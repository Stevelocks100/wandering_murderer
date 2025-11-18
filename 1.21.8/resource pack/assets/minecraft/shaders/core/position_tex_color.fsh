#version 150

// Can't moj_import in things used during startup, when resource packs don't exist.
// This is a copy of dynamicimports.glsl
layout(std140) uniform DynamicTransforms {
    mat4 ModelViewMat;
    vec4 ColorModulator;
    vec3 ModelOffset;
    mat4 TextureMat;
    float LineWidth;
};

#moj_import <minecraft:globals.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <devesto:combust.glsl>

uniform sampler2D Sampler0;

in vec2 texCoord0;
in vec4 vertexColor;
flat in float is_missing;

out vec4 fragColor;



void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor;
    if (color.a == 0.0) {
        discard;
    }
    
    fragColor = color * ColorModulator;

    if (is_missing == 1) {

        fragColor = combustion(gl_FragCoord.xy,GameTime * 1200, ScreenSize);
    }


    
}
