#version 150

#moj_import <minecraft:light.glsl>
#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <minecraft:globals.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV1;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler0;
uniform sampler2D Sampler1;
uniform sampler2D Sampler2;

out float sphericalVertexDistance;
out float cylindricalVertexDistance;
out vec4 vertexColor;
out vec4 lightMapColor;
out vec4 overlayColor;
out vec2 texCoord0;

float rand_float(float co) {
    return fract(sin(co * 78.233) * 43758.5453);
}

void main() {

    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);

    vec3 pos = Position;
    vec3 shader_check = round(texture(Sampler0,vec2(0)).rgb*255);
    if (shader_check == vec3(12,34,56) && textureSize(Sampler0,0) == ivec2(64)) {
        pos.x += rand_float(pos.x+GameTime*8000)*0.5*smoothstep(30,40,sphericalVertexDistance);
        pos.y += rand_float(pos.y+GameTime*8000)*0.5*smoothstep(30,40,sphericalVertexDistance);
        pos.z += rand_float(pos.z+GameTime*8000)*0.5*smoothstep(30,40,sphericalVertexDistance);
    }
    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);

    
#ifdef NO_CARDINAL_LIGHTING
    vertexColor = Color;
#else
    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color);
#endif
#ifndef EMISSIVE
    lightMapColor = texelFetch(Sampler2, UV2 / 16, 0);
#endif
    overlayColor = texelFetch(Sampler1, UV1, 0);

    texCoord0 = UV0;
#ifdef APPLY_TEXTURE_MATRIX
    texCoord0 = (TextureMat * vec4(UV0, 0.0, 1.0)).xy;
#endif
}
