#ifndef UTIL_H_
#define UTIL_H_

#include "./base.cginc"

float3 ScaleNormal(float3 normal, float power)
{
    // float3 normal1 = normal - float3(0.0, 0.0, 1.0);
    // return power * normal1 + float3(0.0, 0.0, 1.0);
    return lerp(float3(0.0, 0.0, 1.0), normal, power);
}

float3 CombineNormal(float3 a, float3 b)
{
    return normalize(float3(a.xy + b.xy, a.z * b.z));
}

float3 UnpackColor(float3 color, float t)
{
    float4 color1 = color.g >= color.b ? float4(color.gb, 0, -0.3333333) : float4(color.bg, -1.0, 0.6666667);
    float4 color2 = color.r >= color1.x ? float4(color.r, color1.y, color1.z, color1.x) : float4(color1.xyw, color.r);
    float x7 = color2.x - min(color2.y, color2.w);
    float x8 = t + abs((color2.w - color2.y) / (x7 * 6.0) + color2.z);
    float x9 = x8 < 0.0 ? x8 + 1.0 : (x8 > 1.0 ? x8 - 1.0 : x8);
    float3 xyz10 = x9 + float3(1.0, 0.6666667, 0.3333333);
    float3 xyz11 = frac(xyz10) * 6.0 - 3.0;
    float3 xyz12 = saturate(abs(xyz11) - 1.0);
    float3 xyz13 = xyz12 - 1.0;
    return x7 * xyz13 + color2.x;
}

float2 TileToUV(float tile, float2 uv)
{
    float tmp0_w_122 = tile * tile;
    // float tmp1_w_123 = 1.00001 / tmp0_w_122;
    float tmp1_w_123 = 1.00001 / tmp0_w_122;
    // float tmp1_w_124 = frac(tmp1_w_123);
    float tmp1_w_124 = frac(tmp1_w_123);
    // float tmp0_w_125 = tmp0_w_122 * tmp1_w_124;
    float tmp0_w_125 = tmp0_w_122 * tmp1_w_124;
    // float tmp0_w_126 = floor(tmp0_w_125);
    float tmp0_w_126 = floor(tmp0_w_125);
    // float tmp1_w_127 = tmp0_w_126 + 0.5;
    float tmp1_w_127 = tmp0_w_126 + 0.5;
    // float tmp3_w_128 = 1.0 / _Kira01_02Tile;
    float tmp3_w_128 = 1.0 / tile;
    // float tmp1_w_129 = tmp1_w_127 * tmp3_w_128;
    float tmp1_w_129 = tmp1_w_127 * tmp3_w_128;
    // float tmp4_x_130 = floor(tmp1_w_129);
    float tmp4_x_130 = floor(tmp1_w_129);
    // float tmp0_w_131 = -_Kira01_02Tile * tmp4_x_130 + tmp0_w_126;
    float tmp0_w_131 = -tile * tmp4_x_130 + tmp0_w_126;
    // float tmp0_w_132 = tmp0_w_131 + 1.0;
    float tmp0_w_132 = tmp0_w_131 + 1.0;
    // float tmp4_y_133 = _Kira01_02Tile - tmp0_w_132;
    float tmp4_y_133 = tile - tmp0_w_132;
    // float2 tmp4_xy_134 = float2(tmp4_x_130, tmp4_y_133) + inp.interp.yx;
    float2 tmp4_xy_134 = float2(tmp4_y_133, tmp4_x_130) + uv;
    // float2 tmp4_xy_135 = tmp4_xy_134 * tmp3_w_128.xx + float2(-0.77, -0.61);
    return tmp4_xy_134 / tile;
}

float3 Formula0(float3 a, float3 b)
{
    return a > 0.5 ? (2.0 * (a + b) - 1.0) : 0.0; 
}

float3 KiraAtColor(float t)
{
    float3 kiraAtColor = float3(sin(t * 2.5), sin(t * 2.5 + 2.09439), sin(t * 2.5 + 4.18878)) + float3(3.0, 3.0, 3.0);
    return kiraAtColor * float3(0.2, 0.2, 0.2);
}

float3 ProcessColor(float3 kiraColor)
{
    float3 color0 = pow(2.0, log(abs(kiraColor)) * 0.4166667);
    float3 color1 = color0 * 1.055 - 0.055;
    return kiraColor <= 0.0031308 ? kiraColor * 12.92321 : color1;
}

#endif