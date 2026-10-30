vec3 access_lut1(vec3 color, sampler2D lutTex)
{
    const float N = 16.0;                 // LUT_COUNT
    const vec2 tex_size = vec2(4096.);
    vec2  tileSize   = tex_size / N;  // 256×256 if tex = 4096×4096

    // --- 1. blue slice → tile column/row -------------------------------
    float bIdx = color.b * (N * N - 1.0); // 0-255
    float bx   = mod(bIdx, N);            // 0-15
    float by   = floor(bIdx / N);         // 0-15

    // --- 2. red/green indices inside that tile -------------------------
    float rIdx = color.r * (N - 1.0);     // 0-15
    float gIdx = color.g * (N - 1.0);     // 0-15

    // --- 3. CORRECTED: Compute step size accounting for tile boundaries ---
    float stepX = (tileSize.x - 1.0) / (N - 1.0); // Adjusted step
    float stepY = (tileSize.y - 1.0) / (N - 1.0);

    vec2 uvPix = vec2(
        bx * tileSize.x + rIdx * stepX,
        by * tileSize.y + gIdx * stepY
    ) + 0.5; // centre of the texel

    vec2 uv    = uvPix / tex_size;    // normalised 0-1 coords

    return texture(lutTex, uv).rgb;
}



vec3 access_lut2(vec3 color, sampler2D lutTex)
{
    int b = int(color.b * 255.0);

    ivec2 pixel = ivec2(
        (b & 15) * 256 + int(color.r * 15.0) * 17,
        (b >> 4) * 256 + int(color.g * 15.0) * 17
    );

    return texelFetch(lutTex, pixel, 0).rgb;
}

