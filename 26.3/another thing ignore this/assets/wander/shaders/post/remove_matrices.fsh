#version 330
#extension GL_ARB_separate_shader_objects : require

uniform sampler2D InSampler;

layout(location = 0) in vec2 texCoord;

layout(location = 0) out vec4 fragColor;

void main(){

    if (gl_FragCoord.x < 18 && gl_FragCoord.y < 4) {
        fragColor = texture(InSampler, texCoord + vec2(0,5) / textureSize(InSampler,0));
    } else if (gl_FragCoord.x < 22 && gl_FragCoord.y < 1) {
        fragColor = texture(InSampler, texCoord + vec2(0,2) / textureSize(InSampler,0));
    } else {
        fragColor = texture(InSampler, texCoord);
    }
}
