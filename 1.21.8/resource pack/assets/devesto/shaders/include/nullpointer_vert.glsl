
float rand_vec2(vec2 co){
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

float rand_float(float co) {
    return fract(sin(co * 78.233) * 43758.5453);
}




vec3 devesto(vec3 pos) {
    vec4 shader_check = round(texture(Sampler0, UV0)*255);
    if (shader_check == vec4(52,48,218,158)) {
       vec3 offset = (vec3(cos(GameTime*12000*2),sin(GameTime*40000*2),sin(GameTime*30700*2)));
       pos += offset/150;
    }
    return pos;
}
