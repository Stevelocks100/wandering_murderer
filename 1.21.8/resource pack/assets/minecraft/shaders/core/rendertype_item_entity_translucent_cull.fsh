#version 150

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:globals.glsl>




uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec2 texCoord1;
in float vertex_id;
in vec3 skybox_pos;

out vec4 fragColor;

#moj_import <devesto:cnoise.glsl>
#moj_import <devesto:nullpointer_frag.glsl>


vec3 encode(int value) {
    return vec3((value >> 16) & 0xFF, (value >> 8) & 0xFF, value & 0xFF);
}

int decode(vec3 value) {
    int x = int(round(value.x));
    int y = int(round(value.y));
    int z = int(round(value.z));

    return (x << 16) | (y << 8) | z;
}

vec2 to_pixel_cord(vec2 texture_size, vec2 texture_cord) {
    return texture_cord * texture_size;
}

vec2 to_uv_cord(vec2 texture_size, vec2 pixel_cord) {
    return pixel_cord / texture_size;
}

vec2 cube_face(float size, float face) {
    int f = int(face);
    
    switch (f) {
        case 0: return vec2(0.0,    size);
        case 1: return vec2(size,  size);
        case 2: return vec2(size,    0.0);
        case 3: return vec2(size * 2,   0.0);
        case 4: return vec2(size * 2, size);
        case 5: return vec2(size * 3, size);
    }

    return vec2(0.0);
}

vec3 shifted_color(sampler2D Sampler, vec2 texCoord) {
    vec2 coords = vec2(0,1024)/textureSize(Sampler,0);
    return texture(Sampler,texCoord+coords).rgb;
}

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
    devesto();
    missing_object();
    overlay();

    vec2 texture_size = textureSize(Sampler0,0);
    vec2 temp_texCoord0 = floor(texCoord0*texture_size)/texture_size;
    ivec2 pixel_coord = ivec2(floor(temp_texCoord0 * texture_size));
    float skybox = round(texelFetch(Sampler0, pixel_coord,0).a * 100);
    vec3 funny_color = vec3(round(texelFetch(Sampler0, pixel_coord,0).rgb * 255));
    vec3 rotate_color = vec3(1);
    float size = 512.0;

    if ((int(round(size)) % 2) != 0) {
        size = 512.0;
    }

    if (skybox == 58 && (funny_color == vec3(69,42,5) || funny_color == vec3(69,42,7))) {

        // direction to face
        vec3 dir = normalize(skybox_pos.xyz);        
        vec3 absDir = abs(dir);
        float maxAxis;
        vec2 uv;
        float face = 0.0;

        
        
        // face logic
        if (absDir.x >= absDir.y && absDir.x >= absDir.z) {
            maxAxis = absDir.x;
            uv = vec2(dir.z, dir.y) / maxAxis;
            face = dir.x > 0.0 ? 0.0 : 1.0;
        } else if (absDir.y >= absDir.x && absDir.y >= absDir.z) {
            maxAxis = absDir.y;
            uv = vec2(dir.x, -dir.z) / maxAxis;
            face = dir.y > 0.0 ? 2.0 : 3.0;
        } else {
            maxAxis = absDir.z;
            uv = vec2(dir.x, dir.y) / maxAxis;
            face = dir.z > 0.0 ? 4.0 : 5.0;
        }
        
        // convert [-1,1] to [0,1]
        uv = uv * 0.5 + 0.5;
        
        // flip Y to match texture atlas layout
        uv.y = 1 - uv.y;
        if (mod(face,2)==1) {
            uv.x = 1-uv.x;
        }
        if (face >= 4) {
            uv.x = 1-uv.x;
        }
        if (face >= 2 && face <= 3) {
            uv.x = 1-uv.x;
        }

        
        vec2 AtlasSize = textureSize(Sampler0,0);
        vec2 faceOffset = cube_face(size, face);
        faceOffset = faceOffset / AtlasSize;

        vec2 one_face = size / AtlasSize;
        uv *= one_face;
        vec2 actual_texCoord0 = floor(texCoord0*AtlasSize)/AtlasSize;
        vec2 final_uv = actual_texCoord0+faceOffset;
        final_uv += uv;

        fragColor = texture(Sampler0, final_uv);

        if (funny_color == vec3(69,42,5)) {

            float angle = GameTime * 100.0; // speed multiplier
            float cosA = cos(angle);
            float sinA = sin(angle);

            // store original x and z
            float origX = dir.x;
            float origZ = dir.z;

            dir.x = origX * cosA - origZ * sinA;
            dir.z = origX * sinA + origZ * cosA;
            // --- Smoke effect improvements ---
            float time = GameTime * 200; // slower motion
            vec3 p = dir * 3.0; // base scale
            
            // Layered fractal noise
            float n = 0.0;
            float amp = 0.5;
            float freq = 1.0;
            for (int i = 0; i < 4; i++) {
                n += cnoise_vec4(vec4(p * freq, time * freq)) * amp;
                freq *= 2.0;
                amp *= 0.5;
            }
            n = n * 0.5 + 0.5; // normalize 0..1
            
            // Add turbulence distortion
            vec3 offset = vec3(
                cnoise_vec4(vec4(p * 1.2 + time * 0.4, 0.0)),
                cnoise_vec4(vec4(p * 1.2 + time * 0.4, 1.0)),
                cnoise_vec4(vec4(p * 1.2 + time * 0.4, 2.0))
            );
            float turbulence = length(offset) * 0.5;
            
            // Sample a "shifted" version of the skybox to use as the smoke color source
            vec3 baseColor = texture(Sampler0, final_uv).rgb;
            vec3 altColor = shifted_color(Sampler0, final_uv); // shifted version of the skybox
            
            // Blend based on procedural noise
            vec3 smoke = mix(baseColor, altColor, n);
            smoke = mix(smoke, altColor * 0.8 + baseColor * 0.2, turbulence);
            
            // Blend with existing texture
            float intensity = smoothstep(0.3, 0.8, n + turbulence * 0.5);
            //intensity = clamp(intensity-0.4,0,1);
            fragColor.rgb = mix(fragColor.rgb, smoke, intensity * 0.7);

        }

    }

    vec4 shader_check = round(texture(Sampler0,texCoord0)*255);
    if (shader_check == vec4(192,90,90,105)) {
        fragColor = vec4(1.0,1.0,1.0,1.0);
    }
    if (shader_check == vec4(49,138,138,105)) {
        fragColor = vec4(1.0,1.0,1.0,0.5);
    }
    if (shader_check == vec4(107,54,129,255)) {
        discard;
    }
    shader_check = round(texture(Sampler0,texCoord0+(vec2(128,0)/textureSize(Sampler0,0)))*255);
    if (shader_check.rgb == vec3(130,160,109)) {
        fragColor = texture(Sampler0,texCoord0);
    }

    //fragColor = vec4(vec3(fragColor.a),1);
    
    
}
