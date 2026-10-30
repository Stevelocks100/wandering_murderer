#version 330
#extension GL_ARB_separate_shader_objects : require

#include <wander:float_utils.glsl>
#include <wander:lut.glsl>
#include <minecraft:globals.glsl>
#include <wander:noise.glsl>

uniform sampler2D InSampler;
uniform sampler2D DepthSampler;
uniform sampler2D MatSampler;
uniform sampler2D LUTSampler;


layout(location = 0) in vec2 texCoord;
layout(location = 1) flat in mat4 InvProjMat;
layout(location = 290) flat in mat4 ProjMat;
layout(location = 300) flat in vec3 pos;


layout(location = 0) out vec4 fragColor;

vec3 hash33(vec2 p)
{
    vec3 q = vec3(
        dot(p, vec2(127.1, 311.7)),
        dot(p, vec2(269.5, 183.3)),
        dot(p, vec2(419.2, 371.9))
    );

    return fract(sin(q) * 43758.5453);
}

float luminance(vec3 c) {
    return dot(c, vec3(0.2126, 0.7152, 0.0722));
}

#include <wander:fog.glsl>

void main(){

    float fog_strength = get_fog(MatSampler);

    //FogEnvironmentalStart
    vec3 color = texture(InSampler, texCoord).rgb;
    float darkness_strength = smoothstep(60,30,fog_strength);
    

    vec3 dither = hash33(gl_FragCoord.xy) - 0.5;
    vec3 dither_color = clamp(color + dither * (1.0 / 30.0), 0.0, 1.0);

    float lut_weight = 0.75;

    color = mix(color,access_lut1(color, LUTSampler) * lut_weight + access_lut2(dither_color, LUTSampler) * (1 - lut_weight),darkness_strength);

    //if (darkness_strength > 0) {
    //    color = mix(color, applyVolumetricFog(color, texCoord, fog_strength),darkness_strength);
    //}


        //first, get the eye direction and attempt to determine if it's obstructed.
    // slightly misleading, but projmat is projviewmat
    // Project the world-space position into clip space.
    vec4 clipPos = ProjMat * vec4(pos, 1.0);

    // Behind the camera or too close to the projection plane.
    if (clipPos.w > 0.0) {
        // Convert to normalized device coordinates.
        vec3 ndc = clipPos.xyz / clipPos.w;

        // Convert XY to screen UV coordinates.
        vec2 screenUV = ndc.xy * 0.5 + 0.5;

        // Outside the screen.
        if (any(lessThan(screenUV, vec2(-0.2))) ||
            any(greaterThan(screenUV, vec2(1.2)))) {
            // Not visible.
        } else {
            // Sample depth at the projected position, not texCoord.
            float sceneDepth = texture(DepthSampler, screenUV).r;
        
            // Convert the scene depth to the same NDC convention
            // as your projection matrix.
            // OpenGL-style depth: [0, 1] -> [-1, 1].
             #ifdef RENDERPEARL_DEPTH_IS_ZERO_TO_ONE
                float sceneNdcZ = sceneDepth;
            #else
                float sceneNdcZ = sceneDepth * 2.0 - 1.0;
            #endif
            

            // Compare projected depth with scene depth.
            // This comparison assumes conventional (non-reversed) Z.
            if (ndc.z < sceneNdcZ) {
                // The point is behind the visible surface.
            } else {
                // The point may be visible.
                vec2 delta = texCoord - screenUV;

                float angle = radians(30.0);
                float c = cos(angle);
                float s = sin(angle);

                // Rotate the coordinates
                delta = mat2(c, -s, s, c) * delta;

                // Stretch the rotated shape
                delta.x *= 0.7;
                delta.y *= 1.3;

                float d = length(delta);


                delta = texCoord - screenUV;
                delta = mat2(c, -s, s, c) * delta;
                // Stretch the rotated shape
                delta.x *= 1.6;
                delta.y *= 0.7;

                float d2 = length(delta);

                float red_strength = pow(clamp(max(d,d2) * 7.0, 0.0, 1.0),0.34);
                vec3 red = vec3(1.0,0.0,0.0);
                red = mix(red,vec3(1),pow(1-red_strength,1.5));
                color = mix(red, color, red_strength);
            }
        }
    }

    float vignette = distance(texCoord,vec2(0.5));
    vignette = smoothstep(0.45, 0.7, vignette);

    color = mix(color, color * vec3(0.3,0.0,0.0), vignette * 0.7 * darkness_strength);
    fragColor = vec4(color,1.0);
}
