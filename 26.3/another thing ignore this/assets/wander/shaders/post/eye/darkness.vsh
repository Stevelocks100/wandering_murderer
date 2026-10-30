#version 330
#extension GL_ARB_separate_shader_objects : require

#include <wander:float_utils.glsl>

uniform sampler2D InSampler;
uniform sampler2D MatSampler;
uniform sampler2D LUTSampler;

layout(location = 0) out vec2 texCoord;
layout(location = 1) flat out mat4 InvProjMat;
layout(location = 290) flat out mat4 ProjMat;
layout(location = 300) flat out vec3 pos;

void main() {
    InvProjMat = read_matrix(MatSampler,0);
    ProjMat = read_matrix(MatSampler,4);
    pos = get_pos(MatSampler);

    vec2 uv = vec2((gl_VertexIndex << 1) & 2, gl_VertexIndex & 2);
    vec4 pos = vec4(uv * vec2(2, 2) + vec2(-1, -1), 0, 1);

    gl_Position = pos;
    texCoord = uv;
}
