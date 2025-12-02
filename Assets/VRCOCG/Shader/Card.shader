Shader "OCG/Card"
{
    Properties
    {
        // The behavior of tiling and offset of this texture is changed.
        _MainTex ("Card Image", 2D) = "white" {}
        _PendulumTex ("Pendulum Card Image", 2D) = "white" {}
        
        _BaseTex ("Card Base", 2D) = "black" {}
        _BackTex ("Card Back", 2D) = "black" {}
        _MaskTex ("Normal Card Mask", 2D) = "black" {}
        _PendulumMaskTex ("PendulumCard Mask", 2D) = "black" {}
        _AttrTex ("Attribute", 2D) = "black" {}
        _IconTex ("Icon", 2D) = "black" {}
        _LevelTex ("Level Tex", 2D) = "black" {}
        _ArrowOnTex ("Link Arrow On Tex", 2D) = "black" {}
        _ArrowOffTex ("Link Arrow Off Tex", 2D) = "black" {}

        // _HasIcon ("Has Icon", Integer) = 0
        _Arrow ("Arrow", Integer) = -1
        _IsPendulum ("Is Pendulum", Integer) = 0
        _DoubleFace ("Double Face", Integer) = 0
    }
    SubShader
    {
        Tags { "RenderType" = "Opaque" "Queue"="Geometry" }
        LOD 100

        Pass
        {
            Cull Off
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "./common.h"

            #define SAMPLE(uv, tex) tex2D((tex), TRANSFORM_TEX(uv, tex))
            #define REVERSE_SAMPLE(uv, tex) tex2D((tex), ((uv) + (tex##_ST).zw) / (tex##_ST).xy)
            #define REVERSE_SAMPLE_COND(cond, uv, tex1, tex2) cond ? REVERSE_SAMPLE(uv, tex1) : REVERSE_SAMPLE(uv, tex2)

            #define CARD_W 1394.0
            #define CARD_H 2031.0

            #define SCALE 1
            #define OFFSET 0
            
            #define DEF_TEX(name) \
                sampler2D name; \
                float4 name##_ST;

            #define CALC_OFFSET(v, size) float2(v.x, CARD_H - v.y - size.y)

            #define LAYER_CALLBACK(name, CB) \
                static const float2 name##Offset = CALC_OFFSET(name##Offset1, name##Size); \
                static const float2 name##LB = name##Offset / cardSize; \
                static const float2 name##HB = (name##Offset + name##Size) / cardSize; \
                if (name##LB.x <= i.uv.x && i.uv.x <= name##HB.x && name##LB.y <= i.uv.y && i.uv.y <= name##HB.y) { \
                    static const float2 factor = cardSize / name##Size * SCALE; \
                    static const float2 bias = - (name##Offset / name##Size) * SCALE + OFFSET; \
                    const float2 uv = i.uv * factor + bias; \
                    CB; \
                }
                
            #define LAYER(frontColor, name, tex) LAYER_CALLBACK(name, frontColor += REVERSE_SAMPLE(uv, tex))

            #define ARROW_LAYER(frontColor, name, mask) \
                static const float2 name##Offset = CALC_OFFSET(name##Offset1, name##Size); \
                static const float2 name##LB = name##Offset / cardSize; \
                static const float2 name##HB = (name##Offset + name##Size) / cardSize; \
                if (name##LB.x <= i.uv.x && i.uv.x <= name##HB.x && name##LB.y <= i.uv.y && i.uv.y <= name##HB.y) { \
                    static const float2 factor = cardSize / arrowSize * SCALE; \
                    static const float2 bias = - (arrowOffset / arrowSize) * SCALE + OFFSET; \
                    const float2 uv = i.uv * factor + bias; \
                    frontColor += REVERSE_SAMPLE_COND((_Arrow & mask) != 0, uv, _ArrowOnTex, _ArrowOffTex); \
                }
            
            #define BLENDLAYER() \
                baseColor = frontColor * frontColor.a + baseColor * (1 - frontColor.a); \
                baseColor.a = 1; \
                frontColor = float4(0, 0, 0, 0)

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            DEF_TEX(_MainTex);
            DEF_TEX(_PendulumTex);
            DEF_TEX(_BaseTex);
            DEF_TEX(_BackTex);
            DEF_TEX(_MaskTex);
            DEF_TEX(_PendulumMaskTex);
            DEF_TEX(_AttrTex);
            DEF_TEX(_IconTex);
            DEF_TEX(_LevelTex);
            DEF_TEX(_ArrowOnTex);
            DEF_TEX(_ArrowOffTex);

            int _Level;
            int _Arrow;
            int _IsPendulum;
            int _DoubleFace;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            float4 frag (v2f i, fixed facing : VFACE) : SV_Target
            {
                static const float2 cardSize = float2(CARD_W, CARD_H);

                if (facing <= 0) {
                    i.uv.x = 1 - i.uv.x;
                    if (_DoubleFace == 0) {
                        // back side, mirror
                        return REVERSE_SAMPLE(i.uv, _BackTex);
                    }
                }

                float4 baseColor = REVERSE_SAMPLE(i.uv, _BaseTex);
                float4 frontColor = float4(0, 0, 0, 0); // transparent

                static const float2 imgSize = _IsPendulum ? float2(1210, 1537) : float2(1054, 1054);
                static const float2 imgOffset1 = _IsPendulum ? float2(92, 364) : float2(170, 375);
                LAYER_CALLBACK(img, frontColor = REVERSE_SAMPLE_COND(_IsPendulum, uv, _PendulumTex, _MainTex));

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
                LAYER_CALLBACK(mask, frontColor = REVERSE_SAMPLE_COND(_IsPendulum, uv, _PendulumMaskTex, _MaskTex));

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

                return baseColor;
            }
            ENDCG
        }
    }
}