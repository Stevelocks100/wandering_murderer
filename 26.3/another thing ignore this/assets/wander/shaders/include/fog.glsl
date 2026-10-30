#define FOG_STEPS 6

const float FOG_DENSITY = 0.08;
const float FOG_NOISE_SCALE = 1;
const float FOG_ANIMATION_SPEED = 0.025 * 1200;
const vec3 FOG_COLOR = vec3(0.72, 0.78, 0.85) / 15;

vec3 reconstructViewPos(vec2 uv, float depth) {
    #ifdef RENDERPEARL_DEPTH_IS_ZERO_TO_ONE
        vec4 clipPos = vec4(
            uv * 2.0 - 1.0,
            depth,
            1.0
        );
    #else
        vec4 clipPos = vec4(
            uv * 2.0 - 1.0,
            depth * 2.0 - 1.0,
            1.0
        );
    #endif
    

    vec4 viewPos = InvProjMat * clipPos;
    return viewPos.xyz / viewPos.w;
}

float fogDensityAt(vec3 worldPos) {
    float noise = fbm4d(
        vec4(
            worldPos * FOG_NOISE_SCALE,
            GameTime * FOG_ANIMATION_SPEED
        ),
        2
    );

    noise = clamp(noise, 0.0, 1.0);

    float density = pow(noise, 1.5);
    density = mix(0.08, 1.8, density);
    return density * FOG_DENSITY;
}

vec3 applyVolumetricFog(vec3 sceneColor, vec2 uv, float fog_strength) {
    float depth = texture(DepthSampler, uv).r;

    // Conventional depth 1.0 represents the far plane.
    // Handle the sky separately to avoid marching to an enormous distance.
    if (depth >= 0.9) {
        return sceneColor;
    }

    vec3 endPos = reconstructViewPos(uv, depth);
    float rayLength = min(length(endPos),fog_strength);

    if (rayLength < 0.001) {
        return sceneColor;
    }

    vec3 rayDir = endPos / rayLength;

    float stepLength = rayLength / float(FOG_STEPS);
    float transmittance = 1.0;
    vec3 scattering = vec3(0.0);

    for (int i = 0; i < FOG_STEPS; ++i) {
        float t = (float(i) + 0.5) * stepLength;
        vec3 p = rayDir * t;

        float density = fogDensityAt(CameraBlockPos - CameraOffset + p);

        float stepTransmittance = exp(-density * stepLength);

        // Constant fog illumination for this initial version.
        float cloudShadow = smoothstep(
            FOG_DENSITY * 0.75,
            FOG_DENSITY * 1.25,
            density
        );

        vec3 stepColor = FOG_COLOR * mix(0.35, 1.0, cloudShadow);

        scattering += transmittance
                    * (1.0 - stepTransmittance)
                    * stepColor;

        transmittance *= stepTransmittance;

        if (transmittance < 0.01) {
            break;
        }
    }

    return sceneColor * transmittance + scattering ;
}

