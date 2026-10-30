float decodeColor(vec4 color) {
    uvec4 iColor = uvec4(round(color * 255.));
    uint iValue = iColor.r << 24 | iColor.g << 16 | iColor.b << 8 | iColor.a;
    return uintBitsToFloat(iValue);
}

vec4 encodeFloat(float value) {
    uint iValue = floatBitsToUint(value);
    return vec4(
        iValue >> 24u,
        iValue >> 16u & 0xffu,
        iValue >>  8u & 0xffu,
        iValue        & 0xffu
    ) / 255.;
}

//^^^ these are made by HalbFettKaese, @thederdiscohund on discord. (the goat thank you so much for the info)


//for reading things like ink demon pos or the mat4s directly

vec3 read_vec3(sampler2D pos) {
    //assuming the image is 3x1
    //if (texelFetch(pos,ivec2(0,0),0).b != 0) {
    //    return vec3(-1000,1000,1000);
    //}
    return vec3(
        decodeColor(texelFetch(pos,ivec2(0,0),0)),
        decodeColor(texelFetch(pos,ivec2(1,0),0)),
        decodeColor(texelFetch(pos,ivec2(2,0),0))
        );
}
mat4 read_matrix(sampler2D mat, int offsetX) {

    vec4 a = vec4(
        decodeColor(texelFetch(mat, ivec2(offsetX + 0, 0), 0)),
        decodeColor(texelFetch(mat, ivec2(offsetX + 0, 1), 0)),
        decodeColor(texelFetch(mat, ivec2(offsetX + 0, 2), 0)),
        decodeColor(texelFetch(mat, ivec2(offsetX + 0, 3), 0))
    );

    vec4 b = vec4(
        decodeColor(texelFetch(mat, ivec2(offsetX + 1, 0), 0)),
        decodeColor(texelFetch(mat, ivec2(offsetX + 1, 1), 0)),
        decodeColor(texelFetch(mat, ivec2(offsetX + 1, 2), 0)),
        decodeColor(texelFetch(mat, ivec2(offsetX + 1, 3), 0))
    );

    vec4 c = vec4(
        decodeColor(texelFetch(mat, ivec2(offsetX + 2, 0), 0)),
        decodeColor(texelFetch(mat, ivec2(offsetX + 2, 1), 0)),
        decodeColor(texelFetch(mat, ivec2(offsetX + 2, 2), 0)),
        decodeColor(texelFetch(mat, ivec2(offsetX + 2, 3), 0))
    );

    vec4 d = vec4(
        decodeColor(texelFetch(mat, ivec2(offsetX + 3, 0), 0)),
        decodeColor(texelFetch(mat, ivec2(offsetX + 3, 1), 0)),
        decodeColor(texelFetch(mat, ivec2(offsetX + 3, 2), 0)),
        decodeColor(texelFetch(mat, ivec2(offsetX + 3, 3), 0))
    );

    //maybe change this to direct indexing?

    return mat4(a, b, c, d);
}

float get_fog(sampler2D mat) {
    return decodeColor(texelFetch(mat, ivec2(8, 0), 0));
}

vec3 get_pos(sampler2D mat) {
    return vec3(
        decodeColor(texelFetch(mat, ivec2(8, 1), 0)),
        decodeColor(texelFetch(mat, ivec2(8, 2), 0)),
        decodeColor(texelFetch(mat, ivec2(8, 3), 0))
    );
}


float detectNDCZ()
{
    #ifdef RENDERPEARL_DEPTH_IS_ZERO_TO_ONE
        return 0.;
    #else
        return 1.;
    #endif
}