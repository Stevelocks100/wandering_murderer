#version 330
#extension GL_ARB_separate_shader_objects : require

uniform sampler2D InSampler;
uniform sampler2D MatSampler;

#include <wander:float_utils.glsl>

layout(location = 0) in vec2 texCoord;

layout(location = 0) out vec4 fragColor;

void main(){
    fragColor = texture(InSampler, texCoord);
    ivec2 coords = ivec2(gl_FragCoord.xy);

    
    if (gl_FragCoord.x < 16 && gl_FragCoord.y < 4) {

            vec4 encoded = texelFetch(MatSampler,ivec2(coords.x / 2,coords.y),0);

            if (coords.x % 2 == 0) {
                fragColor = vec4(encoded.xy, 0.0, 1);
            } else {
                fragColor = vec4(encoded.zw, 0.0, 1);
            }

    }
}
