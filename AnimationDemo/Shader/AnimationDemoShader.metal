//
//  AnimationDemoShader.metal
//  AnimationDemo
//
//  Created by Didier Delhaisse on 04/11/2025.
//

#include <metal_stdlib>
using namespace metal;

// Small helpers
inline float osc(float t, float speed, float phase, float amp) {
    return 0.5 + amp * sin(t * speed + phase);
}

inline half4 mixColor(half4 a, half4 b, float x) {
    return a + half(x) * (b - a);
}

// Expose to SwiftUI shaders
[[ stitchable ]]
half4 lavaLampShader(float2 position,
                     half4 /*color*/,
                     float2 size,
                     float  time,
                     float  threshold,
                     float  distanceFactor,
                     half4  blobBottomColor,
                     half4  blobTopColor)
{
    float2 uv = position / size;

    // Base result: background dark
    half4 result = half4(0.0, 0.0, 0.0, 1.0);

    // Aviation palette vertical blend
    half4 grad = mixColor(blobBottomColor, blobTopColor, uv.y);

    // Six “blobs” flying like beacons in a flow field (phase offsets mimic different lanes)
    float3 centers[6];
    centers[0] = float3(0.60, osc(time, 0.50, 0.40, 0.50), 0.60);
    centers[1] = float3(0.35, osc(time, 0.20, 0.50, 0.60), 0.55);
    centers[2] = float3(0.55, osc(time, 0.12, 0.10, 0.50), 0.55);
    centers[3] = float3(0.45, osc(time, 0.10, 0.20, 0.80), 0.80);
    centers[4] = float3(0.62, osc(time, 0.09, 0.00, 0.80), 0.80);
    centers[5] = float3(0.20, osc(time, 0.18, 1.00, 0.60), 0.65);

    // Metaball field (inverse-distance sum)
    float influence = 0.0;
    constexpr ushort n = 6;
    for (ushort i = 0; i < n; ++i) {
        float2 c = float2(centers[i].x, centers[i].y) * size;
        float d = distance(c, position) * (1.0 / distanceFactor) + 1e-4;
        influence += centers[i].z / d;
    }

    if (influence > threshold) {
        // inside the isosurface → colorized lava
        result = grad;
    }

    return result;
}

