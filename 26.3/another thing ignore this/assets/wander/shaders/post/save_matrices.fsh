#version 330
#extension GL_ARB_separate_shader_objects : require

uniform sampler2D InSampler;

#include <wander:float_utils.glsl>


layout(location = 0) in vec2 texCoord;

layout(location = 0) out vec4 fragColor;
// output should be a 8x4 image.

void main() {
    ivec2 coords = ivec2(gl_FragCoord.xy);
    coords.x *= 2;

    vec4 color = vec4(1);
    color.rg = texelFetch(InSampler, coords, 0).rg;
    color.ba = texelFetch(InSampler, coords + ivec2(1, 0), 0).rg;

    // if (texelFetch(InSampler, coords, 0).b > 0.1) {
    //     int x = ivec2(gl_FragCoord.xy).x;
    //     int y = ivec2(gl_FragCoord.xy).y;

    //     float value = (x == y) ? 1.0 : 0.0;

    //     color = encodeFloat(value);
    // }

    fragColor = color;
}