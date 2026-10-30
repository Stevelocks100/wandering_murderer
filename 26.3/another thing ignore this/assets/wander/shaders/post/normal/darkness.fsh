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

    float vignette = distance(texCoord,vec2(0.5));
    vignette = smoothstep(0.45, 0.7, vignette);

    color = mix(color, color * vec3(0.3,0.0,0.0), vignette * 0.7 * darkness_strength);
    fragColor = vec4(color,1.0);
}
