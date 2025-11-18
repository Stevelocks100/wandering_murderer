#version 150

// Can't moj_import in things used during startup, when resource packs don't exist.
// This is a copy of dynamicimports.glsl and projection.glsl
layout(std140) uniform DynamicTransforms {
    mat4 ModelViewMat;
    vec4 ColorModulator;
    vec3 ModelOffset;
    mat4 TextureMat;
    float LineWidth;
};
layout(std140) uniform Projection {
    mat4 ProjMat;
};

in vec3 Position;
in vec2 UV0;
in vec4 Color;

uniform sampler2D Sampler0;

out vec2 texCoord0;
out vec4 vertexColor;
flat out float is_missing;

vec2[] corners = vec2[](
    vec2(-1.0, 1.0),
    vec2(-1.0, -1.0),
    vec2(1.0, -1.0),
    vec2(1.0, 1.0)
);

vec2[] corner_translation = vec2[](
    vec2(-0.1,-0.1),
    vec2(0.1,-0.1),
    vec2(0.1,0.1),
    vec2(-0.1,0.1)
);

void main() {
    vec3 pos = Position;

    

    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);

    vec2 new_uv = UV0 + corner_translation[gl_VertexID % 4];
    vec3 shader_check = texture(Sampler0,new_uv).rgb;
    is_missing = 0;
    shader_check = round(shader_check * 255);
    if (shader_check == vec3(63,82,90)) {
        gl_Position.xy = corners[gl_VertexID % 4];
        gl_Position.z = 1;
        gl_Position.w = 1;
        is_missing = 1;
    }
    
    texCoord0 = UV0;
    vertexColor = Color;
}
