//	Classic Perlin 3D Noise 
//	by Stefan Gustavson (https://github.com/stegu/webgl-noise)
//
vec4 permute(vec4 x){return mod(((x*34.0)+1.0)*x, 289.0);}
vec4 taylorInvSqrt(vec4 r){return 1.79284291400159 - 0.85373472095314 * r;}
vec3 fade(vec3 t) {return t*t*t*(t*(t*6.0-15.0)+10.0);}

float cnoise(vec3 P){
  vec3 Pi0 = floor(P); // Integer part for indexing
  vec3 Pi1 = Pi0 + vec3(1.0); // Integer part + 1
  Pi0 = mod(Pi0, 289.0);
  Pi1 = mod(Pi1, 289.0);
  vec3 Pf0 = fract(P); // Fractional part for interpolation
  vec3 Pf1 = Pf0 - vec3(1.0); // Fractional part - 1.0
  vec4 ix = vec4(Pi0.x, Pi1.x, Pi0.x, Pi1.x);
  vec4 iy = vec4(Pi0.yy, Pi1.yy);
  vec4 iz0 = Pi0.zzzz;
  vec4 iz1 = Pi1.zzzz;

  vec4 ixy = permute(permute(ix) + iy);
  vec4 ixy0 = permute(ixy + iz0);
  vec4 ixy1 = permute(ixy + iz1);

  vec4 gx0 = ixy0 / 7.0;
  vec4 gy0 = fract(floor(gx0) / 7.0) - 0.5;
  gx0 = fract(gx0);
  vec4 gz0 = vec4(0.5) - abs(gx0) - abs(gy0);
  vec4 sz0 = step(gz0, vec4(0.0));
  gx0 -= sz0 * (step(0.0, gx0) - 0.5);
  gy0 -= sz0 * (step(0.0, gy0) - 0.5);

  vec4 gx1 = ixy1 / 7.0;
  vec4 gy1 = fract(floor(gx1) / 7.0) - 0.5;
  gx1 = fract(gx1);
  vec4 gz1 = vec4(0.5) - abs(gx1) - abs(gy1);
  vec4 sz1 = step(gz1, vec4(0.0));
  gx1 -= sz1 * (step(0.0, gx1) - 0.5);
  gy1 -= sz1 * (step(0.0, gy1) - 0.5);

  vec3 g000 = vec3(gx0.x,gy0.x,gz0.x);
  vec3 g100 = vec3(gx0.y,gy0.y,gz0.y);
  vec3 g010 = vec3(gx0.z,gy0.z,gz0.z);
  vec3 g110 = vec3(gx0.w,gy0.w,gz0.w);
  vec3 g001 = vec3(gx1.x,gy1.x,gz1.x);
  vec3 g101 = vec3(gx1.y,gy1.y,gz1.y);
  vec3 g011 = vec3(gx1.z,gy1.z,gz1.z);
  vec3 g111 = vec3(gx1.w,gy1.w,gz1.w);

  vec4 norm0 = taylorInvSqrt(vec4(dot(g000, g000), dot(g010, g010), dot(g100, g100), dot(g110, g110)));
  g000 *= norm0.x;
  g010 *= norm0.y;
  g100 *= norm0.z;
  g110 *= norm0.w;
  vec4 norm1 = taylorInvSqrt(vec4(dot(g001, g001), dot(g011, g011), dot(g101, g101), dot(g111, g111)));
  g001 *= norm1.x;
  g011 *= norm1.y;
  g101 *= norm1.z;
  g111 *= norm1.w;

  float n000 = dot(g000, Pf0);
  float n100 = dot(g100, vec3(Pf1.x, Pf0.yz));
  float n010 = dot(g010, vec3(Pf0.x, Pf1.y, Pf0.z));
  float n110 = dot(g110, vec3(Pf1.xy, Pf0.z));
  float n001 = dot(g001, vec3(Pf0.xy, Pf1.z));
  float n101 = dot(g101, vec3(Pf1.x, Pf0.y, Pf1.z));
  float n011 = dot(g011, vec3(Pf0.x, Pf1.yz));
  float n111 = dot(g111, Pf1);

  vec3 fade_xyz = fade(Pf0);
  vec4 n_z = mix(vec4(n000, n100, n010, n110), vec4(n001, n101, n011, n111), fade_xyz.z);
  vec2 n_yz = mix(n_z.xy, n_z.zw, fade_xyz.y);
  float n_xyz = mix(n_yz.x, n_yz.y, fade_xyz.x); 
  return 2.2 * n_xyz;
}

float rand_vec2(vec2 co){
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

float rand_float(float co) {
    return fract(sin(co * 78.233) * 43758.5453);
}

// Debug function to visualize which areas of the atlas are being used
// Samples every 256 pixels and marks active areas in red
vec3 debug_atlas_usage() {
    vec2 atlas_size = vec2(textureSize(Sampler0, 0));
    vec2 uv = gl_FragCoord.xy / ScreenSize;
    vec3 color = vec3(0.0);
    
    // Only sample every 256 pixels for performance
    vec2 step_size = vec2(256.0) / atlas_size;
    
    for (float x = 0.0; x < 1.0; x += step_size.x) {
        for (float y = 0.0; y < 1.0; y += step_size.y) {
            vec4 tex = texture(Sampler0, vec2(x, y));
            float brightness = dot(tex.rgb, vec3(0.299, 0.587, 0.114));
            if (brightness > 0.05 || tex.a > 0.05) {
                // Mark active areas in red
                if (distance(uv, vec2(x, y)) < step_size.x * 0.5)
                    color = vec3(1.0, 0.0, 0.0);
            }
        }
    }

    return color;
}

vec3 missing_screen_space(float scale,vec2 shake,vec2 speed) {
    // Convert to grid coordinates
    vec2 fragCoord = gl_FragCoord.xy + GameTime*128000*speed;
    fragCoord = fragCoord + (vec2(rand_float(GameTime*1200),rand_float(GameTime*1200 + 20.0))*4-2)*shake;
    vec2 grid = floor(fragCoord * scale / 100.0);

    // Checkerboard pattern: sum X+Y, even=magenta, odd=black
    float checker = mod(grid.x + grid.y, 2.0);

    if (checker < 0.5) {
        return vec3(1.0, 0.0, 1.0); // Magenta
    } else {
        return vec3(0.0); // Black
    }
}



// Finds the normalized UV bounds of used portions of the texture atlas.
// Returns vec4(minX, minY, maxX, maxY).
vec4 get_used_atlas_bounds() {
    vec2 atlas_size = vec2(textureSize(Sampler0, 0));
    vec2 step_size = vec2(128.0) / atlas_size;
    float minX = 1.0;
    float minY = 1.0;
    float maxX = 0.0;
    float maxY = 0.0;

    for (float x = 0.0; x < 1.0; x += step_size.x) {
        for (float y = 0.0; y < 1.0; y += step_size.y) {
            vec4 tex = texture(Sampler0, vec2(x, y));
            float brightness = dot(tex.rgb, vec3(0.299, 0.587, 0.114));
            if (brightness > 0.05 || tex.a > 0.05) {
                minX = min(minX, x);
                minY = min(minY, y);
                maxX = max(maxX, x);
                maxY = max(maxY, y);
            }
        }
    }

    return vec4(minX, minY, maxX, maxY);
}
// Debug function to display the used atlas bounds in screen space
vec3 debug_used_bounds_screen() {
    vec4 used = get_used_atlas_bounds(); // minX, minY, maxX, maxY in UV space

    // Convert UV bounds to screen-space coordinates
    vec2 minPixel = used.xy * ScreenSize;
    vec2 maxPixel = used.zw * ScreenSize;

    vec2 fragPos = gl_FragCoord.xy;

    // Draw a border around the used region
    float thickness = 2.0; // pixels
    vec3 color = vec3(0.0); // default black

    // Check if fragment is near left/right border
    if (abs(fragPos.x - minPixel.x) < thickness || abs(fragPos.x - maxPixel.x) < thickness) {
        if (fragPos.y >= minPixel.y && fragPos.y <= maxPixel.y) {
            color = vec3(1.0, 0.0, 0.0); // red vertical borders
        }
    }

    // Check if fragment is near top/bottom border
    if (abs(fragPos.y - minPixel.y) < thickness || abs(fragPos.y - maxPixel.y) < thickness) {
        if (fragPos.x >= minPixel.x && fragPos.x <= maxPixel.x) {
            color = vec3(1.0, 0.0, 0.0); // red horizontal borders
        }
    }

    return color;
}

vec2 random_texture(vec2 texCoord) {
    vec2 atlas_size = vec2(textureSize(Sampler0, 0));
    float texture_size = 16.0;               // one block texture size in pixels
    vec2 one_texture = texture_size / atlas_size;

    vec4 used = get_used_atlas_bounds();
    vec2 used_min = used.xy;
    vec2 used_max = used.zw;
    vec2 used_range = used_max - used_min;

    // how much free space we have for full tiles
    vec2 movable_range = used_range - one_texture;
    bool smallX = (movable_range.x <= 0.0);
    bool smallY = (movable_range.y <= 0.0);

    // base random region index that changes over time
    float bigSeed = GameTime * 900.0;
    vec2 base_rand = vec2(rand_float(floor(bigSeed)), rand_float(floor(bigSeed) + 17.0));


    vec2 wrapped = fract(base_rand);

    // ---- add shaking near region switch ----
    float phase = fract(bigSeed); // goes 0→1 between changes
    // shake_strength ramps up near the end of each cycle
    float shake_strength = smoothstep(0.7, 1.0, phase);
    // small random jitter direction (consistent for current region)
    vec2 shake_dir = (vec2(rand_float(floor(bigSeed) + 42.0),
                           rand_float(floor(bigSeed) + 84.0)) * 2.0 - 1.0);
    // apply shaking scaled by atlas resolution
    vec2 shake = shake_dir * (0.002 * shake_strength); // tweak multiplier for intensity
    // add shake into wrapped coordinate, wrapping safely
    wrapped = fract(wrapped + shake);

    // compute tile origin within movable range
    vec2 origin;
    if (!smallX && !smallY) {
        origin = used_min + wrapped * movable_range;
    } else {
        origin = used_min;
    }

    float offset_intensity = fract(GameTime*900)*2-1;
    offset_intensity = clamp(offset_intensity,0,1);
    vec2 random_offset = (vec2(rand_float(GameTime*1200),rand_float(GameTime*1200 + 20.0))*4-2) / atlas_size;

    // preserve the intra-tile texCoord
    vec2 fracCoord;
    if (!smallX && !smallY) {
        fracCoord = fract(texCoord / one_texture) * one_texture;
        return origin + fracCoord + offset_intensity*random_offset;
    } else {
        // fallback when used range is smaller than a tile
        vec2 local_frac = fract(texCoord);
        vec2 scaled_frac = local_frac * used_range;
        return used_min + scaled_frac + offset_intensity*random_offset;
    }
}

vec2 random_texture_old() {
    vec2 atlas_size = textureSize(Sampler0, 0);
    float texture_size = 16.0; // size of one block texture in pixels
    vec2 one_texture = atlas_size / texture_size;

    // Make a random seed from time (changes every 60 frames here)
    float frame_group = (GameTime * 900.0); // slower change
    float rx = rand_float(frame_group);
    float ry = rand_float(frame_group + 20.0);
    float offset_intensity = fract(GameTime*900)*2-1;
    offset_intensity = clamp(offset_intensity,0,1);
    vec2 random_offset = (vec2(rand_float(GameTime*1200),rand_float(GameTime*1200 + 20.0))*4-2) / atlas_size;

    return (vec2(rx, ry) * one_texture)+random_offset*offset_intensity;
}



vec3 pulsing(vec2 atlas_size) {

    float power = sin(GameTime*8000)/2+0.8;
    vec3 color = texture(Sampler0,texCoord0+(vec2(32,0) / atlas_size)).rgb;
    return clamp(color * power,0,1);
}


// Returns a vec3 color given UV (vec2 between 0 and 1) and time (seconds)
vec3 trippyShader(vec2 uv, float time) {
    // Center UV at (0,0)
    vec2 p = uv - 0.5;
    
    // Calculate radius and angle for polar distortions
    float r = length(p);
    float angle = atan(p.y, p.x);
    
    // Create swirling distortion using sine waves and time
    float swirl = sin(5.0 * angle + time * 3.0) * 0.3;
    
    // Distort radius by swirl and animated sine waves
    float distortedR = r + swirl * 0.2 + 0.1 * sin(10.0 * r - time * 5.0);
    
    // Convert back to cartesian coords with distortion
    vec2 distortedUV = vec2(cos(angle), sin(angle)) * distortedR + 0.5;
    
    // Use layered sine waves for color channels, offset by time and position
    float red = 0.5 + 0.5 * sin(10.0 * distortedUV.x + time * 4.0);
    float green = 0.5 + 0.5 * sin(10.0 * distortedUV.y + time * 3.0 + 1.0);
    float blue = 0.5 + 0.5 * sin(10.0 * (distortedUV.x + distortedUV.y) + time * 5.0 + 2.0);
    
    // Combine color channels, optionally adjust saturation or brightness here
    vec3 color = vec3(red, green, blue);
    
    // Add subtle noise for extra confusion (optional)
    float noise = fract(sin(dot(uv * 1000.0, vec2(12.9898,78.233))) * 43758.5453);
    color += 0.1 * noise;
    
    // Clamp color to valid range
    return clamp(color, 0.0, 1.0);
}

vec3 debug_random_texture_screen_scaled(vec2 current_pos) {
    vec4 used = get_used_atlas_bounds();      // minX, minY, maxX, maxY
    vec2 used_range = used.zw - used.xy;

    // Map fragment to normalized screen space [0,1]
    vec2 screen_uv = gl_FragCoord.xy / ScreenSize;

    // Map screen space to atlas UV in the used region
    vec2 atlas_uv = used.xy + screen_uv * used_range;

    // Sample the atlas
    vec4 tex = texture(Sampler0, screen_uv);

    if (distance(screen_uv,current_pos) < 0.01) tex.rgb = vec3(1.0,0.0,0.0);
    return tex.rgb+debug_used_bounds_screen();
}

vec3 debug_random_texture_screen_scaled2(vec2 current_pos) {
    vec4 used = get_used_atlas_bounds();      // minX, minY, maxX, maxY
    vec2 used_range = used.zw - used.xy;

    // Map fragment to normalized screen space [0,1]
    vec2 screen_uv = gl_FragCoord.xy / ScreenSize;

    // Map screen space to atlas UV in the used region
    vec2 atlas_uv = used.xy + screen_uv * used_range;

    // Sample the atlas
    vec4 tex = texture(Sampler0, atlas_uv);

    if (distance(atlas_uv,current_pos) < 0.01) tex.rgb = vec3(1.0,0.0,0.0);
    return tex.rgb;
}

void devesto() {
    vec4 shader_check = round(texture(Sampler0, texCoord0)*255);
    
    if (shader_check == vec4(52,48,218,158)) {
        float missing_scale = 50.0 / sphericalVertexDistance;
        // Prevent overly detailed pattern when close by capping the max scale
        if (sphericalVertexDistance < 5.0) {
            missing_scale = 2.0; // Adjust this value to set the coarseness when very close
        }
        missing_scale = clamp(missing_scale, 0.5, 5.0);
        vec2 atlas_size = textureSize(Sampler0,0);
        vec2 pixel_aligned = floor(texCoord0 * atlas_size) / atlas_size;
        int shader_mode = int(floor(mod(GameTime*300+(rand_vec2(pixel_aligned)/5-0.25),4)));

        switch (shader_mode) {
            case 0:
                fragColor = vec4(missing_screen_space(missing_scale,vec2(3),vec2(1)),1);
                break;
            case 1:
                fragColor = vec4(texture(Sampler0,random_texture(texCoord0)).rgb,1);
                break;
            case 2:

                fragColor = vec4(pulsing(atlas_size),1);
                break;
            case 3:
                vec2 uv = texture(Sampler0,texCoord0+(vec2(32,16) / atlas_size)).rg;
                fragColor = vec4(trippyShader(uv,GameTime*1200),1);
        }
        //fragColor = vec4(debug_random_texture_screen_scaled(random_texture(texCoord0)),1.0);

        //fragColor = vec4(missing_screen_space(missing_scale),1);
        //fragColor = vec4(texture(Sampler0,random_texture()+texCoord0).rgb,1);

        return;
    }
}


void missing_object() {
    vec4 shader_check = round(texture(Sampler0, texCoord0)*255);
    
    if (shader_check == vec4(189,178,31,158)) {
        vec3 layered_missing = mix(missing_screen_space(1,vec2(5),vec2(4)), missing_screen_space(1.2,vec2(13,4),vec2(2,1)),clamp(sin(GameTime*2400)/2+0.3,0,0.7));
        fragColor = vec4(layered_missing,1);

    }
}


float threshold(float value, float threshold) {
    return value < threshold ? 0.0 : 1.0;
}

void overlay() {
    vec4 shader_check = round(texture(Sampler0, texCoord0)*255);
    
    if (shader_check == vec4(171,80,137,112)) {
        vec2 uv = gl_FragCoord.xy / ScreenSize;
        uv = round(uv*100)/100;
        float distance = distance(uv,vec2(0.5));

        // solid red when <= 3, fade to 0 by 8
        float alpha = 1.0 - smoothstep(3.0, 18.0, sphericalVertexDistance);
        float noise = cnoise(vec3(uv*10,GameTime*1200))/2.0 + 0.5;
        noise = clamp(noise+0.2,0.0,1.0);
        // Bias noise toward edges: 0 near center, 1 near edges
        float edgeFactor = pow(clamp(distance * 1.5, 0.0, 1.0), 1.4);

        // Apply edge bias + alpha
        noise *= edgeFactor * alpha;
        
        noise = threshold(noise,min(0.5,smoothstep(2,6,sphericalVertexDistance)));
        // mix solid red with noise-based red using alpha
        vec3 layered_missing = mix(missing_screen_space(1,vec2(5),vec2(4)), missing_screen_space(1.2,vec2(13,4),vec2(2,1)),clamp(sin(GameTime*2400)/2+0.3,0,0.7));
        fragColor = vec4(layered_missing, noise);
        if (noise < 0.1) {
            discard;
        }
    }
}
