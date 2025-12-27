Shader "Shader Graphs/RoyalStyle3D" {
    Properties {
        [NoScaleOffset] _MainTex ("MainTex", 2D) = "white" {}
        [NoScaleOffset] _LoadingTex ("LoadingTex", 2D) = "white" {}
        _LoadingBlend ("LoadingBlend", Range(0, 1)) = 0
        [NoScaleOffset] _MonsterNameTex ("MonsterNameTex", 2D) = "black" {}
        _MonsterNameTextBold ("MonsterNameTextBold", Float) = 1.3
        _MonsterNameNormalPower ("MonsterNameNormalPower", Float) = 3
        [NoScaleOffset] _AttributeTex ("AttributeTex", 2D) = "white" {}
        _AttributeTile ("AttributeTile", Float) = 0
        _AttributeSize_Pos ("AttributeSize&Pos", Vector) = (9.85, 13.9, -3.7, -5.81)
        _MainTexMetal ("MainTexMetal", Float) = 1
        [NoScaleOffset] _MainNormal ("MainNormal", 2D) = "white" {}
        _MainNormalPower ("MainNormalPower", Float) = 1
        _FrameMetal ("FrameMetal", Float) = 0
        _CubemapPower ("CubemapPower", Float) = 2
        _CubemapColor ("CubemapColor", Color) = (0.8980392, 0.8666667, 0.3254902, 0)
        [NoScaleOffset] _FrameMask ("FrameMask", 2D) = "black" {}
        [HDR] _KiraColor01 ("KiraColor01", Color) = (0.4392157, 0.4156863, 0.5843138, 0)
        [NoScaleOffset] _KiraColorTexture ("KiraColorTexture", 2D) = "white" {}
        _KiraMetal01 ("KiraMetal01", Float) = -0.33
        _Kira01_01Tile ("Kira01_01Tile", Float) = 0.5
        _KiraNormal01_01Power ("Kira01_01Power", Float) = 1
        [NoScaleOffset] _KiraNormal01_02 ("Kira01_02", 2D) = "white" {}
        _Kira01_02Tile ("Kira01_02Tile", Float) = 2
        _Kira01_02Power ("Kira01_02Power", Float) = -2.19
        _CardDistortion01 ("CardDistortion01", Float) = 1
        [NoScaleOffset] _HoloTex ("HoloTex01", 2D) = "white" {}
        [HDR] _KiraColor02 ("KiraColor02", Color) = (0.4352941, 0.3960784, 0.6588235, 0)
        _HoloShift01 ("HoloShift01", Float) = 2.18
        _HoloBrightness ("HoloBrightness", Float) = 1
        _KiraMetal02 ("KiraMetal02", Float) = 3
        [NoScaleOffset] [Normal] _Kira02_01 ("Kira02_01", 2D) = "bump" {}
        _Kira02_01Tile ("Kira02_01Tile", Float) = 1
        _Kira02_01Power ("Kira02_01Power", Float) = -3.47
        _Kira2_02Tile ("Kira2_02Tile", Float) = 1
        _Kira02_02Power ("Kira02_02Power", Float) = 0.49
        _CardDistortion02 ("CardDistortion02", Float) = 1
        [NoScaleOffset] _KiraMask ("KiraMask", 2D) = "white" {}
        _HoloBrightness02 ("HoloBrightness02", Float) = 1.29
        _HoloShift02 ("HoloShift02", Float) = 1
        _SpecularColor ("SpecularColor", Color) = (0.1019608, 0.1019608, 0.1019608, 1)
        _Smoothness ("Smoothness", Float) = 0.5
        _AmbientColor ("AmbientColor", Color) = (0.1019608, 0.1019608, 0.1019608, 1)
        _AddColor ("AddColor", Color) = (0.5019608, 0.5019608, 0.5019608, 1)
        _Monochrome ("Monochrome", Range(0, 1)) = 0
        _DirectionalLightAmp ("DirectionalLightAmp", Float) = 0.88
        _Color ("Color", Color) = (1, 1, 1, 0)
        _ScrollSpeed ("ScrollSpeed", Float) = 1.5
        _HighlightAmp ("HighlightAmp", Float) = 1.8
        _HighlightScrollOffset ("HighlightScrollOffset", Float) = 0
        _HighlightRotation ("HighlightRotation", Float) = -30
        _CubemapContrast ("CubemapContrast", Range(0, 1)) = 0
        [NoScaleOffset] _HighlightTex ("HighlightTex", 2D) = "white" {}
        [NoScaleOffset] _HighlightNormal ("HighlightNormal", 2D) = "white" {}
        _EnhanceColorThreshold ("EnhanceColorThreshold", Float) = 1
        _RanbowPower ("RanbowPower", Float) = 0
        _IllustBright ("IllustBright", Float) = 0
        _IlluustRanbowPower ("IlluustRanbowPower", Float) = 0
        _FakeLightColor ("FakeLightColor", Color) = (0, 0, 0, 0)
        _FakeLightDirection ("FakeLightDirection", Vector) = (0, 0, 0, 0)
        _FakeViewDirection ("FakeViewDirection", Vector) = (0, 0, 0, 0)
        _FakeNormalDirection ("FakeNormalDirection", Vector) = (0, 0, 0, 0)
        _FakeBlend ("FakeBlend", Range(0, 1)) = 0
        _TintColor ("TintColor", Color) = (1, 1, 1, 1)
        [ToggleUI] _isFade ("isFade", Float) = 0
        [NoScaleOffset] _Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D ("Texture2D", 2D) = "white" {}
        [HideInInspector] _QueueOffset ("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl ("_QueueControl", Float) = -1
        [HideInInspector] [NoScaleOffset] unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector] [NoScaleOffset] unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector] [NoScaleOffset] unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" {}
    }
    SubShader {
        Tags {
            "DisableBatching"="False"
            "QUEUE"="Transparent"
            // "RenderPipeline"="UniversalPipeline"
            "RenderType"="Transparent"
            "ShaderGraphShader"="true"
            "ShaderGraphTargetId"="UniversalUnlitSubTarget"
            "UniversalMaterialType"="Unlit"
        }
        Pass {
            Name "Universal Forward"
            Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
            ZClip On
            Tags {
                "DisableBatching"="False"
                "QUEUE"="Transparent"
                // "RenderPipeline"="UniversalPipeline"
                "RenderType"="Transparent"
                "ShaderGraphShader"="true"
                "ShaderGraphTargetId"="UniversalUnlitSubTarget"
                "UniversalMaterialType"="Unlit"
            }
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityPBSLighting.cginc"

            

            struct appdata
            {
                float3 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float4 texcoord : TEXCOORD;
            };
            struct v2f
            {
                float4 position : SV_POSITION;
                float4 interp : INTERP;
                float3 interp1 : INTERP1;
                float3 interp2 : INTERP2;
            };

            // CBs for DX11VertexSM40
            // Textures for DX11VertexSM40

            v2f vert(appdata v)
            {
                v2f o;
                float4 tmp0;
                float4 tmp1;
                tmp0.xyz = v.vertex.yyy * unity_ObjectToWorld._m01_m11_m21;
                tmp0.xyz = unity_ObjectToWorld._m00_m10_m20 * v.vertex.xxx + tmp0.xyz;
                tmp0.xyz = unity_ObjectToWorld._m02_m12_m22 * v.vertex.zzz + tmp0.xyz;
                tmp0.xyz = tmp0.xyz + unity_ObjectToWorld._m03_m13_m23;
                tmp1 = tmp0.yyyy * unity_MatrixVP._m01_m11_m21_m31;
                tmp1 = unity_MatrixVP._m00_m10_m20_m30 * tmp0.xxxx + tmp1;
                tmp1 = unity_MatrixVP._m02_m12_m22_m32 * tmp0.zzzz + tmp1;
                o.interp1.xyz = tmp0.xyz;
                o.position = tmp1 + unity_MatrixVP._m03_m13_m23_m33;
                o.interp = v.texcoord;
                tmp0.x = dot(v.normal.xyz, unity_WorldToObject._m00_m10_m20);
                tmp0.y = dot(v.normal.xyz, unity_WorldToObject._m01_m11_m21);
                tmp0.z = dot(v.normal.xyz, unity_WorldToObject._m02_m12_m22);
                tmp0.w = dot(tmp0.xyz, tmp0.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                o.interp2.xyz = tmp0.www * tmp0.xyz;
                return o;
            }

            struct fout
            {
                float4 sv_target : SV_Target;
            };

            // CBs for DX11PixelSM40
            float2 _GlobalMipBias; // 64 (starting at cb0[4].x)
            float4 _MainLightPosition; // 80 (starting at cb0[5].x)
            float4 _MainLightColor; // 96 (starting at cb0[6].x)
            float4 _TimeParameters; // 304 (starting at cb0[19].x)
            // float4 unity_OrthoParams; // 400 (starting at cb0[25].x)
            // CBUFFER_START(UnityPerMaterial) // 1
                float _LoadingBlend; // 48 (starting at cb1[3].x)
            // CBUFFER_END
            float _MonsterNameTextBold; // 80 (starting at cb1[5].x)
            float _MonsterNameNormalPower; // 84 (starting at cb1[5].y)
            float _AttributeTile; // 112 (starting at cb1[7].x)
            float4 _AttributeSize_Pos; // 128 (starting at cb1[8].x)
            float _MainNormalPower; // 176 (starting at cb1[11].x)
            float _FrameMetal; // 180 (starting at cb1[11].y)
            float _CubemapPower; // 184 (starting at cb1[11].z)
            float4 _CubemapColor; // 192 (starting at cb1[12].x)
            float _Kira01_01Tile; // 260 (starting at cb1[16].y)
            float _KiraNormal01_01Power; // 264 (starting at cb1[16].z)
            float _Kira01_02Tile; // 288 (starting at cb1[18].x)
            float _Kira01_02Power; // 292 (starting at cb1[18].y)
            float _CardDistortion01; // 296 (starting at cb1[18].z)
            float4 _KiraColor02; // 320 (starting at cb1[20].x)
            float _HoloShift01; // 336 (starting at cb1[21].x)
            float _HoloBrightness; // 340 (starting at cb1[21].y)
            float _Kira02_01Tile; // 368 (starting at cb1[23].x)
            float _Kira02_01Power; // 372 (starting at cb1[23].y)
            float _Kira2_02Tile; // 376 (starting at cb1[23].z)
            float _Kira02_02Power; // 380 (starting at cb1[23].w)
            float _CardDistortion02; // 384 (starting at cb1[24].x)
            float _HoloBrightness02; // 416 (starting at cb1[26].x)
            float _HoloShift02; // 420 (starting at cb1[26].y)
            float4 _SpecularColor; // 432 (starting at cb1[27].x)
            float _Smoothness; // 448 (starting at cb1[28].x)
            float4 _AmbientColor; // 464 (starting at cb1[29].x)
            float4 _AddColor; // 480 (starting at cb1[30].x)
            float _Monochrome; // 496 (starting at cb1[31].x)
            float _DirectionalLightAmp; // 500 (starting at cb1[31].y)
            float4 _Color; // 512 (starting at cb1[32].x)
            float _ScrollSpeed; // 528 (starting at cb1[33].x)
            float _HighlightAmp; // 532 (starting at cb1[33].y)
            float _HighlightScrollOffset; // 536 (starting at cb1[33].z)
            float _HighlightRotation; // 540 (starting at cb1[33].w)
            float _EnhanceColorThreshold; // 592 (starting at cb1[37].x)
            float _RanbowPower; // 596 (starting at cb1[37].y)
            float _IllustBright; // 600 (starting at cb1[37].z)
            float _IlluustRanbowPower; // 604 (starting at cb1[37].w)
            float4 _FakeLightColor; // 608 (starting at cb1[38].x)
            float3 _FakeLightDirection; // 624 (starting at cb1[39].x)
            float3 _FakeViewDirection; // 640 (starting at cb1[40].x)
            float3 _FakeNormalDirection; // 656 (starting at cb1[41].x)
            float _FakeBlend; // 668 (starting at cb1[41].w)
            float4 _TintColor; // 672 (starting at cb1[42].x)
            float _isFade; // 688 (starting at cb1[43].x)
            // Textures for DX11PixelSM40
            sampler2D _Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D; // 0
            sampler2D _MainTex; // 1
            sampler2D _LoadingTex; // 2
            sampler2D _MonsterNameTex; // 3
            sampler2D _AttributeTex; // 4
            sampler2D _MainNormal; // 5
            sampler2D _FrameMask; // 6
            sampler2D _KiraColorTexture; // 7
            sampler2D _KiraNormal01_02; // 8
            sampler2D _HoloTex; // 9
            sampler2D _Kira02_01; // 10
            sampler2D _KiraMask; // 11
            sampler2D _HighlightTex; // 12
            sampler2D _HighlightNormal; // 13

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
                float4 color1 = color.g >= color.b ? float4(color.gb, 0, 0.6666667 - 1.0) : float4(color.bg, -1.0, 0.6666667);
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

            fout frag(v2f inp)
            {
                fout o;
                // float2 tmp0_zw_0 = float2(-1.0, 0.6666667);
                // float2 tmp1_zw_1 = float2(1.0, -1.0);
                // float3 tmp2_xyz_2 = log(abs(_KiraColor02.xyz));
                // float3 tmp2_xyz_3 = tmp2_xyz_2 * float3(0.4166667, 0.4166667, 0.4166667);
                // float3 tmp2_xyz_4 = pow(2.0, tmp2_xyz_3);
                float3 tmp2_xyz_4 = pow(2.0, log(abs(_KiraColor02.xyz)) * 0.4166667);
                // float3 tmp2_xyz_5 = tmp2_xyz_4 * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
                float3 tmp2_xyz_5 = tmp2_xyz_4 * 1.055 - 0.055;
                // float3 tmp3_xyz_6 = _KiraColor02.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
                // float3 tmp4_xyz_7 = _KiraColor02.xyz * float3(12.92321, 12.92321, 12.92321);
                // float3 tmp2_xyz_8 = tmp3_xyz_6 ? tmp4_xyz_7 : tmp2_xyz_5;
                float3 kiraColor = _KiraColor02.xyz <= 0.0031308 ? _KiraColor02.xyz * 12.92321 : tmp2_xyz_5;
                // float4 tmp3_xyzw_9 = tex2Dbias(_KiraColorTexture, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 kiraColorSampled = tex2Dbias(_KiraColorTexture, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // float3 tmp4_xyw_10 = tmp2_xyz_8.yzx * tmp3_xyzw_9.yzx;
                float3 multKiraColor = kiraColor * kiraColorSampled;
                // float2 tmp0_xy_11 = tmp4_xyw_10.yx;
                // float2 tmp1_xy_12 = tmp3_xyzw_9.yz * tmp2_xyz_8.yz + -tmp0_xy_11;
                // float tmp2_w_13 = tmp0_xy_11.y >= tmp4_xyw_10.y;
                // float tmp2_w_14 = uint1(tmp2_w_13) & uint1(1);
                // float4 color1 = tmp2_w_14.xxxx * float4(tmp1_xy_12, tmp1_zw_1) + float4(tmp0_xy_11, tmp0_zw_0);
                // float4 color1 = tmp2_w_14.xxxx * float4(multKiraColor.gb - multKiraColor.bg, tmp1_zw_1) + float4(multKiraColor.bg, tmp0_zw_0);
                float4 color1 = multKiraColor.g >= multKiraColor.b ? float4(multKiraColor.gb, float2(1.0, -1.0) + float2(-1.0, 0.6666667)) : float4(multKiraColor.bg, float2(-1.0, 0.6666667));
                // float3 tmp4_xyz_16 = color1.xyw;
                // float tmp1_x_17 = tmp4_xyw_10.z >= tmp4_xyz_16.x;
                // float tmp1_x_18 = uint1(tmp1_x_17) & uint1(1);
                // float3 tmp0_xyw_19 = float3(tmp4_xyw_10.z, tmp4_xyz_16.yx);
                // float4 tmp0_xyzw_20 = float4(tmp0_xyw_19.xy, color1.z, tmp0_xyw_19.z) - float4(tmp4_xyz_16, tmp4_xyw_10.z);
                // float4 color2 = tmp1_x_18.xxxx * tmp0_xyzw_20 + float4(tmp4_xyz_16, tmp4_xyw_10.z);
                // float4 color2 = tmp1_x_18.xxxx * tmp0_xyzw_20 + float4(color1.xyw, multKiraColor.r);
                float4 color2 = multKiraColor.r >= color1.x ? float4(multKiraColor.r, color1.y, color1.z, color1.x) : float4(color1.xyw, multKiraColor.r);
                // float tmp1_x_22 = color2.w - color2.y;
                float tmp1_x_22 = color2.w - color2.y;
                // float tmp0_y_23 = min(color2.y, color2.w);
                // float tmp0_y_24 = color2.x - tmp0_y_23;
                float x7 = color2.x - min(color2.y, color2.w);
                // float tmp0_w_25 = tmp0_y_24 * 6.0 + 0.0;
                // float tmp0_w_26 = tmp1_x_22 / tmp0_w_25;
                // float tmp0_z_27 = tmp0_w_26 + color2.z;
                // float tmp0_z_28 = _Time.y * 0.1111111 + abs(tmp0_z_27);
                float x8 = _Time.y * 0.1111111 + abs((color2.w - color2.y) / (x7 * 6.0) + color2.z);
                // float tmp0_w_29 = tmp0_z_28 > 1.0;
                // float2 tmp1_xy_30 = tmp0_z_28.xx + float2(1.0, -1.0);
                // float tmp0_w_31 = tmp0_w_29 ? tmp1_xy_30.y : tmp0_z_28;
                // float tmp0_z_32 = tmp0_z_28 < 0.0;
                // float tmp0_z_33 = tmp0_z_32 ? tmp1_xy_30.x : tmp0_w_31;
                float x9 = x8 < 0.0 ? x8 + 1.0 : (x8 > 1.0 ? x8 - 1.0 : x8);
                // float3 tmp1_xyz_34 = tmp0_z_33.xxx + float3(1.0, 0.6666667, 0.3333333);
                float3 xyz10 = x9 + float3(1.0, 0.6666667, 0.3333333);
                // float3 tmp1_xyz_35 = frac(tmp1_xyz_34);
                // float3 tmp1_xyz_36 = tmp1_xyz_35 * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                float3 xyz11 = frac(xyz10) * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                // float3 tmp1_xyz_37 = saturate(abs(tmp1_xyz_36) - float3(1.0, 1.0, 1.0));
                float3 xyz12 = saturate(abs(xyz11) - float3(1.0, 1.0, 1.0));
                // float3 tmp1_xyz_38 = tmp1_xyz_37 - float3(1.0, 1.0, 1.0);
                float3 xyz13 = xyz12 - float3(1.0, 1.0, 1.0);
                // float tmp0_z_39 = color2.x + 0.0;
                // float tmp0_w_40 = tmp0_y_24 / tmp0_z_39;
                float tmp0_w_40 = x7 / color2.x;
                // float tmp0_y_41 = tmp0_y_24 == 0.0;
                // float tmp0_x_42 = tmp0_y_41 ? color2.x : tmp0_z_39;
                // float3 tmp0_yzw_43 = tmp0_w_40.xxx * tmp1_xyz_38 + float3(1.0, 1.0, 1.0);
                float3 tmp0_yzw_43 = (x7 / color2.x) * xyz13 + 1;
                // float3 tmp1_xyz_44 = -tmp0_x_42.xxx * tmp0_yzw_43 + float3(1.0, 1.0, 1.0);
                // float3 tmp0_xyz_45 = tmp0_yzw_43 * tmp0_x_42.xxx;
                // float3 calcKiraColor = x7 * xyz13 + color2.x;
                float3 calcKiraColor = UnpackColor(multKiraColor, _Time.y * 0.1111111);;
                float3 tmp1_xyz_44 = 1 - calcKiraColor;
                // float3 tmp3_xyz_46 = float3(1.0, 1.0, 1.0) - tmp2_xyz_8;
                float3 tmp3_xyz_46 = 1 - kiraColor;
                // float3 tmp3_xyz_47 = tmp3_xyz_46 + tmp3_xyz_46;
                float3 tmp3_xyz_47 = 2 * (1 - kiraColor);
                // float3 tmp1_xyz_48 = -tmp3_xyz_47 * tmp1_xyz_44 + float3(1.0, 1.0, 1.0);
                float3 tmp1_xyz_48 = - 2 * (1 - kiraColor) * (1 - calcKiraColor) + 1;
                // float3 tmp3_xyz_49 = tmp2_xyz_8 <= float3(0.5, 0.5, 0.5);
                float3 tmp3_xyz_49 = kiraColor <= float3(0.5, 0.5, 0.5);
                // float3 tmp2_xyz_50 = tmp2_xyz_8 * tmp0_xyz_45;
                float3 tmp2_xyz_50 = kiraColor * calcKiraColor;
                // float3 tmp2_xyz_51 = tmp2_xyz_50 + tmp2_xyz_50;
                float3 tmp2_xyz_51 = 2 * kiraColor * calcKiraColor;
                // float3 tmp4_xyz_52 = tmp3_xyz_49 ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                float3 tmp4_xyz_52 = kiraColor <= 0.5 ? 0 : 1;
                // float3 tmp3_xyz_53 = uint3(tmp3_xyz_49) & uint3(int3(1, 1, 1));
                float3 tmp3_xyz_53 = uint3(tmp3_xyz_49) & uint3(int3(1, 1, 1));
                // float3 tmp1_xyz_54 = tmp1_xyz_48 * tmp4_xyz_52;
                // float3 tmp1_xyz_55 = tmp2_xyz_51 * tmp3_xyz_53 + tmp1_xyz_54;
                float3 kiraCalcKiraColor = Formula0(kiraColor, calcKiraColor);
                // o.sv_target = float4(kiraCalcKiraColor, 1.0);
                // return o;
                // float tmp0_w_56 = _Kira01_01Tile * _Kira01_01Tile;
                float kira01_01Tile_square = _Kira01_01Tile * _Kira01_01Tile;
                // float tmp1_w_57 = 1.00001 / tmp0_w_56;
                // float tmp1_w_58 = frac(tmp1_w_57);
                // float tmp0_w_59 = tmp0_w_56 * tmp1_w_58;
                // float tmp0_w_60 = floor(tmp0_w_59);
                float tmp0_w_60 = floor(kira01_01Tile_square * frac(1.00001 / (kira01_01Tile_square)));
                // float tmp1_w_61 = tmp0_w_60 + 0.5;
                // float tmp2_x_62 = 1.0 / _Kira01_01Tile;
                // float tmp1_w_63 = tmp1_w_61 * tmp2_x_62;
                // float tmp3_y_64 = floor(tmp1_w_63);
                float tmp3_y_64 = floor((tmp0_w_60 + 0.5) / _Kira01_01Tile);
                // float tmp0_w_65 = -_Kira01_01Tile * tmp3_y_64 + tmp0_w_60;
                // float tmp0_w_66 = tmp0_w_65 + 1.0;
                // float tmp3_x_67 = _Kira01_01Tile - tmp0_w_66;
                float tmp3_x_67 = _Kira01_01Tile * (tmp3_y_64 + 1.0) - tmp0_w_60 - 1.0;
                // float2 tmp2_yz_68 = float2(tmp3_x_67, tmp3_y_64) + inp.interp.xy;
                float2 tmp2_yz_68 = float2(tmp3_x_67, tmp3_y_64) + inp.interp.xy;
                // float2 tmp2_xy_69 = tmp2_x_62.xx * tmp2_yz_68;
                float2 tile1UV = TileToUV(_Kira01_01Tile, inp.interp.xy);
                // float4 tmp2_xyzw_70 = tex2Dbias(_HighlightNormal, float4(tmp2_xy_69, 0, _GlobalMipBias.x));
                float4 rawHNormal = tex2Dbias(_HighlightNormal, float4(tile1UV, 0, _GlobalMipBias.x));
                // float tmp2_x_71 = tmp2_xyzw_70.x * tmp2_xyzw_70.w;
                // float2 tmp2_xw_72 = float2(tmp2_xyzw_70.y, tmp2_x_71) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 hNormalXY = float2(rawHNormal.x * rawHNormal.w, rawHNormal.y) * 2.0 - 1.0;
                float2 tmp2_xw_72 = hNormalXY.yx;
                // float tmp0_w_73 = dot(tmp2_xw_72, tmp2_xw_72);
                // float tmp0_w_74 = min(tmp0_w_73, 1.0);
                // float tmp0_w_75 = 1.0 - tmp0_w_74;
                // float tmp0_w_76 = sqrt(tmp0_w_75);
                // float tmp3_x_77 = max(tmp0_w_76, 0.0);
                float hNormalZ = max(sqrt(1.0 - min(dot(hNormalXY, hNormalXY), 1.0)), 0.0);
                // float tmp0_w_78 = tmp2_xw_72.x >= tmp3_x_77;
                float tmp0_w_78 = hNormalXY.y >= hNormalZ;
                // float tmp0_w_79 = uint1(tmp0_w_78) & uint1(1);
                float tmp0_w_79 = uint1(tmp0_w_78) & uint1(1);
                // float tmp4_x_80 = tmp2_xw_72.x - tmp3_x_77;
                float tmp4_x_80 = hNormalXY.y - hNormalZ;
                // float tmp3_y_81 = tmp2_xw_72.x;
                // float tmp4_y_82 = tmp3_x_77 - tmp3_y_81;
                float tmp4_y_82 = hNormalZ - hNormalXY.y;
                // float2 tmp3_zw_83 = float2(-1.0, 0.6666667);
                float2 tmp3_zw_83 = float2(-1.0, 0.6666667);
                // float2 tmp4_zw_84 = float2(1.0, -1.0);
                float2 tmp4_zw_84 = float2(1.0, -1.0);
                // float4 tmp3_xyzw_85 = tmp0_w_79.xxxx * float4(tmp4_x_80, tmp4_y_82, tmp4_zw_84) + float4(tmp3_x_77, tmp3_y_81, tmp3_zw_83);
                // float4 tmp3_xyzw_85 = tmp0_w_79.xxxx * float4(hNormalXY.y - hNormalZ, hNormalZ - hNormalXY.y, tmp4_zw_84) + float4(hNormalZ, hNormalXY.y, tmp3_zw_83);
                float4 normal1 = hNormalXY.y >= hNormalZ ? float4(hNormalXY.y, hNormalZ, float2(1.0, -1.0) + float2(-1.0, 0.6666667)) : float4(hNormalZ, hNormalXY.y, float2(-1.0, 0.6666667));
                // float tmp0_w_86 = tmp2_xw_72.y >= tmp3_xyzw_85.x;
                // float tmp0_w_87 = uint1(tmp0_w_86) & uint1(1);
                // float3 tmp2_xyz_88 = tmp3_xyzw_85.xyw;
                // float3 tmp3_xyw_89 = float3(tmp2_xw_72.y, tmp2_xyz_88.yx);
                // float4 tmp3_xyzw_90 = float4(tmp3_xyw_89.xy, tmp3_xyzw_85.z, tmp3_xyw_89.z) - float4(tmp2_xyz_88, tmp2_xw_72.y);
                // float4 tmp2_xyzw_91 = tmp0_w_87.xxxx * tmp3_xyzw_90 + float4(tmp2_xyz_88, tmp2_xw_72.y);
                float4 normal2 = hNormalXY.x >= normal1.x ? float4(hNormalXY.x, normal1.y, normal1.z, normal1.x) : float4(normal1.xyw, hNormalXY.x);
                // float tmp0_w_92 = tmp2_xyzw_91.w - tmp2_xyzw_91.y;
                float tmp0_w_92 = normal2.w - normal2.y;
                // float tmp1_w_93 = min(tmp2_xyzw_91.y, tmp2_xyzw_91.w);
                float tmp1_w_93 = min(normal2.y, normal2.w);
                // float tmp1_w_94 = tmp2_xyzw_91.x - tmp1_w_93;
                float nx7 = normal2.x - min(normal2.y, normal2.w);
                // float tmp2_y_95 = tmp1_w_94 * 6.0 + 0.0;
                float tmp2_y_95 = nx7 * 6.0 + 0.0;
                // float tmp0_w_96 = tmp0_w_92 / tmp2_y_95;
                float tmp0_w_96 = (normal2.w - normal2.y) / (nx7 * 6.0);
                // float tmp0_w_97 = tmp0_w_96 + tmp2_xyzw_91.z;
                float tmp0_w_97 = (normal2.w - normal2.y) / (nx7 * 6.0) + normal2.z;
                // float tmp2_y_98 = sin(_Time.y);
                float tmp2_y_98 = sin(_Time.y);
                // float tmp0_w_99 = tmp2_y_98 * 0.1388889 + abs(tmp0_w_97);
                float nx8 = sin(_Time.y) * 0.1388889 + abs((normal2.w - normal2.y) / (nx7 * 6.0) + normal2.z);
                // float tmp2_y_100 = saturate(tmp2_y_98 + 0.5);
                float tmp2_y_100 = saturate(sin(_Time.y) + 0.5);
                // float tmp2_z_101 = tmp0_w_99 > 1.0;
                // float2 tmp3_xy_102 = tmp0_w_99.xx + float2(1.0, -1.0);
                // float tmp2_z_103 = tmp2_z_101 ? tmp3_xy_102.y : tmp0_w_99;
                // float tmp0_w_104 = tmp0_w_99 < 0.0;
                // float tmp0_w_105 = tmp0_w_104 ? tmp3_xy_102.x : tmp2_z_103;
                float nx9 = nx8 < 0.0 ? nx8 + 1.0 : (nx8 > 1.0 ? nx8 - 1.0 : nx8);
                // float3 tmp3_xyz_106 = tmp0_w_105.xxx + float3(1.0, 0.6666667, 0.3333333);
                float3 nxyz10 = nx9 + float3(1.0, 0.6666667, 0.3333333);
                // float3 tmp3_xyz_107 = frac(tmp3_xyz_106);
                float3 tmp3_xyz_107 = frac(nxyz10);
                // float3 tmp3_xyz_108 = tmp3_xyz_107 * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                float3 nxyz11 = frac(nxyz10) * 6.0 - 3.0;
                // float3 tmp3_xyz_109 = saturate(abs(tmp3_xyz_108) - float3(1.0, 1.0, 1.0));
                float3 nxyz12 = saturate(abs(nxyz11) - 1.0);
                // float3 tmp3_xyz_110 = tmp3_xyz_109 - float3(1.0, 1.0, 1.0);
                float3 nxyz13 = nxyz12 - 1.0;
                // float tmp0_w_111 = tmp2_xyzw_91.x + 0.0;
                // float tmp2_z_112 = tmp1_w_94 / tmp0_w_111;
                float tmp2_z_112 = nx7 / normal2.x;
                // float tmp1_w_113 = tmp1_w_94 == 0.0;
                // float tmp0_w_114 = tmp1_w_113 ? tmp2_xyzw_91.x : tmp0_w_111;
                float tmp0_w_114 = normal2.x;
                // float3 tmp2_xzw_115 = tmp2_z_112.xxx * tmp3_xyz_110 + float3(1.0, 1.0, 1.0);
                float3 tmp2_xzw_115 = (nx7 / normal2.x) * nxyz13 + 1;
                // float3 tmp3_xyz_116 = tmp0_w_114.xxx * tmp2_xzw_115 + float3(-0.0, -0.0, -1.0);
                // float3 tmp2_xzw_117 = tmp0_w_114.xxx * tmp2_xzw_115;
                // float3 calcNormal = nx7 * nxyz13 + normal2.x;
                float3 calcNormal = UnpackColor(float3(hNormalXY, hNormalZ), sin(_Time.y) * 0.1388889);
                // float3 tmp2_xzw_118 = saturate(tmp2_xzw_117);
                // float3 tmp2_xzw_119 = tmp2_xzw_118 - float3(0.0, 0.0, 1.0);
                // float3 tmp2_xzw_120 = _KiraNormal01_01Power.xxx * tmp2_xzw_119 + float3(0.0, 0.0, 1.0);
                // float3 tmp3_xyz_121 = _CardDistortion01.xxx * tmp3_xyz_116 + float3(0.0, 0.0, 1.0);

                // float tmp0_w_122 = _Kira01_02Tile * _Kira01_02Tile;
                float tmp0_w_122 = _Kira01_02Tile * _Kira01_02Tile;
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
                float tmp3_w_128 = 1.0 / _Kira01_02Tile;
                // float tmp1_w_129 = tmp1_w_127 * tmp3_w_128;
                float tmp1_w_129 = tmp1_w_127 * tmp3_w_128;
                // float tmp4_x_130 = floor(tmp1_w_129);
                float tmp4_x_130 = floor(tmp1_w_129);
                // float tmp0_w_131 = -_Kira01_02Tile * tmp4_x_130 + tmp0_w_126;
                float tmp0_w_131 = -_Kira01_02Tile * tmp4_x_130 + tmp0_w_126;
                // float tmp0_w_132 = tmp0_w_131 + 1.0;
                float tmp0_w_132 = tmp0_w_131 + 1.0;
                // float tmp4_y_133 = _Kira01_02Tile - tmp0_w_132;
                float tmp4_y_133 = _Kira01_02Tile - tmp0_w_132;
                // float2 tmp4_xy_134 = float2(tmp4_x_130, tmp4_y_133) + inp.interp.yx;
                float2 tmp4_xy_134 = float2(tmp4_x_130, tmp4_y_133) + inp.interp.yx;
                // float2 tmp4_xy_135 = tmp4_xy_134 * tmp3_w_128.xx + float2(-0.77, -0.61);
                float2 tile2UV_rev = TileToUV(_Kira01_02Tile, inp.interp.xy).yx;
                float2 tile2UV1 = tile2UV_rev + float2(-0.77, -0.61);
                // float tmp0_w_136 = dot(tmp4_xy_135, tmp4_xy_135);
                // float tmp0_w_137 = sqrt(tmp0_w_136);
                // float tmp0_w_138 = tmp0_w_137 * 0.77;
                float tmp0_w_138 = length(tile2UV1) * 0.77;
                // float tmp5_x_139 = sin(tmp0_w_138);
                // float tmp6_x_140 = cos(tmp0_w_138);
                // float2 tmp4_zw_141 = tmp4_xy_135 * tmp5_x_139.xx;
                // float tmp0_w_142 = tmp6_x_140 * tmp4_xy_135.y + -tmp4_zw_141.x;
                // float tmp1_w_143 = tmp6_x_140 * tmp4_xy_135.x + tmp4_zw_141.y;
                // float tmp1_w_144 = _Time.y * 0.05 + tmp1_w_143;
                // float tmp4_y_145 = tmp1_w_144 + 0.77;
                // This is a rotation
                float tmp4_y_145 = _Time.y * 0.05 + cos(tmp0_w_138) * tile2UV1.x + tile2UV1.y * sin(tmp0_w_138) + 0.77;
                // float tmp0_w_146 = _Time.y * 0.05 + tmp0_w_142;
                // float tmp4_x_147 = tmp0_w_146 + 0.61;
                float tmp4_x_147 = _Time.y * 0.05 + cos(tmp0_w_138) * tile2UV1.y - tile2UV1.x * sin(tmp0_w_138) + 0.61;
                // float2 kiraNormalUV = _Time.y * 0.05 + float2(0.77, 0.61) + mul(float2x2(cos(tmp0_w_138), -sin(tmp0_w_138), sin(tmp0_w_138), cos(tmp0_w_138), tile2UV1.yx));
                // float4 tmp4_xyzw_148 = tex2Dbias(_KiraNormal01_02, float4(float2(tmp4_x_147, tmp4_y_145), 0, _GlobalMipBias.x));
                float4 rawKiraNormal2 = tex2Dbias(_KiraNormal01_02, float4(float2(tmp4_x_147, tmp4_y_145), 0, _GlobalMipBias.x));
                // float tmp4_x_149 = tmp4_xyzw_148.x * tmp4_xyzw_148.w;
                float tmp4_x_149 = rawKiraNormal2.x * rawKiraNormal2.w;
                // float2 tmp4_xy_150 = float2(tmp4_x_149, tmp4_xyzw_148.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 tmp4_xy_150 = float2(tmp4_x_149, rawKiraNormal2.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // float tmp0_w_151 = dot(tmp4_xy_150, tmp4_xy_150);
                float tmp0_w_151 = dot(tmp4_xy_150, tmp4_xy_150);
                // float tmp0_w_152 = min(tmp0_w_151, 1.0);
                float tmp0_w_152 = min(tmp0_w_151, 1.0);
                // float tmp0_w_153 = 1.0 - tmp0_w_152;
                float tmp0_w_153 = 1.0 - tmp0_w_152;
                // float tmp0_w_154 = sqrt(tmp0_w_153);
                float tmp0_w_154 = sqrt(tmp0_w_153);
                // float tmp4_z_155 = max(tmp0_w_154, 0.0);
                float tmp4_z_155 = max(tmp0_w_154, 0.0);
                // float3 tmp4_xyz_156 = saturate(float3(tmp4_xy_150, tmp4_z_155));
                float3 kiraNormal2 = saturate(float3(tmp4_xy_150, tmp4_z_155));
                // float3 tmp4_xyz_157 = tmp4_xyz_156 - float3(0.0, 0.0, 1.0);
                float3 tmp4_xyz_157 = kiraNormal2 - float3(0.0, 0.0, 1.0);
                // float3 tmp4_xyz_158 = _Kira01_02Power.xxx * tmp4_xyz_157 + float3(0.0, 0.0, 1.0);
                float3 tmp4_xyz_158 = _Kira01_02Power * tmp4_xyz_157 + float3(0.0, 0.0, 1.0);
                float3 tmp2_xzw_119 = saturate(calcNormal) - float3(0.0, 0.0, 1.0);
                float3 tmp2_xzw_120 = _KiraNormal01_01Power.xxx * tmp2_xzw_119 + float3(0.0, 0.0, 1.0);
                // float2 tmp5_xy_159 = tmp2_xzw_120.xy + tmp4_xyz_158.xy;
                float2 tmp5_xy_159 = tmp2_xzw_120.xy + tmp4_xyz_158.xy;
                // float tmp5_z_160 = tmp2_xzw_120.z * tmp4_xyz_158.z;
                float tmp5_z_160 = tmp2_xzw_120.z * tmp4_xyz_158.z;
                // float tmp0_w_161 = dot(float3(tmp5_xy_159, tmp5_z_160), float3(tmp5_xy_159, tmp5_z_160));
                float tmp0_w_161 = dot(float3(tmp5_xy_159, tmp5_z_160), float3(tmp5_xy_159, tmp5_z_160));
                // float tmp0_w_162 = max(tmp0_w_161, 8388608.0);
                float tmp0_w_162 = max(tmp0_w_161, 8388608.0);
                // float tmp0_w_163 = rsqrt(tmp0_w_162);
                float tmp0_w_163 = rsqrt(tmp0_w_162);
                // float3 tmp2_xzw_164 = float3(tmp5_xy_159, tmp5_z_160) * tmp0_w_163.xxx + float3(-0.0, -0.0, -1.0);
                float3 combined0102Normal = CombineNormal(
                    ScaleNormal(saturate(calcNormal), _KiraNormal01_01Power), 
                    ScaleNormal(saturate(kiraNormal2), _Kira01_02Power));
                float3 kiraNormalProcessed = combined0102Normal + float3(-0.0, -0.0, -1.0);
                // float tmp0_w_165 = _AttributeTile + 0.00001;
                float tmp0_w_165 = _AttributeTile + 0.00001;
                // float tmp0_w_166 = tmp0_w_165 * 0.0625;
                float tmp0_w_166 = tmp0_w_165 * 0.0625;
                // float tmp1_w_167 = tmp0_w_166 >= -tmp0_w_166;
                float tmp1_w_167 = tmp0_w_166 >= -tmp0_w_166;
                // float tmp0_w_168 = frac(abs(tmp0_w_166));
                float tmp0_w_168 = frac(abs(tmp0_w_166));
                // float tmp0_w_169 = tmp1_w_167 ? tmp0_w_168 : -tmp0_w_168;
                float tmp0_w_169 = tmp1_w_167 ? tmp0_w_168 : -tmp0_w_168;
                // float tmp0_w_170 = tmp0_w_169 * 16.0;
                float tmp0_w_170 = tmp0_w_169 * 16.0;
                // float tmp0_w_171 = floor(tmp0_w_170);
                float tmp0_w_171 = floor(tmp0_w_170);
                // float tmp1_w_172 = tmp0_w_171 + 0.5;
                float tmp1_w_172 = tmp0_w_171 + 0.5;
                // float tmp1_w_173 = tmp1_w_172 * 0.25;
                float tmp1_w_173 = tmp1_w_172 * 0.25;
                // float tmp1_w_174 = floor(tmp1_w_173);
                float tmp1_w_174 = floor(tmp1_w_173);
                // float tmp4_x_175 = -tmp1_w_174 * 4.0 + tmp0_w_171;
                float tmp4_x_175 = -tmp1_w_174 * 4.0 + tmp0_w_171;
                // float tmp0_w_176 = tmp1_w_174 + 1.0;
                float tmp0_w_176 = tmp1_w_174 + 1.0;
                // float2 tmp4_zw_177 = _AttributeSize_Pos.xy * float2(0.5, 0.5) + float2(-0.5, -0.5);
                float2 tmp4_zw_177 = _AttributeSize_Pos.xy * float2(0.5, 0.5) + float2(-0.5, -0.5);
                // float2 tmp4_zw_178 = inp.interp.xy * _AttributeSize_Pos.xy + -tmp4_zw_177;
                float2 tmp4_zw_178 = inp.interp.xy * _AttributeSize_Pos.xy + -tmp4_zw_177;
                // float2 tmp5_xy_179 = tmp4_zw_178 + _AttributeSize_Pos.zw;
                float2 tmp5_xy_179 = tmp4_zw_178 + _AttributeSize_Pos.zw;
                // float tmp4_y_180 = tmp5_xy_179.y - tmp0_w_176;
                float tmp4_y_180 = tmp5_xy_179.y - tmp0_w_176;
                // float tmp5_z_181 = 4.0;
                float tmp5_z_181 = 4.0;
                // float2 tmp4_xy_182 = float2(tmp4_x_175, tmp4_y_180) + float2(tmp5_xy_179.x, tmp5_z_181);
                float2 tmp4_xy_182 = float2(tmp4_x_175, tmp4_y_180) + float2(tmp5_xy_179.x, tmp5_z_181);
                // float2 tmp4_zw_183 = tmp5_xy_179 * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 tmp4_zw_183 = tmp5_xy_179 * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // float2 tmp4_zw_184 = abs(tmp4_zw_183) - float2(1.0, 1.0);
                float2 tmp4_zw_184 = abs(tmp4_zw_183) - float2(1.0, 1.0);
                // float2 tmp4_xy_185 = tmp4_xy_182 * float2(0.25, 0.25);
                float2 tmp4_xy_185 = tmp4_xy_182 * float2(0.25, 0.25);
                // float4 tmp5_xyzw_186 = tex2Dbias(_AttributeTex, float4(tmp4_xy_185, 0, _GlobalMipBias.x));
                float4 attributeMask = tex2Dbias(_AttributeTex, float4(tmp4_xy_185, 0, _GlobalMipBias.x));
                // float2 tmp4_xy_187 = ddx(tmp4_zw_184);
                float2 tmp4_xy_187 = ddx(tmp4_zw_184);
                // float2 tmp5_yz_188 = ddy(tmp4_zw_184);
                float2 tmp5_yz_188 = ddy(tmp4_zw_184);
                // float2 tmp4_xy_189 = abs(tmp4_xy_187) + abs(tmp5_yz_188);
                float2 tmp4_xy_189 = abs(tmp4_xy_187) + abs(tmp5_yz_188);
                // float2 tmp4_xy_190 = tmp4_zw_184 / tmp4_xy_189;
                float2 tmp4_xy_190 = tmp4_zw_184 / tmp4_xy_189;
                // float2 tmp4_xy_191 = saturate(float2(1.0, 1.0) - tmp4_xy_190);
                float2 tmp4_xy_191 = saturate(float2(1.0, 1.0) - tmp4_xy_190);
                // float tmp0_w_192 = min(tmp4_xy_191.y, tmp4_xy_191.x);
                float tmp0_w_192 = min(tmp4_xy_191.y, tmp4_xy_191.x);
                // float2 tmp4_xy_193 = inp.interp.xy * float2(1.0, 5.0) + float2(0.0, -4.0);
                float2 tmp4_xy_193 = inp.interp.xy * float2(1.0, 5.0) + float2(0.0, -4.0);
                // float4 tmp4_xyzw_194 = tex2Dbias(_MonsterNameTex, float4(tmp4_xy_193, 0, _GlobalMipBias.x));
                float4 monsterNameColor = tex2Dbias(_MonsterNameTex, float4(tmp4_xy_193, 0, _GlobalMipBias.x));
                // float tmp1_w_195 = saturate(_MonsterNameTextBold * tmp4_xyzw_194.w + tmp4_xyzw_194.w);
                float monsterNameColorBold = saturate(_MonsterNameTextBold * monsterNameColor.w + monsterNameColor.w);
                // float tmp0_w_196 = tmp5_xyzw_186.x * tmp0_w_192 + tmp1_w_195;
                float tmp0_w_196 = attributeMask.x * tmp0_w_192 + monsterNameColorBold;
                // float4 tmp5_xyzw_197 = tex2Dbias(_FrameMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 frameMask = tex2Dbias(_FrameMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // float tmp3_w_198 = tmp0_w_196 + tmp5_xyzw_197.x;
                float overallMask = tmp0_w_196 + frameMask.x;
                overallMask = saturate(frameMask.x * 0.8);
                // float tmp0_w_199 = 1.0 - tmp0_w_196;
                float tmp0_w_199 = 1.0 - overallMask;
                // float3 tmp2_xzw_200 = tmp3_w_198.xxx * tmp2_xzw_164 + float3(0.0, 0.0, 1.0);
                // float3 maskedKiraNormal = overallMask.xxx * kiraNormalProcessed + float3(0.0, 0.0, 1.0);
                float3 maskedKiraNormal = ScaleNormal(combined0102Normal, overallMask);
                // float3 tmp5_xyz_201 = _FakeLightDirection - _MainLightPosition.xyz;
                float3 tmp5_xyz_201 = _FakeLightDirection - _MainLightPosition.xyz;
                // float3 tmp5_xyz_202 = _FakeBlend.xxx * tmp5_xyz_201 + _MainLightPosition.xyz;
                // float3 lightDir = _FakeBlend.xxx * tmp5_xyz_201 + _MainLightPosition.xyz;
                float3 lightDir = lerp(_MainLightPosition.xyz, _FakeLightDirection, _FakeBlend);
                // float3 tmp6_xyz_203 = tmp5_xyz_202 + float3(0.0, 1.0, 0.0);
                float3 offsetLightDir = lightDir + float3(0.0, 1.0, 0.0);
                // float tmp4_z_204 = dot(tmp6_xyz_203, tmp6_xyz_203);
                float tmp4_z_204 = dot(offsetLightDir, offsetLightDir);
                // float tmp4_z_205 = rsqrt(tmp4_z_204);
                float tmp4_z_205 = rsqrt(tmp4_z_204);
                // float3 tmp6_xyz_206 = tmp4_z_205.xxx * tmp6_xyz_203;
                float3 tmp6_xyz_206 = normalize(offsetLightDir);
                // float tmp4_z_207 = dot(inp.interp2.xyz, inp.interp2.xyz);
                float tmp4_z_207 = dot(inp.interp2.xyz, inp.interp2.xyz);
                // float tmp4_z_208 = sqrt(tmp4_z_207);
                float tmp4_z_208 = sqrt(tmp4_z_207);
                // float tmp4_z_209 = 1.0 / tmp4_z_208;
                float tmp4_z_209 = 1.0 / tmp4_z_208;
                // float3 tmp7_xyz_210 = tmp4_z_209.xxx * inp.interp2.xyz;
                float3 tmp7_xyz_210 = normalize(inp.interp2.xyz);
                // float3 tmp8_xyz_211 = -tmp4_z_209.xxx * inp.interp2.xyz + _FakeNormalDirection;
                float3 tmp8_xyz_211 = -tmp7_xyz_210 + _FakeNormalDirection;
                // float3 tmp7_xyz_212 = _FakeBlend.xxx * tmp8_xyz_211 + tmp7_xyz_210;
                // float3 tmp7_xyz_212 = _FakeBlend.xxx * tmp8_xyz_211 + tmp7_xyz_210;
                float3 normalDir = float3(0, 0, 1); //lerp(normalize(inp.interp2.xyz), _FakeNormalDirection, _FakeBlend);
                // float tmp4_z_213 = dot(tmp6_xyz_206, tmp7_xyz_212);
                float offsetDiff = dot(normalize(offsetLightDir), normalDir);
                // float tmp5_w_214 = tmp4_z_213 * _HoloShift01;
                float tmp5_w_214 = offsetDiff * _HoloShift01;
                // float tmp4_z_215 = offsetDiff * _HoloShift02;
                float tmp4_z_215 = offsetDiff * _HoloShift02;
                // float4 tmp6_xyzw_216 = tex2Dbias(_HoloTex, float4(tmp4_z_215.xx, 0, _GlobalMipBias.x));
                float4 rawHolo2 = tex2Dbias(_HoloTex, float4(tmp4_z_215.xx, 0, _GlobalMipBias.x));
                // float4 tmp8_xyzw_217 = tex2Dbias(_HoloTex, float4(tmp5_w_214.xx, 0, _GlobalMipBias.x));
                float4 rawHolo1 = tex2Dbias(_HoloTex, float4(tmp5_w_214.xx, 0, _GlobalMipBias.x));
                // float tmp8_x_218 = tmp8_xyzw_217.x * tmp8_xyzw_217.w;
                float tmp8_x_218 = rawHolo1.x * rawHolo1.w;
                // float2 tmp8_xy_219 = float2(tmp8_x_218, tmp8_xyzw_217.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 holo1XY = float2(tmp8_x_218, rawHolo1.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // float tmp4_z_220 = dot(tmp8_xy_219, tmp8_xy_219);
                float tmp4_z_220 = dot(holo1XY, holo1XY);
                // float2 tmp8_xy_221 = tmp2_xzw_200.xy + tmp8_xy_219;
                float2 tmp8_xy_221 = maskedKiraNormal.xy + holo1XY;
                // float tmp4_z_222 = min(tmp4_z_220, 1.0);
                float tmp4_z_222 = min(tmp4_z_220, 1.0);
                // float tmp4_z_223 = 1.0 - tmp4_z_222;
                float tmp4_z_223 = 1.0 - tmp4_z_222;
                // float tmp4_z_224 = sqrt(tmp4_z_223);
                float tmp4_z_224 = sqrt(tmp4_z_223);
                // float tmp4_z_225 = max(tmp4_z_224, 0.0);
                float holo1Z = max(tmp4_z_224, 0.0);
                // float tmp8_z_226 = tmp2_xzw_200.z * tmp4_z_225;
                float tmp8_z_226 = maskedKiraNormal.z * holo1Z;
                // float tmp4_z_227 = dot(float3(tmp8_xy_221, tmp8_z_226), float3(tmp8_xy_221, tmp8_z_226));
                float tmp4_z_227 = dot(float3(tmp8_xy_221, tmp8_z_226), float3(tmp8_xy_221, tmp8_z_226));
                // float tmp4_z_228 = max(tmp4_z_227, 8388608.0);
                float tmp4_z_228 = max(tmp4_z_227, 8388608.0);
                // float tmp4_z_229 = rsqrt(tmp4_z_228);
                float tmp4_z_229 = rsqrt(tmp4_z_228);
                // float tmp5_w_230 = tmp4_z_229 * tmp8_z_226;
                float tmp5_w_230 = tmp4_z_229 * tmp8_z_226;
                // float2 tmp8_xy_231 = tmp8_xy_221 * tmp4_z_229.xx + tmp3_xyz_121.xy;
                float3 tmp3_xyz_121 = ScaleNormal(calcNormal, _CardDistortion01);
                float2 tmp8_xy_231 = tmp8_xy_221 * tmp4_z_229.xx + tmp3_xyz_121.xy;
                // float tmp8_z_232 = tmp3_xyz_121.z * tmp5_w_230;
                float tmp8_z_232 = tmp3_xyz_121.z * tmp5_w_230;
                // float tmp3_x_233 = dot(float3(tmp8_xy_231, tmp8_z_232), float3(tmp8_xy_231, tmp8_z_232));
                float tmp3_x_233 = dot(float3(tmp8_xy_231, tmp8_z_232), float3(tmp8_xy_231, tmp8_z_232));
                // float tmp3_x_234 = max(tmp3_x_233, 8388608.0);
                float tmp3_x_234 = max(tmp3_x_233, 8388608.0);
                // float tmp3_x_235 = rsqrt(tmp3_x_234);
                float tmp3_x_235 = rsqrt(tmp3_x_234);
                // float3 tmp3_xyz_236 = tmp3_x_235.xxx * float3(tmp8_xy_231, tmp8_z_232);
                // float3 tmp3_xyz_236 = tmp3_x_235.xxx * float3(tmp8_xy_231, tmp8_z_232);
                float3 multipleCombinedNormal = CombineNormal(
                    CombineNormal(maskedKiraNormal, float3(holo1XY, holo1Z)),
                    ScaleNormal(calcNormal, _CardDistortion01));
                // float2 tmp8_xy_237 = tmp3_xyz_236.yy * unity_MatrixV._m01_m11;
                float2 tmp8_xy_237 = multipleCombinedNormal.yy * unity_MatrixV._m01_m11;
                // float2 tmp3_xy_238 = unity_MatrixV._m00_m10 * tmp3_xyz_236.xx + tmp8_xy_237;
                float2 tmp3_xy_238 = unity_MatrixV._m00_m10 * multipleCombinedNormal.xx + tmp8_xy_237;
                // float2 tmp3_xy_239 = unity_MatrixV._m02_m12 * tmp3_xyz_236.zz + tmp3_xy_238;
                float2 tmp3_xy_239 = unity_MatrixV._m02_m12 * multipleCombinedNormal.zz + tmp3_xy_238;
                // float2 tmp3_xy_240 = tmp3_xy_239 + unity_MatrixV._m03_m13;
                // float2 tmp3_xy_240 = tmp3_xy_239 + unity_MatrixV._m03_m13;
                float2 multipleCombinedNormalUV = mul(unity_MatrixV, float4(multipleCombinedNormal, 0)).xy;
                // float4 tmp8_xyzw_241 = tex2Dbias(_HoloTex, float4(tmp3_xy_240, 0, _GlobalMipBias.x));
                float4 holo3 = tex2Dbias(_HoloTex, float4(multipleCombinedNormalUV, 0, _GlobalMipBias.x));
                // float3 tmp3_xyz_242 = float3(1.0, 1.0, 1.0) - tmp8_xyzw_241.xyz;
                float3 tmp3_xyz_242 = 1.0 - holo3.xyz;
                // float3 tmp3_xyz_243 = tmp3_xyz_242 + tmp3_xyz_242;
                float3 tmp3_xyz_243 = 2 * (1.0 - holo3.xyz);
                // float tmp4_z_244 = 1.0 - _HoloBrightness02;
                float tmp4_z_244 = 1.0 - _HoloBrightness02;
                // float3 tmp3_xyz_245 = -tmp3_xyz_243 * tmp4_z_244.xxx + float3(1.0, 1.0, 1.0);
                float3 tmp3_xyz_245 = - 2 * (1.0 - holo3.xyz) * (1.0 - _HoloBrightness02) + 1.0;
                // float3 tmp9_xyz_246 = tmp8_xyzw_241.xyz <= float3(0.5, 0.5, 0.5);
                float3 tmp9_xyz_246 = holo3.xyz <= 0.5;
                // float3 tmp8_xyz_247 = tmp8_xyzw_241.xyz * _HoloBrightness02.xxx;
                float3 tmp8_xyz_247 = holo3.xyz * _HoloBrightness02;
                // float3 tmp8_xyz_248 = tmp8_xyz_247 + tmp8_xyz_247;
                float3 tmp8_xyz_248 = 2 * holo3.xyz * _HoloBrightness02;
                // float3 tmp10_xyz_249 = tmp9_xyz_246 ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                float3 tmp10_xyz_249 = holo3.xyz > 0.5 ? 1.0 : 0.0;
                // float3 tmp9_xyz_250 = uint3(tmp9_xyz_246) & uint3(int3(1, 1, 1));
                float3 tmp9_xyz_250 = uint3(tmp9_xyz_246) & uint3(int3(1, 1, 1));
                // float3 tmp3_xyz_251 = tmp3_xyz_245 * tmp10_xyz_249;
                float3 tmp3_xyz_251 = tmp3_xyz_245 * tmp10_xyz_249;
                // float3 tmp3_xyz_252 = saturate(tmp8_xyz_248 * tmp9_xyz_250 + tmp3_xyz_251);
                float3 tmp3_xyz_252 = saturate(Formula0(holo3.xyz, _HoloBrightness02));
                // float3 tmp3_xyz_253 = tmp3_xyz_252.zzz + tmp3_xyz_252;
                float3 tmp3_xyz_253 = tmp3_xyz_252.zzz + tmp3_xyz_252;
                // float3 tmp1_xyz_254 = saturate(tmp1_xyz_55 * tmp3_xyz_253);
                float3 kiraHoloColor0 = saturate(kiraCalcKiraColor * tmp3_xyz_253);
                
                // float2 tmp3_xy_255 = _Time.yy * float2(2.5, 2.5) + float2(2.09439, 4.18878);
                float2 tmp3_xy_255 = _Time.yy * float2(2.5, 2.5) + float2(2.09439, 4.18878);
                // float2 tmp3_yz_256 = sin(tmp3_xy_255);
                float2 tmp3_yz_256 = sin(tmp3_xy_255);
                // float2 tmp8_xy_257 = _Time.yy * float2(0.25, 2.5);
                float2 tmp8_xy_257 = _Time.yy * float2(0.25, 2.5);
                // float tmp3_x_258 = sin(tmp8_xy_257.y);
                float tmp3_x_258 = sin(tmp8_xy_257.y);
                // float tmp8_x_259 = sin(tmp8_xy_257.x);
                float tmp8_x_259 = sin(tmp8_xy_257.x);
                // float tmp9_x_260 = cos(tmp8_x_259);
                float tmp9_x_260 = cos(sin(0.25 * _Time.y));
                // float3 tmp3_xyz_261 = float3(tmp3_x_258, tmp3_yz_256) + float3(3.0, 3.0, 3.0);
                float3 tmp3_xyz_261 = float3(tmp3_x_258, tmp3_yz_256) + float3(3.0, 3.0, 3.0);
                // float4 tmp10_xyzw_262 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 mainColor = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // float3 tmp3_xyz_263 = tmp3_xyz_261 * float3(0.2, 0.2, 0.2) + -tmp10_xyzw_262.xyz;
                float3 kiraDelta = KiraAtColor(_Time.y) - mainColor.xyz;
                // float tmp3_x_264 = dot(tmp3_xyz_263, tmp3_xyz_263);
                float tmp3_x_264 = dot(kiraDelta, kiraDelta);
                // float tmp3_x_265 = sqrt(tmp3_x_264);
                float tmp3_x_265 = length(kiraDelta);
                // float tmp3_x_266 = saturate(-_EnhanceColorThreshold * tmp3_x_265 + 1.0);
                float tmp3_x_266 = saturate(-_EnhanceColorThreshold * length(kiraDelta) + 1.0);
                // float tmp3_x_267 = dot(tmp3_x_266.xx, _IlluustRanbowPower.xx);
                float tmp3_x_267 = 2 * tmp3_x_266 * _IlluustRanbowPower;
                // float3 tmp3_xyz_268 = tmp0_xyz_45 * tmp3_x_267.xxx;
                float3 tmp3_xyz_268 = calcKiraColor * (2 * tmp3_x_266 * _IlluustRanbowPower);
                // float3 tmp0_xyz_269 = _RanbowPower.xxx * tmp0_xyz_45 + tmp3_xyz_268;
                float3 kiraShineColor = calcKiraColor * (2 * tmp3_x_266 * _IlluustRanbowPower + _RanbowPower);
                // float2 tmp9_yz_270 = tmp8_x_259.xx;
                float2 tmp9_yz_270 = sin(0.25 * _Time.y).xx;
                // float3 tmp3_xyz_271 = float3(tmp9_x_260, tmp9_yz_270) * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                float3 tmp3_xyz_271 = float3(cos(sin(0.25 * _Time.y)), sin(0.25 * _Time.y), sin(0.25 * _Time.y)) * float3(0.5, -0.5, 0.5) + 0.5;
                // float3 tmp3_xyz_272 = tmp3_xyz_271 * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                float3 tmp3_xyz_272 = float3(cos(sin(0.25 * _Time.y)), -sin(0.25 * _Time.y), sin(0.25 * _Time.y));
                // float2 tmp8_xy_273 = float2(_Kira02_01Tile.x, _Kira2_02Tile.x) * float2(_Kira02_01Tile.x, _Kira2_02Tile.x);
                float2 tmp8_xy_273 = float2(_Kira02_01Tile.x, _Kira2_02Tile.x) * float2(_Kira02_01Tile.x, _Kira2_02Tile.x);
                // float2 tmp8_zw_274 = float2(1.00001, 1.00001) / tmp8_xy_273;
                float2 tmp8_zw_274 = float2(1.00001, 1.00001) / tmp8_xy_273;
                // float2 tmp8_zw_275 = frac(tmp8_zw_274);
                float2 tmp8_zw_275 = frac(tmp8_zw_274);
                // float2 tmp8_xy_276 = tmp8_xy_273 * tmp8_zw_275;
                float2 tmp8_xy_276 = tmp8_xy_273 * tmp8_zw_275;
                // float2 tmp8_xy_277 = floor(tmp8_xy_276);
                float2 tmp8_xy_277 = floor(tmp8_xy_276);
                // float2 tmp8_zw_278 = tmp8_xy_277 + float2(0.5, 0.5);
                float2 tmp8_zw_278 = tmp8_xy_277 + float2(0.5, 0.5);
                // float2 tmp9_xy_279 = float2(1.0, 1.0) / float2(_Kira02_01Tile.x, _Kira2_02Tile.x);
                float2 tmp9_xy_279 = float2(1.0, 1.0) / float2(_Kira02_01Tile.x, _Kira2_02Tile.x);
                // float2 tmp8_zw_280 = tmp8_zw_278 * tmp9_xy_279;
                float2 tmp8_zw_280 = tmp8_zw_278 * tmp9_xy_279;
                // float2 tmp11_zw_281 = floor(tmp8_zw_280);
                float2 tmp11_zw_281 = floor(tmp8_zw_280);
                // float2 tmp8_xy_282 = -float2(_Kira02_01Tile.x, _Kira2_02Tile.x) * tmp11_zw_281 + tmp8_xy_277;
                float2 tmp8_xy_282 = -float2(_Kira02_01Tile.x, _Kira2_02Tile.x) * tmp11_zw_281 + tmp8_xy_277;
                // float2 tmp8_xy_283 = tmp8_xy_282 + float2(1.0, 1.0);
                float2 tmp8_xy_283 = tmp8_xy_282 + float2(1.0, 1.0);
                // float2 tmp11_xy_284 = float2(_Kira02_01Tile.x, _Kira2_02Tile.x) - tmp8_xy_283;
                float2 tmp11_xy_284 = float2(_Kira02_01Tile.x, _Kira2_02Tile.x) - tmp8_xy_283;
                // float4 tmp8_xyzw_285 = float4(tmp11_xy_284.x, tmp11_zw_281.x, tmp11_xy_284.y, tmp11_zw_281.y) + inp.interp.xyxy;
                float4 tmp8_xyzw_285 = float4(tmp11_xy_284.x, tmp11_zw_281.x, tmp11_xy_284.y, tmp11_zw_281.y) + inp.interp.xyxy; // TileToUV
                // float4 tmp8_xyzw_286 = tmp8_xyzw_285 * tmp9_xy_279.xxyy + float4(-0.5, -0.5, -0.5, -0.5);
                float4 tmp8_xyzw_286 = float4(TileToUV(_Kira02_01Tile, inp.interp.xy), TileToUV(_Kira2_02Tile, inp.interp.xy)) - 0.5;
                // float tmp9_x_287 = dot(tmp8_xyzw_286.xy, tmp3_xyz_272.xz);
                float tmp9_x_287 = dot(tmp8_xyzw_286.xy, tmp3_xyz_272.xz);
                // float tmp9_y_288 = dot(tmp8_xyzw_286.yx, tmp3_xyz_272.xy);
                float tmp9_y_288 = dot(tmp8_xyzw_286.yx, tmp3_xyz_272.xy);
                // float2 tmp3_xy_289 = float2(tmp9_x_287, tmp9_y_288) + float2(0.5, 0.5);
                // float2 tmp3_xy_290 = tmp3_xy_289 * float2(0.5, 0.5) + float2(0.25, 0.25);
                float2 tmp3_xy_290_uv = float2(tmp9_x_287, tmp9_y_288) * 0.5 + 0.5;
                // float4 tmp9_xyzw_291 = tex2Dbias(_Kira02_01, float4(tmp3_xy_290, 0, _GlobalMipBias.x));
                float4 rawKira0201 = tex2Dbias(_Kira02_01, float4(tmp3_xy_290_uv, 0, _GlobalMipBias.x));
                // float tmp9_x_292 = tmp9_xyzw_291.x * tmp9_xyzw_291.w;
                float tmp9_x_292 = rawKira0201.x * rawKira0201.w;
                // float2 tmp3_xy_293 = float2(tmp9_x_292, tmp9_xyzw_291.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 rawKira0201XY = float2(tmp9_x_292, rawKira0201.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // float tmp4_z_294 = dot(tmp3_xy_293, tmp3_xy_293);
                float tmp4_z_294 = dot(rawKira0201XY, rawKira0201XY);
                // float tmp4_z_295 = min(tmp4_z_294, 1.0);
                float tmp4_z_295 = min(tmp4_z_294, 1.0);
                // float tmp4_z_296 = 1.0 - tmp4_z_295;
                float tmp4_z_296 = 1.0 - tmp4_z_295;
                // float tmp4_z_297 = sqrt(tmp4_z_296);
                float tmp4_z_297 = sqrt(tmp4_z_296);
                // float tmp3_z_298 = max(tmp4_z_297, 0.0);
                float rawKira0201Z = max(tmp4_z_297, 0.0);
                // float3 tmp3_xyz_299 = saturate(float3(tmp3_xy_293, tmp3_z_298));
                float3 kira0201Normal = saturate(float3(rawKira0201XY, rawKira0201Z));
                // float3 tmp3_xyz_300 = tmp3_xyz_299 - float3(0.0, 0.0, 1.0);
                float3 tmp3_xyz_300 = kira0201Normal - float3(0.0, 0.0, 1.0);
                // float3 tmp3_xyz_301 = _Kira02_01Power.xxx * tmp3_xyz_300 + float3(0.0, 0.0, 1.0);
                float3 tmp3_xyz_301 = ScaleNormal(kira0201Normal, _Kira02_01Power);
                // float tmp4_z_302 = -_Time.y * 0.25 + 1.0;
                float tmp4_z_302 = -_Time.y * 0.25 + 1.0;
                // float tmp8_x_303 = sin(tmp4_z_302);
                float tmp8_x_303 = sin(tmp4_z_302);
                // float tmp9_x_304 = cos(tmp4_z_302);
                float tmp9_x_304 = cos(tmp4_z_302);
                // float2 tmp9_yz_305 = tmp8_x_303.xx;
                float2 tmp9_yz_305 = tmp8_x_303.xx;
                // float3 tmp9_xyz_306 = float3(tmp9_x_304, tmp9_yz_305) * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                float3 tmp9_xyz_306 = float3(tmp9_x_304, tmp9_yz_305) * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                // float3 tmp9_xyz_307 = tmp9_xyz_306 * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                float3 tmp9_xyz_307 = tmp9_xyz_306 * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                // float tmp8_x_308 = dot(tmp8_xyzw_286.zw, tmp9_xyz_307.xz);
                float tmp8_x_308 = dot(tmp8_xyzw_286.zw, tmp9_xyz_307.xz);
                // float tmp8_y_309 = dot(tmp8_xyzw_286.wz, tmp9_xyz_307.xy);
                float tmp8_y_309 = dot(tmp8_xyzw_286.wz, tmp9_xyz_307.xy);
                // float2 tmp8_xy_310 = float2(tmp8_x_308, tmp8_y_309) + float2(0.5, 0.5);
                float2 tmp8_xy_310 = float2(tmp8_x_308, tmp8_y_309) + 0.5;
                // float2 tmp8_xy_311 = tmp8_xy_310 * float2(0.5, 0.5) + float2(0.25, 0.25);
                float2 tmp8_xy_311_uv = float2(tmp8_x_308, tmp8_y_309) * 0.5 + 0.5;
                // float4 tmp8_xyzw_312 = tex2Dbias(_Kira02_01, float4(tmp8_xy_311, 0, _GlobalMipBias.x));
                float4 rawKira02012 = tex2Dbias(_Kira02_01, float4(tmp8_xy_311_uv, 0, _GlobalMipBias.x));
                // float tmp8_x_313 = tmp8_xyzw_312.x * tmp8_xyzw_312.w;
                float tmp8_x_313 = rawKira02012.x * rawKira02012.w;
                // float2 tmp8_xy_314 = float2(tmp8_x_313, tmp8_xyzw_312.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 kira0201XY2 = float2(tmp8_x_313, rawKira02012.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // float tmp4_z_315 = dot(tmp8_xy_314, tmp8_xy_314);
                float tmp4_z_315 = dot(kira0201XY2, kira0201XY2);
                // float tmp4_z_316 = min(tmp4_z_315, 1.0);
                float tmp4_z_316 = min(tmp4_z_315, 1.0);
                // float tmp4_z_317 = 1.0 - tmp4_z_316;
                float tmp4_z_317 = 1.0 - tmp4_z_316;
                // float tmp4_z_318 = sqrt(tmp4_z_317);
                float tmp4_z_318 = sqrt(tmp4_z_317);
                // float tmp8_z_319 = max(tmp4_z_318, 0.0);
                float kira0201Z2 = max(tmp4_z_318, 0.0);
                // float3 tmp8_xyz_320 = saturate(float3(tmp8_xy_314, tmp8_z_319));
                float3 kira0201Normal2 = saturate(float3(kira0201XY2, kira0201Z2));
                // float3 tmp8_xyz_321 = tmp8_xyz_320 - float3(0.0, 0.0, 1.0);
                float3 tmp8_xyz_321 = kira0201Normal2 - float3(0.0, 0.0, 1.0);
                // float3 tmp8_xyz_322 = _Kira02_02Power.xxx * tmp8_xyz_321 + float3(0.0, 0.0, 1.0);
                float3 tmp8_xyz_322 = ScaleNormal(kira0201Normal2, _Kira02_02Power);
                // float2 tmp9_xy_323 = tmp3_xyz_301.xy + tmp8_xyz_322.xy;
                float2 tmp9_xy_323 = tmp3_xyz_301.xy + tmp8_xyz_322.xy;
                // float tmp9_z_324 = tmp3_xyz_301.z * tmp8_xyz_322.z;
                float tmp9_z_324 = tmp3_xyz_301.z * tmp8_xyz_322.z;
                // float tmp3_x_325 = dot(float3(tmp9_xy_323, tmp9_z_324), float3(tmp9_xy_323, tmp9_z_324));
                float tmp3_x_325 = dot(float3(tmp9_xy_323, tmp9_z_324), float3(tmp9_xy_323, tmp9_z_324));
                // float tmp3_x_326 = max(tmp3_x_325, 8388608.0);
                float tmp3_x_326 = max(tmp3_x_325, 8388608.0);
                // float tmp3_x_327 = rsqrt(tmp3_x_326);
                float tmp3_x_327 = rsqrt(tmp3_x_326);
                // float tmp3_y_328 = tmp3_x_327 * tmp9_z_324;
                float tmp3_y_328 = tmp3_x_327 * tmp9_z_324;
                // float2 tmp8_xy_329 = tmp9_xy_323 * tmp3_x_327.xx + tmp2_xzw_200.xy;
                float2 tmp8_xy_329 = tmp9_xy_323 * tmp3_x_327.xx + maskedKiraNormal.xy;
                // float tmp8_z_330 = tmp2_xzw_200.z * tmp3_y_328;
                float tmp8_z_330 = maskedKiraNormal.z * tmp3_y_328;
                // float tmp2_x_331 = dot(float3(tmp8_xy_329, tmp8_z_330), float3(tmp8_xy_329, tmp8_z_330));
                float tmp2_x_331 = dot(float3(tmp8_xy_329, tmp8_z_330), float3(tmp8_xy_329, tmp8_z_330));
                // float tmp2_x_332 = max(tmp2_x_331, 8388608.0);
                float tmp2_x_332 = max(tmp2_x_331, 8388608.0);
                // float tmp2_x_333 = rsqrt(tmp2_x_332);
                float tmp2_x_333 = rsqrt(tmp2_x_332);
                // float3 tmp2_xzw_334 = tmp2_x_333.xxx * float3(tmp8_xy_329, tmp8_z_330);
                // float3 tmp2_xzw_334 = tmp2_x_333.xxx * float3(tmp8_xy_329, tmp8_z_330);
                float3 kiraCombinedNormal = CombineNormal(
                    CombineNormal(
                        ScaleNormal(kira0201Normal, _Kira02_01Power),
                        ScaleNormal(kira0201Normal2, _Kira02_02Power)),
                    maskedKiraNormal);
                // float tmp3_x_335 = dot(tmp2_xzw_334, tmp2_xzw_334);
                float tmp3_x_335 = dot(kiraCombinedNormal, kiraCombinedNormal);
                // float tmp3_x_336 = max(tmp3_x_335, 8388608.0);
                float tmp3_x_336 = max(tmp3_x_335, 8388608.0);
                // float tmp3_x_337 = rsqrt(tmp3_x_336);
                float tmp3_x_337 = rsqrt(tmp3_x_336);
                // float tmp6_x_338 = tmp6_xyzw_216.x * tmp6_xyzw_216.w;
                float tmp6_x_338 = rawHolo2.x * rawHolo2.w;
                // float2 tmp3_yz_339 = float2(tmp6_x_338, tmp6_xyzw_216.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 holo2XY = float2(tmp6_x_338, rawHolo2.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // float2 tmp6_xy_340 = tmp2_xzw_334.xy * tmp3_x_337.xx + tmp3_yz_339;
                float2 tmp6_xy_340 = kiraCombinedNormal.xy * tmp3_x_337.xx + holo2XY;
                // float tmp3_y_341 = dot(tmp3_yz_339, tmp3_yz_339);
                float tmp3_y_341 = dot(holo2XY, holo2XY);
                // float tmp3_y_342 = min(tmp3_y_341, 1.0);
                float tmp3_y_342 = min(tmp3_y_341, 1.0);
                // float tmp3_y_343 = 1.0 - tmp3_y_342;
                float tmp3_y_343 = 1.0 - tmp3_y_342;
                // float tmp3_y_344 = sqrt(tmp3_y_343);
                float tmp3_y_344 = sqrt(tmp3_y_343);
                // float tmp3_y_345 = max(tmp3_y_344, 0.0);
                float holo2Z = max(tmp3_y_344, 0.0);
                // float tmp2_w_346 = tmp2_xzw_334.z * tmp3_x_337;
                float tmp2_w_346 = kiraCombinedNormal.z * tmp3_x_337;
                // float tmp6_z_347 = tmp3_y_345 * tmp2_w_346;
                float tmp6_z_347 = holo2Z * tmp2_w_346;
                // float tmp3_y_348 = dot(float3(tmp6_xy_340, tmp6_z_347), float3(tmp6_xy_340, tmp6_z_347));
                float tmp3_y_348 = dot(float3(tmp6_xy_340, tmp6_z_347), float3(tmp6_xy_340, tmp6_z_347));
                // float tmp3_y_349 = max(tmp3_y_348, 8388608.0);
                float tmp3_y_349 = max(tmp3_y_348, 8388608.0);
                // float tmp3_y_350 = rsqrt(tmp3_y_349);
                float tmp3_y_350 = rsqrt(tmp3_y_349);
                // float tmp8_z_351 = tmp3_y_350 * tmp6_z_347;
                float tmp8_z_351 = tmp3_y_350 * tmp6_z_347;
                // float2 tmp8_xy_352 = tmp6_xy_340 * tmp3_y_350.xx + _CardDistortion02.xx;
                float2 tmp8_xy_352 = tmp6_xy_340 * tmp3_y_350.xx + _CardDistortion02.xx;
                // float tmp3_y_353 = dot(float3(tmp8_xy_352, tmp8_z_351), float3(tmp8_xy_352, tmp8_z_351));
                float tmp3_y_353 = dot(float3(tmp8_xy_352, tmp8_z_351), float3(tmp8_xy_352, tmp8_z_351));
                // float tmp3_y_354 = max(tmp3_y_353, 8388608.0);
                float tmp3_y_354 = max(tmp3_y_353, 8388608.0);
                // float tmp3_y_355 = rsqrt(tmp3_y_354);
                float tmp3_y_355 = rsqrt(tmp3_y_354);
                // float3 tmp6_xyz_356 = tmp3_y_355.xxx * float3(tmp8_xy_352, tmp8_z_351);
                float3 tmp6_xyz_356 = normalize(CombineNormal(kiraCombinedNormal, float3(holo2XY, holo2Z)) + float3(_CardDistortion02, _CardDistortion02, 0.0));
                // float2 tmp3_yz_357 = tmp6_xyz_356.yy * unity_MatrixV._m01_m11;
                float2 tmp3_yz_357 = tmp6_xyz_356.yy * unity_MatrixV._m01_m11;
                // float2 tmp3_yz_358 = unity_MatrixV._m00_m10 * tmp6_xyz_356.xx + tmp3_yz_357;
                float2 tmp3_yz_358 = unity_MatrixV._m00_m10 * tmp6_xyz_356.xx + tmp3_yz_357;
                // float2 tmp3_yz_359 = unity_MatrixV._m02_m12 * tmp6_xyz_356.zz + tmp3_yz_358;
                float2 tmp3_yz_359 = unity_MatrixV._m02_m12 * tmp6_xyz_356.zz + tmp3_yz_358;
                // float2 tmp3_yz_360 = tmp3_yz_359 + unity_MatrixV._m03_m13;
                float2 tmp3_yz_360_uv = mul(unity_MatrixV, float4(tmp6_xyz_356, 0)).xy;
                // float4 tmp6_xyzw_361 = tex2Dbias(_HoloTex, float4(tmp3_yz_360, 0, _GlobalMipBias.x));
                float4 holo4 = tex2Dbias(_HoloTex, float4(tmp3_yz_360_uv, 0, _GlobalMipBias.x));
                // float3 tmp8_xyz_362 = float3(1.0, 1.0, 1.0) - tmp6_xyzw_361.xyz;
                float3 tmp8_xyz_362 = float3(1.0, 1.0, 1.0) - holo4.xyz;
                // float3 tmp8_xyz_363 = tmp8_xyz_362 + tmp8_xyz_362;
                float3 tmp8_xyz_363 = tmp8_xyz_362 + tmp8_xyz_362;
                // float tmp3_y_364 = 1.0 - _HoloBrightness;
                float tmp3_y_364 = 1.0 - _HoloBrightness;
                // float3 tmp8_xyz_365 = -tmp8_xyz_363 * tmp3_y_364.xxx + float3(1.0, 1.0, 1.0);
                float3 tmp8_xyz_365 = -tmp8_xyz_363 * tmp3_y_364.xxx + float3(1.0, 1.0, 1.0);
                // float3 tmp9_xyz_366 = tmp6_xyzw_361.xyz <= float3(0.5, 0.5, 0.5);
                float3 tmp9_xyz_366 = holo4.xyz <= float3(0.5, 0.5, 0.5);
                // float3 tmp6_xyz_367 = tmp6_xyzw_361.xyz * _HoloBrightness.xxx;
                float3 tmp6_xyz_367 = holo4.xyz * _HoloBrightness.xxx;
                // float3 tmp6_xyz_368 = tmp6_xyz_367 + tmp6_xyz_367;
                float3 tmp6_xyz_368 = tmp6_xyz_367 + tmp6_xyz_367;
                // float3 tmp11_xyz_369 = tmp9_xyz_366 ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                float3 tmp11_xyz_369 = tmp9_xyz_366 ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                // float3 tmp9_xyz_370 = uint3(tmp9_xyz_366) & uint3(int3(1, 1, 1));
                float3 tmp9_xyz_370 = uint3(tmp9_xyz_366) & uint3(int3(1, 1, 1));
                // float3 tmp8_xyz_371 = tmp8_xyz_365 * tmp11_xyz_369;
                float3 tmp8_xyz_371 = tmp8_xyz_365 * tmp11_xyz_369;
                // float3 tmp6_xyz_372 = saturate(tmp6_xyz_368 * tmp9_xyz_370 + tmp8_xyz_371);
                float3 tmp6_xyz_372 = saturate(Formula0(holo4, _HoloBrightness));
                // float3 tmp6_xyz_373 = tmp6_xyz_372.zzz + tmp6_xyz_372;
                float3 tmp6_xyz_373 = tmp6_xyz_372.zzz + tmp6_xyz_372;
                // tmp6_xyz_373 = 1;
                // float4 tmp8_xyzw_374 = tex2Dbias(_KiraMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 kiraMask = tex2Dbias(_KiraMask, float4(inp.interp.xy, 0, _GlobalMipBias.x)) > 0 ? (61.0/255) : 0;
                // float tmp3_y_375 = tmp8_xyzw_374.x * _IllustBright + 1.0;
                float tmp3_y_375 = kiraMask.x * _IllustBright + 1.0;
                // float3 tmp8_yzw_376 = tmp10_xyzw_262.xyz * tmp3_y_375.xxx;
                float3 kiraBaseColor = mainColor.xyz * (kiraMask.x * _IllustBright + 1.0);
                // float3 tmp0_xyz_377 = tmp6_xyz_373 * tmp0_xyz_269 + -tmp8_yzw_376;
                float3 tmp0_xyz_377 = tmp6_xyz_373 * kiraShineColor - kiraBaseColor;
                // float3 tmp0_xyz_378 = tmp8_xyzw_374.xxx * tmp0_xyz_377 + tmp8_yzw_376;
                float3 tmp0_xyz_378 = lerp(kiraBaseColor, tmp6_xyz_373 * kiraShineColor, kiraMask);
                // float3 tmp1_xyz_379 = tmp1_xyz_254 - tmp0_xyz_378;
                float3 tmp1_xyz_379 = kiraHoloColor0 - tmp0_xyz_378;
                // float3 tmp0_xyz_380 = tmp3_w_198.xxx * tmp1_xyz_379 + tmp0_xyz_378;
                float3 tmp0_xyz_380 = lerp(tmp0_xyz_378, kiraHoloColor0, overallMask);
                // float tmp1_x_381 = max(tmp3_w_198, tmp8_xyzw_374.x);
                float tmp1_x_381 = max(overallMask, kiraMask.x);
                // float tmp1_y_382 = tmp8_xyzw_374.x * 100.0;
                float tmp1_y_382 = kiraMask.x * 100.0;
                // float tmp1_y_383 = max(tmp1_y_382, 0.0);
                float tmp1_y_383 = max(kiraMask.x * 100.0, 0.0);
                // float tmp1_y_384 = min(tmp2_y_100, tmp1_y_383);
                float tmp1_y_384 = min(saturate(sin(_Time.y) + 0.5), max(kiraMask.x * 100.0, 0.0));
                // float tmp1_x_385 = saturate(tmp1_x_381 + 0.2);
                float tmp1_x_385 = saturate(max(overallMask, kiraMask.x) + 0.2);
                // float3 tmp0_xyz_386 = tmp0_xyz_380 + _AmbientColor.xyz;
                float3 overallKiraColor = tmp0_xyz_380 + _AmbientColor.xyz;
                // float4 tmp6_xyzw_387 = inp.interp.xyxy - float4(0.375, 0.427, -0.0, 0.35);
                float4 tmp6_xyzw_387 = inp.interp.xyxy - float4(0.375, 0.427, -0.0, 0.35);
                // float4 tmp6_xyzw_388 = tmp6_xyzw_387 * float4(2.0, 2.0, 2.0, 2.0) + float4(-1.0, -1.0, -1.0, -1.0);
                float4 tmp6_xyzw_388 = tmp6_xyzw_387 * float4(2.0, 2.0, 2.0, 2.0) + float4(-1.0, -1.0, -1.0, -1.0);
                // float4 tmp6_xyzw_389 = abs(tmp6_xyzw_388) - float4(0.1, 0.085, 0.91, 0.06);
                float4 tmp6_xyzw_389 = abs(tmp6_xyzw_388) - float4(0.1, 0.085, 0.91, 0.06);
                // float4 tmp8_xyzw_390 = ddx(tmp6_xyzw_389);
                float4 tmp8_xyzw_390 = ddx(tmp6_xyzw_389);
                // float4 tmp9_xyzw_391 = ddy(tmp6_xyzw_389);
                float4 tmp9_xyzw_391 = ddy(tmp6_xyzw_389);
                // float4 tmp8_xyzw_392 = abs(tmp8_xyzw_390) + abs(tmp9_xyzw_391);
                float4 tmp8_xyzw_392 = abs(tmp8_xyzw_390) + abs(tmp9_xyzw_391);
                // float4 tmp6_xyzw_393 = tmp6_xyzw_389 / tmp8_xyzw_392;
                float4 tmp6_xyzw_393 = tmp6_xyzw_389 / tmp8_xyzw_392;
                // float4 tmp6_xyzw_394 = saturate(float4(1.0, 1.0, 1.0, 1.0) - tmp6_xyzw_393);
                float4 tmp6_xyzw_394 = saturate(float4(1.0, 1.0, 1.0, 1.0) - tmp6_xyzw_393);
                // float2 tmp3_yz_395 = min(tmp6_xyzw_394.yw, tmp6_xyzw_394.xz);
                float2 tmp3_yz_395 = min(tmp6_xyzw_394.yw, tmp6_xyzw_394.xz);
                // float3 tmp6_xyz_396 = _CubemapPower.xxx * _CubemapColor.xyz;
                float3 tmp6_xyz_396 = _CubemapPower.xxx * _CubemapColor.xyz;
                // float3 tmp8_xyz_397 = -_CubemapPower.xxx * _CubemapColor.xyz + _CubemapPower.xxx;
                float3 tmp8_xyz_397 = -_CubemapPower.xxx * _CubemapColor.xyz + _CubemapPower.xxx;
                // float3 tmp6_xyz_398 = tmp3_yz_395.xxx * tmp8_xyz_397 + tmp6_xyz_396;
                float3 tmp6_xyz_398 = tmp3_yz_395.xxx * tmp8_xyz_397 + tmp6_xyz_396;
                // float3 tmp8_xyz_399 = _CubemapPower.xxx * float3(0.8980392, 0.8666667, 0.3254902) + -tmp6_xyz_398;
                float3 tmp8_xyz_399 = _CubemapPower.xxx * float3(0.8980392, 0.8666667, 0.3254902) + -tmp6_xyz_398;
                // float3 tmp3_yzw_400 = tmp3_yz_395.yyy * tmp8_xyz_399 + tmp6_xyz_398;
                float3 tmp3_yzw_400 = tmp3_yz_395.yyy * tmp8_xyz_399 + tmp6_xyz_398;
                // float3 tmp6_xyz_401 = tmp10_xyzw_262.xyz - tmp3_yzw_400;
                float3 tmp6_xyz_401 = mainColor.xyz - tmp3_yzw_400;
                // float3 tmp3_yzw_402 = tmp0_w_199.xxx * tmp6_xyz_401 + tmp3_yzw_400;
                float3 tmp3_yzw_402 = lerp(mainColor.xyz, tmp3_yzw_400, overallMask);
                // float3 tmp0_xyz_403 = tmp0_xyz_386 - tmp3_yzw_402;
                float3 tmp0_xyz_403 = overallKiraColor - tmp3_yzw_402;
                // float3 tmp0_xyz_404 = tmp0_w_199.xxx * tmp0_xyz_403 + tmp3_yzw_402;
                float3 tmp0_xyz_404 = lerp(overallKiraColor, kiraCalcKiraColor, overallMask);
                // float3 tmp3_yzw_405 = tmp3_yzw_402 + _AmbientColor.xyz;
                float3 tmp3_yzw_405 = tmp3_yzw_402 + _AmbientColor.xyz;
                
                // o.sv_target = float4(overallKiraColor, 1.0);
                // return o;
                // float tmp4_x_406 = tmp4_xyzw_194.x * tmp4_xyzw_194.w;
                float tmp4_x_406 = monsterNameColor.x * monsterNameColor.w;
                // float2 tmp4_zw_407 = float2(tmp4_x_406, tmp4_xyzw_194.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 tmp4_zw_407 = float2(tmp4_x_406, monsterNameColor.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // float2 tmp6_xy_408 = float2(tmp4_x_406, tmp4_xyzw_194.y) + float2(tmp4_x_406, tmp4_xyzw_194.y);
                float2 tmp6_xy_408 = float2(tmp4_x_406, monsterNameColor.y) + float2(tmp4_x_406, monsterNameColor.y);
                // float tmp0_w_409 = dot(tmp4_zw_407, tmp4_zw_407);
                float tmp0_w_409 = dot(tmp4_zw_407, tmp4_zw_407);
                // float tmp0_w_410 = min(tmp0_w_409, 1.0);
                float tmp0_w_410 = min(tmp0_w_409, 1.0);
                // float tmp0_w_411 = 1.0 - tmp0_w_410;
                float tmp0_w_411 = 1.0 - tmp0_w_410;
                // float tmp0_w_412 = sqrt(tmp0_w_411);
                float tmp0_w_412 = sqrt(tmp0_w_411);
                // float tmp6_z_413 = max(tmp0_w_412, 0.0);
                float tmp6_z_413 = max(tmp0_w_412, 0.0);
                // float3 tmp4_xyz_414 = float3(tmp6_xy_408, tmp6_z_413) - float3(1.0, 1.0, 1.0);
                float3 tmp4_xyz_414 = float3(tmp6_xy_408, tmp6_z_413) - float3(1.0, 1.0, 1.0);
                // float3 tmp4_xyz_415 = _MonsterNameNormalPower.xxx * tmp4_xyz_414 + float3(0.0, 0.0, 1.0);
                float3 tmp4_xyz_415 = ScaleNormal(UnpackNormal(monsterNameColor), _MonsterNameNormalPower);
                // float4 tmp6_xyzw_416 = tex2Dbias(_MainNormal, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 tmp6_xyzw_416 = tex2Dbias(_MainNormal, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 mainNormal = tmp6_xyzw_416;
                // float tmp6_x_417 = tmp6_xyzw_416.x * tmp6_xyzw_416.w;
                float tmp6_x_417 = tmp6_xyzw_416.x * tmp6_xyzw_416.w;
                // float2 tmp6_zw_418 = float2(tmp6_x_417, tmp6_xyzw_416.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 tmp6_zw_418 = float2(tmp6_x_417, tmp6_xyzw_416.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // float2 tmp8_xy_419 = float2(tmp6_x_417, tmp6_xyzw_416.y) + float2(tmp6_x_417, tmp6_xyzw_416.y);
                float2 tmp8_xy_419 = float2(tmp6_x_417, tmp6_xyzw_416.y) + float2(tmp6_x_417, tmp6_xyzw_416.y);
                // float tmp0_w_420 = dot(tmp6_zw_418, tmp6_zw_418);
                float tmp0_w_420 = dot(tmp6_zw_418, tmp6_zw_418);
                // float tmp0_w_421 = min(tmp0_w_420, 1.0);
                float tmp0_w_421 = min(tmp0_w_420, 1.0);
                // float tmp0_w_422 = 1.0 - tmp0_w_421;
                float tmp0_w_422 = 1.0 - tmp0_w_421;
                // float tmp0_w_423 = sqrt(tmp0_w_422);
                float tmp0_w_423 = sqrt(tmp0_w_422);
                // float tmp8_z_424 = max(tmp0_w_423, 0.0);
                float tmp8_z_424 = max(tmp0_w_423, 0.0);
                // float3 tmp6_xyz_425 = float3(tmp8_xy_419, tmp8_z_424) - float3(1.0, 1.0, 1.0);
                float3 tmp6_xyz_425 = float3(tmp8_xy_419, tmp8_z_424) - float3(1.0, 1.0, 1.0);
                // float3 tmp6_xyz_426 = _MainNormalPower.xxx * tmp6_xyz_425 + float3(0.0, 0.0, 1.0);
                float3 tmp6_xyz_426 = ScaleNormal(UnpackNormal(mainNormal), _MainNormalPower);
                // float3 tmp4_xyz_427 = tmp4_xyz_415 - tmp6_xyz_426;
                float3 tmp4_xyz_427 = tmp4_xyz_415 - tmp6_xyz_426;
                // float3 tmp4_xyz_428 = tmp1_w_195.xxx * tmp4_xyz_427 + tmp6_xyz_426;
                float3 tmp4_xyz_428 = lerp(
                    ScaleNormal(UnpackNormal(mainNormal), _MainNormalPower), 
                    ScaleNormal(UnpackNormal(monsterNameColor), _MonsterNameNormalPower), 
                    0); // mod
                // float2 tmp2_xy_429 = tmp2_xzw_334.xy * tmp3_x_337.xx + tmp4_xyz_428.xy;
                float2 tmp2_xy_429 = kiraCombinedNormal.xy * tmp3_x_337.xx + tmp4_xyz_428.xy;
                // float tmp2_z_430 = tmp2_w_346 * tmp4_xyz_428.z;
                float tmp2_z_430 = tmp2_w_346 * tmp4_xyz_428.z;
                // float tmp0_w_431 = dot(float3(tmp2_xy_429, tmp2_z_430), float3(tmp2_xy_429, tmp2_z_430));
                float tmp0_w_431 = dot(float3(tmp2_xy_429, tmp2_z_430), float3(tmp2_xy_429, tmp2_z_430));
                // float tmp0_w_432 = max(tmp0_w_431, 8388608.0);
                float tmp0_w_432 = max(tmp0_w_431, 8388608.0);
                // float tmp0_w_433 = rsqrt(tmp0_w_432);
                float tmp0_w_433 = rsqrt(tmp0_w_432);
                // float2 tmp4_xy_434 = tmp2_xy_429 * tmp0_w_433.xx + tmp7_xyz_212.xy;
                float2 tmp4_xy_434 = tmp2_xy_429 * tmp0_w_433.xx + normalDir.xy;
                // float tmp0_w_435 = tmp0_w_433 * tmp2_z_430;
                float tmp0_w_435 = tmp0_w_433 * tmp2_z_430;
                // float tmp4_z_436 = tmp0_w_435 * tmp7_xyz_212.z;
                float tmp4_z_436 = tmp0_w_435 * normalDir.z;
                // float tmp0_w_437 = dot(float3(tmp4_xy_434, tmp4_z_436), float3(tmp4_xy_434, tmp4_z_436));
                float tmp0_w_437 = dot(float3(tmp4_xy_434, tmp4_z_436), float3(tmp4_xy_434, tmp4_z_436));
                // float tmp0_w_438 = max(tmp0_w_437, 8388608.0);
                float tmp0_w_438 = max(tmp0_w_437, 8388608.0);
                // float tmp0_w_439 = rsqrt(tmp0_w_438);
                float tmp0_w_439 = rsqrt(tmp0_w_438);
                // float3 tmp2_xyz_440 = tmp0_w_439.xxx * float3(tmp4_xy_434, tmp4_z_436);
                float3 tmp2_xyz_440 = CombineNormal(CombineNormal(kiraCombinedNormal, tmp4_xyz_428), normalDir);
                // float tmp0_w_441 = dot(tmp2_xyz_440, tmp2_xyz_440);
                float tmp0_w_441 = dot(tmp2_xyz_440, tmp2_xyz_440);
                // float tmp0_w_442 = rsqrt(tmp0_w_441);
                float tmp0_w_442 = rsqrt(tmp0_w_441);
                // float3 tmp4_xyz_443 = tmp0_w_442.xxx * tmp2_xyz_440;
                float3 tmp4_xyz_443_normal = tmp0_w_442.xxx * tmp2_xyz_440; // = tmp2_xyz_440
                // float tmp0_w_444 = saturate(dot(tmp2_xyz_440, tmp5_xyz_202));
                float tmp0_w_444 = saturate(dot(tmp2_xyz_440, lightDir));
                // float3 tmp2_xyz_445 = _WorldSpaceCameraPos - inp.interp1.xyz;
                float3 tmp2_xyz_445 = _WorldSpaceCameraPos - inp.interp1.xyz;
                // float tmp1_z_446 = dot(tmp2_xyz_445, tmp2_xyz_445);
                float tmp1_z_446 = dot(tmp2_xyz_445, tmp2_xyz_445);
                // float tmp1_z_447 = rsqrt(tmp1_z_446);
                float tmp1_z_447 = rsqrt(tmp1_z_446);
                // float3 tmp2_xyz_448 = tmp1_z_447.xxx * tmp2_xyz_445;
                float3 tmp2_xyz_448 = tmp1_z_447.xxx * tmp2_xyz_445;
                // float tmp1_z_449 = unity_OrthoParams.w == 0.0;
                float tmp1_z_449 = unity_OrthoParams.w == 0.0;
                // float tmp6_x_450 = tmp1_z_449 ? tmp2_xyz_448.x : unity_MatrixV._m20;
                float tmp6_x_450 = tmp1_z_449 ? tmp2_xyz_448.x : unity_MatrixV._m20;
                // float tmp6_y_451 = tmp1_z_449 ? tmp2_xyz_448.y : unity_MatrixV._m21;
                float tmp6_y_451 = tmp1_z_449 ? tmp2_xyz_448.y : unity_MatrixV._m21;
                // float tmp6_z_452 = tmp1_z_449 ? tmp2_xyz_448.z : unity_MatrixV._m22;
                float tmp6_z_452 = tmp1_z_449 ? tmp2_xyz_448.z : unity_MatrixV._m22;
                // float3 tmp2_xyz_453 = _FakeViewDirection - float3(tmp6_x_450, tmp6_y_451, tmp6_z_452);
                float3 tmp2_xyz_453 = _FakeViewDirection - float3(tmp6_x_450, tmp6_y_451, tmp6_z_452);
                // float3 tmp2_xyz_454 = _FakeBlend.xxx * tmp2_xyz_453 + float3(tmp6_x_450, tmp6_y_451, tmp6_z_452);
                float3 tmp2_xyz_454 = _FakeBlend.xxx * tmp2_xyz_453 + float3(tmp6_x_450, tmp6_y_451, tmp6_z_452);
                // float tmp1_z_455 = dot(tmp2_xyz_454, tmp2_xyz_454);
                float tmp1_z_455 = dot(tmp2_xyz_454, tmp2_xyz_454);
                // float tmp1_z_456 = max(tmp1_z_455, 8388608.0);
                float tmp1_z_456 = max(tmp1_z_455, 8388608.0);
                // float tmp1_z_457 = rsqrt(tmp1_z_456);
                float tmp1_z_457 = rsqrt(tmp1_z_456);
                // float3 tmp2_xyz_458 = tmp2_xyz_454 * tmp1_z_457.xxx + tmp5_xyz_202;
                float3 tmp2_xyz_458 = tmp2_xyz_454 * tmp1_z_457.xxx + lightDir;
                // float tmp1_z_459 = dot(tmp2_xyz_458, tmp2_xyz_458);
                float tmp1_z_459 = dot(tmp2_xyz_458, tmp2_xyz_458);
                // float tmp1_z_460 = max(tmp1_z_459, 8388608.0);
                float tmp1_z_460 = max(tmp1_z_459, 8388608.0);
                // float tmp1_z_461 = rsqrt(tmp1_z_460);
                float tmp1_z_461 = rsqrt(tmp1_z_460);
                // float3 tmp2_xyz_462 = tmp1_z_461.xxx * tmp2_xyz_458;
                float3 halfDir = tmp1_z_461.xxx * tmp2_xyz_458;
                // float tmp1_z_463 = saturate(dot(tmp4_xyz_443, tmp2_xyz_462));
                float tmp1_z_463 = saturate(dot(tmp4_xyz_443_normal, halfDir));
                // float tmp1_z_464 = log(tmp1_z_463);
                float tmp1_z_464 = log(tmp1_z_463);
                // float tmp1_w_465 = _Smoothness * 10.0 + 1.0;
                float tmp1_w_465 = _Smoothness * 10.0 + 1.0;
                // float tmp1_w_466 = pow(2.0, tmp1_w_465);
                float tmp1_w_466 = pow(2.0, tmp1_w_465);
                // float tmp1_z_467 = tmp1_z_464 * tmp1_w_466;
                float tmp1_z_467 = tmp1_z_464 * tmp1_w_466;
                // float tmp1_z_468 = pow(2.0, tmp1_z_467);
                float tmp1_z_468 = pow(2.0, tmp1_z_467);
                // float3 tmp2_xyz_469 = _FrameMetal.xxx * _SpecularColor.xyz;
                float3 tmp2_xyz_469 = _FrameMetal.xxx * _SpecularColor.xyz;
                // float3 tmp2_xyz_470 = tmp1_z_468.xxx * tmp2_xyz_469;
                float3 tmp2_xyz_470 = tmp1_z_468.xxx * tmp2_xyz_469;
                // float3 tmp4_xyz_471 = _FakeLightColor.xyz - _MainLightColor.xyz;
                float3 tmp4_xyz_471 = _FakeLightColor.xyz - _MainLightColor.xyz;
                // float3 tmp4_xyz_472 = _FakeBlend.xxx * tmp4_xyz_471 + _MainLightColor.xyz;
                float3 tmp4_xyz_472 = _FakeBlend.xxx * tmp4_xyz_471 + _MainLightColor.xyz;
                // float3 tmp4_xyz_473 = tmp4_xyz_472 * _DirectionalLightAmp.xxx;
                float3 tmp4_xyz_473 = tmp4_xyz_472 * _DirectionalLightAmp.xxx;
                // float3 tmp2_xyz_474 = tmp2_xyz_470 * tmp4_xyz_473;
                float3 tmp2_xyz_474 = tmp2_xyz_470 * tmp4_xyz_473;
                // float3 tmp2_xyz_475 = tmp0_w_444.xxx * _DirectionalLightAmp.xxx + tmp2_xyz_474;
                float3 tmp2_xyz_475 = tmp0_w_444.xxx * _DirectionalLightAmp.xxx + tmp2_xyz_474;
                // float3 tmp2_xyz_476 = tmp2_xyz_475 + _AmbientColor.xyz;
                float3 tmp2_xyz_476 = tmp2_xyz_475 + _AmbientColor.xyz;
                // float2 tmp4_zw_477 = float2(-1.0, 0.6666667);
                float2 tmp4_zw_477 = float2(-1.0, 0.6666667);
                // float2 tmp5_zw_478 = float2(1.0, -1.0);
                float2 tmp5_zw_478 = float2(1.0, -1.0);
                // float2 tmp1_zw_479 = inp.interp.xy * float2(1.5, 1.5);
                float2 tmp1_zw_479 = inp.interp.xy * float2(1.5, 1.5);
                // float4 tmp6_xyzw_480 = tex2Dbias(_HighlightNormal, float4(tmp1_zw_479, 0, _GlobalMipBias.x));
                float4 tmp6_xyzw_480 = tex2Dbias(_HighlightNormal, float4(inp.interp.xy * float2(1.5, 1.5), 0, _GlobalMipBias.x));
                // float tmp6_x_481 = tmp6_xyzw_480.x * tmp6_xyzw_480.w;
                float tmp6_x_481 = tmp6_xyzw_480.x * tmp6_xyzw_480.w;
                // float2 tmp6_xw_482 = float2(tmp6_xyzw_480.y, tmp6_x_481) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 tmp6_xw_482 = float2(tmp6_xyzw_480.y, tmp6_x_481) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // float tmp0_w_483 = dot(tmp6_xw_482, tmp6_xw_482);
                float tmp0_w_483 = dot(tmp6_xw_482, tmp6_xw_482);
                // float tmp0_w_484 = min(tmp0_w_483, 1.0);
                float tmp0_w_484 = min(tmp0_w_483, 1.0);
                // float tmp0_w_485 = 1.0 - tmp0_w_484;
                float tmp0_w_485 = 1.0 - tmp0_w_484;
                // float tmp0_w_486 = sqrt(tmp0_w_485);
                float tmp0_w_486 = sqrt(tmp0_w_485);
                // float tmp4_x_487 = max(tmp0_w_486, 0.0);
                float tmp4_x_487 = max(tmp0_w_486, 0.0);
                // float tmp0_w_488 = tmp6_xw_482.x >= tmp4_x_487;
                float tmp0_w_488 = tmp6_xw_482.x >= tmp4_x_487;
                // float tmp0_w_489 = uint1(tmp0_w_488) & uint1(1);
                float tmp0_w_489 = uint1(tmp0_w_488) & uint1(1);
                // float tmp5_x_490 = tmp6_xw_482.x - tmp4_x_487;
                float tmp5_x_490 = tmp6_xw_482.x - tmp4_x_487;
                // float tmp4_y_491 = tmp6_xw_482.x;
                float tmp4_y_491 = tmp6_xw_482.x;
                // float tmp5_y_492 = tmp4_x_487 - tmp4_y_491;
                float tmp5_y_492 = tmp4_x_487 - tmp4_y_491;
                // float4 tmp4_xyzw_493 = tmp0_w_489.xxxx * float4(tmp5_x_490, tmp5_y_492, tmp5_zw_478) + float4(tmp4_x_487, tmp4_y_491, tmp4_zw_477);
                float4 tmp4_xyzw_493 = tmp0_w_489.xxxx * float4(tmp5_x_490, tmp5_y_492, tmp5_zw_478) + float4(tmp4_x_487, tmp4_y_491, tmp4_zw_477);
                // float tmp0_w_494 = tmp6_xw_482.y >= tmp4_xyzw_493.x;
                float tmp0_w_494 = tmp6_xw_482.y >= tmp4_xyzw_493.x;
                // float tmp0_w_495 = uint1(tmp0_w_494) & uint1(1);
                float tmp0_w_495 = uint1(tmp0_w_494) & uint1(1);
                // float3 tmp6_xyz_496 = tmp4_xyzw_493.xyw;
                float3 tmp6_xyz_496 = tmp4_xyzw_493.xyw;
                // float3 tmp4_xyw_497 = float3(tmp6_xw_482.y, tmp6_xyz_496.yx);
                float3 tmp4_xyw_497 = float3(tmp6_xw_482.y, tmp6_xyz_496.yx);
                // float4 tmp4_xyzw_498 = float4(tmp4_xyw_497.xy, tmp4_xyzw_493.z, tmp4_xyw_497.z) - float4(tmp6_xyz_496, tmp6_xw_482.y);
                float4 tmp4_xyzw_498 = float4(tmp4_xyw_497.xy, tmp4_xyzw_493.z, tmp4_xyw_497.z) - float4(tmp6_xyz_496, tmp6_xw_482.y);
                // float4 tmp4_xyzw_499 = tmp0_w_495.xxxx * tmp4_xyzw_498 + float4(tmp6_xyz_496, tmp6_xw_482.y);
                float4 tmp4_xyzw_499 = tmp0_w_495.xxxx * tmp4_xyzw_498 + float4(tmp6_xyz_496, tmp6_xw_482.y);
                // float tmp0_w_500 = tmp4_xyzw_499.w - tmp4_xyzw_499.y;
                float tmp0_w_500 = tmp4_xyzw_499.w - tmp4_xyzw_499.y;
                // float tmp1_z_501 = min(tmp4_xyzw_499.y, tmp4_xyzw_499.w);
                float tmp1_z_501 = min(tmp4_xyzw_499.y, tmp4_xyzw_499.w);
                // float tmp1_z_502 = tmp4_xyzw_499.x - tmp1_z_501;
                float tmp1_z_502 = tmp4_xyzw_499.x - tmp1_z_501;
                // float tmp1_w_503 = tmp1_z_502 * 6.0 + 0.0;
                float tmp1_w_503 = tmp1_z_502 * 6.0 + 0.0;
                // float tmp0_w_504 = tmp0_w_500 / tmp1_w_503;
                float tmp0_w_504 = tmp0_w_500 / tmp1_w_503;
                // float tmp0_w_505 = tmp0_w_504 + tmp4_xyzw_499.z;
                float tmp0_w_505 = tmp0_w_504 + tmp4_xyzw_499.z;
                // float tmp1_w_506 = _Time.y * 0.5;
                float tmp1_w_506 = _Time.y * 0.5;
                // float tmp1_w_507 = frac(tmp1_w_506);
                float tmp1_w_507 = frac(_Time.y * 0.5);
                // float tmp0_w_508 = abs(tmp0_w_505) + tmp1_w_507;
                float tmp0_w_508 = abs(tmp0_w_505) + tmp1_w_507;
                // float tmp1_w_509 = tmp0_w_508 > 1.0;
                float tmp1_w_509 = tmp0_w_508 > 1.0;
                // float tmp2_w_510 = tmp0_w_508 - 1.0;
                float tmp2_w_510 = tmp0_w_508 - 1.0;
                // float tmp0_w_511 = tmp1_w_509 ? tmp2_w_510 : tmp0_w_508;
                float tmp0_w_511 = tmp1_w_509 ? tmp2_w_510 : tmp0_w_508;
                // float3 tmp4_yzw_512 = tmp0_w_511.xxx + float3(1.0, 0.6666667, 0.3333333);
                float3 tmp4_yzw_512 = tmp0_w_511.xxx + float3(1.0, 0.6666667, 0.3333333);
                // float3 tmp4_yzw_513 = frac(tmp4_yzw_512);
                float3 tmp4_yzw_513 = frac(tmp4_yzw_512);
                // float3 tmp4_yzw_514 = tmp4_yzw_513 * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                float3 tmp4_yzw_514 = tmp4_yzw_513 * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                // float3 tmp4_yzw_515 = saturate(abs(tmp4_yzw_514) - float3(1.0, 1.0, 1.0));
                float3 tmp4_yzw_515 = saturate(abs(tmp4_yzw_514) - float3(1.0, 1.0, 1.0));
                // float3 tmp4_yzw_516 = tmp4_yzw_515 - float3(1.0, 1.0, 1.0);
                float3 tmp4_yzw_516 = tmp4_yzw_515 - float3(1.0, 1.0, 1.0); // xyz13
                // float tmp0_w_517 = tmp4_xyzw_499.x + 0.0;
                float tmp0_w_517 = tmp4_xyzw_499.x + 0.0;
                // float tmp1_w_518 = tmp1_z_502 / tmp0_w_517;
                float tmp1_w_518 = tmp1_z_502 / tmp0_w_517;
                // float tmp1_z_519 = tmp1_z_502 == 0.0;
                float tmp1_z_519 = tmp1_z_502 == 0.0;
                // float tmp0_w_520 = tmp1_z_519 ? tmp4_xyzw_499.x : tmp0_w_517;
                float tmp0_w_520 = tmp1_z_519 ? tmp4_xyzw_499.x : tmp0_w_517;
                // float3 tmp4_xyz_521 = tmp1_w_518.xxx * tmp4_yzw_516 + float3(1.0, 1.0, 1.0);
                float3 tmp4_xyz_521 = tmp1_w_518.xxx * tmp4_yzw_516 + float3(1.0, 1.0, 1.0);
                // float tmp1_z_522 = tmp0_w_520 * tmp4_xyz_521.z;
                float tmp1_z_522 = tmp0_w_520 * tmp4_xyz_521.z;
                // float2 tmp4_xy_523 = tmp0_w_520.xx * tmp4_xyz_521.xy + tmp7_xyz_212.xy;
                float2 tmp4_xy_523 = tmp0_w_520.xx * tmp4_xyz_521.xy + normalDir.xy;
                // float tmp4_z_524 = tmp7_xyz_212.z * tmp1_z_522;
                float tmp4_z_524 = normalDir.z * tmp1_z_522;
                // float tmp0_w_525 = dot(float3(tmp4_xy_523, tmp4_z_524), float3(tmp4_xy_523, tmp4_z_524));
                float tmp0_w_525 = dot(float3(tmp4_xy_523, tmp4_z_524), float3(tmp4_xy_523, tmp4_z_524));
                // float tmp0_w_526 = max(tmp0_w_525, 8388608.0);
                float tmp0_w_526 = max(tmp0_w_525, 8388608.0);
                // float tmp0_w_527 = rsqrt(tmp0_w_526);
                float tmp0_w_527 = rsqrt(tmp0_w_526);
                // float2 tmp1_zw_528 = tmp0_w_527.xx * tmp4_xy_523;
                // x8 < 0 is optimized here
                float2 tmp1_zw_528_uv = CombineNormal(UnpackColor(tmp6_xyzw_480, frac(_Time.y * 0.5)), normalDir).xy;
                // float4 tmp4_xyzw_529 = tex2Dbias(_HighlightTex, float4(tmp1_zw_528, 0, _GlobalMipBias.x));
                float4 tmp4_xyzw_529 = tex2Dbias(_HighlightTex, float4(tmp1_zw_528_uv, 0, _GlobalMipBias.x));
                // float3 tmp4_xyz_530 = tmp4_xyzw_529.xyz * _Color.xyz;
                float3 tmp4_xyz_530 = tmp4_xyzw_529.xyz * _Color.xyz;
                // float3 tmp1_xzw_531 = tmp1_x_385.xxx * tmp4_xyz_530;
                float3 tmp1_xzw_531 = saturate(max(overallMask, kiraMask.x) + 0.2) * tmp4_xyzw_529.xyz * _Color.xyz;
                // float3 tmp1_xzw_532 = tmp1_xzw_531 * _HighlightAmp.xxx;
                float3 tmp1_xzw_532 = saturate(max(overallMask, kiraMask.x) + 0.2) * tmp4_xyzw_529.xyz * _Color.xyz * _HighlightAmp.xxx;
                
                // float tmp0_w_533 = _HighlightRotation * 0.01745329;
                float tmp0_w_533 = _HighlightRotation * 0.01745329;
                // float tmp3_x_534 = sin(tmp0_w_533);
                float tmp3_x_534 = sin(_HighlightRotation * 0.01745329);
                // float tmp4_x_535 = cos(tmp0_w_533);
                float tmp4_x_535 = cos(_HighlightRotation * 0.01745329);
                // float tmp4_y_536 = tmp3_x_534;
                float tmp4_y_536 = sin(_HighlightRotation * 0.01745329);
                // float2 tmp4_xy_537 = float2(tmp4_x_535, tmp4_y_536) * float2(0.5, 0.5) + float2(0.5, 0.5);
                float2 tmp4_xy_537 = float2(cos(_HighlightRotation * 0.01745329), sin(_HighlightRotation * 0.01745329)) * float2(0.5, 0.5) + float2(0.5, 0.5);
                // float2 tmp4_xy_538 = tmp4_xy_537 * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 tmp4_xy_538 = float2(cos(_HighlightRotation * 0.01745329), sin(_HighlightRotation * 0.01745329));
                // float2 tmp4_zw_539 = inp.interp.xy - float2(0.5, 0.5);
                float2 tmp4_zw_539 = inp.interp.xy - float2(0.5, 0.5);
                // float tmp0_w_540 = dot(tmp4_zw_539, tmp4_xy_538);
                float tmp0_w_540 = dot(tmp4_zw_539, tmp4_xy_538);
                // float tmp0_w_541 = tmp0_w_540 + 0.5;
                float tmp0_w_541 = dot(tmp4_zw_539, tmp4_xy_538) + 0.5;
                // float tmp2_w_542 = _Time.y * _ScrollSpeed;
                float tmp2_w_542 = _Time.y * _ScrollSpeed;
                // float tmp2_w_543 = tmp2_w_542 * -0.2 + _HighlightScrollOffset;
                float tmp2_w_543 = _Time.y * _ScrollSpeed * -0.2 + _HighlightScrollOffset;
                // float tmp2_w_544 = tmp2_w_543 + 0.1;
                float tmp2_w_544 = _Time.y * _ScrollSpeed * -0.2 + _HighlightScrollOffset + 0.1;
                // float tmp0_w_545 = tmp0_w_541 * 0.1 + tmp2_w_544;
                float tmp0_w_545 = (dot(tmp4_zw_539, tmp4_xy_538) + 0.5) * 0.1 + _Time.y * _ScrollSpeed * -0.2 + _HighlightScrollOffset + 0.1;
                // float tmp0_w_546 = frac(tmp0_w_545);
                float tmp0_w_546 = frac((dot(tmp4_zw_539, tmp4_xy_538) + 0.5) * 0.1 + _Time.y * _ScrollSpeed * -0.2 + _HighlightScrollOffset + 0.1);
                // float tmp2_w_547 = 1.0 - tmp0_w_546;
                float tmp2_w_547 = 1.0 - tmp0_w_546;
                // float tmp0_w_548 = tmp2_w_547 * tmp0_w_546 + -0.08;
                float tmp0_w_548 = (1.0 - tmp0_w_546) * tmp0_w_546 - 0.08;
                // float tmp0_w_549 = tmp0_w_548 * -10.0;
                float tmp0_w_549 = ((1.0 - tmp0_w_546) * tmp0_w_546 - 0.08) * -10.0;
                // float tmp0_w_550 = max(tmp0_w_549, 0.0);
                float tmp0_w_550 = max(tmp0_w_549, 0.0);
                // float tmp2_w_551 = tmp0_w_550 * -2.0 + 3.0;
                float tmp2_w_551 = tmp0_w_550 * -2.0 + 3.0;
                // float tmp0_w_552 = tmp0_w_550 * tmp0_w_550;
                float tmp0_w_552 = tmp0_w_550 * tmp0_w_550;
                // float tmp0_w_553 = tmp0_w_552 * tmp2_w_551;
                float tmp0_w_553 = tmp0_w_550 * tmp0_w_550 * (tmp0_w_550 * -2.0 + 3.0);
                // float tmp0_w_554 = min(tmp0_w_553, 1.0);
                float tmp0_w_554 = min(tmp0_w_550 * tmp0_w_550 * (tmp0_w_550 * -2.0 + 3.0), 1.0);
                // float3 tmp1_xzw_555 = tmp1_xzw_532 * tmp0_w_554.xxx;
                float3 tmp1_xzw_555 = tmp1_xzw_532 * tmp0_w_554.xxx;
                // float3 tmp0_xyz_556 = tmp2_xyz_476 * tmp0_xyz_404 + tmp1_xzw_555;
                float3 tmp0_xyz_556 = tmp2_xyz_476 * tmp0_xyz_404 + tmp1_xzw_555;
                o.sv_target = float4(tmp0_w_554.xxx, 1.0);
                return o;
                // float3 tmp1_xzw_557 = tmp3_yzw_405 - tmp0_xyz_556;
                // float3 tmp0_xyz_558 = tmp1_y_384.xxx * tmp1_xzw_557 + tmp0_xyz_556;
                float3 tmp0_xyz_558 = lerp(tmp0_xyz_556, tmp3_yzw_405, 
                        min(saturate(sin(_Time.y) + 0.5), max(kiraMask.x * 100.0, 0.0))) ;
                // float4 tmp1_xyzw_559 = tex2Dbias(_LoadingTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 tmp1_xyzw_559 = tex2Dbias(_LoadingTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // float tmp0_w_560 = 1.0;
                float tmp0_w_560 = 1.0;
                // float4 tmp1_xyzw_561 = tmp1_xyzw_559 - float4(tmp0_xyz_558, tmp0_w_560);
                float4 tmp1_xyzw_561 = tmp1_xyzw_559 - float4(tmp0_xyz_558, tmp0_w_560);
                // float4 tmp0_xyzw_562 = _LoadingBlend.xxxx * tmp1_xyzw_561 + float4(tmp0_xyz_558, tmp0_w_560);
                float4 tmp0_xyzw_562 = _LoadingBlend.xxxx * tmp1_xyzw_561 + float4(tmp0_xyz_558, tmp0_w_560);
                // float tmp1_x_563 = dot(tmp0_xyzw_562.xyz, float4(0.299, 0.587, 0.114, 0.0));
                float tmp1_x_563 = dot(tmp0_xyzw_562.xyz, float4(0.299, 0.587, 0.114, 0.0));
                // float3 tmp1_xyz_564 = tmp1_x_563.xxx - tmp0_xyzw_562.xyz;
                float3 tmp1_xyz_564 = tmp1_x_563.xxx - tmp0_xyzw_562.xyz;
                // float tmp1_w_565 = 0.0;
                float tmp1_w_565 = 0.0;
                // float4 tmp0_xyzw_566 = _Monochrome.xxxx * float4(tmp1_xyz_564, tmp1_w_565) + tmp0_xyzw_562;
                float4 tmp0_xyzw_566 = _Monochrome.xxxx * float4(tmp1_xyz_564, tmp1_w_565) + tmp0_xyzw_562;
                // float4 tmp0_xyzw_567 = tmp0_xyzw_566.yzwx * _TintColor;
                float4 tmp0_xyzw_567 = tmp0_xyzw_566.yzwx * _TintColor;
                // float3 tmp1_xyz_568 = tmp0_xyzw_567.wxy;
                float3 tmp1_xyz_568 = tmp0_xyzw_567.wxy;
                // float tmp1_w_569 = 1.0;
                float tmp1_w_569 = 1.0;
                // float4 tmp1_xyzw_570 = float4(tmp1_xyz_568, tmp1_w_569) * _AddColor;
                float4 tmp1_xyzw_570 = float4(tmp1_xyz_568, tmp1_w_569) * _AddColor;
                // float4 tmp2_xyzw_571 = tex2Dbias(_Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 tmp2_xyzw_571 = tex2Dbias(_Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // float tmp0_w_572 = tmp2_xyzw_571.x;
                float tmp0_w_572 = tmp2_xyzw_571.x;
                // float4 tmp1_xyzw_573 = float4(tmp0_w_572.xxx, tmp0_xyzw_567.z) * tmp1_xyzw_570;
                float4 tmp1_xyzw_573 = float4(tmp0_w_572.xxx, tmp0_xyzw_567.z) * tmp1_xyzw_570;
                // float tmp0_x_574 = 2.0;
                float tmp0_x_574 = 2.0;
                // float4 tmp0_xyzw_575 = tmp1_xyzw_573 * float4(tmp0_x_574.xxx, tmp0_w_572);
                float4 tmp0_xyzw_575 = tmp1_xyzw_573 * float4(tmp0_x_574.xxx, tmp0_w_572);
                // float tmp1_x_576 = _Time.y + _Time.y;
                float tmp1_x_576 = _Time.y + _Time.y;
                // float tmp1_x_577 = sin(tmp1_x_576);
                float tmp1_x_577 = sin(tmp1_x_576);
                // float tmp1_x_578 = tmp1_x_577 + 1.0;
                float tmp1_x_578 = tmp1_x_577 + 1.0;
                // float tmp1_x_579 = tmp1_x_578 * 0.2 + 0.5;
                float tmp1_x_579 = tmp1_x_578 * 0.2 + 0.5;
                // float4 tmp1_xyzw_580 = tmp0_xyzw_575 * tmp1_x_579.xxxx;
                float4 tmp1_xyzw_580 = tmp0_xyzw_575 * tmp1_x_579.xxxx;
                // float tmp2_x_581 = _isFade != 0.0;
                float tmp2_x_581 = _isFade != 0.0;
                // o.sv_target = tmp2_x_581.xxxx ? tmp1_xyzw_580 : tmp0_xyzw_575;
                o.sv_target = tmp2_x_581.xxxx ? tmp1_xyzw_580 : tmp0_xyzw_575;
                return o;
            }
            ENDCG
            
        }
        // Pass {
        //     Name "DepthOnly"
        //     ColorMask B
        //     ZClip On
        //     Tags {
        //         "DisableBatching"="False"
        //         "LIGHTMODE"="DepthOnly"
        //         "QUEUE"="Transparent"
        //         // "RenderPipeline"="UniversalPipeline"
        //         "RenderType"="Transparent"
        //         "ShaderGraphShader"="true"
        //         "ShaderGraphTargetId"="UniversalUnlitSubTarget"
        //         "UniversalMaterialType"="Unlit"
        //     }
        //     CGPROGRAM
            
        //     #pragma vertex vert
        //     #pragma fragment frag

            

        //     struct appdata
        //     {
        //         float3 vertex : POSITION;
        //         float3 normal : NORMAL;
        //         float4 tangent : TANGENT;
        //         float4 texcoord : TEXCOORD;
        //     };
        //     struct v2f
        //     {
        //         float4 position : SV_POSITION;
        //         float4 interp : INTERP;
        //         float3 interp1 : INTERP1;
        //         float3 interp2 : INTERP2;
        //     };

        //     // CBs for DX11VertexSM40
        //     // Textures for DX11VertexSM40

        //     v2f vert(appdata v)
        //     {
        //         v2f o;
        //         float4 tmp0;
        //         float4 tmp1;
        //         tmp0.xyz = v.vertex.yyy * unity_ObjectToWorld._m01_m11_m21;
        //         tmp0.xyz = unity_ObjectToWorld._m00_m10_m20 * v.vertex.xxx + tmp0.xyz;
        //         tmp0.xyz = unity_ObjectToWorld._m02_m12_m22 * v.vertex.zzz + tmp0.xyz;
        //         tmp0.xyz = tmp0.xyz + unity_ObjectToWorld._m03_m13_m23;
        //         tmp1 = tmp0.yyyy * unity_MatrixVP._m01_m11_m21_m31;
        //         tmp1 = unity_MatrixVP._m00_m10_m20_m30 * tmp0.xxxx + tmp1;
        //         tmp1 = unity_MatrixVP._m02_m12_m22_m32 * tmp0.zzzz + tmp1;
        //         o.interp1.xyz = tmp0.xyz;
        //         o.position = tmp1 + unity_MatrixVP._m03_m13_m23_m33;
        //         o.interp = v.texcoord;
        //         tmp0.x = dot(v.normal.xyz, unity_WorldToObject._m00_m10_m20);
        //         tmp0.y = dot(v.normal.xyz, unity_WorldToObject._m01_m11_m21);
        //         tmp0.z = dot(v.normal.xyz, unity_WorldToObject._m02_m12_m22);
        //         tmp0.w = dot(tmp0.xyz, tmp0.xyz);
        //         tmp0.w = max(tmp0.w, 8388608.0);
        //         tmp0.w = rsqrt(tmp0.w);
        //         o.interp2.xyz = tmp0.www * tmp0.xyz;
        //         return o;
        //     }

        //     struct fout
        //     {
        //         float4 sv_target : SV_TARGET;
        //     };

        //     // CBs for DX11PixelSM40
        //     // Textures for DX11PixelSM40

        //     fout frag(v2f inp)
        //     {
        //         fout o;
        //         o.sv_target = inp.position.zzzz;
        //         return o;
        //     }
        //     ENDCG
            
        // }
        // Pass {
        //     Name "MotionVectors"
        //     ColorMask GB
        //     ZClip On
        //     Tags {
        //         "DisableBatching"="False"
        //         "LIGHTMODE"="MOTIONVECTORS"
        //         "QUEUE"="Transparent"
        //         // "RenderPipeline"="UniversalPipeline"
        //         "RenderType"="Transparent"
        //         "ShaderGraphShader"="true"
        //         "ShaderGraphTargetId"="UniversalUnlitSubTarget"
        //         "UniversalMaterialType"="Unlit"
        //     }
        //     CGPROGRAM
            
        //     #pragma vertex vert
        //     #pragma fragment frag

            

        //     struct appdata
        //     {
        //         float3 vertex : POSITION;
        //         float3 normal : NORMAL;
        //         float4 texcoord : TEXCOORD;
        //         float3 texcoord4 : TEXCOORD4;
        //     };
        //     struct v2f
        //     {
        //         float3 clip_position_no_jitter : CLIP_POSITION_NO_JITTER;
        //         float3 previous_clip_position_no_jitter : PREVIOUS_CLIP_POSITION_NO_JITTER;
        //         float4 position : SV_POSITION;
        //         float4 interp : INTERP;
        //         float3 interp1 : INTERP1;
        //         float3 interp2 : INTERP2;
        //     };

        //     // CBs for DX11VertexSM40
        //     float4x4 _PrevViewProjMatrix; // 1424 (starting at cb0[89].x)
        //     float4x4 _NonJitteredViewProjMatrix; // 1488 (starting at cb0[93].x)
        //     // CBUFFER_START(UnityPerDraw) // 1
        //         float4x4 unity_MatrixPreviousM; // 544 (starting at cb1[34].x)
        //     // CBUFFER_END
        //     float4 unity_MotionVectorsParams; // 672 (starting at cb1[42].x)
        //     // Textures for DX11VertexSM40

        //     v2f vert(appdata v)
        //     {
        //         v2f o;
        //         float4 tmp0;
        //         float4 tmp1;
        //         float4 tmp2;
        //         tmp0.xyz = v.vertex.yyy * unity_ObjectToWorld._m01_m11_m21;
        //         tmp0.xyz = unity_ObjectToWorld._m00_m10_m20 * v.vertex.xxx + tmp0.xyz;
        //         tmp0.xyz = unity_ObjectToWorld._m02_m12_m22 * v.vertex.zzz + tmp0.xyz;
        //         tmp0.xyz = tmp0.xyz + unity_ObjectToWorld._m03_m13_m23;
        //         tmp1.x = dot(v.normal.xyz, unity_WorldToObject._m00_m10_m20);
        //         tmp1.y = dot(v.normal.xyz, unity_WorldToObject._m01_m11_m21);
        //         tmp1.z = dot(v.normal.xyz, unity_WorldToObject._m02_m12_m22);
        //         tmp0.w = dot(tmp1.xyz, tmp1.xyz);
        //         tmp0.w = max(tmp0.w, 8388608.0);
        //         tmp0.w = rsqrt(tmp0.w);
        //         o.interp2.xyz = tmp0.www * tmp1.xyz;
        //         tmp1 = tmp0.yyyy * unity_MatrixVP._m01_m11_m21_m31;
        //         tmp1 = unity_MatrixVP._m00_m10_m20_m30 * tmp0.xxxx + tmp1;
        //         tmp1 = unity_MatrixVP._m02_m12_m22_m32 * tmp0.zzzz + tmp1;
        //         o.position = tmp1 + unity_MatrixVP._m03_m13_m23_m33;
        //         tmp0.w = unity_MotionVectorsParams.y != 0.0;
        //         if (tmp0.w) {
        //             tmp0.w = unity_MotionVectorsParams.x == 1.0;
        //             tmp1.xyz = tmp0.www ? v.texcoord4.xyz : v.vertex.xyz;
        //             tmp2.xyz = tmp0.yyy * _NonJitteredViewProjMatrix._m01_m11_m31;
        //             tmp2.xyz = _NonJitteredViewProjMatrix._m00_m10_m30 * tmp0.xxx + tmp2.xyz;
        //             tmp2.xyz = _NonJitteredViewProjMatrix._m02_m12_m32 * tmp0.zzz + tmp2.xyz;
        //             o.clip_position_no_jitter.xyz = tmp2.xyz + _NonJitteredViewProjMatrix._m03_m13_m33;
        //             tmp2 = tmp1.yyyy * unity_MatrixPreviousM._m01_m11_m21_m31;
        //             tmp2 = unity_MatrixPreviousM._m00_m10_m20_m30 * tmp1.xxxx + tmp2;
        //             tmp1 = unity_MatrixPreviousM._m02_m12_m22_m32 * tmp1.zzzz + tmp2;
        //             tmp1 = tmp1 + unity_MatrixPreviousM._m03_m13_m23_m33;
        //             tmp2.xyz = tmp1.yyy * _PrevViewProjMatrix._m01_m11_m31;
        //             tmp2.xyz = _PrevViewProjMatrix._m00_m10_m30 * tmp1.xxx + tmp2.xyz;
        //             tmp1.xyz = _PrevViewProjMatrix._m02_m12_m32 * tmp1.zzz + tmp2.xyz;
        //             o.previous_clip_position_no_jitter.xyz = _PrevViewProjMatrix._m03_m13_m33 * tmp1.www + tmp1.xyz;
        //         } else {
        //             o.clip_position_no_jitter.xyz = float3(0.0, 0.0, 0.0);
        //             o.previous_clip_position_no_jitter.xyz = float3(0.0, 0.0, 0.0);
        //         }
        //         o.interp = v.texcoord;
        //         o.interp1.xyz = tmp0.xyz;
        //         return o;
        //     }

        //     struct fout
        //     {
        //         float4 sv_target : SV_Target;
        //     };

        //     // CBs for DX11PixelSM40
        //     // CBUFFER_START(UnityPerDraw) // 0
        //     // CBUFFER_END
        //     // Textures for DX11PixelSM40

        //     fout frag(v2f inp)
        //     {
        //         fout o;
        //         float4 tmp0;
        //         tmp0.x = 1.0 / inp.previous_clip_position_no_jitter.z;
        //         tmp0.xy = tmp0.xx * inp.previous_clip_position_no_jitter.xy;
        //         tmp0.z = 1.0 / inp.clip_position_no_jitter.z;
        //         tmp0.xy = inp.clip_position_no_jitter.xy * tmp0.zz + -tmp0.xy;
        //         tmp0.xy = tmp0.xy * float2(0.5, -0.5);
        //         tmp0.z = unity_MotionVectorsParams.y != 0.0;
        //         o.sv_target.xy = uint2(tmp0.xy) & uint2(tmp0.zz);
        //         o.sv_target.zw = float2(0.0, 0.0);
        //         return o;
        //     }
        //     ENDCG
            
        // }
        // Pass {
        //     Name "DepthNormalsOnly"
        //     ZClip On
        //     Tags {
        //         "DisableBatching"="False"
        //         "LIGHTMODE"="DepthNormalsOnly"
        //         "QUEUE"="Transparent"
        //         // "RenderPipeline"="UniversalPipeline"
        //         "RenderType"="Transparent"
        //         "ShaderGraphShader"="true"
        //         "ShaderGraphTargetId"="UniversalUnlitSubTarget"
        //         "UniversalMaterialType"="Unlit"
        //     }
        //     CGPROGRAM
            
        //     #pragma vertex vert
        //     #pragma fragment frag

            

        //     struct appdata
        //     {
        //         float3 vertex : POSITION;
        //         float3 normal : NORMAL;
        //         float4 tangent : TANGENT;
        //         float4 texcoord : TEXCOORD;
        //     };
        //     struct v2f
        //     {
        //         float4 position : SV_POSITION;
        //         float4 interp : INTERP;
        //         float3 interp1 : INTERP1;
        //         float3 interp2 : INTERP2;
        //     };

        //     // CBs for DX11VertexSM40
        //     // Textures for DX11VertexSM40

        //     v2f vert(appdata v)
        //     {
        //         v2f o;
        //         float4 tmp0;
        //         float4 tmp1;
        //         tmp0.xyz = v.vertex.yyy * unity_ObjectToWorld._m01_m11_m21;
        //         tmp0.xyz = unity_ObjectToWorld._m00_m10_m20 * v.vertex.xxx + tmp0.xyz;
        //         tmp0.xyz = unity_ObjectToWorld._m02_m12_m22 * v.vertex.zzz + tmp0.xyz;
        //         tmp0.xyz = tmp0.xyz + unity_ObjectToWorld._m03_m13_m23;
        //         tmp1 = tmp0.yyyy * unity_MatrixVP._m01_m11_m21_m31;
        //         tmp1 = unity_MatrixVP._m00_m10_m20_m30 * tmp0.xxxx + tmp1;
        //         tmp1 = unity_MatrixVP._m02_m12_m22_m32 * tmp0.zzzz + tmp1;
        //         o.interp1.xyz = tmp0.xyz;
        //         o.position = tmp1 + unity_MatrixVP._m03_m13_m23_m33;
        //         o.interp = v.texcoord;
        //         tmp0.x = dot(v.normal.xyz, unity_WorldToObject._m00_m10_m20);
        //         tmp0.y = dot(v.normal.xyz, unity_WorldToObject._m01_m11_m21);
        //         tmp0.z = dot(v.normal.xyz, unity_WorldToObject._m02_m12_m22);
        //         tmp0.w = dot(tmp0.xyz, tmp0.xyz);
        //         tmp0.w = max(tmp0.w, 8388608.0);
        //         tmp0.w = rsqrt(tmp0.w);
        //         o.interp2.xyz = tmp0.www * tmp0.xyz;
        //         return o;
        //     }

        //     struct fout
        //     {
        //         float4 sv_target : SV_Target;
        //     };

        //     // CBs for DX11PixelSM40
        //     // Textures for DX11PixelSM40

        //     fout frag(v2f inp)
        //     {
        //         fout o;
        //         float4 tmp0;
        //         tmp0.x = dot(inp.interp2.xyz, inp.interp2.xyz);
        //         tmp0.x = rsqrt(tmp0.x);
        //         o.sv_target.xyz = tmp0.xxx * inp.interp2.xyz;
        //         o.sv_target.w = 0.0;
        //         return o;
        //     }
        //     ENDCG
            
        // }
        // Pass {
        //     Name "ShadowCaster"
        //     ColorMask 0
        //     ZClip On
        //     Tags {
        //         "DisableBatching"="False"
        //         "LIGHTMODE"="SHADOWCASTER"
        //         "QUEUE"="Transparent"
        //         // "RenderPipeline"="UniversalPipeline"
        //         "RenderType"="Transparent"
        //         "ShaderGraphShader"="true"
        //         "ShaderGraphTargetId"="UniversalUnlitSubTarget"
        //         "UniversalMaterialType"="Unlit"
        //     }
        //     CGPROGRAM
            
        //     #pragma vertex vert
        //     #pragma fragment frag

            

        //     struct appdata
        //     {
        //         float3 vertex : POSITION;
        //         float3 normal : NORMAL;
        //         float4 tangent : TANGENT;
        //         float4 texcoord : TEXCOORD;
        //     };
        //     struct v2f
        //     {
        //         float4 position : SV_POSITION;
        //         float4 interp : INTERP;
        //         float3 interp1 : INTERP1;
        //         float3 interp2 : INTERP2;
        //     };

        //     // CBs for DX11VertexSM40
        //     float4 _ShadowBias; // 2064 (starting at cb0[129].x)
        //     float3 _LightDirection; // 2080 (starting at cb0[130].x)
        //     // Textures for DX11VertexSM40

        //     v2f vert(appdata v)
        //     {
        //         v2f o;
        //         float4 tmp0;
        //         float4 tmp1;
        //         float4 tmp2;
        //         tmp0.x = dot(v.normal.xyz, unity_WorldToObject._m00_m10_m20);
        //         tmp0.y = dot(v.normal.xyz, unity_WorldToObject._m01_m11_m21);
        //         tmp0.z = dot(v.normal.xyz, unity_WorldToObject._m02_m12_m22);
        //         tmp0.w = dot(tmp0.xyz, tmp0.xyz);
        //         tmp0.w = max(tmp0.w, 8388608.0);
        //         tmp0.w = rsqrt(tmp0.w);
        //         tmp0.xyz = tmp0.www * tmp0.xyz;
        //         tmp0.w = saturate(dot(_LightDirection, tmp0.xyz));
        //         tmp0.w = 1.0 - tmp0.w;
        //         tmp0.w = tmp0.w * _ShadowBias.y;
        //         tmp1.xyz = v.vertex.yyy * unity_ObjectToWorld._m01_m11_m21;
        //         tmp1.xyz = unity_ObjectToWorld._m00_m10_m20 * v.vertex.xxx + tmp1.xyz;
        //         tmp1.xyz = unity_ObjectToWorld._m02_m12_m22 * v.vertex.zzz + tmp1.xyz;
        //         tmp1.xyz = tmp1.xyz + unity_ObjectToWorld._m03_m13_m23;
        //         tmp2.xyz = _LightDirection * _ShadowBias.xxx + tmp1.xyz;
        //         o.interp1.xyz = tmp1.xyz;
        //         tmp1.xyz = tmp0.xyz * tmp0.www + tmp2.xyz;
        //         o.interp2.xyz = tmp0.xyz;
        //         tmp0 = tmp1.yyyy * unity_MatrixVP._m01_m11_m21_m31;
        //         tmp0 = unity_MatrixVP._m00_m10_m20_m30 * tmp1.xxxx + tmp0;
        //         tmp0 = unity_MatrixVP._m02_m12_m22_m32 * tmp1.zzzz + tmp0;
        //         tmp0 = tmp0 + unity_MatrixVP._m03_m13_m23_m33;
        //         tmp1.x = min(tmp0.w, tmp0.z);
        //         tmp1.x = tmp1.x - tmp0.z;
        //         tmp1.y = round(_ShadowBias.z);
        //         tmp1.y = tmp1.y == 1.0;
        //         tmp1.y = uint1(tmp1.y) & uint1(1);
        //         o.position.z = tmp1.y * tmp1.x + tmp0.z;
        //         o.position.xyw = tmp0.xyw;
        //         o.interp = v.texcoord;
        //         return o;
        //     }

        //     struct fout
        //     {
        //         float4 sv_target : SV_TARGET;
        //     };

        //     // CBs for DX11PixelSM40
        //     // Textures for DX11PixelSM40

        //     fout frag(v2f inp)
        //     {
        //         fout o;
        //         o.sv_target = float4(0.0, 0.0, 0.0, 0.0);
        //         return o;
        //     }
        //     ENDCG
            
        // }
    }
    Fallback "Hidden/Shader Graph/FallbackError"
}
