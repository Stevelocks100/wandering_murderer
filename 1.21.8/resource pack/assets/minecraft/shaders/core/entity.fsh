#version 150

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:globals.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec4 vertexColor;
in vec4 lightMapColor;
in vec4 overlayColor;
in vec2 texCoord0;

out vec4 fragColor;


#moj_import <devesto:nullpointer_frag.glsl>

void main() {
    vec4 color = texture(Sampler0, texCoord0);
#ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT) {
        discard;
    }
#endif
    color *= vertexColor * ColorModulator;
#ifndef NO_OVERLAY
    color.rgb = mix(overlayColor.rgb, color.rgb, overlayColor.a);
#endif
#ifndef EMISSIVE
    color *= lightMapColor;
#endif
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);

    vec3 shader_check = round(texture(Sampler0,vec2(0)).rgb*255);
    if (shader_check == vec3(12,34,56) && textureSize(Sampler0,0) == ivec2(64)) {
        vec2 uv = floor(texCoord0*64)/64;
        float noise = cnoise(vec3(uv*10,GameTime*1200))/2.0 + 0.5;
        noise = clamp(noise,0.0,1.0);

        vec3 layered_missing = mix(missing_screen_space(1,vec2(5),vec2(4)), missing_screen_space(1.2,vec2(13,4),vec2(2,1)),clamp(sin(GameTime*2400)/2+0.3,0,0.7));
        fragColor = mix(vec4(layered_missing,1.0), fragColor, round(clamp(noise+smoothstep(40,30,sphericalVertexDistance),0,1)));

    }
    
}
