#version 330
#extension GL_ARB_separate_shader_objects : require


#include <minecraft:fog.glsl>
#include <minecraft:projection.glsl>
#include <minecraft:dynamictransforms.glsl>
#include <minecraft:oit.glsl>

#include <minecraft:globals.glsl>

#include <wander:float_utils.glsl>

uniform sampler2D Sampler0;

#ifdef GLINT
uniform sampler2D GlintSampler;
#endif


layout(location = 0) in float sphericalVertexDistance;
layout(location = 1) in float cylindricalVertexDistance;

layout(location = 2) in vec4 vertexColor;
#ifndef OIT_ALPHA_ONLY
layout(location = 3) in vec4 lightMapColor;
layout(location = 4) in vec4 overlayColor;
#endif
layout(location = 5) in vec2 texCoord0;
#ifdef GLINT
layout(location = 6) in vec2 texCoordGlint;
#endif

layout(location = 7) in vec3 pos;
layout(location = 8) flat in int projMatData;
layout(location = 9) flat in mat4 IProjViewMat;
// layout(location = 14) flat in mat4 ProjViewMat;



#ifndef OIT_ALPHA_ONLY
layout(location = 0) out vec4 fragColor;
#endif



#ifndef OIT_ALPHA_ONLY

vec4 calculateFinalColor(vec4 color) {
    color.rgb = mix(overlayColor.rgb, color.rgb, overlayColor.a);

    color *= lightMapColor;

    #ifdef GLINT
    vec4 glintColor = GlintAlpha * texture(GlintSampler, texCoordGlint);// Glint color modulator?
    // Matches BlendFuntion.GLINT
    color.rgb += glintColor.rgb * glintColor.rgb;
    #endif

    #ifdef OIT_ACCUMULATE
    color = sampleColorForAccumulation(color);
    vec4 fogColor = vec4(FogColor.rgb * color.a, FogColor.a);
    #else
    vec4 fogColor = FogColor;
    #endif

    color = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, fogColor);

    return color;
}
#endif



void main() {


    vec4 color = texture(Sampler0, texCoord0);

    bool alpha_cutout = true;
    
    if (projMatData != 0) {
        ivec2 coords = ivec2(gl_FragCoord.xy);
        #ifndef OIT_ALPHA_ONLY
            
            


            fragColor = vec4(1.0, 0.0, 0.0, 1.0);

            // if (coords.y > 4) {
            //     fragColor = vec4(vec3(115,26,138)/255,1);
            //     return;
            // }

            vec4 encoded;

            if (coords.x / 2 < 4) {
                encoded = encodeFloat(IProjViewMat[coords.x / 2][coords.y]);

            } else if (coords.x / 2 < 8) {
                encoded = encodeFloat((ProjMat * ModelViewMat)[(coords.x - 8) / 2][coords.y]);
                fragColor.b = 1;
            } else if (coords.y < 1) {
                encoded = encodeFloat(FogEnvironmentalEnd);
            } else {
                // the last 6 pixels.
                if (projMatData == 2) {
                    encoded = encodeFloat((pos)[coords.y-1]); //ignore world pos for now.
                } else {
                    discard;
                }
            }
            if (coords.x % 2 == 0) {
                fragColor.rg = encoded.xy;

            } else {
                fragColor.rg = encoded.zw;

            }
            

        #ifdef OIT_ACCUMULATE
            fragColor = sampleColorForAccumulation(fragColor);
        #endif
        
        return;

        #else
        if (projMatData == 1 && coords.x / 2 >= 8 && coords.y >= 1) discard;
        color = vec4(1);
        alpha_cutout = false;

        #endif
    }    

    

    #ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT && alpha_cutout) {
        discard;
    }
    #endif

    color *= vertexColor * ColorModulator;

    #ifdef GLINT
    color.a = max(color.a, GlintAlpha);
    #endif

    #ifdef OIT_ALPHA_ONLY
    executeAlphaOnlyPhase(gl_FragCoord.z, color.a);
    #else
    fragColor = calculateFinalColor(color);
    #endif
}