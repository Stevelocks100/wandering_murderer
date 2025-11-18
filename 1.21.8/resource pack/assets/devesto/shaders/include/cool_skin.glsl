
float threshold(float value, float threshold) {
    return value < threshold ? 0.0 : 1.0;
}
const float threshold_value = 0.18;


void cool_skin() {

    vec3 shader_check = texture(Sampler0,vec2(0)).rgb;
    shader_check = round(shader_check*255);
    ivec2 texture_size = textureSize(Sampler0,0);
    if (shader_check == vec3(12,34,56) && texture_size == ivec2(64)) {
        vec4 new_color = vec4(threshold(fragColor.r,threshold_value),threshold(fragColor.g,threshold_value),threshold(fragColor.b,threshold_value),fragColor.a);
        float mix_value = clamp(1.0 - ((sphericalVertexDistance - 50.0) / 50.0), 0.0, 1.0);
        fragColor = mix(fragColor, new_color, mix_value);
    }
}
    