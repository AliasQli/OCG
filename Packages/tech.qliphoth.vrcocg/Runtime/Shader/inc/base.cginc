#ifndef BASE_H_
#define BASE_H_

#pragma vertex vert
#pragma fragment frag
// #include "UnityCG.cginc"
#include "UnityPBSLighting.cginc"

SamplerState my_linear_clamp_sampler;
SamplerState my_linear_repeat_sampler;

// #define DEF_TEX(name) \
//     sampler2D name; \
//     float4 name##_ST;
#define DEF_TEX_SAMPLER(name) \
    Texture2D name; \
    SamplerState sampler##name; \
    float4 name##_ST;
#define DEF_TEX_NOSAMPLER(name) \
    Texture2D name; \
    float4 name##_ST;

#define DEFAULT_SAMPLER my_linear_clamp_sampler

#define REVERSE_TRANSFORM_TEX(uv, st) (((uv) + (st).zw) / (st).xy)

#define SAMPLE(uv, tex) (tex).Sample(DEFAULT_SAMPLER, TRANSFORM_TEX(uv, tex))
#define PLAIN_SAMPLE(uv, tex) (tex).Sample(DEFAULT_SAMPLER, uv)
#define REVERSE_SAMPLE(uv, tex) (tex).Sample(DEFAULT_SAMPLER, REVERSE_TRANSFORM_TEX(uv, tex##_ST))
#define PLAIN_SAMPLE_COND(cond, uv, tex1, tex2) cond ? PLAIN_SAMPLE(uv, tex1) : PLAIN_SAMPLE(uv, tex2)
#define REVERSE_SAMPLE_COND(cond, uv, tex1, tex2) cond ? REVERSE_SAMPLE(uv, tex1) : REVERSE_SAMPLE(uv, tex2)

#define PI 3.141592653589793238462
#define CDOT(a, b) saturate(dot(a, b))

#endif