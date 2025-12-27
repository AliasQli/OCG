#ifndef RAWCOLOR_H_
#define RAWCOLOR_H_

#include "./base.cginc"
#include "./common.cginc"

#define CARD_W 1394.0
#define CARD_H 2031.0

#define SCALE 1.0
#define OFFSET 0.0

#define CALC_OFFSET(v, size) float2(v.x, CARD_H - v.y - size.y)

float2 CalcOffset(float2 offset1, float2 size) {
    return float2(offset1.x, CARD_H - offset1.y - size.y);
}

#define LAYER_CALLBACK(name, CB) \
    static const float2 name##Offset = CALC_OFFSET(name##Offset1, name##Size); \
    static const float2 name##LB = name##Offset / cardSize; \
    static const float2 name##HB = (name##Offset + name##Size) / cardSize; \
    withinBound = 0; \
    if (name##LB.x <= i_uv.x && i_uv.x <= name##HB.x && name##LB.y <= i_uv.y && i_uv.y <= name##HB.y) { \
        static const float2 factor = cardSize / name##Size * SCALE; \
        static const float2 bias = - (name##Offset / name##Size) * SCALE + OFFSET; \
        const float2 uv = i_uv * factor + bias; \
        withinBound = 1; \
        CB; \
    }

#define LAYER(frontColor, name, tex) LAYER_CALLBACK(name, frontColor += REVERSE_SAMPLE(uv, tex))

// #define DEFAULT_ST float4(1, 1, 0, 0)

#define ARROW_LAYER(frontColor, name, mask) \
    static const float2 name##Offset = CALC_OFFSET(name##Offset1, name##Size); \
    static const float2 name##LB = name##Offset / cardSize; \
    static const float2 name##HB = (name##Offset + name##Size) / cardSize; \
    if (name##LB.x <= i_uv.x && i_uv.x <= name##HB.x && name##LB.y <= i_uv.y && i_uv.y <= name##HB.y) { \
        static const float2 factor = cardSize / arrowSize * SCALE; \
        static const float2 bias = - (arrowOffset / arrowSize) * SCALE + OFFSET; \
        const float2 uv = i_uv * factor + bias; \
        frontColor += PLAIN_SAMPLE_COND((_Arrow & mask) != 0, uv, _ArrowOnTex, _ArrowOffTex); \
    }

#define BLENDLAYER() \
    baseColor = frontColor.rgb * frontColor.a + baseColor * (1 - frontColor.a); \
    frontColor = float4(0, 0, 0, 0);

DEF_TEX_NOSAMPLER(_MainTex);
DEF_TEX_NOSAMPLER(_PendulumTex);
DEF_TEX_NOSAMPLER(_BaseTex);
DEF_TEX_NOSAMPLER(_MaskTex);
DEF_TEX_NOSAMPLER(_PendulumMaskTex);
DEF_TEX_NOSAMPLER(_AttrTex);
DEF_TEX_NOSAMPLER(_IconTex);
DEF_TEX_NOSAMPLER(_LevelTex);
DEF_TEX_NOSAMPLER(_ArrowOnTex);
DEF_TEX_NOSAMPLER(_ArrowOffTex);

int _Level;
int _Arrow;
int _IsPendulum;

float4 RawColor(float2 i_uv)
{
    static const float2 cardSize = float2(CARD_W, CARD_H);

    float3 baseColor = REVERSE_SAMPLE(i_uv, _BaseTex);
    float4 frontColor = float4(0, 0, 0, 0); // transparent
    bool withinBound = 0;

    static const float2 imgSize = _IsPendulum ? float2(1210, 1537) : float2(1054, 1054);
    static const float2 imgOffset1 = _IsPendulum ? float2(92, 364) : float2(170, 375);
    LAYER_CALLBACK(img, frontColor = REVERSE_SAMPLE_COND(_IsPendulum, uv, _PendulumTex, _MainTex));
    bool imgBound = withinBound;

    static const float2 attrSize = float2(128, 128);
    static const float2 attrOffset1 = float2(1163, 96);
    LAYER(frontColor, attr, _AttrTex);

    static const float2 levelSize = float2(1192, 88);
    static const float2 levelOffset1 = float2(101, 247);
    LAYER(frontColor, level, _LevelTex);

    static const float2 iconSize = float2(72, 72);
    static const float2 iconOffset1 = float2(1176, 260);
    LAYER(frontColor, icon, _IconTex);

    BLENDLAYER();

    static const float2 maskSize = _IsPendulum ? float2(1256, 1596) : float2(1164, 1164);
    static const float2 maskOffset1 = _IsPendulum ? float2(68, 342) : float2(116, 321);
    float4 maskColor = 0;
    LAYER_CALLBACK(mask, maskColor = PLAIN_SAMPLE_COND(_IsPendulum, uv, _PendulumMaskTex, _MaskTex));
    frontColor += maskColor;
    bool kiraMask = imgBound && maskColor.a == 0;

    BLENDLAYER();

    if (_Arrow > 0) {
        static const float2 arrowSize = float2(1252, 1248);
        static const float2 arrowOffset1 = float2(71, 278);
        static const float2 arrowOffset = CALC_OFFSET(arrowOffset1, arrowSize);

        static const float2 arrowUpSize = float2(281, 98);
        static const float2 arrowUpOffset1 = float2(555, 278);
        ARROW_LAYER(frontColor, arrowUp, LINK_MARKER_TOP);

        static const float2 arrowDownSize = arrowUpSize;
        static const float2 arrowDownOffset1 = float2(555, 1428);
        ARROW_LAYER(frontColor, arrowDown, LINK_MARKER_BOTTOM);

        static const float2 arrowLeftSize = float2(100, 287);
        static const float2 arrowLeftOffset1 = float2(71, 758);
        ARROW_LAYER(frontColor, arrowLeft, LINK_MARKER_LEFT);

        static const float2 arrowRightSize = arrowLeftSize;
        static const float2 arrowRightOffset1 = float2(1223, 761);
        ARROW_LAYER(frontColor, arrowRight, LINK_MARKER_RIGHT);

        static const float2 arrowUpLeftSize = float2(168, 168);
        static const float2 arrowUpLeftOffset1 = float2(95, 299);
        ARROW_LAYER(frontColor, arrowUpLeft, LINK_MARKER_TOP_LEFT);

        static const float2 arrowUpRightSize = arrowUpLeftSize;
        static const float2 arrowUpRightOffset1 = float2(1130, 299);
        ARROW_LAYER(frontColor, arrowUpRight, LINK_MARKER_TOP_RIGHT);

        static const float2 arrowDownLeftSize = arrowUpLeftSize;
        static const float2 arrowDownLeftOffset1 = float2(95, 1336);
        ARROW_LAYER(frontColor, arrowDownLeft, LINK_MARKER_BOTTOM_LEFT);

        static const float2 arrowDownRightSize = arrowUpLeftSize;
        static const float2 arrowDownRightOffset1 = float2(1130, 1336);
        ARROW_LAYER(frontColor, arrowDownRight, LINK_MARKER_BOTTOM_RIGHT);

        BLENDLAYER();
    }

    return float4(baseColor, kiraMask);
}

#endif