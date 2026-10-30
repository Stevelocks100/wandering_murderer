#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:light.glsl>
#include <minecraft:fog.glsl>
#include <minecraft:dynamictransforms.glsl>
#include <minecraft:projection.glsl>
#include <minecraft:sample_lightmap.glsl>

#include <minecraft:globals.glsl>

layout(location = 0) in vec3 Position;
layout(location = 1) in vec4 Color;
layout(location = 2) in vec2 UV0;
layout(location = 3) in ivec2 UV1;
layout(location = 4) in ivec2 UV2;
#ifdef GLINT_SPECIAL
layout(location = 5) in vec2 UV3;
#endif
layout(location = 6) in vec3 Normal;

uniform sampler2D Sampler0;
#ifndef OIT_ALPHA_ONLY
uniform sampler2D Sampler1;
uniform sampler2D Sampler2;
#endif
layout(location = 0) out float sphericalVertexDistance;
layout(location = 1) out float cylindricalVertexDistance;

layout(location = 2) out vec4 vertexColor;
#ifndef OIT_ALPHA_ONLY
layout(location = 3) out vec4 lightMapColor;
layout(location = 4) out vec4 overlayColor;
#endif

layout(location = 5) out vec2 texCoord0;
#ifdef GLINT
layout(location = 6) out vec2 texCoordGlint;
#endif

layout(location = 7) out vec3 pos;
layout(location = 8) flat out int projMatData;
layout(location = 9) flat out mat4 IProjViewMat;

// layout(location = 14) flat out mat4 ProjViewMat;

vec2[] screen_corners = vec2[](
    vec2(0.0, 1.0),
    vec2(0.0, 0.0),
    vec2(1.0, 0.0),
    vec2(1.0, 1.0)
);
// vec2[] screen_corners = vec2[](
//     vec2(-1.0, 1.0),
//     vec2(-1.0, -1.0),
//     vec2(1.0, -1.0),
//     vec2(1.0, 1.0)
// );

void main() {

    pos = Position;



    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);

    sphericalVertexDistance = fog_spherical_distance(pos);
    cylindricalVertexDistance = fog_cylindrical_distance(pos);

    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color);



    #ifndef OIT_ALPHA_ONLY
    lightMapColor = sample_lightmap(Sampler2, UV2);
    overlayColor = texelFetch(Sampler1, UV1, 0);
    #endif

    texCoord0 = UV0;
    #ifdef GLINT
    #ifdef GLINT_SPECIAL
    texCoordGlint = (TextureMat * vec4(UV3, 0.0, 1.0)).xy;
    #else
    texCoordGlint = (TextureMat * vec4(UV0, 0.0, 1.0)).xy;
    #endif
    #endif


    vec4 shader_check = round(texture(Sampler0,UV0)*255);

    projMatData = 0;
    
    if (shader_check == vec4(77,91,85,66)) {

        projMatData = 1;
        vec2 corner = screen_corners[gl_VertexIndex % 4];
        gl_Position = vec4(vec2(-1) + 2. * corner * vec2(18, 4) / ScreenSize, 1.0, 1.0);
        //ProjViewMat = ProjMat * ModelViewMat;
        IProjViewMat = inverse(ProjMat * ModelViewMat);
        
    }
    if (shader_check == vec4(77,91,86,66)) {
        //do something with the wandering murderer eye.
        projMatData = 2;
        vec2 corner = screen_corners[gl_VertexIndex % 4];
        gl_Position = vec4(vec2(-1) + 2. * corner * vec2(2, 3) / ScreenSize + vec2(16,1) * 2 / ScreenSize, 1.0, 1.0); // is storing vec3

    }
}
