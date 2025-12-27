// Upgrade NOTE: replaced 'glstate_matrix_projection' with 'UNITY_MATRIX_P'

Shader "Shader Graphs/RoyalStyleUI" {
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
        [NoScaleOffset] _Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D ("Texture2D", 2D) = "white" {}
        [HideInInspector] _StencilComp ("Stencil Comparison", Float) = 8
        [HideInInspector] _Stencil ("Stencil ID", Float) = 0
        [HideInInspector] _StencilOp ("Stencil Operation", Float) = 0
        [HideInInspector] _StencilWriteMask ("Stencil Write Mask", Float) = 255
        [HideInInspector] _StencilReadMask ("Stencil Read Mask", Float) = 255
        [HideInInspector] _ColorMask ("ColorMask", Float) = 15
        [HideInInspector] _ClipRect ("ClipRect", Vector) = (0, 0, 0, 0)
        [HideInInspector] _UIMaskSoftnessX ("UIMaskSoftnessX", Float) = 1
        [HideInInspector] _UIMaskSoftnessY ("UIMaskSoftnessY", Float) = 1
        [HideInInspector] [NoScaleOffset] unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector] [NoScaleOffset] unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector] [NoScaleOffset] unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" {}
    }
    SubShader {
        Tags {
            "CanUseSpriteAtlas"="true"
            "IGNOREPROJECTOR"="true"
            "PreviewType"="Plane"
            "QUEUE"="Transparent"
            // "RenderPipeline"="UniversalPipeline"
            "RenderType"="Transparent"
            "ShaderGraphShader"="true"
            "ShaderGraphTargetId"="UniversalCanvasSubTarget"
        }
        Pass {
            Name "Default"
            Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
            ColorMask 0
            ZClip On
            ZWrite Off
            Cull Off
            Stencil {
                ReadMask 0
                WriteMask 0
            }
            Tags {
                "CanUseSpriteAtlas"="true"
                "IGNOREPROJECTOR"="true"
                "PreviewType"="Plane"
                "QUEUE"="Transparent"
                // "RenderPipeline"="UniversalPipeline"
                "RenderType"="Transparent"
                "ShaderGraphShader"="true"
                "ShaderGraphTargetId"="UniversalCanvasSubTarget"
            }
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag

            #pragma shader_feature UNITY_UI_ALPHACLIP
            #pragma shader_feature UNITY_UI_CLIP_RECT
            

            #if UNITY_UI_ALPHACLIP && UNITY_UI_CLIP_RECT
            struct appdata
            {
                float3 vertex : POSITION;
                float3 normal : NORMAL;
                float4 color : COLOR;
                float4 texcoord : TEXCOORD;
                float4 texcoord1 : TEXCOORD1;
                uint sv_instanceid : SV_InstanceID;
                uint sv_vertexid : SV_VertexID;
            };
            struct v2f
            {
                float4 position : SV_POSITION;
                float4 interp : INTERP;
                float4 interp1 : INTERP1;
                float4 interp2 : INTERP2;
                float3 interp3 : INTERP3;
                float3 interp4 : INTERP4;
            };

            // CBs for DX11VertexSM40
            // CBUFFER_START(UnityPerMaterial) // 2
                float4 _ClipRect; // 720 (starting at cb2[45].x)
            // CBUFFER_END
            float _UIMaskSoftnessX; // 736 (starting at cb2[46].x)
            float _UIMaskSoftnessY; // 740 (starting at cb2[46].y)
            // Textures for DX11VertexSM40

            v2f vert(appdata v)
            {
                v2f o;
                float4 tmp0;
                float4 tmp1;
                tmp0 = v.vertex.yyyy * unity_ObjectToWorld._m01_m11_m21_m31;
                tmp0 = unity_ObjectToWorld._m00_m10_m20_m30 * v.vertex.xxxx + tmp0;
                tmp0 = unity_ObjectToWorld._m02_m12_m22_m32 * v.vertex.zzzz + tmp0;
                tmp0 = tmp0 + unity_ObjectToWorld._m03_m13_m23_m33;
                tmp1 = tmp0.yyyy * unity_MatrixVP._m01_m11_m21_m31;
                tmp1 = unity_MatrixVP._m00_m10_m20_m30 * tmp0.xxxx + tmp1;
                tmp1 = unity_MatrixVP._m02_m12_m22_m32 * tmp0.zzzz + tmp1;
                tmp0 = unity_MatrixVP._m03_m13_m23_m33 * tmp0.wwww + tmp1;
                o.position = tmp0;
                o.interp = v.texcoord;
                tmp1.z = _ScreenParams.x * UNITY_MATRIX_P._m00;
                tmp1.w = _ScreenParams.y * UNITY_MATRIX_P._m11;
                tmp0.xy = tmp0.ww / abs(tmp1.zw);
                tmp0.xy = float2(_UIMaskSoftnessX.x, _UIMaskSoftnessY.x) * float2(0.25, 0.25) + abs(tmp0.xy);
                o.interp1.zw = float2(0.25, 0.25) / tmp0.xy;
                tmp0 = max(_ClipRect, float4(-20000000000.0, -20000000000.0, -20000000000.0, -20000000000.0));
                tmp0 = min(tmp0, float4(20000000000.0, 20000000000.0, 20000000000.0, 20000000000.0));
                tmp0.xy = v.vertex.xy * float2(2.0, 2.0) + -tmp0.xy;
                o.interp1.xy = tmp0.xy - tmp0.zw;
                o.interp2 = v.color;
                tmp0.xyz = v.vertex.yyy * unity_ObjectToWorld._m01_m11_m21;
                tmp0.xyz = unity_ObjectToWorld._m00_m10_m20 * v.vertex.xxx + tmp0.xyz;
                tmp0.xyz = unity_ObjectToWorld._m02_m12_m22 * v.vertex.zzz + tmp0.xyz;
                o.interp3.xyz = tmp0.xyz + unity_ObjectToWorld._m03_m13_m23;
                tmp0.x = dot(v.normal.xyz, unity_WorldToObject._m00_m10_m20);
                tmp0.y = dot(v.normal.xyz, unity_WorldToObject._m01_m11_m21);
                tmp0.z = dot(v.normal.xyz, unity_WorldToObject._m02_m12_m22);
                tmp0.w = dot(tmp0.xyz, tmp0.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                o.interp4.xyz = tmp0.www * tmp0.xyz;
                return o;
            }

            #elif UNITY_UI_CLIP_RECT
            struct appdata
            {
                float3 vertex : POSITION;
                float3 normal : NORMAL;
                float4 color : COLOR;
                float4 texcoord : TEXCOORD;
                float4 texcoord1 : TEXCOORD1;
                uint sv_instanceid : SV_InstanceID;
                uint sv_vertexid : SV_VertexID;
            };
            struct v2f
            {
                float4 position : SV_POSITION;
                float4 interp : INTERP;
                float4 interp1 : INTERP1;
                float4 interp2 : INTERP2;
                float3 interp3 : INTERP3;
                float3 interp4 : INTERP4;
            };

            // CBs for DX11VertexSM40
            // CBUFFER_START(UnityPerMaterial) // 2
                float4 _ClipRect; // 720 (starting at cb2[45].x)
            // CBUFFER_END
            float _UIMaskSoftnessX; // 736 (starting at cb2[46].x)
            float _UIMaskSoftnessY; // 740 (starting at cb2[46].y)
            // Textures for DX11VertexSM40

            v2f vert(appdata v)
            {
                v2f o;
                float4 tmp0;
                float4 tmp1;
                tmp0 = v.vertex.yyyy * unity_ObjectToWorld._m01_m11_m21_m31;
                tmp0 = unity_ObjectToWorld._m00_m10_m20_m30 * v.vertex.xxxx + tmp0;
                tmp0 = unity_ObjectToWorld._m02_m12_m22_m32 * v.vertex.zzzz + tmp0;
                tmp0 = tmp0 + unity_ObjectToWorld._m03_m13_m23_m33;
                tmp1 = tmp0.yyyy * unity_MatrixVP._m01_m11_m21_m31;
                tmp1 = unity_MatrixVP._m00_m10_m20_m30 * tmp0.xxxx + tmp1;
                tmp1 = unity_MatrixVP._m02_m12_m22_m32 * tmp0.zzzz + tmp1;
                tmp0 = unity_MatrixVP._m03_m13_m23_m33 * tmp0.wwww + tmp1;
                o.position = tmp0;
                o.interp = v.texcoord;
                tmp1.z = _ScreenParams.x * UNITY_MATRIX_P._m00;
                tmp1.w = _ScreenParams.y * UNITY_MATRIX_P._m11;
                tmp0.xy = tmp0.ww / abs(tmp1.zw);
                tmp0.xy = float2(_UIMaskSoftnessX.x, _UIMaskSoftnessY.x) * float2(0.25, 0.25) + abs(tmp0.xy);
                o.interp1.zw = float2(0.25, 0.25) / tmp0.xy;
                tmp0 = max(_ClipRect, float4(-20000000000.0, -20000000000.0, -20000000000.0, -20000000000.0));
                tmp0 = min(tmp0, float4(20000000000.0, 20000000000.0, 20000000000.0, 20000000000.0));
                tmp0.xy = v.vertex.xy * float2(2.0, 2.0) + -tmp0.xy;
                o.interp1.xy = tmp0.xy - tmp0.zw;
                o.interp2 = v.color;
                tmp0.xyz = v.vertex.yyy * unity_ObjectToWorld._m01_m11_m21;
                tmp0.xyz = unity_ObjectToWorld._m00_m10_m20 * v.vertex.xxx + tmp0.xyz;
                tmp0.xyz = unity_ObjectToWorld._m02_m12_m22 * v.vertex.zzz + tmp0.xyz;
                o.interp3.xyz = tmp0.xyz + unity_ObjectToWorld._m03_m13_m23;
                tmp0.x = dot(v.normal.xyz, unity_WorldToObject._m00_m10_m20);
                tmp0.y = dot(v.normal.xyz, unity_WorldToObject._m01_m11_m21);
                tmp0.z = dot(v.normal.xyz, unity_WorldToObject._m02_m12_m22);
                tmp0.w = dot(tmp0.xyz, tmp0.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                o.interp4.xyz = tmp0.www * tmp0.xyz;
                return o;
            }

            #elif UNITY_UI_ALPHACLIP
            struct appdata
            {
                float3 vertex : POSITION;
                float3 normal : NORMAL;
                float4 color : COLOR;
                float4 texcoord : TEXCOORD;
                float4 texcoord1 : TEXCOORD1;
                uint sv_instanceid : SV_InstanceID;
                uint sv_vertexid : SV_VertexID;
            };
            struct v2f
            {
                float4 position : SV_POSITION;
                float4 interp : INTERP;
                float4 interp1 : INTERP1;
                float4 interp2 : INTERP2;
                float3 interp3 : INTERP3;
                float3 interp4 : INTERP4;
            };

            // CBs for DX11VertexSM40
            // Textures for DX11VertexSM40

            v2f vert(appdata v)
            {
                v2f o;
                float4 tmp0;
                float4 tmp1;
                tmp0 = v.vertex.yyyy * unity_ObjectToWorld._m01_m11_m21_m31;
                tmp0 = unity_ObjectToWorld._m00_m10_m20_m30 * v.vertex.xxxx + tmp0;
                tmp0 = unity_ObjectToWorld._m02_m12_m22_m32 * v.vertex.zzzz + tmp0;
                tmp0 = tmp0 + unity_ObjectToWorld._m03_m13_m23_m33;
                tmp1 = tmp0.yyyy * unity_MatrixVP._m01_m11_m21_m31;
                tmp1 = unity_MatrixVP._m00_m10_m20_m30 * tmp0.xxxx + tmp1;
                tmp1 = unity_MatrixVP._m02_m12_m22_m32 * tmp0.zzzz + tmp1;
                o.position = unity_MatrixVP._m03_m13_m23_m33 * tmp0.wwww + tmp1;
                o.interp = v.texcoord;
                o.interp1 = float4(0.0, 0.0, 0.0, 0.0);
                o.interp2 = v.color;
                tmp0.xyz = v.vertex.yyy * unity_ObjectToWorld._m01_m11_m21;
                tmp0.xyz = unity_ObjectToWorld._m00_m10_m20 * v.vertex.xxx + tmp0.xyz;
                tmp0.xyz = unity_ObjectToWorld._m02_m12_m22 * v.vertex.zzz + tmp0.xyz;
                o.interp3.xyz = tmp0.xyz + unity_ObjectToWorld._m03_m13_m23;
                tmp0.x = dot(v.normal.xyz, unity_WorldToObject._m00_m10_m20);
                tmp0.y = dot(v.normal.xyz, unity_WorldToObject._m01_m11_m21);
                tmp0.z = dot(v.normal.xyz, unity_WorldToObject._m02_m12_m22);
                tmp0.w = dot(tmp0.xyz, tmp0.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                o.interp4.xyz = tmp0.www * tmp0.xyz;
                return o;
            }

            #else
            struct appdata
            {
                float3 vertex : POSITION;
                float3 normal : NORMAL;
                float4 color : COLOR;
                float4 texcoord : TEXCOORD;
                float4 texcoord1 : TEXCOORD1;
                uint sv_instanceid : SV_InstanceID;
                uint sv_vertexid : SV_VertexID;
            };
            struct v2f
            {
                float4 position : SV_POSITION;
                float4 interp : INTERP;
                float4 interp1 : INTERP1;
                float4 interp2 : INTERP2;
                float3 interp3 : INTERP3;
                float3 interp4 : INTERP4;
            };

            // CBs for DX11VertexSM40
            // Textures for DX11VertexSM40

            v2f vert(appdata v)
            {
                v2f o;
                float4 tmp0;
                float4 tmp1;
                tmp0 = v.vertex.yyyy * unity_ObjectToWorld._m01_m11_m21_m31;
                tmp0 = unity_ObjectToWorld._m00_m10_m20_m30 * v.vertex.xxxx + tmp0;
                tmp0 = unity_ObjectToWorld._m02_m12_m22_m32 * v.vertex.zzzz + tmp0;
                tmp0 = tmp0 + unity_ObjectToWorld._m03_m13_m23_m33;
                tmp1 = tmp0.yyyy * unity_MatrixVP._m01_m11_m21_m31;
                tmp1 = unity_MatrixVP._m00_m10_m20_m30 * tmp0.xxxx + tmp1;
                tmp1 = unity_MatrixVP._m02_m12_m22_m32 * tmp0.zzzz + tmp1;
                o.position = unity_MatrixVP._m03_m13_m23_m33 * tmp0.wwww + tmp1;
                o.interp = v.texcoord;
                o.interp1 = float4(0.0, 0.0, 0.0, 0.0);
                o.interp2 = v.color;
                tmp0.xyz = v.vertex.yyy * unity_ObjectToWorld._m01_m11_m21;
                tmp0.xyz = unity_ObjectToWorld._m00_m10_m20 * v.vertex.xxx + tmp0.xyz;
                tmp0.xyz = unity_ObjectToWorld._m02_m12_m22 * v.vertex.zzz + tmp0.xyz;
                o.interp3.xyz = tmp0.xyz + unity_ObjectToWorld._m03_m13_m23;
                tmp0.x = dot(v.normal.xyz, unity_WorldToObject._m00_m10_m20);
                tmp0.y = dot(v.normal.xyz, unity_WorldToObject._m01_m11_m21);
                tmp0.z = dot(v.normal.xyz, unity_WorldToObject._m02_m12_m22);
                tmp0.w = dot(tmp0.xyz, tmp0.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                o.interp4.xyz = tmp0.www * tmp0.xyz;
                return o;
            }
            #endif


            #if UNITY_UI_ALPHACLIP && UNITY_UI_CLIP_RECT
            struct fout
            {
                float4 sv_target : SV_TARGET;
            };

            // CBs for DX11PixelSM40
            float2 _GlobalMipBias; // 64 (starting at cb0[4].x)
            float4 _MainLightPosition; // 80 (starting at cb0[5].x)
            float4 _MainLightColor; // 96 (starting at cb0[6].x)
            float4 _TimeParameters; // 304 (starting at cb0[19].x)
            // float4 unity_OrthoParams; // 400 (starting at cb0[25].x)
            float _isFade; // 2128 (starting at cb0[133].x)
            // CBUFFER_START(UnityPerMaterial) // 1
            // CBUFFER_END
            float _LoadingBlend; // 48 (starting at cb1[3].x)
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

            fout frag(v2f inp)
            {
                fout o;
                float4 tmp0;
                float4 tmp1;
                float4 tmp2;
                float4 tmp3;
                float4 tmp4;
                float4 tmp5;
                float4 tmp6;
                float4 tmp7;
                float4 tmp8;
                float4 tmp9;
                float4 tmp10;
                float4 tmp11;
                tmp0.zw = float2(-1.0, 0.6666667);
                tmp1.zw = float2(1.0, -1.0);
                tmp2.xyz = log(abs(_KiraColor02.xyz));
                tmp2.xyz = tmp2.xyz * float3(0.4166667, 0.4166667, 0.4166667);
                tmp2.xyz = pow(2.0, tmp2.xyz);
                tmp2.xyz = tmp2.xyz * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
                tmp3.xyz = _KiraColor02.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
                tmp4.xyz = _KiraColor02.xyz * float3(12.92321, 12.92321, 12.92321);
                tmp2.xyz = tmp3.xyz ? tmp4.xyz : tmp2.xyz;
                tmp3 = tex2Dbias(_KiraColorTexture, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp4.xyw = tmp2.yzx * tmp3.yzx;
                tmp0.xy = tmp4.yx;
                tmp1.xy = tmp3.yz * tmp2.yz + -tmp0.xy;
                tmp2.w = tmp0.y >= tmp4.y;
                tmp2.w = uint1(tmp2.w) & uint1(1);
                tmp0 = tmp2.wwww * tmp1 + tmp0;
                tmp4.xyz = tmp0.xyw;
                tmp1.x = tmp4.w >= tmp4.x;
                tmp1.x = uint1(tmp1.x) & uint1(1);
                tmp0.xyw = tmp4.wyx;
                tmp0 = tmp0 - tmp4;
                tmp0 = tmp1.xxxx * tmp0 + tmp4;
                tmp1.x = tmp0.w - tmp0.y;
                tmp0.y = min(tmp0.y, tmp0.w);
                tmp0.y = tmp0.x - tmp0.y;
                tmp0.w = tmp0.y * 6.0 + 0.0;
                tmp0.w = tmp1.x / tmp0.w;
                tmp0.z = tmp0.w + tmp0.z;
                tmp0.z = _Time.y * 0.1111111 + abs(tmp0.z);
                tmp0.w = tmp0.z > 1.0;
                tmp1.xy = tmp0.zz + float2(1.0, -1.0);
                tmp0.w = tmp0.w ? tmp1.y : tmp0.z;
                tmp0.z = tmp0.z < 0.0;
                tmp0.z = tmp0.z ? tmp1.x : tmp0.w;
                tmp1.xyz = tmp0.zzz + float3(1.0, 0.6666667, 0.3333333);
                tmp1.xyz = frac(tmp1.xyz);
                tmp1.xyz = tmp1.xyz * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                tmp1.xyz = saturate(abs(tmp1.xyz) - float3(1.0, 1.0, 1.0));
                tmp1.xyz = tmp1.xyz - float3(1.0, 1.0, 1.0);
                tmp0.z = tmp0.x + 0.0;
                tmp0.w = tmp0.y / tmp0.z;
                tmp0.y = tmp0.y == 0.0;
                tmp0.x = tmp0.y ? tmp0.x : tmp0.z;
                tmp0.yzw = tmp0.www * tmp1.xyz + float3(1.0, 1.0, 1.0);
                tmp1.xyz = -tmp0.xxx * tmp0.yzw + float3(1.0, 1.0, 1.0);
                tmp0.xyz = tmp0.yzw * tmp0.xxx;
                tmp3.xyz = float3(1.0, 1.0, 1.0) - tmp2.xyz;
                tmp3.xyz = tmp3.xyz + tmp3.xyz;
                tmp1.xyz = -tmp3.xyz * tmp1.xyz + float3(1.0, 1.0, 1.0);
                tmp3.xyz = tmp2.xyz <= float3(0.5, 0.5, 0.5);
                tmp2.xyz = tmp2.xyz * tmp0.xyz;
                tmp2.xyz = tmp2.xyz + tmp2.xyz;
                tmp4.xyz = tmp3.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                tmp3.xyz = uint3(tmp3.xyz) & uint3(int3(1, 1, 1));
                tmp1.xyz = tmp1.xyz * tmp4.xyz;
                tmp1.xyz = tmp2.xyz * tmp3.xyz + tmp1.xyz;
                tmp0.w = _Kira01_01Tile * _Kira01_01Tile;
                tmp1.w = 1.00001 / tmp0.w;
                tmp1.w = frac(tmp1.w);
                tmp0.w = tmp0.w * tmp1.w;
                tmp0.w = floor(tmp0.w);
                tmp1.w = tmp0.w + 0.5;
                tmp2.x = 1.0 / _Kira01_01Tile;
                tmp1.w = tmp1.w * tmp2.x;
                tmp3.y = floor(tmp1.w);
                tmp0.w = -_Kira01_01Tile * tmp3.y + tmp0.w;
                tmp0.w = tmp0.w + 1.0;
                tmp3.x = _Kira01_01Tile - tmp0.w;
                tmp2.yz = tmp3.xy + inp.interp.xy;
                tmp2.xy = tmp2.xx * tmp2.yz;
                tmp2 = tex2Dbias(_HighlightNormal, float4(tmp2.xy, 0, _GlobalMipBias.x));
                tmp2.x = tmp2.x * tmp2.w;
                tmp2.xw = tmp2.yx * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.w = dot(tmp2.xw, tmp2.xw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp3.x = max(tmp0.w, 0.0);
                tmp0.w = tmp2.x >= tmp3.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp4.x = tmp2.x - tmp3.x;
                tmp3.y = tmp2.x;
                tmp4.y = tmp3.x - tmp3.y;
                tmp3.zw = float2(-1.0, 0.6666667);
                tmp4.zw = float2(1.0, -1.0);
                tmp3 = tmp0.wwww * tmp4 + tmp3;
                tmp0.w = tmp2.w >= tmp3.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp2.xyz = tmp3.xyw;
                tmp3.xyw = tmp2.wyx;
                tmp3 = tmp3 - tmp2;
                tmp2 = tmp0.wwww * tmp3 + tmp2;
                tmp0.w = tmp2.w - tmp2.y;
                tmp1.w = min(tmp2.y, tmp2.w);
                tmp1.w = tmp2.x - tmp1.w;
                tmp2.y = tmp1.w * 6.0 + 0.0;
                tmp0.w = tmp0.w / tmp2.y;
                tmp0.w = tmp0.w + tmp2.z;
                tmp2.y = sin(_Time.y);
                tmp0.w = tmp2.y * 0.1388889 + abs(tmp0.w);
                tmp2.y = saturate(tmp2.y + 0.5);
                tmp2.z = tmp0.w > 1.0;
                tmp3.xy = tmp0.ww + float2(1.0, -1.0);
                tmp2.z = tmp2.z ? tmp3.y : tmp0.w;
                tmp0.w = tmp0.w < 0.0;
                tmp0.w = tmp0.w ? tmp3.x : tmp2.z;
                tmp3.xyz = tmp0.www + float3(1.0, 0.6666667, 0.3333333);
                tmp3.xyz = frac(tmp3.xyz);
                tmp3.xyz = tmp3.xyz * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                tmp3.xyz = saturate(abs(tmp3.xyz) - float3(1.0, 1.0, 1.0));
                tmp3.xyz = tmp3.xyz - float3(1.0, 1.0, 1.0);
                tmp0.w = tmp2.x + 0.0;
                tmp2.z = tmp1.w / tmp0.w;
                tmp1.w = tmp1.w == 0.0;
                tmp0.w = tmp1.w ? tmp2.x : tmp0.w;
                tmp2.xzw = tmp2.zzz * tmp3.xyz + float3(1.0, 1.0, 1.0);
                tmp3.xyz = tmp0.www * tmp2.xzw + float3(-0.0, -0.0, -1.0);
                tmp2.xzw = tmp0.www * tmp2.xzw;
                tmp2.xzw = saturate(tmp2.xzw);
                tmp2.xzw = tmp2.xzw - float3(0.0, 0.0, 1.0);
                tmp2.xzw = _KiraNormal01_01Power.xxx * tmp2.xzw + float3(0.0, 0.0, 1.0);
                tmp3.xyz = _CardDistortion01.xxx * tmp3.xyz + float3(0.0, 0.0, 1.0);
                tmp0.w = _Kira01_02Tile * _Kira01_02Tile;
                tmp1.w = 1.00001 / tmp0.w;
                tmp1.w = frac(tmp1.w);
                tmp0.w = tmp0.w * tmp1.w;
                tmp0.w = floor(tmp0.w);
                tmp1.w = tmp0.w + 0.5;
                tmp3.w = 1.0 / _Kira01_02Tile;
                tmp1.w = tmp1.w * tmp3.w;
                tmp4.x = floor(tmp1.w);
                tmp0.w = -_Kira01_02Tile * tmp4.x + tmp0.w;
                tmp0.w = tmp0.w + 1.0;
                tmp4.y = _Kira01_02Tile - tmp0.w;
                tmp4.xy = tmp4.xy + inp.interp.yx;
                tmp4.xy = tmp4.xy * tmp3.ww + float2(-0.77, -0.61);
                tmp0.w = dot(tmp4.xy, tmp4.xy);
                tmp0.w = sqrt(tmp0.w);
                tmp0.w = tmp0.w * 0.77;
                tmp5.x = sin(tmp0.w);
                tmp6.x = cos(tmp0.w);
                tmp4.zw = tmp4.xy * tmp5.xx;
                tmp0.w = tmp6.x * tmp4.y + -tmp4.z;
                tmp1.w = tmp6.x * tmp4.x + tmp4.w;
                tmp1.w = _Time.y * 0.05 + tmp1.w;
                tmp4.y = tmp1.w + 0.77;
                tmp0.w = _Time.y * 0.05 + tmp0.w;
                tmp4.x = tmp0.w + 0.61;
                tmp4 = tex2Dbias(_KiraNormal01_02, float4(tmp4.xy, 0, _GlobalMipBias.x));
                tmp4.x = tmp4.x * tmp4.w;
                tmp4.xy = tmp4.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.w = dot(tmp4.xy, tmp4.xy);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp4.z = max(tmp0.w, 0.0);
                tmp4.xyz = saturate(tmp4.xyz);
                tmp4.xyz = tmp4.xyz - float3(0.0, 0.0, 1.0);
                tmp4.xyz = _Kira01_02Power.xxx * tmp4.xyz + float3(0.0, 0.0, 1.0);
                tmp5.xy = tmp2.xz + tmp4.xy;
                tmp5.z = tmp2.w * tmp4.z;
                tmp0.w = dot(tmp5.xyz, tmp5.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp2.xzw = tmp5.xyz * tmp0.www + float3(-0.0, -0.0, -1.0);
                tmp0.w = _AttributeTile + 0.00001;
                tmp0.w = tmp0.w * 0.0625;
                tmp1.w = tmp0.w >= -tmp0.w;
                tmp0.w = frac(abs(tmp0.w));
                tmp0.w = tmp1.w ? tmp0.w : -tmp0.w;
                tmp0.w = tmp0.w * 16.0;
                tmp0.w = floor(tmp0.w);
                tmp1.w = tmp0.w + 0.5;
                tmp1.w = tmp1.w * 0.25;
                tmp1.w = floor(tmp1.w);
                tmp4.x = -tmp1.w * 4.0 + tmp0.w;
                tmp0.w = tmp1.w + 1.0;
                tmp4.zw = _AttributeSize_Pos.xy * float2(0.5, 0.5) + float2(-0.5, -0.5);
                tmp4.zw = inp.interp.xy * _AttributeSize_Pos.xy + -tmp4.zw;
                tmp5.xy = tmp4.zw + _AttributeSize_Pos.zw;
                tmp4.y = tmp5.y - tmp0.w;
                tmp5.z = 4.0;
                tmp4.xy = tmp4.xy + tmp5.xz;
                tmp4.zw = tmp5.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.zw = abs(tmp4.zw) - float2(1.0, 1.0);
                tmp4.xy = tmp4.xy * float2(0.25, 0.25);
                tmp5 = tex2Dbias(_AttributeTex, float4(tmp4.xy, 0, _GlobalMipBias.x));
                tmp4.xy = ddx(tmp4.zw);
                tmp5.yz = ddy(tmp4.zw);
                tmp4.xy = abs(tmp4.xy) + abs(tmp5.yz);
                tmp4.xy = tmp4.zw / tmp4.xy;
                tmp4.xy = saturate(float2(1.0, 1.0) - tmp4.xy);
                tmp0.w = min(tmp4.y, tmp4.x);
                tmp4.xy = inp.interp.xy * float2(1.0, 5.0) + float2(0.0, -4.0);
                tmp4 = tex2Dbias(_MonsterNameTex, float4(tmp4.xy, 0, _GlobalMipBias.x));
                tmp1.w = saturate(_MonsterNameTextBold * tmp4.w + tmp4.w);
                tmp0.w = tmp5.x * tmp0.w + tmp1.w;
                tmp5 = tex2Dbias(_FrameMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp3.w = tmp0.w + tmp5.x;
                tmp0.w = 1.0 - tmp0.w;
                tmp2.xzw = tmp3.www * tmp2.xzw + float3(0.0, 0.0, 1.0);
                tmp5.xyz = _FakeLightDirection - _MainLightPosition.xyz;
                tmp5.xyz = _FakeBlend.xxx * tmp5.xyz + _MainLightPosition.xyz;
                tmp6.xyz = tmp5.xyz + float3(0.0, 1.0, 0.0);
                tmp4.z = dot(tmp6.xyz, tmp6.xyz);
                tmp4.z = rsqrt(tmp4.z);
                tmp6.xyz = tmp4.zzz * tmp6.xyz;
                tmp4.z = dot(inp.interp4.xyz, inp.interp4.xyz);
                tmp4.z = sqrt(tmp4.z);
                tmp4.z = 1.0 / tmp4.z;
                tmp7.xyz = tmp4.zzz * inp.interp4.xyz;
                tmp8.xyz = -tmp4.zzz * inp.interp4.xyz + _FakeNormalDirection;
                tmp7.xyz = _FakeBlend.xxx * tmp8.xyz + tmp7.xyz;
                tmp4.z = dot(tmp6.xyz, tmp7.xyz);
                tmp5.w = tmp4.z * _HoloShift01;
                tmp4.z = tmp4.z * _HoloShift02;
                tmp6 = tex2Dbias(_HoloTex, float4(tmp4.zz, 0, _GlobalMipBias.x));
                tmp8 = tex2Dbias(_HoloTex, float4(tmp5.ww, 0, _GlobalMipBias.x));
                tmp8.x = tmp8.x * tmp8.w;
                tmp8.xy = tmp8.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.z = dot(tmp8.xy, tmp8.xy);
                tmp8.xy = tmp2.xz + tmp8.xy;
                tmp4.z = min(tmp4.z, 1.0);
                tmp4.z = 1.0 - tmp4.z;
                tmp4.z = sqrt(tmp4.z);
                tmp4.z = max(tmp4.z, 0.0);
                tmp8.z = tmp2.w * tmp4.z;
                tmp4.z = dot(tmp8.xyz, tmp8.xyz);
                tmp4.z = max(tmp4.z, 8388608.0);
                tmp4.z = rsqrt(tmp4.z);
                tmp5.w = tmp4.z * tmp8.z;
                tmp8.xy = tmp8.xy * tmp4.zz + tmp3.xy;
                tmp8.z = tmp3.z * tmp5.w;
                tmp3.x = dot(tmp8.xyz, tmp8.xyz);
                tmp3.x = max(tmp3.x, 8388608.0);
                tmp3.x = rsqrt(tmp3.x);
                tmp3.xyz = tmp3.xxx * tmp8.xyz;
                tmp8.xy = tmp3.yy * unity_MatrixV._m01_m11;
                tmp3.xy = unity_MatrixV._m00_m10 * tmp3.xx + tmp8.xy;
                tmp3.xy = unity_MatrixV._m02_m12 * tmp3.zz + tmp3.xy;
                tmp3.xy = tmp3.xy + unity_MatrixV._m03_m13;
                tmp8 = tex2Dbias(_HoloTex, float4(tmp3.xy, 0, _GlobalMipBias.x));
                tmp3.xyz = float3(1.0, 1.0, 1.0) - tmp8.xyz;
                tmp3.xyz = tmp3.xyz + tmp3.xyz;
                tmp4.z = 1.0 - _HoloBrightness02;
                tmp3.xyz = -tmp3.xyz * tmp4.zzz + float3(1.0, 1.0, 1.0);
                tmp9.xyz = tmp8.xyz <= float3(0.5, 0.5, 0.5);
                tmp8.xyz = tmp8.xyz * _HoloBrightness02.xxx;
                tmp8.xyz = tmp8.xyz + tmp8.xyz;
                tmp10.xyz = tmp9.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                tmp9.xyz = uint3(tmp9.xyz) & uint3(int3(1, 1, 1));
                tmp3.xyz = tmp3.xyz * tmp10.xyz;
                tmp3.xyz = saturate(tmp8.xyz * tmp9.xyz + tmp3.xyz);
                tmp3.xyz = tmp3.zzz + tmp3.xyz;
                tmp1.xyz = saturate(tmp1.xyz * tmp3.xyz);
                tmp3.xy = _Time.yx * float2(2.5, 2.5) + float2(2.09439, 4.18878);
                tmp3.yz = sin(tmp3.xy);
                tmp8.xy = _Time.yx * float2(0.25, 2.5);
                tmp3.x = sin(tmp8.y);
                tmp8.x = sin(tmp8.x);
                tmp9.x = cos(tmp8.x);
                tmp3.xyz = tmp3.xyz + float3(3.0, 3.0, 3.0);
                tmp10 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp3.xyz = tmp3.xyz * float3(0.2, 0.2, 0.2) + -tmp10.xyz;
                tmp3.x = dot(tmp3.xyz, tmp3.xyz);
                tmp3.x = sqrt(tmp3.x);
                tmp3.x = saturate(-_EnhanceColorThreshold * tmp3.x + 1.0);
                tmp3.x = dot(tmp3.xx, _IlluustRanbowPower.xx);
                tmp3.xyz = tmp0.xyz * tmp3.xxx;
                tmp0.xyz = _RanbowPower.xxx * tmp0.xyz + tmp3.xyz;
                tmp9.yz = tmp8.xx;
                tmp3.xyz = tmp9.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                tmp3.xyz = tmp3.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                tmp8.xy = float2(_Kira02_01Tile.x, _Kira2_02Tile.x) * float2(_Kira02_01Tile.x, _Kira2_02Tile.x);
                tmp8.zw = float2(1.00001, 1.00001) / tmp8.xy;
                tmp8.zw = frac(tmp8.zw);
                tmp8.xy = tmp8.xy * tmp8.zw;
                tmp8.xy = floor(tmp8.xy);
                tmp8.zw = tmp8.xy + float2(0.5, 0.5);
                tmp9.xy = float2(1.0, 1.0) / float2(_Kira02_01Tile.x, _Kira2_02Tile.x);
                tmp8.zw = tmp8.zw * tmp9.xy;
                tmp11.zw = floor(tmp8.zw);
                tmp8.xy = -float2(_Kira02_01Tile.x, _Kira2_02Tile.x) * tmp11.zw + tmp8.xy;
                tmp8.xy = tmp8.xy + float2(1.0, 1.0);
                tmp11.xy = float2(_Kira02_01Tile.x, _Kira2_02Tile.x) - tmp8.xy;
                tmp8 = tmp11.xzyw + inp.interp.xyxy;
                tmp8 = tmp8 * tmp9.xxyy + float4(-0.5, -0.5, -0.5, -0.5);
                tmp9.x = dot(tmp8.xy, tmp3.xz);
                tmp9.y = dot(tmp8.yx, tmp3.xy);
                tmp3.xy = tmp9.xy + float2(0.5, 0.5);
                tmp3.xy = tmp3.xy * float2(0.5, 0.5) + float2(0.25, 0.25);
                tmp9 = tex2Dbias(_Kira02_01, float4(tmp3.xy, 0, _GlobalMipBias.x));
                tmp9.x = tmp9.x * tmp9.w;
                tmp3.xy = tmp9.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.z = dot(tmp3.xy, tmp3.xy);
                tmp4.z = min(tmp4.z, 1.0);
                tmp4.z = 1.0 - tmp4.z;
                tmp4.z = sqrt(tmp4.z);
                tmp3.z = max(tmp4.z, 0.0);
                tmp3.xyz = saturate(tmp3.xyz);
                tmp3.xyz = tmp3.xyz - float3(0.0, 0.0, 1.0);
                tmp3.xyz = _Kira02_01Power.xxx * tmp3.xyz + float3(0.0, 0.0, 1.0);
                tmp4.z = -_Time.y * 0.25 + 1.0;
                tmp8.x = sin(tmp4.z);
                tmp9.x = cos(tmp4.z);
                tmp9.yz = tmp8.xx;
                tmp9.xyz = tmp9.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                tmp9.xyz = tmp9.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                tmp8.x = dot(tmp8.zw, tmp9.xz);
                tmp8.y = dot(tmp8.wz, tmp9.xy);
                tmp8.xy = tmp8.xy + float2(0.5, 0.5);
                tmp8.xy = tmp8.xy * float2(0.5, 0.5) + float2(0.25, 0.25);
                tmp8 = tex2Dbias(_Kira02_01, float4(tmp8.xy, 0, _GlobalMipBias.x));
                tmp8.x = tmp8.x * tmp8.w;
                tmp8.xy = tmp8.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.z = dot(tmp8.xy, tmp8.xy);
                tmp4.z = min(tmp4.z, 1.0);
                tmp4.z = 1.0 - tmp4.z;
                tmp4.z = sqrt(tmp4.z);
                tmp8.z = max(tmp4.z, 0.0);
                tmp8.xyz = saturate(tmp8.xyz);
                tmp8.xyz = tmp8.xyz - float3(0.0, 0.0, 1.0);
                tmp8.xyz = _Kira02_02Power.xxx * tmp8.xyz + float3(0.0, 0.0, 1.0);
                tmp9.xy = tmp3.xy + tmp8.xy;
                tmp9.z = tmp3.z * tmp8.z;
                tmp3.x = dot(tmp9.xyz, tmp9.xyz);
                tmp3.x = max(tmp3.x, 8388608.0);
                tmp3.x = rsqrt(tmp3.x);
                tmp3.y = tmp3.x * tmp9.z;
                tmp8.xy = tmp9.xy * tmp3.xx + tmp2.xz;
                tmp8.z = tmp2.w * tmp3.y;
                tmp2.x = dot(tmp8.xyz, tmp8.xyz);
                tmp2.x = max(tmp2.x, 8388608.0);
                tmp2.x = rsqrt(tmp2.x);
                tmp2.xzw = tmp2.xxx * tmp8.xyz;
                tmp3.x = dot(tmp2.xzw, tmp2.xzw);
                tmp3.x = max(tmp3.x, 8388608.0);
                tmp3.x = rsqrt(tmp3.x);
                tmp6.x = tmp6.x * tmp6.w;
                tmp3.yz = tmp6.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp6.xy = tmp2.xz * tmp3.xx + tmp3.yz;
                tmp3.y = dot(tmp3.yz, tmp3.yz);
                tmp3.y = min(tmp3.y, 1.0);
                tmp3.y = 1.0 - tmp3.y;
                tmp3.y = sqrt(tmp3.y);
                tmp3.y = max(tmp3.y, 0.0);
                tmp2.w = tmp2.w * tmp3.x;
                tmp6.z = tmp3.y * tmp2.w;
                tmp3.y = dot(tmp6.xyz, tmp6.xyz);
                tmp3.y = max(tmp3.y, 8388608.0);
                tmp3.y = rsqrt(tmp3.y);
                tmp8.z = tmp3.y * tmp6.z;
                tmp8.xy = tmp6.xy * tmp3.yy + _CardDistortion02.xx;
                tmp3.y = dot(tmp8.xyz, tmp8.xyz);
                tmp3.y = max(tmp3.y, 8388608.0);
                tmp3.y = rsqrt(tmp3.y);
                tmp6.xyz = tmp3.yyy * tmp8.xyz;
                tmp3.yz = tmp6.yy * unity_MatrixV._m01_m11;
                tmp3.yz = unity_MatrixV._m00_m10 * tmp6.xx + tmp3.yz;
                tmp3.yz = unity_MatrixV._m02_m12 * tmp6.zz + tmp3.yz;
                tmp3.yz = tmp3.yz + unity_MatrixV._m03_m13;
                tmp6 = tex2Dbias(_HoloTex, float4(tmp3.yz, 0, _GlobalMipBias.x));
                tmp8.xyz = float3(1.0, 1.0, 1.0) - tmp6.xyz;
                tmp8.xyz = tmp8.xyz + tmp8.xyz;
                tmp3.y = 1.0 - _HoloBrightness;
                tmp8.xyz = -tmp8.xyz * tmp3.yyy + float3(1.0, 1.0, 1.0);
                tmp9.xyz = tmp6.xyz <= float3(0.5, 0.5, 0.5);
                tmp6.xyz = tmp6.xyz * _HoloBrightness.xxx;
                tmp6.xyz = tmp6.xyz + tmp6.xyz;
                tmp11.xyz = tmp9.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                tmp9.xyz = uint3(tmp9.xyz) & uint3(int3(1, 1, 1));
                tmp8.xyz = tmp8.xyz * tmp11.xyz;
                tmp6.xyz = saturate(tmp6.xyz * tmp9.xyz + tmp8.xyz);
                tmp6.xyz = tmp6.zzz + tmp6.xyz;
                tmp8 = tex2Dbias(_KiraMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp3.y = tmp8.x * _IllustBright + 1.0;
                tmp8.yzw = tmp10.xyz * tmp3.yyy;
                tmp0.xyz = tmp6.xyz * tmp0.xyz + -tmp8.yzw;
                tmp0.xyz = tmp8.xxx * tmp0.xyz + tmp8.yzw;
                tmp1.xyz = tmp1.xyz - tmp0.xyz;
                tmp0.xyz = tmp3.www * tmp1.xyz + tmp0.xyz;
                tmp1.x = max(tmp3.w, tmp8.x);
                tmp1.y = tmp8.x * 100.0;
                tmp1.y = max(tmp1.y, 0.0);
                tmp1.y = min(tmp2.y, tmp1.y);
                tmp1.x = saturate(tmp1.x + 0.2);
                tmp0.xyz = tmp0.xyz + _AmbientColor.xyz;
                tmp6 = inp.interp.xyxy - float4(0.375, 0.427, -0.0, 0.35);
                tmp6 = tmp6 * float4(2.0, 2.0, 2.0, 2.0) + float4(-1.0, -1.0, -1.0, -1.0);
                tmp6 = abs(tmp6) - float4(0.1, 0.085, 0.91, 0.06);
                tmp8 = ddx(tmp6);
                tmp9 = ddy(tmp6);
                tmp8 = abs(tmp8) + abs(tmp9);
                tmp6 = tmp6 / tmp8;
                tmp6 = saturate(float4(1.0, 1.0, 1.0, 1.0) - tmp6);
                tmp3.yz = min(tmp6.yw, tmp6.xz);
                tmp6.xyz = _CubemapPower.xxx * _CubemapColor.xyz;
                tmp8.xyz = -_CubemapPower.xxx * _CubemapColor.xyz + _CubemapPower.xxx;
                tmp6.xyz = tmp3.yyy * tmp8.xyz + tmp6.xyz;
                tmp8.xyz = _CubemapPower.xxx * float3(0.8980392, 0.8666667, 0.3254902) + -tmp6.xyz;
                tmp3.yzw = tmp3.zzz * tmp8.xyz + tmp6.xyz;
                tmp6.xyz = tmp10.xyz - tmp3.yzw;
                tmp3.yzw = tmp0.www * tmp6.xyz + tmp3.yzw;
                tmp0.xyz = tmp0.xyz - tmp3.yzw;
                tmp0.xyz = tmp0.www * tmp0.xyz + tmp3.yzw;
                tmp3.yzw = tmp3.yzw + _AmbientColor.xyz;
                tmp4.x = tmp4.x * tmp4.w;
                tmp4.zw = tmp4.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp6.xy = tmp4.xy + tmp4.xy;
                tmp0.w = dot(tmp4.zw, tmp4.zw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp6.z = max(tmp0.w, 0.0);
                tmp4.xyz = tmp6.xyz - float3(1.0, 1.0, 1.0);
                tmp4.xyz = _MonsterNameNormalPower.xxx * tmp4.xyz + float3(0.0, 0.0, 1.0);
                tmp6 = tex2Dbias(_MainNormal, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp6.x = tmp6.x * tmp6.w;
                tmp6.zw = tmp6.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp8.xy = tmp6.xy + tmp6.xy;
                tmp0.w = dot(tmp6.zw, tmp6.zw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp8.z = max(tmp0.w, 0.0);
                tmp6.xyz = tmp8.xyz - float3(1.0, 1.0, 1.0);
                tmp6.xyz = _MainNormalPower.xxx * tmp6.xyz + float3(0.0, 0.0, 1.0);
                tmp4.xyz = tmp4.xyz - tmp6.xyz;
                tmp4.xyz = tmp1.www * tmp4.xyz + tmp6.xyz;
                tmp2.xy = tmp2.xz * tmp3.xx + tmp4.xy;
                tmp2.z = tmp2.w * tmp4.z;
                tmp0.w = dot(tmp2.xyz, tmp2.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp4.xy = tmp2.xy * tmp0.ww + tmp7.xy;
                tmp0.w = tmp0.w * tmp2.z;
                tmp4.z = tmp0.w * tmp7.z;
                tmp0.w = dot(tmp4.xyz, tmp4.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp2.xyz = tmp0.www * tmp4.xyz;
                tmp0.w = dot(tmp2.xyz, tmp2.xyz);
                tmp0.w = rsqrt(tmp0.w);
                tmp4.xyz = tmp0.www * tmp2.xyz;
                tmp0.w = saturate(dot(tmp2.xyz, tmp5.xyz));
                tmp2.xyz = _WorldSpaceCameraPos - inp.interp3.xyz;
                tmp1.z = dot(tmp2.xyz, tmp2.xyz);
                tmp1.z = rsqrt(tmp1.z);
                tmp2.xyz = tmp1.zzz * tmp2.xyz;
                tmp1.z = unity_OrthoParams.w == 0.0;
                tmp6.x = tmp1.z ? tmp2.x : unity_MatrixV._m20;
                tmp6.y = tmp1.z ? tmp2.y : unity_MatrixV._m21;
                tmp6.z = tmp1.z ? tmp2.z : unity_MatrixV._m22;
                tmp2.xyz = _FakeViewDirection - tmp6.xyz;
                tmp2.xyz = _FakeBlend.xxx * tmp2.xyz + tmp6.xyz;
                tmp1.z = dot(tmp2.xyz, tmp2.xyz);
                tmp1.z = max(tmp1.z, 8388608.0);
                tmp1.z = rsqrt(tmp1.z);
                tmp2.xyz = tmp2.xyz * tmp1.zzz + tmp5.xyz;
                tmp1.z = dot(tmp2.xyz, tmp2.xyz);
                tmp1.z = max(tmp1.z, 8388608.0);
                tmp1.z = rsqrt(tmp1.z);
                tmp2.xyz = tmp1.zzz * tmp2.xyz;
                tmp1.z = saturate(dot(tmp4.xyz, tmp2.xyz));
                tmp1.z = log(tmp1.z);
                tmp1.w = _Smoothness * 10.0 + 1.0;
                tmp1.w = pow(2.0, tmp1.w);
                tmp1.z = tmp1.z * tmp1.w;
                tmp1.z = pow(2.0, tmp1.z);
                tmp2.xyz = _FrameMetal.xxx * _SpecularColor.xyz;
                tmp2.xyz = tmp1.zzz * tmp2.xyz;
                tmp4.xyz = _FakeLightColor.xyz - _MainLightColor.xyz;
                tmp4.xyz = _FakeBlend.xxx * tmp4.xyz + _MainLightColor.xyz;
                tmp4.xyz = tmp4.xyz * _DirectionalLightAmp.xxx;
                tmp2.xyz = tmp2.xyz * tmp4.xyz;
                tmp2.xyz = tmp0.www * _DirectionalLightAmp.xxx + tmp2.xyz;
                tmp2.xyz = tmp2.xyz + _AmbientColor.xyz;
                tmp4.zw = float2(-1.0, 0.6666667);
                tmp5.zw = float2(1.0, -1.0);
                tmp1.zw = inp.interp.xy * float2(1.5, 1.5);
                tmp6 = tex2Dbias(_HighlightNormal, float4(tmp1.zw, 0, _GlobalMipBias.x));
                tmp6.x = tmp6.x * tmp6.w;
                tmp6.xw = tmp6.yx * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.w = dot(tmp6.xw, tmp6.xw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp4.x = max(tmp0.w, 0.0);
                tmp0.w = tmp6.x >= tmp4.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp5.x = tmp6.x - tmp4.x;
                tmp4.y = tmp6.x;
                tmp5.y = tmp4.x - tmp4.y;
                tmp4 = tmp0.wwww * tmp5 + tmp4;
                tmp0.w = tmp6.w >= tmp4.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp6.xyz = tmp4.xyw;
                tmp4.xyw = tmp6.wyx;
                tmp4 = tmp4 - tmp6;
                tmp4 = tmp0.wwww * tmp4 + tmp6;
                tmp0.w = tmp4.w - tmp4.y;
                tmp1.z = min(tmp4.y, tmp4.w);
                tmp1.z = tmp4.x - tmp1.z;
                tmp1.w = tmp1.z * 6.0 + 0.0;
                tmp0.w = tmp0.w / tmp1.w;
                tmp0.w = tmp0.w + tmp4.z;
                tmp1.w = _Time.y * 0.5;
                tmp1.w = frac(tmp1.w);
                tmp0.w = abs(tmp0.w) + tmp1.w;
                tmp1.w = tmp0.w > 1.0;
                tmp2.w = tmp0.w - 1.0;
                tmp0.w = tmp1.w ? tmp2.w : tmp0.w;
                tmp4.yzw = tmp0.www + float3(1.0, 0.6666667, 0.3333333);
                tmp4.yzw = frac(tmp4.yzw);
                tmp4.yzw = tmp4.yzw * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                tmp4.yzw = saturate(abs(tmp4.yzw) - float3(1.0, 1.0, 1.0));
                tmp4.yzw = tmp4.yzw - float3(1.0, 1.0, 1.0);
                tmp0.w = tmp4.x + 0.0;
                tmp1.w = tmp1.z / tmp0.w;
                tmp1.z = tmp1.z == 0.0;
                tmp0.w = tmp1.z ? tmp4.x : tmp0.w;
                tmp4.xyz = tmp1.www * tmp4.yzw + float3(1.0, 1.0, 1.0);
                tmp1.z = tmp0.w * tmp4.z;
                tmp4.xy = tmp0.ww * tmp4.xy + tmp7.xy;
                tmp4.z = tmp7.z * tmp1.z;
                tmp0.w = dot(tmp4.xyz, tmp4.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp1.zw = tmp0.ww * tmp4.xy;
                tmp4 = tex2Dbias(_HighlightTex, float4(tmp1.zw, 0, _GlobalMipBias.x));
                tmp4.xyz = tmp4.xyz * _Color.xyz;
                tmp1.xzw = tmp1.xxx * tmp4.xyz;
                tmp1.xzw = tmp1.xzw * _HighlightAmp.xxx;
                tmp0.w = _HighlightRotation * 0.01745329;
                tmp3.x = sin(tmp0.w);
                tmp4.x = cos(tmp0.w);
                tmp4.y = tmp3.x;
                tmp4.xy = tmp4.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                tmp4.xy = tmp4.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.zw = inp.interp.xy - float2(0.5, 0.5);
                tmp0.w = dot(tmp4.zw, tmp4.xy);
                tmp0.w = tmp0.w + 0.5;
                tmp2.w = _Time.y * _ScrollSpeed;
                tmp2.w = tmp2.w * -0.2 + _HighlightScrollOffset;
                tmp2.w = tmp2.w + 0.1;
                tmp0.w = tmp0.w * 0.1 + tmp2.w;
                tmp0.w = frac(tmp0.w);
                tmp2.w = 1.0 - tmp0.w;
                tmp0.w = tmp2.w * tmp0.w + -0.08;
                tmp0.w = tmp0.w * -10.0;
                tmp0.w = max(tmp0.w, 0.0);
                tmp2.w = tmp0.w * -2.0 + 3.0;
                tmp0.w = tmp0.w * tmp0.w;
                tmp0.w = tmp0.w * tmp2.w;
                tmp0.w = min(tmp0.w, 1.0);
                tmp1.xzw = tmp1.xzw * tmp0.www;
                tmp0.xyz = tmp2.xyz * tmp0.xyz + tmp1.xzw;
                tmp1.xzw = tmp3.yzw - tmp0.xyz;
                tmp0.xyz = tmp1.yyy * tmp1.xzw + tmp0.xyz;
                tmp1 = tex2Dbias(_LoadingTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp0.w = 1.0;
                tmp1 = tmp1 - tmp0;
                tmp0 = _LoadingBlend.xxxx * tmp1 + tmp0;
                tmp1.x = dot(tmp0.xyz, float4(0.299, 0.587, 0.114, 0.0));
                tmp1.xyz = tmp1.xxx - tmp0.xyz;
                tmp1.w = 0.0;
                tmp0 = _Monochrome.xxxx * tmp1 + tmp0;
                tmp0 = tmp0.yzwx * _TintColor;
                tmp1.xyz = tmp0.wxy;
                tmp1.w = 1.0;
                tmp1 = tmp1 * _AddColor;
                tmp2 = tex2Dbias(_Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp0.w = tmp2.x;
                tmp1 = tmp0.wwwz * tmp1;
                tmp0.x = 2.0;
                tmp0 = tmp1 * tmp0.xxxw;
                tmp1.x = _Time.y + _Time.y;
                tmp1.x = sin(tmp1.x);
                tmp1.x = tmp1.x + 1.0;
                tmp1.x = tmp1.x * 0.2 + 0.5;
                tmp1 = tmp0 * tmp1.xxxx;
                tmp2.x = _isFade != 0.0;
                tmp0 = tmp2.xxxx ? tmp1 : tmp0;
                tmp1.x = inp.interp2.w * 255.0;
                tmp1.x = round(tmp1.x);
                tmp1.w = tmp1.x * 0.00392157;
                tmp1.xyz = inp.interp2.xyz;
                tmp0 = tmp0 * tmp1;
                tmp1.xy = _ClipRect.zw - _ClipRect.xy;
                tmp1.xy = tmp1.xy - abs(inp.interp1.xy);
                tmp1.xy = saturate(tmp1.xy * inp.interp1.zw);
                tmp1.x = tmp1.y * tmp1.x;
                tmp0.w = tmp0.w * tmp1.x;
                o.sv_target.xyz = tmp0.www * tmp0.xyz;
                o.sv_target.w = tmp0.w;
                return o;
            }

            #elif UNITY_UI_CLIP_RECT
            struct fout
            {
                float4 sv_target : SV_TARGET;
            };

            // CBs for DX11PixelSM40
            float2 _GlobalMipBias; // 64 (starting at cb0[4].x)
            float4 _MainLightPosition; // 80 (starting at cb0[5].x)
            float4 _MainLightColor; // 96 (starting at cb0[6].x)
            float4 _TimeParameters; // 304 (starting at cb0[19].x)
            // float4 unity_OrthoParams; // 400 (starting at cb0[25].x)
            float _isFade; // 2128 (starting at cb0[133].x)
            // CBUFFER_START(UnityPerMaterial) // 1
            // CBUFFER_END
            float _LoadingBlend; // 48 (starting at cb1[3].x)
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

            fout frag(v2f inp)
            {
                fout o;
                float4 tmp0;
                float4 tmp1;
                float4 tmp2;
                float4 tmp3;
                float4 tmp4;
                float4 tmp5;
                float4 tmp6;
                float4 tmp7;
                float4 tmp8;
                float4 tmp9;
                float4 tmp10;
                float4 tmp11;
                tmp0.zw = float2(-1.0, 0.6666667);
                tmp1.zw = float2(1.0, -1.0);
                tmp2.xyz = log(abs(_KiraColor02.xyz));
                tmp2.xyz = tmp2.xyz * float3(0.4166667, 0.4166667, 0.4166667);
                tmp2.xyz = pow(2.0, tmp2.xyz);
                tmp2.xyz = tmp2.xyz * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
                tmp3.xyz = _KiraColor02.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
                tmp4.xyz = _KiraColor02.xyz * float3(12.92321, 12.92321, 12.92321);
                tmp2.xyz = tmp3.xyz ? tmp4.xyz : tmp2.xyz;
                tmp3 = tex2Dbias(_KiraColorTexture, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp4.xyw = tmp2.yzx * tmp3.yzx;
                tmp0.xy = tmp4.yx;
                tmp1.xy = tmp3.yz * tmp2.yz + -tmp0.xy;
                tmp2.w = tmp0.y >= tmp4.y;
                tmp2.w = uint1(tmp2.w) & uint1(1);
                tmp0 = tmp2.wwww * tmp1 + tmp0;
                tmp4.xyz = tmp0.xyw;
                tmp1.x = tmp4.w >= tmp4.x;
                tmp1.x = uint1(tmp1.x) & uint1(1);
                tmp0.xyw = tmp4.wyx;
                tmp0 = tmp0 - tmp4;
                tmp0 = tmp1.xxxx * tmp0 + tmp4;
                tmp1.x = tmp0.w - tmp0.y;
                tmp0.y = min(tmp0.y, tmp0.w);
                tmp0.y = tmp0.x - tmp0.y;
                tmp0.w = tmp0.y * 6.0 + 0.0;
                tmp0.w = tmp1.x / tmp0.w;
                tmp0.z = tmp0.w + tmp0.z;
                tmp0.z = _Time.y * 0.1111111 + abs(tmp0.z);
                tmp0.w = tmp0.z > 1.0;
                tmp1.xy = tmp0.zz + float2(1.0, -1.0);
                tmp0.w = tmp0.w ? tmp1.y : tmp0.z;
                tmp0.z = tmp0.z < 0.0;
                tmp0.z = tmp0.z ? tmp1.x : tmp0.w;
                tmp1.xyz = tmp0.zzz + float3(1.0, 0.6666667, 0.3333333);
                tmp1.xyz = frac(tmp1.xyz);
                tmp1.xyz = tmp1.xyz * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                tmp1.xyz = saturate(abs(tmp1.xyz) - float3(1.0, 1.0, 1.0));
                tmp1.xyz = tmp1.xyz - float3(1.0, 1.0, 1.0);
                tmp0.z = tmp0.x + 0.0;
                tmp0.w = tmp0.y / tmp0.z;
                tmp0.y = tmp0.y == 0.0;
                tmp0.x = tmp0.y ? tmp0.x : tmp0.z;
                tmp0.yzw = tmp0.www * tmp1.xyz + float3(1.0, 1.0, 1.0);
                tmp1.xyz = -tmp0.xxx * tmp0.yzw + float3(1.0, 1.0, 1.0);
                tmp0.xyz = tmp0.yzw * tmp0.xxx;
                tmp3.xyz = float3(1.0, 1.0, 1.0) - tmp2.xyz;
                tmp3.xyz = tmp3.xyz + tmp3.xyz;
                tmp1.xyz = -tmp3.xyz * tmp1.xyz + float3(1.0, 1.0, 1.0);
                tmp3.xyz = tmp2.xyz <= float3(0.5, 0.5, 0.5);
                tmp2.xyz = tmp2.xyz * tmp0.xyz;
                tmp2.xyz = tmp2.xyz + tmp2.xyz;
                tmp4.xyz = tmp3.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                tmp3.xyz = uint3(tmp3.xyz) & uint3(int3(1, 1, 1));
                tmp1.xyz = tmp1.xyz * tmp4.xyz;
                tmp1.xyz = tmp2.xyz * tmp3.xyz + tmp1.xyz;
                tmp0.w = _Kira01_01Tile * _Kira01_01Tile;
                tmp1.w = 1.00001 / tmp0.w;
                tmp1.w = frac(tmp1.w);
                tmp0.w = tmp0.w * tmp1.w;
                tmp0.w = floor(tmp0.w);
                tmp1.w = tmp0.w + 0.5;
                tmp2.x = 1.0 / _Kira01_01Tile;
                tmp1.w = tmp1.w * tmp2.x;
                tmp3.y = floor(tmp1.w);
                tmp0.w = -_Kira01_01Tile * tmp3.y + tmp0.w;
                tmp0.w = tmp0.w + 1.0;
                tmp3.x = _Kira01_01Tile - tmp0.w;
                tmp2.yz = tmp3.xy + inp.interp.xy;
                tmp2.xy = tmp2.xx * tmp2.yz;
                tmp2 = tex2Dbias(_HighlightNormal, float4(tmp2.xy, 0, _GlobalMipBias.x));
                tmp2.x = tmp2.x * tmp2.w;
                tmp2.xw = tmp2.yx * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.w = dot(tmp2.xw, tmp2.xw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp3.x = max(tmp0.w, 0.0);
                tmp0.w = tmp2.x >= tmp3.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp4.x = tmp2.x - tmp3.x;
                tmp3.y = tmp2.x;
                tmp4.y = tmp3.x - tmp3.y;
                tmp3.zw = float2(-1.0, 0.6666667);
                tmp4.zw = float2(1.0, -1.0);
                tmp3 = tmp0.wwww * tmp4 + tmp3;
                tmp0.w = tmp2.w >= tmp3.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp2.xyz = tmp3.xyw;
                tmp3.xyw = tmp2.wyx;
                tmp3 = tmp3 - tmp2;
                tmp2 = tmp0.wwww * tmp3 + tmp2;
                tmp0.w = tmp2.w - tmp2.y;
                tmp1.w = min(tmp2.y, tmp2.w);
                tmp1.w = tmp2.x - tmp1.w;
                tmp2.y = tmp1.w * 6.0 + 0.0;
                tmp0.w = tmp0.w / tmp2.y;
                tmp0.w = tmp0.w + tmp2.z;
                tmp2.y = sin(_Time.y);
                tmp0.w = tmp2.y * 0.1388889 + abs(tmp0.w);
                tmp2.y = saturate(tmp2.y + 0.5);
                tmp2.z = tmp0.w > 1.0;
                tmp3.xy = tmp0.ww + float2(1.0, -1.0);
                tmp2.z = tmp2.z ? tmp3.y : tmp0.w;
                tmp0.w = tmp0.w < 0.0;
                tmp0.w = tmp0.w ? tmp3.x : tmp2.z;
                tmp3.xyz = tmp0.www + float3(1.0, 0.6666667, 0.3333333);
                tmp3.xyz = frac(tmp3.xyz);
                tmp3.xyz = tmp3.xyz * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                tmp3.xyz = saturate(abs(tmp3.xyz) - float3(1.0, 1.0, 1.0));
                tmp3.xyz = tmp3.xyz - float3(1.0, 1.0, 1.0);
                tmp0.w = tmp2.x + 0.0;
                tmp2.z = tmp1.w / tmp0.w;
                tmp1.w = tmp1.w == 0.0;
                tmp0.w = tmp1.w ? tmp2.x : tmp0.w;
                tmp2.xzw = tmp2.zzz * tmp3.xyz + float3(1.0, 1.0, 1.0);
                tmp3.xyz = tmp0.www * tmp2.xzw + float3(-0.0, -0.0, -1.0);
                tmp2.xzw = tmp0.www * tmp2.xzw;
                tmp2.xzw = saturate(tmp2.xzw);
                tmp2.xzw = tmp2.xzw - float3(0.0, 0.0, 1.0);
                tmp2.xzw = _KiraNormal01_01Power.xxx * tmp2.xzw + float3(0.0, 0.0, 1.0);
                tmp3.xyz = _CardDistortion01.xxx * tmp3.xyz + float3(0.0, 0.0, 1.0);
                tmp0.w = _Kira01_02Tile * _Kira01_02Tile;
                tmp1.w = 1.00001 / tmp0.w;
                tmp1.w = frac(tmp1.w);
                tmp0.w = tmp0.w * tmp1.w;
                tmp0.w = floor(tmp0.w);
                tmp1.w = tmp0.w + 0.5;
                tmp3.w = 1.0 / _Kira01_02Tile;
                tmp1.w = tmp1.w * tmp3.w;
                tmp4.x = floor(tmp1.w);
                tmp0.w = -_Kira01_02Tile * tmp4.x + tmp0.w;
                tmp0.w = tmp0.w + 1.0;
                tmp4.y = _Kira01_02Tile - tmp0.w;
                tmp4.xy = tmp4.xy + inp.interp.yx;
                tmp4.xy = tmp4.xy * tmp3.ww + float2(-0.77, -0.61);
                tmp0.w = dot(tmp4.xy, tmp4.xy);
                tmp0.w = sqrt(tmp0.w);
                tmp0.w = tmp0.w * 0.77;
                tmp5.x = sin(tmp0.w);
                tmp6.x = cos(tmp0.w);
                tmp4.zw = tmp4.xy * tmp5.xx;
                tmp0.w = tmp6.x * tmp4.y + -tmp4.z;
                tmp1.w = tmp6.x * tmp4.x + tmp4.w;
                tmp1.w = _Time.y * 0.05 + tmp1.w;
                tmp4.y = tmp1.w + 0.77;
                tmp0.w = _Time.y * 0.05 + tmp0.w;
                tmp4.x = tmp0.w + 0.61;
                tmp4 = tex2Dbias(_KiraNormal01_02, float4(tmp4.xy, 0, _GlobalMipBias.x));
                tmp4.x = tmp4.x * tmp4.w;
                tmp4.xy = tmp4.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.w = dot(tmp4.xy, tmp4.xy);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp4.z = max(tmp0.w, 0.0);
                tmp4.xyz = saturate(tmp4.xyz);
                tmp4.xyz = tmp4.xyz - float3(0.0, 0.0, 1.0);
                tmp4.xyz = _Kira01_02Power.xxx * tmp4.xyz + float3(0.0, 0.0, 1.0);
                tmp5.xy = tmp2.xz + tmp4.xy;
                tmp5.z = tmp2.w * tmp4.z;
                tmp0.w = dot(tmp5.xyz, tmp5.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp2.xzw = tmp5.xyz * tmp0.www + float3(-0.0, -0.0, -1.0);
                tmp0.w = _AttributeTile + 0.00001;
                tmp0.w = tmp0.w * 0.0625;
                tmp1.w = tmp0.w >= -tmp0.w;
                tmp0.w = frac(abs(tmp0.w));
                tmp0.w = tmp1.w ? tmp0.w : -tmp0.w;
                tmp0.w = tmp0.w * 16.0;
                tmp0.w = floor(tmp0.w);
                tmp1.w = tmp0.w + 0.5;
                tmp1.w = tmp1.w * 0.25;
                tmp1.w = floor(tmp1.w);
                tmp4.x = -tmp1.w * 4.0 + tmp0.w;
                tmp0.w = tmp1.w + 1.0;
                tmp4.zw = _AttributeSize_Pos.xy * float2(0.5, 0.5) + float2(-0.5, -0.5);
                tmp4.zw = inp.interp.xy * _AttributeSize_Pos.xy + -tmp4.zw;
                tmp5.xy = tmp4.zw + _AttributeSize_Pos.zw;
                tmp4.y = tmp5.y - tmp0.w;
                tmp5.z = 4.0;
                tmp4.xy = tmp4.xy + tmp5.xz;
                tmp4.zw = tmp5.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.zw = abs(tmp4.zw) - float2(1.0, 1.0);
                tmp4.xy = tmp4.xy * float2(0.25, 0.25);
                tmp5 = tex2Dbias(_AttributeTex, float4(tmp4.xy, 0, _GlobalMipBias.x));
                tmp4.xy = ddx(tmp4.zw);
                tmp5.yz = ddy(tmp4.zw);
                tmp4.xy = abs(tmp4.xy) + abs(tmp5.yz);
                tmp4.xy = tmp4.zw / tmp4.xy;
                tmp4.xy = saturate(float2(1.0, 1.0) - tmp4.xy);
                tmp0.w = min(tmp4.y, tmp4.x);
                tmp4.xy = inp.interp.xy * float2(1.0, 5.0) + float2(0.0, -4.0);
                tmp4 = tex2Dbias(_MonsterNameTex, float4(tmp4.xy, 0, _GlobalMipBias.x));
                tmp1.w = saturate(_MonsterNameTextBold * tmp4.w + tmp4.w);
                tmp0.w = tmp5.x * tmp0.w + tmp1.w;
                tmp5 = tex2Dbias(_FrameMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp3.w = tmp0.w + tmp5.x;
                tmp0.w = 1.0 - tmp0.w;
                tmp2.xzw = tmp3.www * tmp2.xzw + float3(0.0, 0.0, 1.0);
                tmp5.xyz = _FakeLightDirection - _MainLightPosition.xyz;
                tmp5.xyz = _FakeBlend.xxx * tmp5.xyz + _MainLightPosition.xyz;
                tmp6.xyz = tmp5.xyz + float3(0.0, 1.0, 0.0);
                tmp4.z = dot(tmp6.xyz, tmp6.xyz);
                tmp4.z = rsqrt(tmp4.z);
                tmp6.xyz = tmp4.zzz * tmp6.xyz;
                tmp4.z = dot(inp.interp4.xyz, inp.interp4.xyz);
                tmp4.z = sqrt(tmp4.z);
                tmp4.z = 1.0 / tmp4.z;
                tmp7.xyz = tmp4.zzz * inp.interp4.xyz;
                tmp8.xyz = -tmp4.zzz * inp.interp4.xyz + _FakeNormalDirection;
                tmp7.xyz = _FakeBlend.xxx * tmp8.xyz + tmp7.xyz;
                tmp4.z = dot(tmp6.xyz, tmp7.xyz);
                tmp5.w = tmp4.z * _HoloShift01;
                tmp4.z = tmp4.z * _HoloShift02;
                tmp6 = tex2Dbias(_HoloTex, float4(tmp4.zz, 0, _GlobalMipBias.x));
                tmp8 = tex2Dbias(_HoloTex, float4(tmp5.ww, 0, _GlobalMipBias.x));
                tmp8.x = tmp8.x * tmp8.w;
                tmp8.xy = tmp8.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.z = dot(tmp8.xy, tmp8.xy);
                tmp8.xy = tmp2.xz + tmp8.xy;
                tmp4.z = min(tmp4.z, 1.0);
                tmp4.z = 1.0 - tmp4.z;
                tmp4.z = sqrt(tmp4.z);
                tmp4.z = max(tmp4.z, 0.0);
                tmp8.z = tmp2.w * tmp4.z;
                tmp4.z = dot(tmp8.xyz, tmp8.xyz);
                tmp4.z = max(tmp4.z, 8388608.0);
                tmp4.z = rsqrt(tmp4.z);
                tmp5.w = tmp4.z * tmp8.z;
                tmp8.xy = tmp8.xy * tmp4.zz + tmp3.xy;
                tmp8.z = tmp3.z * tmp5.w;
                tmp3.x = dot(tmp8.xyz, tmp8.xyz);
                tmp3.x = max(tmp3.x, 8388608.0);
                tmp3.x = rsqrt(tmp3.x);
                tmp3.xyz = tmp3.xxx * tmp8.xyz;
                tmp8.xy = tmp3.yy * unity_MatrixV._m01_m11;
                tmp3.xy = unity_MatrixV._m00_m10 * tmp3.xx + tmp8.xy;
                tmp3.xy = unity_MatrixV._m02_m12 * tmp3.zz + tmp3.xy;
                tmp3.xy = tmp3.xy + unity_MatrixV._m03_m13;
                tmp8 = tex2Dbias(_HoloTex, float4(tmp3.xy, 0, _GlobalMipBias.x));
                tmp3.xyz = float3(1.0, 1.0, 1.0) - tmp8.xyz;
                tmp3.xyz = tmp3.xyz + tmp3.xyz;
                tmp4.z = 1.0 - _HoloBrightness02;
                tmp3.xyz = -tmp3.xyz * tmp4.zzz + float3(1.0, 1.0, 1.0);
                tmp9.xyz = tmp8.xyz <= float3(0.5, 0.5, 0.5);
                tmp8.xyz = tmp8.xyz * _HoloBrightness02.xxx;
                tmp8.xyz = tmp8.xyz + tmp8.xyz;
                tmp10.xyz = tmp9.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                tmp9.xyz = uint3(tmp9.xyz) & uint3(int3(1, 1, 1));
                tmp3.xyz = tmp3.xyz * tmp10.xyz;
                tmp3.xyz = saturate(tmp8.xyz * tmp9.xyz + tmp3.xyz);
                tmp3.xyz = tmp3.zzz + tmp3.xyz;
                tmp1.xyz = saturate(tmp1.xyz * tmp3.xyz);
                tmp3.xy = _Time.yx * float2(2.5, 2.5) + float2(2.09439, 4.18878);
                tmp3.yz = sin(tmp3.xy);
                tmp8.xy = _Time.yx * float2(0.25, 2.5);
                tmp3.x = sin(tmp8.y);
                tmp8.x = sin(tmp8.x);
                tmp9.x = cos(tmp8.x);
                tmp3.xyz = tmp3.xyz + float3(3.0, 3.0, 3.0);
                tmp10 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp3.xyz = tmp3.xyz * float3(0.2, 0.2, 0.2) + -tmp10.xyz;
                tmp3.x = dot(tmp3.xyz, tmp3.xyz);
                tmp3.x = sqrt(tmp3.x);
                tmp3.x = saturate(-_EnhanceColorThreshold * tmp3.x + 1.0);
                tmp3.x = dot(tmp3.xx, _IlluustRanbowPower.xx);
                tmp3.xyz = tmp0.xyz * tmp3.xxx;
                tmp0.xyz = _RanbowPower.xxx * tmp0.xyz + tmp3.xyz;
                tmp9.yz = tmp8.xx;
                tmp3.xyz = tmp9.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                tmp3.xyz = tmp3.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                tmp8.xy = float2(_Kira02_01Tile.x, _Kira2_02Tile.x) * float2(_Kira02_01Tile.x, _Kira2_02Tile.x);
                tmp8.zw = float2(1.00001, 1.00001) / tmp8.xy;
                tmp8.zw = frac(tmp8.zw);
                tmp8.xy = tmp8.xy * tmp8.zw;
                tmp8.xy = floor(tmp8.xy);
                tmp8.zw = tmp8.xy + float2(0.5, 0.5);
                tmp9.xy = float2(1.0, 1.0) / float2(_Kira02_01Tile.x, _Kira2_02Tile.x);
                tmp8.zw = tmp8.zw * tmp9.xy;
                tmp11.zw = floor(tmp8.zw);
                tmp8.xy = -float2(_Kira02_01Tile.x, _Kira2_02Tile.x) * tmp11.zw + tmp8.xy;
                tmp8.xy = tmp8.xy + float2(1.0, 1.0);
                tmp11.xy = float2(_Kira02_01Tile.x, _Kira2_02Tile.x) - tmp8.xy;
                tmp8 = tmp11.xzyw + inp.interp.xyxy;
                tmp8 = tmp8 * tmp9.xxyy + float4(-0.5, -0.5, -0.5, -0.5);
                tmp9.x = dot(tmp8.xy, tmp3.xz);
                tmp9.y = dot(tmp8.yx, tmp3.xy);
                tmp3.xy = tmp9.xy + float2(0.5, 0.5);
                tmp3.xy = tmp3.xy * float2(0.5, 0.5) + float2(0.25, 0.25);
                tmp9 = tex2Dbias(_Kira02_01, float4(tmp3.xy, 0, _GlobalMipBias.x));
                tmp9.x = tmp9.x * tmp9.w;
                tmp3.xy = tmp9.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.z = dot(tmp3.xy, tmp3.xy);
                tmp4.z = min(tmp4.z, 1.0);
                tmp4.z = 1.0 - tmp4.z;
                tmp4.z = sqrt(tmp4.z);
                tmp3.z = max(tmp4.z, 0.0);
                tmp3.xyz = saturate(tmp3.xyz);
                tmp3.xyz = tmp3.xyz - float3(0.0, 0.0, 1.0);
                tmp3.xyz = _Kira02_01Power.xxx * tmp3.xyz + float3(0.0, 0.0, 1.0);
                tmp4.z = -_Time.y * 0.25 + 1.0;
                tmp8.x = sin(tmp4.z);
                tmp9.x = cos(tmp4.z);
                tmp9.yz = tmp8.xx;
                tmp9.xyz = tmp9.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                tmp9.xyz = tmp9.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                tmp8.x = dot(tmp8.zw, tmp9.xz);
                tmp8.y = dot(tmp8.wz, tmp9.xy);
                tmp8.xy = tmp8.xy + float2(0.5, 0.5);
                tmp8.xy = tmp8.xy * float2(0.5, 0.5) + float2(0.25, 0.25);
                tmp8 = tex2Dbias(_Kira02_01, float4(tmp8.xy, 0, _GlobalMipBias.x));
                tmp8.x = tmp8.x * tmp8.w;
                tmp8.xy = tmp8.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.z = dot(tmp8.xy, tmp8.xy);
                tmp4.z = min(tmp4.z, 1.0);
                tmp4.z = 1.0 - tmp4.z;
                tmp4.z = sqrt(tmp4.z);
                tmp8.z = max(tmp4.z, 0.0);
                tmp8.xyz = saturate(tmp8.xyz);
                tmp8.xyz = tmp8.xyz - float3(0.0, 0.0, 1.0);
                tmp8.xyz = _Kira02_02Power.xxx * tmp8.xyz + float3(0.0, 0.0, 1.0);
                tmp9.xy = tmp3.xy + tmp8.xy;
                tmp9.z = tmp3.z * tmp8.z;
                tmp3.x = dot(tmp9.xyz, tmp9.xyz);
                tmp3.x = max(tmp3.x, 8388608.0);
                tmp3.x = rsqrt(tmp3.x);
                tmp3.y = tmp3.x * tmp9.z;
                tmp8.xy = tmp9.xy * tmp3.xx + tmp2.xz;
                tmp8.z = tmp2.w * tmp3.y;
                tmp2.x = dot(tmp8.xyz, tmp8.xyz);
                tmp2.x = max(tmp2.x, 8388608.0);
                tmp2.x = rsqrt(tmp2.x);
                tmp2.xzw = tmp2.xxx * tmp8.xyz;
                tmp3.x = dot(tmp2.xzw, tmp2.xzw);
                tmp3.x = max(tmp3.x, 8388608.0);
                tmp3.x = rsqrt(tmp3.x);
                tmp6.x = tmp6.x * tmp6.w;
                tmp3.yz = tmp6.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp6.xy = tmp2.xz * tmp3.xx + tmp3.yz;
                tmp3.y = dot(tmp3.yz, tmp3.yz);
                tmp3.y = min(tmp3.y, 1.0);
                tmp3.y = 1.0 - tmp3.y;
                tmp3.y = sqrt(tmp3.y);
                tmp3.y = max(tmp3.y, 0.0);
                tmp2.w = tmp2.w * tmp3.x;
                tmp6.z = tmp3.y * tmp2.w;
                tmp3.y = dot(tmp6.xyz, tmp6.xyz);
                tmp3.y = max(tmp3.y, 8388608.0);
                tmp3.y = rsqrt(tmp3.y);
                tmp8.z = tmp3.y * tmp6.z;
                tmp8.xy = tmp6.xy * tmp3.yy + _CardDistortion02.xx;
                tmp3.y = dot(tmp8.xyz, tmp8.xyz);
                tmp3.y = max(tmp3.y, 8388608.0);
                tmp3.y = rsqrt(tmp3.y);
                tmp6.xyz = tmp3.yyy * tmp8.xyz;
                tmp3.yz = tmp6.yy * unity_MatrixV._m01_m11;
                tmp3.yz = unity_MatrixV._m00_m10 * tmp6.xx + tmp3.yz;
                tmp3.yz = unity_MatrixV._m02_m12 * tmp6.zz + tmp3.yz;
                tmp3.yz = tmp3.yz + unity_MatrixV._m03_m13;
                tmp6 = tex2Dbias(_HoloTex, float4(tmp3.yz, 0, _GlobalMipBias.x));
                tmp8.xyz = float3(1.0, 1.0, 1.0) - tmp6.xyz;
                tmp8.xyz = tmp8.xyz + tmp8.xyz;
                tmp3.y = 1.0 - _HoloBrightness;
                tmp8.xyz = -tmp8.xyz * tmp3.yyy + float3(1.0, 1.0, 1.0);
                tmp9.xyz = tmp6.xyz <= float3(0.5, 0.5, 0.5);
                tmp6.xyz = tmp6.xyz * _HoloBrightness.xxx;
                tmp6.xyz = tmp6.xyz + tmp6.xyz;
                tmp11.xyz = tmp9.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                tmp9.xyz = uint3(tmp9.xyz) & uint3(int3(1, 1, 1));
                tmp8.xyz = tmp8.xyz * tmp11.xyz;
                tmp6.xyz = saturate(tmp6.xyz * tmp9.xyz + tmp8.xyz);
                tmp6.xyz = tmp6.zzz + tmp6.xyz;
                tmp8 = tex2Dbias(_KiraMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp3.y = tmp8.x * _IllustBright + 1.0;
                tmp8.yzw = tmp10.xyz * tmp3.yyy;
                tmp0.xyz = tmp6.xyz * tmp0.xyz + -tmp8.yzw;
                tmp0.xyz = tmp8.xxx * tmp0.xyz + tmp8.yzw;
                tmp1.xyz = tmp1.xyz - tmp0.xyz;
                tmp0.xyz = tmp3.www * tmp1.xyz + tmp0.xyz;
                tmp1.x = max(tmp3.w, tmp8.x);
                tmp1.y = tmp8.x * 100.0;
                tmp1.y = max(tmp1.y, 0.0);
                tmp1.y = min(tmp2.y, tmp1.y);
                tmp1.x = saturate(tmp1.x + 0.2);
                tmp0.xyz = tmp0.xyz + _AmbientColor.xyz;
                tmp6 = inp.interp.xyxy - float4(0.375, 0.427, -0.0, 0.35);
                tmp6 = tmp6 * float4(2.0, 2.0, 2.0, 2.0) + float4(-1.0, -1.0, -1.0, -1.0);
                tmp6 = abs(tmp6) - float4(0.1, 0.085, 0.91, 0.06);
                tmp8 = ddx(tmp6);
                tmp9 = ddy(tmp6);
                tmp8 = abs(tmp8) + abs(tmp9);
                tmp6 = tmp6 / tmp8;
                tmp6 = saturate(float4(1.0, 1.0, 1.0, 1.0) - tmp6);
                tmp3.yz = min(tmp6.yw, tmp6.xz);
                tmp6.xyz = _CubemapPower.xxx * _CubemapColor.xyz;
                tmp8.xyz = -_CubemapPower.xxx * _CubemapColor.xyz + _CubemapPower.xxx;
                tmp6.xyz = tmp3.yyy * tmp8.xyz + tmp6.xyz;
                tmp8.xyz = _CubemapPower.xxx * float3(0.8980392, 0.8666667, 0.3254902) + -tmp6.xyz;
                tmp3.yzw = tmp3.zzz * tmp8.xyz + tmp6.xyz;
                tmp6.xyz = tmp10.xyz - tmp3.yzw;
                tmp3.yzw = tmp0.www * tmp6.xyz + tmp3.yzw;
                tmp0.xyz = tmp0.xyz - tmp3.yzw;
                tmp0.xyz = tmp0.www * tmp0.xyz + tmp3.yzw;
                tmp3.yzw = tmp3.yzw + _AmbientColor.xyz;
                tmp4.x = tmp4.x * tmp4.w;
                tmp4.zw = tmp4.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp6.xy = tmp4.xy + tmp4.xy;
                tmp0.w = dot(tmp4.zw, tmp4.zw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp6.z = max(tmp0.w, 0.0);
                tmp4.xyz = tmp6.xyz - float3(1.0, 1.0, 1.0);
                tmp4.xyz = _MonsterNameNormalPower.xxx * tmp4.xyz + float3(0.0, 0.0, 1.0);
                tmp6 = tex2Dbias(_MainNormal, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp6.x = tmp6.x * tmp6.w;
                tmp6.zw = tmp6.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp8.xy = tmp6.xy + tmp6.xy;
                tmp0.w = dot(tmp6.zw, tmp6.zw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp8.z = max(tmp0.w, 0.0);
                tmp6.xyz = tmp8.xyz - float3(1.0, 1.0, 1.0);
                tmp6.xyz = _MainNormalPower.xxx * tmp6.xyz + float3(0.0, 0.0, 1.0);
                tmp4.xyz = tmp4.xyz - tmp6.xyz;
                tmp4.xyz = tmp1.www * tmp4.xyz + tmp6.xyz;
                tmp2.xy = tmp2.xz * tmp3.xx + tmp4.xy;
                tmp2.z = tmp2.w * tmp4.z;
                tmp0.w = dot(tmp2.xyz, tmp2.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp4.xy = tmp2.xy * tmp0.ww + tmp7.xy;
                tmp0.w = tmp0.w * tmp2.z;
                tmp4.z = tmp0.w * tmp7.z;
                tmp0.w = dot(tmp4.xyz, tmp4.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp2.xyz = tmp0.www * tmp4.xyz;
                tmp0.w = dot(tmp2.xyz, tmp2.xyz);
                tmp0.w = rsqrt(tmp0.w);
                tmp4.xyz = tmp0.www * tmp2.xyz;
                tmp0.w = saturate(dot(tmp2.xyz, tmp5.xyz));
                tmp2.xyz = _WorldSpaceCameraPos - inp.interp3.xyz;
                tmp1.z = dot(tmp2.xyz, tmp2.xyz);
                tmp1.z = rsqrt(tmp1.z);
                tmp2.xyz = tmp1.zzz * tmp2.xyz;
                tmp1.z = unity_OrthoParams.w == 0.0;
                tmp6.x = tmp1.z ? tmp2.x : unity_MatrixV._m20;
                tmp6.y = tmp1.z ? tmp2.y : unity_MatrixV._m21;
                tmp6.z = tmp1.z ? tmp2.z : unity_MatrixV._m22;
                tmp2.xyz = _FakeViewDirection - tmp6.xyz;
                tmp2.xyz = _FakeBlend.xxx * tmp2.xyz + tmp6.xyz;
                tmp1.z = dot(tmp2.xyz, tmp2.xyz);
                tmp1.z = max(tmp1.z, 8388608.0);
                tmp1.z = rsqrt(tmp1.z);
                tmp2.xyz = tmp2.xyz * tmp1.zzz + tmp5.xyz;
                tmp1.z = dot(tmp2.xyz, tmp2.xyz);
                tmp1.z = max(tmp1.z, 8388608.0);
                tmp1.z = rsqrt(tmp1.z);
                tmp2.xyz = tmp1.zzz * tmp2.xyz;
                tmp1.z = saturate(dot(tmp4.xyz, tmp2.xyz));
                tmp1.z = log(tmp1.z);
                tmp1.w = _Smoothness * 10.0 + 1.0;
                tmp1.w = pow(2.0, tmp1.w);
                tmp1.z = tmp1.z * tmp1.w;
                tmp1.z = pow(2.0, tmp1.z);
                tmp2.xyz = _FrameMetal.xxx * _SpecularColor.xyz;
                tmp2.xyz = tmp1.zzz * tmp2.xyz;
                tmp4.xyz = _FakeLightColor.xyz - _MainLightColor.xyz;
                tmp4.xyz = _FakeBlend.xxx * tmp4.xyz + _MainLightColor.xyz;
                tmp4.xyz = tmp4.xyz * _DirectionalLightAmp.xxx;
                tmp2.xyz = tmp2.xyz * tmp4.xyz;
                tmp2.xyz = tmp0.www * _DirectionalLightAmp.xxx + tmp2.xyz;
                tmp2.xyz = tmp2.xyz + _AmbientColor.xyz;
                tmp4.zw = float2(-1.0, 0.6666667);
                tmp5.zw = float2(1.0, -1.0);
                tmp1.zw = inp.interp.xy * float2(1.5, 1.5);
                tmp6 = tex2Dbias(_HighlightNormal, float4(tmp1.zw, 0, _GlobalMipBias.x));
                tmp6.x = tmp6.x * tmp6.w;
                tmp6.xw = tmp6.yx * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.w = dot(tmp6.xw, tmp6.xw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp4.x = max(tmp0.w, 0.0);
                tmp0.w = tmp6.x >= tmp4.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp5.x = tmp6.x - tmp4.x;
                tmp4.y = tmp6.x;
                tmp5.y = tmp4.x - tmp4.y;
                tmp4 = tmp0.wwww * tmp5 + tmp4;
                tmp0.w = tmp6.w >= tmp4.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp6.xyz = tmp4.xyw;
                tmp4.xyw = tmp6.wyx;
                tmp4 = tmp4 - tmp6;
                tmp4 = tmp0.wwww * tmp4 + tmp6;
                tmp0.w = tmp4.w - tmp4.y;
                tmp1.z = min(tmp4.y, tmp4.w);
                tmp1.z = tmp4.x - tmp1.z;
                tmp1.w = tmp1.z * 6.0 + 0.0;
                tmp0.w = tmp0.w / tmp1.w;
                tmp0.w = tmp0.w + tmp4.z;
                tmp1.w = _Time.y * 0.5;
                tmp1.w = frac(tmp1.w);
                tmp0.w = abs(tmp0.w) + tmp1.w;
                tmp1.w = tmp0.w > 1.0;
                tmp2.w = tmp0.w - 1.0;
                tmp0.w = tmp1.w ? tmp2.w : tmp0.w;
                tmp4.yzw = tmp0.www + float3(1.0, 0.6666667, 0.3333333);
                tmp4.yzw = frac(tmp4.yzw);
                tmp4.yzw = tmp4.yzw * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                tmp4.yzw = saturate(abs(tmp4.yzw) - float3(1.0, 1.0, 1.0));
                tmp4.yzw = tmp4.yzw - float3(1.0, 1.0, 1.0);
                tmp0.w = tmp4.x + 0.0;
                tmp1.w = tmp1.z / tmp0.w;
                tmp1.z = tmp1.z == 0.0;
                tmp0.w = tmp1.z ? tmp4.x : tmp0.w;
                tmp4.xyz = tmp1.www * tmp4.yzw + float3(1.0, 1.0, 1.0);
                tmp1.z = tmp0.w * tmp4.z;
                tmp4.xy = tmp0.ww * tmp4.xy + tmp7.xy;
                tmp4.z = tmp7.z * tmp1.z;
                tmp0.w = dot(tmp4.xyz, tmp4.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp1.zw = tmp0.ww * tmp4.xy;
                tmp4 = tex2Dbias(_HighlightTex, float4(tmp1.zw, 0, _GlobalMipBias.x));
                tmp4.xyz = tmp4.xyz * _Color.xyz;
                tmp1.xzw = tmp1.xxx * tmp4.xyz;
                tmp1.xzw = tmp1.xzw * _HighlightAmp.xxx;
                tmp0.w = _HighlightRotation * 0.01745329;
                tmp3.x = sin(tmp0.w);
                tmp4.x = cos(tmp0.w);
                tmp4.y = tmp3.x;
                tmp4.xy = tmp4.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                tmp4.xy = tmp4.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.zw = inp.interp.xy - float2(0.5, 0.5);
                tmp0.w = dot(tmp4.zw, tmp4.xy);
                tmp0.w = tmp0.w + 0.5;
                tmp2.w = _Time.y * _ScrollSpeed;
                tmp2.w = tmp2.w * -0.2 + _HighlightScrollOffset;
                tmp2.w = tmp2.w + 0.1;
                tmp0.w = tmp0.w * 0.1 + tmp2.w;
                tmp0.w = frac(tmp0.w);
                tmp2.w = 1.0 - tmp0.w;
                tmp0.w = tmp2.w * tmp0.w + -0.08;
                tmp0.w = tmp0.w * -10.0;
                tmp0.w = max(tmp0.w, 0.0);
                tmp2.w = tmp0.w * -2.0 + 3.0;
                tmp0.w = tmp0.w * tmp0.w;
                tmp0.w = tmp0.w * tmp2.w;
                tmp0.w = min(tmp0.w, 1.0);
                tmp1.xzw = tmp1.xzw * tmp0.www;
                tmp0.xyz = tmp2.xyz * tmp0.xyz + tmp1.xzw;
                tmp1.xzw = tmp3.yzw - tmp0.xyz;
                tmp0.xyz = tmp1.yyy * tmp1.xzw + tmp0.xyz;
                tmp1 = tex2Dbias(_LoadingTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp0.w = 1.0;
                tmp1 = tmp1 - tmp0;
                tmp0 = _LoadingBlend.xxxx * tmp1 + tmp0;
                tmp1.x = dot(tmp0.xyz, float4(0.299, 0.587, 0.114, 0.0));
                tmp1.xyz = tmp1.xxx - tmp0.xyz;
                tmp1.w = 0.0;
                tmp0 = _Monochrome.xxxx * tmp1 + tmp0;
                tmp0 = tmp0.yzwx * _TintColor;
                tmp1.xyz = tmp0.wxy;
                tmp1.w = 1.0;
                tmp1 = tmp1 * _AddColor;
                tmp2 = tex2Dbias(_Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp0.w = tmp2.x;
                tmp1 = tmp0.wwwz * tmp1;
                tmp0.x = 2.0;
                tmp0 = tmp1 * tmp0.xxxw;
                tmp1.x = _Time.y + _Time.y;
                tmp1.x = sin(tmp1.x);
                tmp1.x = tmp1.x + 1.0;
                tmp1.x = tmp1.x * 0.2 + 0.5;
                tmp1 = tmp0 * tmp1.xxxx;
                tmp2.x = _isFade != 0.0;
                tmp0 = tmp2.xxxx ? tmp1 : tmp0;
                tmp1.x = inp.interp2.w * 255.0;
                tmp1.x = round(tmp1.x);
                tmp1.w = tmp1.x * 0.00392157;
                tmp1.xyz = inp.interp2.xyz;
                tmp0 = tmp0 * tmp1;
                tmp1.xy = _ClipRect.zw - _ClipRect.xy;
                tmp1.xy = tmp1.xy - abs(inp.interp1.xy);
                tmp1.xy = saturate(tmp1.xy * inp.interp1.zw);
                tmp1.x = tmp1.y * tmp1.x;
                tmp0.w = tmp0.w * tmp1.x;
                o.sv_target.xyz = tmp0.www * tmp0.xyz;
                o.sv_target.w = tmp0.w;
                return o;
            }

            #elif UNITY_UI_ALPHACLIP
            struct fout
            {
                float4 sv_target : SV_TARGET;
            };

            // CBs for DX11PixelSM40
            float2 _GlobalMipBias; // 64 (starting at cb0[4].x)
            float4 _MainLightPosition; // 80 (starting at cb0[5].x)
            float4 _MainLightColor; // 96 (starting at cb0[6].x)
            float4 _TimeParameters; // 304 (starting at cb0[19].x)
            // float4 unity_OrthoParams; // 400 (starting at cb0[25].x)
            float _isFade; // 2128 (starting at cb0[133].x)
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

            fout frag(v2f inp)
            {
                fout o;
                float4 tmp0;
                float4 tmp1;
                float4 tmp2;
                float4 tmp3;
                float4 tmp4;
                float4 tmp5;
                float4 tmp6;
                float4 tmp7;
                float4 tmp8;
                float4 tmp9;
                float4 tmp10;
                float4 tmp11;
                tmp0.zw = float2(-1.0, 0.6666667);
                tmp1.zw = float2(1.0, -1.0);
                tmp2.xyz = log(abs(_KiraColor02.xyz));
                tmp2.xyz = tmp2.xyz * float3(0.4166667, 0.4166667, 0.4166667);
                tmp2.xyz = pow(2.0, tmp2.xyz);
                tmp2.xyz = tmp2.xyz * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
                tmp3.xyz = _KiraColor02.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
                tmp4.xyz = _KiraColor02.xyz * float3(12.92321, 12.92321, 12.92321);
                tmp2.xyz = tmp3.xyz ? tmp4.xyz : tmp2.xyz;
                tmp3 = tex2Dbias(_KiraColorTexture, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp4.xyw = tmp2.yzx * tmp3.yzx;
                tmp0.xy = tmp4.yx;
                tmp1.xy = tmp3.yz * tmp2.yz + -tmp0.xy;
                tmp2.w = tmp0.y >= tmp4.y;
                tmp2.w = uint1(tmp2.w) & uint1(1);
                tmp0 = tmp2.wwww * tmp1 + tmp0;
                tmp4.xyz = tmp0.xyw;
                tmp1.x = tmp4.w >= tmp4.x;
                tmp1.x = uint1(tmp1.x) & uint1(1);
                tmp0.xyw = tmp4.wyx;
                tmp0 = tmp0 - tmp4;
                tmp0 = tmp1.xxxx * tmp0 + tmp4;
                tmp1.x = tmp0.w - tmp0.y;
                tmp0.y = min(tmp0.y, tmp0.w);
                tmp0.y = tmp0.x - tmp0.y;
                tmp0.w = tmp0.y * 6.0 + 0.0;
                tmp0.w = tmp1.x / tmp0.w;
                tmp0.z = tmp0.w + tmp0.z;
                tmp0.z = _Time.y * 0.1111111 + abs(tmp0.z);
                tmp0.w = tmp0.z > 1.0;
                tmp1.xy = tmp0.zz + float2(1.0, -1.0);
                tmp0.w = tmp0.w ? tmp1.y : tmp0.z;
                tmp0.z = tmp0.z < 0.0;
                tmp0.z = tmp0.z ? tmp1.x : tmp0.w;
                tmp1.xyz = tmp0.zzz + float3(1.0, 0.6666667, 0.3333333);
                tmp1.xyz = frac(tmp1.xyz);
                tmp1.xyz = tmp1.xyz * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                tmp1.xyz = saturate(abs(tmp1.xyz) - float3(1.0, 1.0, 1.0));
                tmp1.xyz = tmp1.xyz - float3(1.0, 1.0, 1.0);
                tmp0.z = tmp0.x + 0.0;
                tmp0.w = tmp0.y / tmp0.z;
                tmp0.y = tmp0.y == 0.0;
                tmp0.x = tmp0.y ? tmp0.x : tmp0.z;
                tmp0.yzw = tmp0.www * tmp1.xyz + float3(1.0, 1.0, 1.0);
                tmp1.xyz = -tmp0.xxx * tmp0.yzw + float3(1.0, 1.0, 1.0);
                tmp0.xyz = tmp0.yzw * tmp0.xxx;
                tmp3.xyz = float3(1.0, 1.0, 1.0) - tmp2.xyz;
                tmp3.xyz = tmp3.xyz + tmp3.xyz;
                tmp1.xyz = -tmp3.xyz * tmp1.xyz + float3(1.0, 1.0, 1.0);
                tmp3.xyz = tmp2.xyz <= float3(0.5, 0.5, 0.5);
                tmp2.xyz = tmp2.xyz * tmp0.xyz;
                tmp2.xyz = tmp2.xyz + tmp2.xyz;
                tmp4.xyz = tmp3.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                tmp3.xyz = uint3(tmp3.xyz) & uint3(int3(1, 1, 1));
                tmp1.xyz = tmp1.xyz * tmp4.xyz;
                tmp1.xyz = tmp2.xyz * tmp3.xyz + tmp1.xyz;
                tmp0.w = _Kira01_01Tile * _Kira01_01Tile;
                tmp1.w = 1.00001 / tmp0.w;
                tmp1.w = frac(tmp1.w);
                tmp0.w = tmp0.w * tmp1.w;
                tmp0.w = floor(tmp0.w);
                tmp1.w = tmp0.w + 0.5;
                tmp2.x = 1.0 / _Kira01_01Tile;
                tmp1.w = tmp1.w * tmp2.x;
                tmp3.y = floor(tmp1.w);
                tmp0.w = -_Kira01_01Tile * tmp3.y + tmp0.w;
                tmp0.w = tmp0.w + 1.0;
                tmp3.x = _Kira01_01Tile - tmp0.w;
                tmp2.yz = tmp3.xy + inp.interp.xy;
                tmp2.xy = tmp2.xx * tmp2.yz;
                tmp2 = tex2Dbias(_HighlightNormal, float4(tmp2.xy, 0, _GlobalMipBias.x));
                tmp2.x = tmp2.x * tmp2.w;
                tmp2.xw = tmp2.yx * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.w = dot(tmp2.xw, tmp2.xw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp3.x = max(tmp0.w, 0.0);
                tmp0.w = tmp2.x >= tmp3.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp4.x = tmp2.x - tmp3.x;
                tmp3.y = tmp2.x;
                tmp4.y = tmp3.x - tmp3.y;
                tmp3.zw = float2(-1.0, 0.6666667);
                tmp4.zw = float2(1.0, -1.0);
                tmp3 = tmp0.wwww * tmp4 + tmp3;
                tmp0.w = tmp2.w >= tmp3.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp2.xyz = tmp3.xyw;
                tmp3.xyw = tmp2.wyx;
                tmp3 = tmp3 - tmp2;
                tmp2 = tmp0.wwww * tmp3 + tmp2;
                tmp0.w = tmp2.w - tmp2.y;
                tmp1.w = min(tmp2.y, tmp2.w);
                tmp1.w = tmp2.x - tmp1.w;
                tmp2.y = tmp1.w * 6.0 + 0.0;
                tmp0.w = tmp0.w / tmp2.y;
                tmp0.w = tmp0.w + tmp2.z;
                tmp2.y = sin(_Time.y);
                tmp0.w = tmp2.y * 0.1388889 + abs(tmp0.w);
                tmp2.y = saturate(tmp2.y + 0.5);
                tmp2.z = tmp0.w > 1.0;
                tmp3.xy = tmp0.ww + float2(1.0, -1.0);
                tmp2.z = tmp2.z ? tmp3.y : tmp0.w;
                tmp0.w = tmp0.w < 0.0;
                tmp0.w = tmp0.w ? tmp3.x : tmp2.z;
                tmp3.xyz = tmp0.www + float3(1.0, 0.6666667, 0.3333333);
                tmp3.xyz = frac(tmp3.xyz);
                tmp3.xyz = tmp3.xyz * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                tmp3.xyz = saturate(abs(tmp3.xyz) - float3(1.0, 1.0, 1.0));
                tmp3.xyz = tmp3.xyz - float3(1.0, 1.0, 1.0);
                tmp0.w = tmp2.x + 0.0;
                tmp2.z = tmp1.w / tmp0.w;
                tmp1.w = tmp1.w == 0.0;
                tmp0.w = tmp1.w ? tmp2.x : tmp0.w;
                tmp2.xzw = tmp2.zzz * tmp3.xyz + float3(1.0, 1.0, 1.0);
                tmp3.xyz = tmp0.www * tmp2.xzw + float3(-0.0, -0.0, -1.0);
                tmp2.xzw = tmp0.www * tmp2.xzw;
                tmp2.xzw = saturate(tmp2.xzw);
                tmp2.xzw = tmp2.xzw - float3(0.0, 0.0, 1.0);
                tmp2.xzw = _KiraNormal01_01Power.xxx * tmp2.xzw + float3(0.0, 0.0, 1.0);
                tmp3.xyz = _CardDistortion01.xxx * tmp3.xyz + float3(0.0, 0.0, 1.0);
                tmp0.w = _Kira01_02Tile * _Kira01_02Tile;
                tmp1.w = 1.00001 / tmp0.w;
                tmp1.w = frac(tmp1.w);
                tmp0.w = tmp0.w * tmp1.w;
                tmp0.w = floor(tmp0.w);
                tmp1.w = tmp0.w + 0.5;
                tmp3.w = 1.0 / _Kira01_02Tile;
                tmp1.w = tmp1.w * tmp3.w;
                tmp4.x = floor(tmp1.w);
                tmp0.w = -_Kira01_02Tile * tmp4.x + tmp0.w;
                tmp0.w = tmp0.w + 1.0;
                tmp4.y = _Kira01_02Tile - tmp0.w;
                tmp4.xy = tmp4.xy + inp.interp.yx;
                tmp4.xy = tmp4.xy * tmp3.ww + float2(-0.77, -0.61);
                tmp0.w = dot(tmp4.xy, tmp4.xy);
                tmp0.w = sqrt(tmp0.w);
                tmp0.w = tmp0.w * 0.77;
                tmp5.x = sin(tmp0.w);
                tmp6.x = cos(tmp0.w);
                tmp4.zw = tmp4.xy * tmp5.xx;
                tmp0.w = tmp6.x * tmp4.y + -tmp4.z;
                tmp1.w = tmp6.x * tmp4.x + tmp4.w;
                tmp1.w = _Time.y * 0.05 + tmp1.w;
                tmp4.y = tmp1.w + 0.77;
                tmp0.w = _Time.y * 0.05 + tmp0.w;
                tmp4.x = tmp0.w + 0.61;
                tmp4 = tex2Dbias(_KiraNormal01_02, float4(tmp4.xy, 0, _GlobalMipBias.x));
                tmp4.x = tmp4.x * tmp4.w;
                tmp4.xy = tmp4.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.w = dot(tmp4.xy, tmp4.xy);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp4.z = max(tmp0.w, 0.0);
                tmp4.xyz = saturate(tmp4.xyz);
                tmp4.xyz = tmp4.xyz - float3(0.0, 0.0, 1.0);
                tmp4.xyz = _Kira01_02Power.xxx * tmp4.xyz + float3(0.0, 0.0, 1.0);
                tmp5.xy = tmp2.xz + tmp4.xy;
                tmp5.z = tmp2.w * tmp4.z;
                tmp0.w = dot(tmp5.xyz, tmp5.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp2.xzw = tmp5.xyz * tmp0.www + float3(-0.0, -0.0, -1.0);
                tmp0.w = _AttributeTile + 0.00001;
                tmp0.w = tmp0.w * 0.0625;
                tmp1.w = tmp0.w >= -tmp0.w;
                tmp0.w = frac(abs(tmp0.w));
                tmp0.w = tmp1.w ? tmp0.w : -tmp0.w;
                tmp0.w = tmp0.w * 16.0;
                tmp0.w = floor(tmp0.w);
                tmp1.w = tmp0.w + 0.5;
                tmp1.w = tmp1.w * 0.25;
                tmp1.w = floor(tmp1.w);
                tmp4.x = -tmp1.w * 4.0 + tmp0.w;
                tmp0.w = tmp1.w + 1.0;
                tmp4.zw = _AttributeSize_Pos.xy * float2(0.5, 0.5) + float2(-0.5, -0.5);
                tmp4.zw = inp.interp.xy * _AttributeSize_Pos.xy + -tmp4.zw;
                tmp5.xy = tmp4.zw + _AttributeSize_Pos.zw;
                tmp4.y = tmp5.y - tmp0.w;
                tmp5.z = 4.0;
                tmp4.xy = tmp4.xy + tmp5.xz;
                tmp4.zw = tmp5.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.zw = abs(tmp4.zw) - float2(1.0, 1.0);
                tmp4.xy = tmp4.xy * float2(0.25, 0.25);
                tmp5 = tex2Dbias(_AttributeTex, float4(tmp4.xy, 0, _GlobalMipBias.x));
                tmp4.xy = ddx(tmp4.zw);
                tmp5.yz = ddy(tmp4.zw);
                tmp4.xy = abs(tmp4.xy) + abs(tmp5.yz);
                tmp4.xy = tmp4.zw / tmp4.xy;
                tmp4.xy = saturate(float2(1.0, 1.0) - tmp4.xy);
                tmp0.w = min(tmp4.y, tmp4.x);
                tmp4.xy = inp.interp.xy * float2(1.0, 5.0) + float2(0.0, -4.0);
                tmp4 = tex2Dbias(_MonsterNameTex, float4(tmp4.xy, 0, _GlobalMipBias.x));
                tmp1.w = saturate(_MonsterNameTextBold * tmp4.w + tmp4.w);
                tmp0.w = tmp5.x * tmp0.w + tmp1.w;
                tmp5 = tex2Dbias(_FrameMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp3.w = tmp0.w + tmp5.x;
                tmp0.w = 1.0 - tmp0.w;
                tmp2.xzw = tmp3.www * tmp2.xzw + float3(0.0, 0.0, 1.0);
                tmp5.xyz = _FakeLightDirection - _MainLightPosition.xyz;
                tmp5.xyz = _FakeBlend.xxx * tmp5.xyz + _MainLightPosition.xyz;
                tmp6.xyz = tmp5.xyz + float3(0.0, 1.0, 0.0);
                tmp4.z = dot(tmp6.xyz, tmp6.xyz);
                tmp4.z = rsqrt(tmp4.z);
                tmp6.xyz = tmp4.zzz * tmp6.xyz;
                tmp4.z = dot(inp.interp4.xyz, inp.interp4.xyz);
                tmp4.z = sqrt(tmp4.z);
                tmp4.z = 1.0 / tmp4.z;
                tmp7.xyz = tmp4.zzz * inp.interp4.xyz;
                tmp8.xyz = -tmp4.zzz * inp.interp4.xyz + _FakeNormalDirection;
                tmp7.xyz = _FakeBlend.xxx * tmp8.xyz + tmp7.xyz;
                tmp4.z = dot(tmp6.xyz, tmp7.xyz);
                tmp5.w = tmp4.z * _HoloShift01;
                tmp4.z = tmp4.z * _HoloShift02;
                tmp6 = tex2Dbias(_HoloTex, float4(tmp4.zz, 0, _GlobalMipBias.x));
                tmp8 = tex2Dbias(_HoloTex, float4(tmp5.ww, 0, _GlobalMipBias.x));
                tmp8.x = tmp8.x * tmp8.w;
                tmp8.xy = tmp8.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.z = dot(tmp8.xy, tmp8.xy);
                tmp8.xy = tmp2.xz + tmp8.xy;
                tmp4.z = min(tmp4.z, 1.0);
                tmp4.z = 1.0 - tmp4.z;
                tmp4.z = sqrt(tmp4.z);
                tmp4.z = max(tmp4.z, 0.0);
                tmp8.z = tmp2.w * tmp4.z;
                tmp4.z = dot(tmp8.xyz, tmp8.xyz);
                tmp4.z = max(tmp4.z, 8388608.0);
                tmp4.z = rsqrt(tmp4.z);
                tmp5.w = tmp4.z * tmp8.z;
                tmp8.xy = tmp8.xy * tmp4.zz + tmp3.xy;
                tmp8.z = tmp3.z * tmp5.w;
                tmp3.x = dot(tmp8.xyz, tmp8.xyz);
                tmp3.x = max(tmp3.x, 8388608.0);
                tmp3.x = rsqrt(tmp3.x);
                tmp3.xyz = tmp3.xxx * tmp8.xyz;
                tmp8.xy = tmp3.yy * unity_MatrixV._m01_m11;
                tmp3.xy = unity_MatrixV._m00_m10 * tmp3.xx + tmp8.xy;
                tmp3.xy = unity_MatrixV._m02_m12 * tmp3.zz + tmp3.xy;
                tmp3.xy = tmp3.xy + unity_MatrixV._m03_m13;
                tmp8 = tex2Dbias(_HoloTex, float4(tmp3.xy, 0, _GlobalMipBias.x));
                tmp3.xyz = float3(1.0, 1.0, 1.0) - tmp8.xyz;
                tmp3.xyz = tmp3.xyz + tmp3.xyz;
                tmp4.z = 1.0 - _HoloBrightness02;
                tmp3.xyz = -tmp3.xyz * tmp4.zzz + float3(1.0, 1.0, 1.0);
                tmp9.xyz = tmp8.xyz <= float3(0.5, 0.5, 0.5);
                tmp8.xyz = tmp8.xyz * _HoloBrightness02.xxx;
                tmp8.xyz = tmp8.xyz + tmp8.xyz;
                tmp10.xyz = tmp9.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                tmp9.xyz = uint3(tmp9.xyz) & uint3(int3(1, 1, 1));
                tmp3.xyz = tmp3.xyz * tmp10.xyz;
                tmp3.xyz = saturate(tmp8.xyz * tmp9.xyz + tmp3.xyz);
                tmp3.xyz = tmp3.zzz + tmp3.xyz;
                tmp1.xyz = saturate(tmp1.xyz * tmp3.xyz);
                tmp3.xy = _Time.yx * float2(2.5, 2.5) + float2(2.09439, 4.18878);
                tmp3.yz = sin(tmp3.xy);
                tmp8.xy = _Time.yx * float2(0.25, 2.5);
                tmp3.x = sin(tmp8.y);
                tmp8.x = sin(tmp8.x);
                tmp9.x = cos(tmp8.x);
                tmp3.xyz = tmp3.xyz + float3(3.0, 3.0, 3.0);
                tmp10 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp3.xyz = tmp3.xyz * float3(0.2, 0.2, 0.2) + -tmp10.xyz;
                tmp3.x = dot(tmp3.xyz, tmp3.xyz);
                tmp3.x = sqrt(tmp3.x);
                tmp3.x = saturate(-_EnhanceColorThreshold * tmp3.x + 1.0);
                tmp3.x = dot(tmp3.xx, _IlluustRanbowPower.xx);
                tmp3.xyz = tmp0.xyz * tmp3.xxx;
                tmp0.xyz = _RanbowPower.xxx * tmp0.xyz + tmp3.xyz;
                tmp9.yz = tmp8.xx;
                tmp3.xyz = tmp9.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                tmp3.xyz = tmp3.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                tmp8.xy = float2(_Kira02_01Tile.x, _Kira2_02Tile.x) * float2(_Kira02_01Tile.x, _Kira2_02Tile.x);
                tmp8.zw = float2(1.00001, 1.00001) / tmp8.xy;
                tmp8.zw = frac(tmp8.zw);
                tmp8.xy = tmp8.xy * tmp8.zw;
                tmp8.xy = floor(tmp8.xy);
                tmp8.zw = tmp8.xy + float2(0.5, 0.5);
                tmp9.xy = float2(1.0, 1.0) / float2(_Kira02_01Tile.x, _Kira2_02Tile.x);
                tmp8.zw = tmp8.zw * tmp9.xy;
                tmp11.zw = floor(tmp8.zw);
                tmp8.xy = -float2(_Kira02_01Tile.x, _Kira2_02Tile.x) * tmp11.zw + tmp8.xy;
                tmp8.xy = tmp8.xy + float2(1.0, 1.0);
                tmp11.xy = float2(_Kira02_01Tile.x, _Kira2_02Tile.x) - tmp8.xy;
                tmp8 = tmp11.xzyw + inp.interp.xyxy;
                tmp8 = tmp8 * tmp9.xxyy + float4(-0.5, -0.5, -0.5, -0.5);
                tmp9.x = dot(tmp8.xy, tmp3.xz);
                tmp9.y = dot(tmp8.yx, tmp3.xy);
                tmp3.xy = tmp9.xy + float2(0.5, 0.5);
                tmp3.xy = tmp3.xy * float2(0.5, 0.5) + float2(0.25, 0.25);
                tmp9 = tex2Dbias(_Kira02_01, float4(tmp3.xy, 0, _GlobalMipBias.x));
                tmp9.x = tmp9.x * tmp9.w;
                tmp3.xy = tmp9.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.z = dot(tmp3.xy, tmp3.xy);
                tmp4.z = min(tmp4.z, 1.0);
                tmp4.z = 1.0 - tmp4.z;
                tmp4.z = sqrt(tmp4.z);
                tmp3.z = max(tmp4.z, 0.0);
                tmp3.xyz = saturate(tmp3.xyz);
                tmp3.xyz = tmp3.xyz - float3(0.0, 0.0, 1.0);
                tmp3.xyz = _Kira02_01Power.xxx * tmp3.xyz + float3(0.0, 0.0, 1.0);
                tmp4.z = -_Time.y * 0.25 + 1.0;
                tmp8.x = sin(tmp4.z);
                tmp9.x = cos(tmp4.z);
                tmp9.yz = tmp8.xx;
                tmp9.xyz = tmp9.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                tmp9.xyz = tmp9.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                tmp8.x = dot(tmp8.zw, tmp9.xz);
                tmp8.y = dot(tmp8.wz, tmp9.xy);
                tmp8.xy = tmp8.xy + float2(0.5, 0.5);
                tmp8.xy = tmp8.xy * float2(0.5, 0.5) + float2(0.25, 0.25);
                tmp8 = tex2Dbias(_Kira02_01, float4(tmp8.xy, 0, _GlobalMipBias.x));
                tmp8.x = tmp8.x * tmp8.w;
                tmp8.xy = tmp8.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.z = dot(tmp8.xy, tmp8.xy);
                tmp4.z = min(tmp4.z, 1.0);
                tmp4.z = 1.0 - tmp4.z;
                tmp4.z = sqrt(tmp4.z);
                tmp8.z = max(tmp4.z, 0.0);
                tmp8.xyz = saturate(tmp8.xyz);
                tmp8.xyz = tmp8.xyz - float3(0.0, 0.0, 1.0);
                tmp8.xyz = _Kira02_02Power.xxx * tmp8.xyz + float3(0.0, 0.0, 1.0);
                tmp9.xy = tmp3.xy + tmp8.xy;
                tmp9.z = tmp3.z * tmp8.z;
                tmp3.x = dot(tmp9.xyz, tmp9.xyz);
                tmp3.x = max(tmp3.x, 8388608.0);
                tmp3.x = rsqrt(tmp3.x);
                tmp3.y = tmp3.x * tmp9.z;
                tmp8.xy = tmp9.xy * tmp3.xx + tmp2.xz;
                tmp8.z = tmp2.w * tmp3.y;
                tmp2.x = dot(tmp8.xyz, tmp8.xyz);
                tmp2.x = max(tmp2.x, 8388608.0);
                tmp2.x = rsqrt(tmp2.x);
                tmp2.xzw = tmp2.xxx * tmp8.xyz;
                tmp3.x = dot(tmp2.xzw, tmp2.xzw);
                tmp3.x = max(tmp3.x, 8388608.0);
                tmp3.x = rsqrt(tmp3.x);
                tmp6.x = tmp6.x * tmp6.w;
                tmp3.yz = tmp6.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp6.xy = tmp2.xz * tmp3.xx + tmp3.yz;
                tmp3.y = dot(tmp3.yz, tmp3.yz);
                tmp3.y = min(tmp3.y, 1.0);
                tmp3.y = 1.0 - tmp3.y;
                tmp3.y = sqrt(tmp3.y);
                tmp3.y = max(tmp3.y, 0.0);
                tmp2.w = tmp2.w * tmp3.x;
                tmp6.z = tmp3.y * tmp2.w;
                tmp3.y = dot(tmp6.xyz, tmp6.xyz);
                tmp3.y = max(tmp3.y, 8388608.0);
                tmp3.y = rsqrt(tmp3.y);
                tmp8.z = tmp3.y * tmp6.z;
                tmp8.xy = tmp6.xy * tmp3.yy + _CardDistortion02.xx;
                tmp3.y = dot(tmp8.xyz, tmp8.xyz);
                tmp3.y = max(tmp3.y, 8388608.0);
                tmp3.y = rsqrt(tmp3.y);
                tmp6.xyz = tmp3.yyy * tmp8.xyz;
                tmp3.yz = tmp6.yy * unity_MatrixV._m01_m11;
                tmp3.yz = unity_MatrixV._m00_m10 * tmp6.xx + tmp3.yz;
                tmp3.yz = unity_MatrixV._m02_m12 * tmp6.zz + tmp3.yz;
                tmp3.yz = tmp3.yz + unity_MatrixV._m03_m13;
                tmp6 = tex2Dbias(_HoloTex, float4(tmp3.yz, 0, _GlobalMipBias.x));
                tmp8.xyz = float3(1.0, 1.0, 1.0) - tmp6.xyz;
                tmp8.xyz = tmp8.xyz + tmp8.xyz;
                tmp3.y = 1.0 - _HoloBrightness;
                tmp8.xyz = -tmp8.xyz * tmp3.yyy + float3(1.0, 1.0, 1.0);
                tmp9.xyz = tmp6.xyz <= float3(0.5, 0.5, 0.5);
                tmp6.xyz = tmp6.xyz * _HoloBrightness.xxx;
                tmp6.xyz = tmp6.xyz + tmp6.xyz;
                tmp11.xyz = tmp9.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                tmp9.xyz = uint3(tmp9.xyz) & uint3(int3(1, 1, 1));
                tmp8.xyz = tmp8.xyz * tmp11.xyz;
                tmp6.xyz = saturate(tmp6.xyz * tmp9.xyz + tmp8.xyz);
                tmp6.xyz = tmp6.zzz + tmp6.xyz;
                tmp8 = tex2Dbias(_KiraMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp3.y = tmp8.x * _IllustBright + 1.0;
                tmp8.yzw = tmp10.xyz * tmp3.yyy;
                tmp0.xyz = tmp6.xyz * tmp0.xyz + -tmp8.yzw;
                tmp0.xyz = tmp8.xxx * tmp0.xyz + tmp8.yzw;
                tmp1.xyz = tmp1.xyz - tmp0.xyz;
                tmp0.xyz = tmp3.www * tmp1.xyz + tmp0.xyz;
                tmp1.x = max(tmp3.w, tmp8.x);
                tmp1.y = tmp8.x * 100.0;
                tmp1.y = max(tmp1.y, 0.0);
                tmp1.y = min(tmp2.y, tmp1.y);
                tmp1.x = saturate(tmp1.x + 0.2);
                tmp0.xyz = tmp0.xyz + _AmbientColor.xyz;
                tmp6 = inp.interp.xyxy - float4(0.375, 0.427, -0.0, 0.35);
                tmp6 = tmp6 * float4(2.0, 2.0, 2.0, 2.0) + float4(-1.0, -1.0, -1.0, -1.0);
                tmp6 = abs(tmp6) - float4(0.1, 0.085, 0.91, 0.06);
                tmp8 = ddx(tmp6);
                tmp9 = ddy(tmp6);
                tmp8 = abs(tmp8) + abs(tmp9);
                tmp6 = tmp6 / tmp8;
                tmp6 = saturate(float4(1.0, 1.0, 1.0, 1.0) - tmp6);
                tmp3.yz = min(tmp6.yw, tmp6.xz);
                tmp6.xyz = _CubemapPower.xxx * _CubemapColor.xyz;
                tmp8.xyz = -_CubemapPower.xxx * _CubemapColor.xyz + _CubemapPower.xxx;
                tmp6.xyz = tmp3.yyy * tmp8.xyz + tmp6.xyz;
                tmp8.xyz = _CubemapPower.xxx * float3(0.8980392, 0.8666667, 0.3254902) + -tmp6.xyz;
                tmp3.yzw = tmp3.zzz * tmp8.xyz + tmp6.xyz;
                tmp6.xyz = tmp10.xyz - tmp3.yzw;
                tmp3.yzw = tmp0.www * tmp6.xyz + tmp3.yzw;
                tmp0.xyz = tmp0.xyz - tmp3.yzw;
                tmp0.xyz = tmp0.www * tmp0.xyz + tmp3.yzw;
                tmp3.yzw = tmp3.yzw + _AmbientColor.xyz;
                tmp4.x = tmp4.x * tmp4.w;
                tmp4.zw = tmp4.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp6.xy = tmp4.xy + tmp4.xy;
                tmp0.w = dot(tmp4.zw, tmp4.zw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp6.z = max(tmp0.w, 0.0);
                tmp4.xyz = tmp6.xyz - float3(1.0, 1.0, 1.0);
                tmp4.xyz = _MonsterNameNormalPower.xxx * tmp4.xyz + float3(0.0, 0.0, 1.0);
                tmp6 = tex2Dbias(_MainNormal, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp6.x = tmp6.x * tmp6.w;
                tmp6.zw = tmp6.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp8.xy = tmp6.xy + tmp6.xy;
                tmp0.w = dot(tmp6.zw, tmp6.zw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp8.z = max(tmp0.w, 0.0);
                tmp6.xyz = tmp8.xyz - float3(1.0, 1.0, 1.0);
                tmp6.xyz = _MainNormalPower.xxx * tmp6.xyz + float3(0.0, 0.0, 1.0);
                tmp4.xyz = tmp4.xyz - tmp6.xyz;
                tmp4.xyz = tmp1.www * tmp4.xyz + tmp6.xyz;
                tmp2.xy = tmp2.xz * tmp3.xx + tmp4.xy;
                tmp2.z = tmp2.w * tmp4.z;
                tmp0.w = dot(tmp2.xyz, tmp2.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp4.xy = tmp2.xy * tmp0.ww + tmp7.xy;
                tmp0.w = tmp0.w * tmp2.z;
                tmp4.z = tmp0.w * tmp7.z;
                tmp0.w = dot(tmp4.xyz, tmp4.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp2.xyz = tmp0.www * tmp4.xyz;
                tmp0.w = dot(tmp2.xyz, tmp2.xyz);
                tmp0.w = rsqrt(tmp0.w);
                tmp4.xyz = tmp0.www * tmp2.xyz;
                tmp0.w = saturate(dot(tmp2.xyz, tmp5.xyz));
                tmp2.xyz = _WorldSpaceCameraPos - inp.interp3.xyz;
                tmp1.z = dot(tmp2.xyz, tmp2.xyz);
                tmp1.z = rsqrt(tmp1.z);
                tmp2.xyz = tmp1.zzz * tmp2.xyz;
                tmp1.z = unity_OrthoParams.w == 0.0;
                tmp6.x = tmp1.z ? tmp2.x : unity_MatrixV._m20;
                tmp6.y = tmp1.z ? tmp2.y : unity_MatrixV._m21;
                tmp6.z = tmp1.z ? tmp2.z : unity_MatrixV._m22;
                tmp2.xyz = _FakeViewDirection - tmp6.xyz;
                tmp2.xyz = _FakeBlend.xxx * tmp2.xyz + tmp6.xyz;
                tmp1.z = dot(tmp2.xyz, tmp2.xyz);
                tmp1.z = max(tmp1.z, 8388608.0);
                tmp1.z = rsqrt(tmp1.z);
                tmp2.xyz = tmp2.xyz * tmp1.zzz + tmp5.xyz;
                tmp1.z = dot(tmp2.xyz, tmp2.xyz);
                tmp1.z = max(tmp1.z, 8388608.0);
                tmp1.z = rsqrt(tmp1.z);
                tmp2.xyz = tmp1.zzz * tmp2.xyz;
                tmp1.z = saturate(dot(tmp4.xyz, tmp2.xyz));
                tmp1.z = log(tmp1.z);
                tmp1.w = _Smoothness * 10.0 + 1.0;
                tmp1.w = pow(2.0, tmp1.w);
                tmp1.z = tmp1.z * tmp1.w;
                tmp1.z = pow(2.0, tmp1.z);
                tmp2.xyz = _FrameMetal.xxx * _SpecularColor.xyz;
                tmp2.xyz = tmp1.zzz * tmp2.xyz;
                tmp4.xyz = _FakeLightColor.xyz - _MainLightColor.xyz;
                tmp4.xyz = _FakeBlend.xxx * tmp4.xyz + _MainLightColor.xyz;
                tmp4.xyz = tmp4.xyz * _DirectionalLightAmp.xxx;
                tmp2.xyz = tmp2.xyz * tmp4.xyz;
                tmp2.xyz = tmp0.www * _DirectionalLightAmp.xxx + tmp2.xyz;
                tmp2.xyz = tmp2.xyz + _AmbientColor.xyz;
                tmp4.zw = float2(-1.0, 0.6666667);
                tmp5.zw = float2(1.0, -1.0);
                tmp1.zw = inp.interp.xy * float2(1.5, 1.5);
                tmp6 = tex2Dbias(_HighlightNormal, float4(tmp1.zw, 0, _GlobalMipBias.x));
                tmp6.x = tmp6.x * tmp6.w;
                tmp6.xw = tmp6.yx * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.w = dot(tmp6.xw, tmp6.xw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp4.x = max(tmp0.w, 0.0);
                tmp0.w = tmp6.x >= tmp4.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp5.x = tmp6.x - tmp4.x;
                tmp4.y = tmp6.x;
                tmp5.y = tmp4.x - tmp4.y;
                tmp4 = tmp0.wwww * tmp5 + tmp4;
                tmp0.w = tmp6.w >= tmp4.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp6.xyz = tmp4.xyw;
                tmp4.xyw = tmp6.wyx;
                tmp4 = tmp4 - tmp6;
                tmp4 = tmp0.wwww * tmp4 + tmp6;
                tmp0.w = tmp4.w - tmp4.y;
                tmp1.z = min(tmp4.y, tmp4.w);
                tmp1.z = tmp4.x - tmp1.z;
                tmp1.w = tmp1.z * 6.0 + 0.0;
                tmp0.w = tmp0.w / tmp1.w;
                tmp0.w = tmp0.w + tmp4.z;
                tmp1.w = _Time.y * 0.5;
                tmp1.w = frac(tmp1.w);
                tmp0.w = abs(tmp0.w) + tmp1.w;
                tmp1.w = tmp0.w > 1.0;
                tmp2.w = tmp0.w - 1.0;
                tmp0.w = tmp1.w ? tmp2.w : tmp0.w;
                tmp4.yzw = tmp0.www + float3(1.0, 0.6666667, 0.3333333);
                tmp4.yzw = frac(tmp4.yzw);
                tmp4.yzw = tmp4.yzw * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                tmp4.yzw = saturate(abs(tmp4.yzw) - float3(1.0, 1.0, 1.0));
                tmp4.yzw = tmp4.yzw - float3(1.0, 1.0, 1.0);
                tmp0.w = tmp4.x + 0.0;
                tmp1.w = tmp1.z / tmp0.w;
                tmp1.z = tmp1.z == 0.0;
                tmp0.w = tmp1.z ? tmp4.x : tmp0.w;
                tmp4.xyz = tmp1.www * tmp4.yzw + float3(1.0, 1.0, 1.0);
                tmp1.z = tmp0.w * tmp4.z;
                tmp4.xy = tmp0.ww * tmp4.xy + tmp7.xy;
                tmp4.z = tmp7.z * tmp1.z;
                tmp0.w = dot(tmp4.xyz, tmp4.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp1.zw = tmp0.ww * tmp4.xy;
                tmp4 = tex2Dbias(_HighlightTex, float4(tmp1.zw, 0, _GlobalMipBias.x));
                tmp4.xyz = tmp4.xyz * _Color.xyz;
                tmp1.xzw = tmp1.xxx * tmp4.xyz;
                tmp1.xzw = tmp1.xzw * _HighlightAmp.xxx;
                tmp0.w = _HighlightRotation * 0.01745329;
                tmp3.x = sin(tmp0.w);
                tmp4.x = cos(tmp0.w);
                tmp4.y = tmp3.x;
                tmp4.xy = tmp4.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                tmp4.xy = tmp4.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.zw = inp.interp.xy - float2(0.5, 0.5);
                tmp0.w = dot(tmp4.zw, tmp4.xy);
                tmp0.w = tmp0.w + 0.5;
                tmp2.w = _Time.y * _ScrollSpeed;
                tmp2.w = tmp2.w * -0.2 + _HighlightScrollOffset;
                tmp2.w = tmp2.w + 0.1;
                tmp0.w = tmp0.w * 0.1 + tmp2.w;
                tmp0.w = frac(tmp0.w);
                tmp2.w = 1.0 - tmp0.w;
                tmp0.w = tmp2.w * tmp0.w + -0.08;
                tmp0.w = tmp0.w * -10.0;
                tmp0.w = max(tmp0.w, 0.0);
                tmp2.w = tmp0.w * -2.0 + 3.0;
                tmp0.w = tmp0.w * tmp0.w;
                tmp0.w = tmp0.w * tmp2.w;
                tmp0.w = min(tmp0.w, 1.0);
                tmp1.xzw = tmp1.xzw * tmp0.www;
                tmp0.xyz = tmp2.xyz * tmp0.xyz + tmp1.xzw;
                tmp1.xzw = tmp3.yzw - tmp0.xyz;
                tmp0.xyz = tmp1.yyy * tmp1.xzw + tmp0.xyz;
                tmp1 = tex2Dbias(_LoadingTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp0.w = 1.0;
                tmp1 = tmp1 - tmp0;
                tmp0 = _LoadingBlend.xxxx * tmp1 + tmp0;
                tmp1.x = dot(tmp0.xyz, float4(0.299, 0.587, 0.114, 0.0));
                tmp1.xyz = tmp1.xxx - tmp0.xyz;
                tmp1.w = 0.0;
                tmp0 = _Monochrome.xxxx * tmp1 + tmp0;
                tmp0 = tmp0.yzwx * _TintColor;
                tmp1.xyz = tmp0.wxy;
                tmp1.w = 1.0;
                tmp1 = tmp1 * _AddColor;
                tmp2 = tex2Dbias(_Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp0.w = tmp2.x;
                tmp1 = tmp0.wwwz * tmp1;
                tmp0.x = 2.0;
                tmp0 = tmp1 * tmp0.xxxw;
                tmp1.x = _Time.y + _Time.y;
                tmp1.x = sin(tmp1.x);
                tmp1.x = tmp1.x + 1.0;
                tmp1.x = tmp1.x * 0.2 + 0.5;
                tmp1 = tmp0 * tmp1.xxxx;
                tmp2.x = _isFade != 0.0;
                tmp0 = tmp2.xxxx ? tmp1 : tmp0;
                tmp1.x = inp.interp2.w * 255.0;
                tmp1.x = round(tmp1.x);
                tmp1.w = tmp1.x * 0.00392157;
                tmp1.xyz = inp.interp2.xyz;
                tmp0 = tmp0 * tmp1;
                o.sv_target.xyz = tmp0.www * tmp0.xyz;
                o.sv_target.w = tmp0.w;
                return o;
            }

            #else
            struct fout
            {
                float4 sv_target : SV_TARGET;
            };

            // CBs for DX11PixelSM40
            float2 _GlobalMipBias; // 64 (starting at cb0[4].x)
            float4 _MainLightPosition; // 80 (starting at cb0[5].x)
            float4 _MainLightColor; // 96 (starting at cb0[6].x)
            float4 _TimeParameters; // 304 (starting at cb0[19].x)
            // float4 unity_OrthoParams; // 400 (starting at cb0[25].x)
            float _isFade; // 2128 (starting at cb0[133].x)
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

            fout frag(v2f inp)
            {
                fout o;
                float4 tmp0;
                float4 tmp1;
                float4 tmp2;
                float4 tmp3;
                float4 tmp4;
                float4 tmp5;
                float4 tmp6;
                float4 tmp7;
                float4 tmp8;
                float4 tmp9;
                float4 tmp10;
                float4 tmp11;
                tmp0.zw = float2(-1.0, 0.6666667);
                tmp1.zw = float2(1.0, -1.0);
                tmp2.xyz = log(abs(_KiraColor02.xyz));
                tmp2.xyz = tmp2.xyz * float3(0.4166667, 0.4166667, 0.4166667);
                tmp2.xyz = pow(2.0, tmp2.xyz);
                tmp2.xyz = tmp2.xyz * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
                tmp3.xyz = _KiraColor02.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
                tmp4.xyz = _KiraColor02.xyz * float3(12.92321, 12.92321, 12.92321);
                tmp2.xyz = tmp3.xyz ? tmp4.xyz : tmp2.xyz;
                tmp3 = tex2Dbias(_KiraColorTexture, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp4.xyw = tmp2.yzx * tmp3.yzx;
                tmp0.xy = tmp4.yx;
                tmp1.xy = tmp3.yz * tmp2.yz + -tmp0.xy;
                tmp2.w = tmp0.y >= tmp4.y;
                tmp2.w = uint1(tmp2.w) & uint1(1);
                tmp0 = tmp2.wwww * tmp1 + tmp0;
                tmp4.xyz = tmp0.xyw;
                tmp1.x = tmp4.w >= tmp4.x;
                tmp1.x = uint1(tmp1.x) & uint1(1);
                tmp0.xyw = tmp4.wyx;
                tmp0 = tmp0 - tmp4;
                tmp0 = tmp1.xxxx * tmp0 + tmp4;
                tmp1.x = tmp0.w - tmp0.y;
                tmp0.y = min(tmp0.y, tmp0.w);
                tmp0.y = tmp0.x - tmp0.y;
                tmp0.w = tmp0.y * 6.0 + 0.0;
                tmp0.w = tmp1.x / tmp0.w;
                tmp0.z = tmp0.w + tmp0.z;
                tmp0.z = _Time.y * 0.1111111 + abs(tmp0.z);
                tmp0.w = tmp0.z > 1.0;
                tmp1.xy = tmp0.zz + float2(1.0, -1.0);
                tmp0.w = tmp0.w ? tmp1.y : tmp0.z;
                tmp0.z = tmp0.z < 0.0;
                tmp0.z = tmp0.z ? tmp1.x : tmp0.w;
                tmp1.xyz = tmp0.zzz + float3(1.0, 0.6666667, 0.3333333);
                tmp1.xyz = frac(tmp1.xyz);
                tmp1.xyz = tmp1.xyz * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                tmp1.xyz = saturate(abs(tmp1.xyz) - float3(1.0, 1.0, 1.0));
                tmp1.xyz = tmp1.xyz - float3(1.0, 1.0, 1.0);
                tmp0.z = tmp0.x + 0.0;
                tmp0.w = tmp0.y / tmp0.z;
                tmp0.y = tmp0.y == 0.0;
                tmp0.x = tmp0.y ? tmp0.x : tmp0.z;
                tmp0.yzw = tmp0.www * tmp1.xyz + float3(1.0, 1.0, 1.0);
                tmp1.xyz = -tmp0.xxx * tmp0.yzw + float3(1.0, 1.0, 1.0);
                tmp0.xyz = tmp0.yzw * tmp0.xxx;
                tmp3.xyz = float3(1.0, 1.0, 1.0) - tmp2.xyz;
                tmp3.xyz = tmp3.xyz + tmp3.xyz;
                tmp1.xyz = -tmp3.xyz * tmp1.xyz + float3(1.0, 1.0, 1.0);
                tmp3.xyz = tmp2.xyz <= float3(0.5, 0.5, 0.5);
                tmp2.xyz = tmp2.xyz * tmp0.xyz;
                tmp2.xyz = tmp2.xyz + tmp2.xyz;
                tmp4.xyz = tmp3.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                tmp3.xyz = uint3(tmp3.xyz) & uint3(int3(1, 1, 1));
                tmp1.xyz = tmp1.xyz * tmp4.xyz;
                tmp1.xyz = tmp2.xyz * tmp3.xyz + tmp1.xyz;
                tmp0.w = _Kira01_01Tile * _Kira01_01Tile;
                tmp1.w = 1.00001 / tmp0.w;
                tmp1.w = frac(tmp1.w);
                tmp0.w = tmp0.w * tmp1.w;
                tmp0.w = floor(tmp0.w);
                tmp1.w = tmp0.w + 0.5;
                tmp2.x = 1.0 / _Kira01_01Tile;
                tmp1.w = tmp1.w * tmp2.x;
                tmp3.y = floor(tmp1.w);
                tmp0.w = -_Kira01_01Tile * tmp3.y + tmp0.w;
                tmp0.w = tmp0.w + 1.0;
                tmp3.x = _Kira01_01Tile - tmp0.w;
                tmp2.yz = tmp3.xy + inp.interp.xy;
                tmp2.xy = tmp2.xx * tmp2.yz;
                tmp2 = tex2Dbias(_HighlightNormal, float4(tmp2.xy, 0, _GlobalMipBias.x));
                tmp2.x = tmp2.x * tmp2.w;
                tmp2.xw = tmp2.yx * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.w = dot(tmp2.xw, tmp2.xw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp3.x = max(tmp0.w, 0.0);
                tmp0.w = tmp2.x >= tmp3.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp4.x = tmp2.x - tmp3.x;
                tmp3.y = tmp2.x;
                tmp4.y = tmp3.x - tmp3.y;
                tmp3.zw = float2(-1.0, 0.6666667);
                tmp4.zw = float2(1.0, -1.0);
                tmp3 = tmp0.wwww * tmp4 + tmp3;
                tmp0.w = tmp2.w >= tmp3.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp2.xyz = tmp3.xyw;
                tmp3.xyw = tmp2.wyx;
                tmp3 = tmp3 - tmp2;
                tmp2 = tmp0.wwww * tmp3 + tmp2;
                tmp0.w = tmp2.w - tmp2.y;
                tmp1.w = min(tmp2.y, tmp2.w);
                tmp1.w = tmp2.x - tmp1.w;
                tmp2.y = tmp1.w * 6.0 + 0.0;
                tmp0.w = tmp0.w / tmp2.y;
                tmp0.w = tmp0.w + tmp2.z;
                tmp2.y = sin(_Time.y);
                tmp0.w = tmp2.y * 0.1388889 + abs(tmp0.w);
                tmp2.y = saturate(tmp2.y + 0.5);
                tmp2.z = tmp0.w > 1.0;
                tmp3.xy = tmp0.ww + float2(1.0, -1.0);
                tmp2.z = tmp2.z ? tmp3.y : tmp0.w;
                tmp0.w = tmp0.w < 0.0;
                tmp0.w = tmp0.w ? tmp3.x : tmp2.z;
                tmp3.xyz = tmp0.www + float3(1.0, 0.6666667, 0.3333333);
                tmp3.xyz = frac(tmp3.xyz);
                tmp3.xyz = tmp3.xyz * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                tmp3.xyz = saturate(abs(tmp3.xyz) - float3(1.0, 1.0, 1.0));
                tmp3.xyz = tmp3.xyz - float3(1.0, 1.0, 1.0);
                tmp0.w = tmp2.x + 0.0;
                tmp2.z = tmp1.w / tmp0.w;
                tmp1.w = tmp1.w == 0.0;
                tmp0.w = tmp1.w ? tmp2.x : tmp0.w;
                tmp2.xzw = tmp2.zzz * tmp3.xyz + float3(1.0, 1.0, 1.0);
                tmp3.xyz = tmp0.www * tmp2.xzw + float3(-0.0, -0.0, -1.0);
                tmp2.xzw = tmp0.www * tmp2.xzw;
                tmp2.xzw = saturate(tmp2.xzw);
                tmp2.xzw = tmp2.xzw - float3(0.0, 0.0, 1.0);
                tmp2.xzw = _KiraNormal01_01Power.xxx * tmp2.xzw + float3(0.0, 0.0, 1.0);
                tmp3.xyz = _CardDistortion01.xxx * tmp3.xyz + float3(0.0, 0.0, 1.0);
                tmp0.w = _Kira01_02Tile * _Kira01_02Tile;
                tmp1.w = 1.00001 / tmp0.w;
                tmp1.w = frac(tmp1.w);
                tmp0.w = tmp0.w * tmp1.w;
                tmp0.w = floor(tmp0.w);
                tmp1.w = tmp0.w + 0.5;
                tmp3.w = 1.0 / _Kira01_02Tile;
                tmp1.w = tmp1.w * tmp3.w;
                tmp4.x = floor(tmp1.w);
                tmp0.w = -_Kira01_02Tile * tmp4.x + tmp0.w;
                tmp0.w = tmp0.w + 1.0;
                tmp4.y = _Kira01_02Tile - tmp0.w;
                tmp4.xy = tmp4.xy + inp.interp.yx;
                tmp4.xy = tmp4.xy * tmp3.ww + float2(-0.77, -0.61);
                tmp0.w = dot(tmp4.xy, tmp4.xy);
                tmp0.w = sqrt(tmp0.w);
                tmp0.w = tmp0.w * 0.77;
                tmp5.x = sin(tmp0.w);
                tmp6.x = cos(tmp0.w);
                tmp4.zw = tmp4.xy * tmp5.xx;
                tmp0.w = tmp6.x * tmp4.y + -tmp4.z;
                tmp1.w = tmp6.x * tmp4.x + tmp4.w;
                tmp1.w = _Time.y * 0.05 + tmp1.w;
                tmp4.y = tmp1.w + 0.77;
                tmp0.w = _Time.y * 0.05 + tmp0.w;
                tmp4.x = tmp0.w + 0.61;
                tmp4 = tex2Dbias(_KiraNormal01_02, float4(tmp4.xy, 0, _GlobalMipBias.x));
                tmp4.x = tmp4.x * tmp4.w;
                tmp4.xy = tmp4.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.w = dot(tmp4.xy, tmp4.xy);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp4.z = max(tmp0.w, 0.0);
                tmp4.xyz = saturate(tmp4.xyz);
                tmp4.xyz = tmp4.xyz - float3(0.0, 0.0, 1.0);
                tmp4.xyz = _Kira01_02Power.xxx * tmp4.xyz + float3(0.0, 0.0, 1.0);
                tmp5.xy = tmp2.xz + tmp4.xy;
                tmp5.z = tmp2.w * tmp4.z;
                tmp0.w = dot(tmp5.xyz, tmp5.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp2.xzw = tmp5.xyz * tmp0.www + float3(-0.0, -0.0, -1.0);
                tmp0.w = _AttributeTile + 0.00001;
                tmp0.w = tmp0.w * 0.0625;
                tmp1.w = tmp0.w >= -tmp0.w;
                tmp0.w = frac(abs(tmp0.w));
                tmp0.w = tmp1.w ? tmp0.w : -tmp0.w;
                tmp0.w = tmp0.w * 16.0;
                tmp0.w = floor(tmp0.w);
                tmp1.w = tmp0.w + 0.5;
                tmp1.w = tmp1.w * 0.25;
                tmp1.w = floor(tmp1.w);
                tmp4.x = -tmp1.w * 4.0 + tmp0.w;
                tmp0.w = tmp1.w + 1.0;
                tmp4.zw = _AttributeSize_Pos.xy * float2(0.5, 0.5) + float2(-0.5, -0.5);
                tmp4.zw = inp.interp.xy * _AttributeSize_Pos.xy + -tmp4.zw;
                tmp5.xy = tmp4.zw + _AttributeSize_Pos.zw;
                tmp4.y = tmp5.y - tmp0.w;
                tmp5.z = 4.0;
                tmp4.xy = tmp4.xy + tmp5.xz;
                tmp4.zw = tmp5.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.zw = abs(tmp4.zw) - float2(1.0, 1.0);
                tmp4.xy = tmp4.xy * float2(0.25, 0.25);
                tmp5 = tex2Dbias(_AttributeTex, float4(tmp4.xy, 0, _GlobalMipBias.x));
                tmp4.xy = ddx(tmp4.zw);
                tmp5.yz = ddy(tmp4.zw);
                tmp4.xy = abs(tmp4.xy) + abs(tmp5.yz);
                tmp4.xy = tmp4.zw / tmp4.xy;
                tmp4.xy = saturate(float2(1.0, 1.0) - tmp4.xy);
                tmp0.w = min(tmp4.y, tmp4.x);
                tmp4.xy = inp.interp.xy * float2(1.0, 5.0) + float2(0.0, -4.0);
                tmp4 = tex2Dbias(_MonsterNameTex, float4(tmp4.xy, 0, _GlobalMipBias.x));
                tmp1.w = saturate(_MonsterNameTextBold * tmp4.w + tmp4.w);
                tmp0.w = tmp5.x * tmp0.w + tmp1.w;
                tmp5 = tex2Dbias(_FrameMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp3.w = tmp0.w + tmp5.x;
                tmp0.w = 1.0 - tmp0.w;
                tmp2.xzw = tmp3.www * tmp2.xzw + float3(0.0, 0.0, 1.0);
                tmp5.xyz = _FakeLightDirection - _MainLightPosition.xyz;
                tmp5.xyz = _FakeBlend.xxx * tmp5.xyz + _MainLightPosition.xyz;
                tmp6.xyz = tmp5.xyz + float3(0.0, 1.0, 0.0);
                tmp4.z = dot(tmp6.xyz, tmp6.xyz);
                tmp4.z = rsqrt(tmp4.z);
                tmp6.xyz = tmp4.zzz * tmp6.xyz;
                tmp4.z = dot(inp.interp4.xyz, inp.interp4.xyz);
                tmp4.z = sqrt(tmp4.z);
                tmp4.z = 1.0 / tmp4.z;
                tmp7.xyz = tmp4.zzz * inp.interp4.xyz;
                tmp8.xyz = -tmp4.zzz * inp.interp4.xyz + _FakeNormalDirection;
                tmp7.xyz = _FakeBlend.xxx * tmp8.xyz + tmp7.xyz;
                tmp4.z = dot(tmp6.xyz, tmp7.xyz);
                tmp5.w = tmp4.z * _HoloShift01;
                tmp4.z = tmp4.z * _HoloShift02;
                tmp6 = tex2Dbias(_HoloTex, float4(tmp4.zz, 0, _GlobalMipBias.x));
                tmp8 = tex2Dbias(_HoloTex, float4(tmp5.ww, 0, _GlobalMipBias.x));
                tmp8.x = tmp8.x * tmp8.w;
                tmp8.xy = tmp8.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.z = dot(tmp8.xy, tmp8.xy);
                tmp8.xy = tmp2.xz + tmp8.xy;
                tmp4.z = min(tmp4.z, 1.0);
                tmp4.z = 1.0 - tmp4.z;
                tmp4.z = sqrt(tmp4.z);
                tmp4.z = max(tmp4.z, 0.0);
                tmp8.z = tmp2.w * tmp4.z;
                tmp4.z = dot(tmp8.xyz, tmp8.xyz);
                tmp4.z = max(tmp4.z, 8388608.0);
                tmp4.z = rsqrt(tmp4.z);
                tmp5.w = tmp4.z * tmp8.z;
                tmp8.xy = tmp8.xy * tmp4.zz + tmp3.xy;
                tmp8.z = tmp3.z * tmp5.w;
                tmp3.x = dot(tmp8.xyz, tmp8.xyz);
                tmp3.x = max(tmp3.x, 8388608.0);
                tmp3.x = rsqrt(tmp3.x);
                tmp3.xyz = tmp3.xxx * tmp8.xyz;
                tmp8.xy = tmp3.yy * unity_MatrixV._m01_m11;
                tmp3.xy = unity_MatrixV._m00_m10 * tmp3.xx + tmp8.xy;
                tmp3.xy = unity_MatrixV._m02_m12 * tmp3.zz + tmp3.xy;
                tmp3.xy = tmp3.xy + unity_MatrixV._m03_m13;
                tmp8 = tex2Dbias(_HoloTex, float4(tmp3.xy, 0, _GlobalMipBias.x));
                tmp3.xyz = float3(1.0, 1.0, 1.0) - tmp8.xyz;
                tmp3.xyz = tmp3.xyz + tmp3.xyz;
                tmp4.z = 1.0 - _HoloBrightness02;
                tmp3.xyz = -tmp3.xyz * tmp4.zzz + float3(1.0, 1.0, 1.0);
                tmp9.xyz = tmp8.xyz <= float3(0.5, 0.5, 0.5);
                tmp8.xyz = tmp8.xyz * _HoloBrightness02.xxx;
                tmp8.xyz = tmp8.xyz + tmp8.xyz;
                tmp10.xyz = tmp9.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                tmp9.xyz = uint3(tmp9.xyz) & uint3(int3(1, 1, 1));
                tmp3.xyz = tmp3.xyz * tmp10.xyz;
                tmp3.xyz = saturate(tmp8.xyz * tmp9.xyz + tmp3.xyz);
                tmp3.xyz = tmp3.zzz + tmp3.xyz;
                tmp1.xyz = saturate(tmp1.xyz * tmp3.xyz);
                tmp3.xy = _Time.yx * float2(2.5, 2.5) + float2(2.09439, 4.18878);
                tmp3.yz = sin(tmp3.xy);
                tmp8.xy = _Time.yx * float2(0.25, 2.5);
                tmp3.x = sin(tmp8.y);
                tmp8.x = sin(tmp8.x);
                tmp9.x = cos(tmp8.x);
                tmp3.xyz = tmp3.xyz + float3(3.0, 3.0, 3.0);
                tmp10 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp3.xyz = tmp3.xyz * float3(0.2, 0.2, 0.2) + -tmp10.xyz;
                tmp3.x = dot(tmp3.xyz, tmp3.xyz);
                tmp3.x = sqrt(tmp3.x);
                tmp3.x = saturate(-_EnhanceColorThreshold * tmp3.x + 1.0);
                tmp3.x = dot(tmp3.xx, _IlluustRanbowPower.xx);
                tmp3.xyz = tmp0.xyz * tmp3.xxx;
                tmp0.xyz = _RanbowPower.xxx * tmp0.xyz + tmp3.xyz;
                tmp9.yz = tmp8.xx;
                tmp3.xyz = tmp9.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                tmp3.xyz = tmp3.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                tmp8.xy = float2(_Kira02_01Tile.x, _Kira2_02Tile.x) * float2(_Kira02_01Tile.x, _Kira2_02Tile.x);
                tmp8.zw = float2(1.00001, 1.00001) / tmp8.xy;
                tmp8.zw = frac(tmp8.zw);
                tmp8.xy = tmp8.xy * tmp8.zw;
                tmp8.xy = floor(tmp8.xy);
                tmp8.zw = tmp8.xy + float2(0.5, 0.5);
                tmp9.xy = float2(1.0, 1.0) / float2(_Kira02_01Tile.x, _Kira2_02Tile.x);
                tmp8.zw = tmp8.zw * tmp9.xy;
                tmp11.zw = floor(tmp8.zw);
                tmp8.xy = -float2(_Kira02_01Tile.x, _Kira2_02Tile.x) * tmp11.zw + tmp8.xy;
                tmp8.xy = tmp8.xy + float2(1.0, 1.0);
                tmp11.xy = float2(_Kira02_01Tile.x, _Kira2_02Tile.x) - tmp8.xy;
                tmp8 = tmp11.xzyw + inp.interp.xyxy;
                tmp8 = tmp8 * tmp9.xxyy + float4(-0.5, -0.5, -0.5, -0.5);
                tmp9.x = dot(tmp8.xy, tmp3.xz);
                tmp9.y = dot(tmp8.yx, tmp3.xy);
                tmp3.xy = tmp9.xy + float2(0.5, 0.5);
                tmp3.xy = tmp3.xy * float2(0.5, 0.5) + float2(0.25, 0.25);
                tmp9 = tex2Dbias(_Kira02_01, float4(tmp3.xy, 0, _GlobalMipBias.x));
                tmp9.x = tmp9.x * tmp9.w;
                tmp3.xy = tmp9.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.z = dot(tmp3.xy, tmp3.xy);
                tmp4.z = min(tmp4.z, 1.0);
                tmp4.z = 1.0 - tmp4.z;
                tmp4.z = sqrt(tmp4.z);
                tmp3.z = max(tmp4.z, 0.0);
                tmp3.xyz = saturate(tmp3.xyz);
                tmp3.xyz = tmp3.xyz - float3(0.0, 0.0, 1.0);
                tmp3.xyz = _Kira02_01Power.xxx * tmp3.xyz + float3(0.0, 0.0, 1.0);
                tmp4.z = -_Time.y * 0.25 + 1.0;
                tmp8.x = sin(tmp4.z);
                tmp9.x = cos(tmp4.z);
                tmp9.yz = tmp8.xx;
                tmp9.xyz = tmp9.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                tmp9.xyz = tmp9.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                tmp8.x = dot(tmp8.zw, tmp9.xz);
                tmp8.y = dot(tmp8.wz, tmp9.xy);
                tmp8.xy = tmp8.xy + float2(0.5, 0.5);
                tmp8.xy = tmp8.xy * float2(0.5, 0.5) + float2(0.25, 0.25);
                tmp8 = tex2Dbias(_Kira02_01, float4(tmp8.xy, 0, _GlobalMipBias.x));
                tmp8.x = tmp8.x * tmp8.w;
                tmp8.xy = tmp8.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.z = dot(tmp8.xy, tmp8.xy);
                tmp4.z = min(tmp4.z, 1.0);
                tmp4.z = 1.0 - tmp4.z;
                tmp4.z = sqrt(tmp4.z);
                tmp8.z = max(tmp4.z, 0.0);
                tmp8.xyz = saturate(tmp8.xyz);
                tmp8.xyz = tmp8.xyz - float3(0.0, 0.0, 1.0);
                tmp8.xyz = _Kira02_02Power.xxx * tmp8.xyz + float3(0.0, 0.0, 1.0);
                tmp9.xy = tmp3.xy + tmp8.xy;
                tmp9.z = tmp3.z * tmp8.z;
                tmp3.x = dot(tmp9.xyz, tmp9.xyz);
                tmp3.x = max(tmp3.x, 8388608.0);
                tmp3.x = rsqrt(tmp3.x);
                tmp3.y = tmp3.x * tmp9.z;
                tmp8.xy = tmp9.xy * tmp3.xx + tmp2.xz;
                tmp8.z = tmp2.w * tmp3.y;
                tmp2.x = dot(tmp8.xyz, tmp8.xyz);
                tmp2.x = max(tmp2.x, 8388608.0);
                tmp2.x = rsqrt(tmp2.x);
                tmp2.xzw = tmp2.xxx * tmp8.xyz;
                tmp3.x = dot(tmp2.xzw, tmp2.xzw);
                tmp3.x = max(tmp3.x, 8388608.0);
                tmp3.x = rsqrt(tmp3.x);
                tmp6.x = tmp6.x * tmp6.w;
                tmp3.yz = tmp6.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp6.xy = tmp2.xz * tmp3.xx + tmp3.yz;
                tmp3.y = dot(tmp3.yz, tmp3.yz);
                tmp3.y = min(tmp3.y, 1.0);
                tmp3.y = 1.0 - tmp3.y;
                tmp3.y = sqrt(tmp3.y);
                tmp3.y = max(tmp3.y, 0.0);
                tmp2.w = tmp2.w * tmp3.x;
                tmp6.z = tmp3.y * tmp2.w;
                tmp3.y = dot(tmp6.xyz, tmp6.xyz);
                tmp3.y = max(tmp3.y, 8388608.0);
                tmp3.y = rsqrt(tmp3.y);
                tmp8.z = tmp3.y * tmp6.z;
                tmp8.xy = tmp6.xy * tmp3.yy + _CardDistortion02.xx;
                tmp3.y = dot(tmp8.xyz, tmp8.xyz);
                tmp3.y = max(tmp3.y, 8388608.0);
                tmp3.y = rsqrt(tmp3.y);
                tmp6.xyz = tmp3.yyy * tmp8.xyz;
                tmp3.yz = tmp6.yy * unity_MatrixV._m01_m11;
                tmp3.yz = unity_MatrixV._m00_m10 * tmp6.xx + tmp3.yz;
                tmp3.yz = unity_MatrixV._m02_m12 * tmp6.zz + tmp3.yz;
                tmp3.yz = tmp3.yz + unity_MatrixV._m03_m13;
                tmp6 = tex2Dbias(_HoloTex, float4(tmp3.yz, 0, _GlobalMipBias.x));
                tmp8.xyz = float3(1.0, 1.0, 1.0) - tmp6.xyz;
                tmp8.xyz = tmp8.xyz + tmp8.xyz;
                tmp3.y = 1.0 - _HoloBrightness;
                tmp8.xyz = -tmp8.xyz * tmp3.yyy + float3(1.0, 1.0, 1.0);
                tmp9.xyz = tmp6.xyz <= float3(0.5, 0.5, 0.5);
                tmp6.xyz = tmp6.xyz * _HoloBrightness.xxx;
                tmp6.xyz = tmp6.xyz + tmp6.xyz;
                tmp11.xyz = tmp9.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                tmp9.xyz = uint3(tmp9.xyz) & uint3(int3(1, 1, 1));
                tmp8.xyz = tmp8.xyz * tmp11.xyz;
                tmp6.xyz = saturate(tmp6.xyz * tmp9.xyz + tmp8.xyz);
                tmp6.xyz = tmp6.zzz + tmp6.xyz;
                tmp8 = tex2Dbias(_KiraMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp3.y = tmp8.x * _IllustBright + 1.0;
                tmp8.yzw = tmp10.xyz * tmp3.yyy;
                tmp0.xyz = tmp6.xyz * tmp0.xyz + -tmp8.yzw;
                tmp0.xyz = tmp8.xxx * tmp0.xyz + tmp8.yzw;
                tmp1.xyz = tmp1.xyz - tmp0.xyz;
                tmp0.xyz = tmp3.www * tmp1.xyz + tmp0.xyz;
                tmp1.x = max(tmp3.w, tmp8.x);
                tmp1.y = tmp8.x * 100.0;
                tmp1.y = max(tmp1.y, 0.0);
                tmp1.y = min(tmp2.y, tmp1.y);
                tmp1.x = saturate(tmp1.x + 0.2);
                tmp0.xyz = tmp0.xyz + _AmbientColor.xyz;
                tmp6 = inp.interp.xyxy - float4(0.375, 0.427, -0.0, 0.35);
                tmp6 = tmp6 * float4(2.0, 2.0, 2.0, 2.0) + float4(-1.0, -1.0, -1.0, -1.0);
                tmp6 = abs(tmp6) - float4(0.1, 0.085, 0.91, 0.06);
                tmp8 = ddx(tmp6);
                tmp9 = ddy(tmp6);
                tmp8 = abs(tmp8) + abs(tmp9);
                tmp6 = tmp6 / tmp8;
                tmp6 = saturate(float4(1.0, 1.0, 1.0, 1.0) - tmp6);
                tmp3.yz = min(tmp6.yw, tmp6.xz);
                tmp6.xyz = _CubemapPower.xxx * _CubemapColor.xyz;
                tmp8.xyz = -_CubemapPower.xxx * _CubemapColor.xyz + _CubemapPower.xxx;
                tmp6.xyz = tmp3.yyy * tmp8.xyz + tmp6.xyz;
                tmp8.xyz = _CubemapPower.xxx * float3(0.8980392, 0.8666667, 0.3254902) + -tmp6.xyz;
                tmp3.yzw = tmp3.zzz * tmp8.xyz + tmp6.xyz;
                tmp6.xyz = tmp10.xyz - tmp3.yzw;
                tmp3.yzw = tmp0.www * tmp6.xyz + tmp3.yzw;
                tmp0.xyz = tmp0.xyz - tmp3.yzw;
                tmp0.xyz = tmp0.www * tmp0.xyz + tmp3.yzw;
                tmp3.yzw = tmp3.yzw + _AmbientColor.xyz;
                tmp4.x = tmp4.x * tmp4.w;
                tmp4.zw = tmp4.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp6.xy = tmp4.xy + tmp4.xy;
                tmp0.w = dot(tmp4.zw, tmp4.zw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp6.z = max(tmp0.w, 0.0);
                tmp4.xyz = tmp6.xyz - float3(1.0, 1.0, 1.0);
                tmp4.xyz = _MonsterNameNormalPower.xxx * tmp4.xyz + float3(0.0, 0.0, 1.0);
                tmp6 = tex2Dbias(_MainNormal, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp6.x = tmp6.x * tmp6.w;
                tmp6.zw = tmp6.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp8.xy = tmp6.xy + tmp6.xy;
                tmp0.w = dot(tmp6.zw, tmp6.zw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp8.z = max(tmp0.w, 0.0);
                tmp6.xyz = tmp8.xyz - float3(1.0, 1.0, 1.0);
                tmp6.xyz = _MainNormalPower.xxx * tmp6.xyz + float3(0.0, 0.0, 1.0);
                tmp4.xyz = tmp4.xyz - tmp6.xyz;
                tmp4.xyz = tmp1.www * tmp4.xyz + tmp6.xyz;
                tmp2.xy = tmp2.xz * tmp3.xx + tmp4.xy;
                tmp2.z = tmp2.w * tmp4.z;
                tmp0.w = dot(tmp2.xyz, tmp2.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp4.xy = tmp2.xy * tmp0.ww + tmp7.xy;
                tmp0.w = tmp0.w * tmp2.z;
                tmp4.z = tmp0.w * tmp7.z;
                tmp0.w = dot(tmp4.xyz, tmp4.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp2.xyz = tmp0.www * tmp4.xyz;
                tmp0.w = dot(tmp2.xyz, tmp2.xyz);
                tmp0.w = rsqrt(tmp0.w);
                tmp4.xyz = tmp0.www * tmp2.xyz;
                tmp0.w = saturate(dot(tmp2.xyz, tmp5.xyz));
                tmp2.xyz = _WorldSpaceCameraPos - inp.interp3.xyz;
                tmp1.z = dot(tmp2.xyz, tmp2.xyz);
                tmp1.z = rsqrt(tmp1.z);
                tmp2.xyz = tmp1.zzz * tmp2.xyz;
                tmp1.z = unity_OrthoParams.w == 0.0;
                tmp6.x = tmp1.z ? tmp2.x : unity_MatrixV._m20;
                tmp6.y = tmp1.z ? tmp2.y : unity_MatrixV._m21;
                tmp6.z = tmp1.z ? tmp2.z : unity_MatrixV._m22;
                tmp2.xyz = _FakeViewDirection - tmp6.xyz;
                tmp2.xyz = _FakeBlend.xxx * tmp2.xyz + tmp6.xyz;
                tmp1.z = dot(tmp2.xyz, tmp2.xyz);
                tmp1.z = max(tmp1.z, 8388608.0);
                tmp1.z = rsqrt(tmp1.z);
                tmp2.xyz = tmp2.xyz * tmp1.zzz + tmp5.xyz;
                tmp1.z = dot(tmp2.xyz, tmp2.xyz);
                tmp1.z = max(tmp1.z, 8388608.0);
                tmp1.z = rsqrt(tmp1.z);
                tmp2.xyz = tmp1.zzz * tmp2.xyz;
                tmp1.z = saturate(dot(tmp4.xyz, tmp2.xyz));
                tmp1.z = log(tmp1.z);
                tmp1.w = _Smoothness * 10.0 + 1.0;
                tmp1.w = pow(2.0, tmp1.w);
                tmp1.z = tmp1.z * tmp1.w;
                tmp1.z = pow(2.0, tmp1.z);
                tmp2.xyz = _FrameMetal.xxx * _SpecularColor.xyz;
                tmp2.xyz = tmp1.zzz * tmp2.xyz;
                tmp4.xyz = _FakeLightColor.xyz - _MainLightColor.xyz;
                tmp4.xyz = _FakeBlend.xxx * tmp4.xyz + _MainLightColor.xyz;
                tmp4.xyz = tmp4.xyz * _DirectionalLightAmp.xxx;
                tmp2.xyz = tmp2.xyz * tmp4.xyz;
                tmp2.xyz = tmp0.www * _DirectionalLightAmp.xxx + tmp2.xyz;
                tmp2.xyz = tmp2.xyz + _AmbientColor.xyz;
                tmp4.zw = float2(-1.0, 0.6666667);
                tmp5.zw = float2(1.0, -1.0);
                tmp1.zw = inp.interp.xy * float2(1.5, 1.5);
                tmp6 = tex2Dbias(_HighlightNormal, float4(tmp1.zw, 0, _GlobalMipBias.x));
                tmp6.x = tmp6.x * tmp6.w;
                tmp6.xw = tmp6.yx * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.w = dot(tmp6.xw, tmp6.xw);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp4.x = max(tmp0.w, 0.0);
                tmp0.w = tmp6.x >= tmp4.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp5.x = tmp6.x - tmp4.x;
                tmp4.y = tmp6.x;
                tmp5.y = tmp4.x - tmp4.y;
                tmp4 = tmp0.wwww * tmp5 + tmp4;
                tmp0.w = tmp6.w >= tmp4.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp6.xyz = tmp4.xyw;
                tmp4.xyw = tmp6.wyx;
                tmp4 = tmp4 - tmp6;
                tmp4 = tmp0.wwww * tmp4 + tmp6;
                tmp0.w = tmp4.w - tmp4.y;
                tmp1.z = min(tmp4.y, tmp4.w);
                tmp1.z = tmp4.x - tmp1.z;
                tmp1.w = tmp1.z * 6.0 + 0.0;
                tmp0.w = tmp0.w / tmp1.w;
                tmp0.w = tmp0.w + tmp4.z;
                tmp1.w = _Time.y * 0.5;
                tmp1.w = frac(tmp1.w);
                tmp0.w = abs(tmp0.w) + tmp1.w;
                tmp1.w = tmp0.w > 1.0;
                tmp2.w = tmp0.w - 1.0;
                tmp0.w = tmp1.w ? tmp2.w : tmp0.w;
                tmp4.yzw = tmp0.www + float3(1.0, 0.6666667, 0.3333333);
                tmp4.yzw = frac(tmp4.yzw);
                tmp4.yzw = tmp4.yzw * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                tmp4.yzw = saturate(abs(tmp4.yzw) - float3(1.0, 1.0, 1.0));
                tmp4.yzw = tmp4.yzw - float3(1.0, 1.0, 1.0);
                tmp0.w = tmp4.x + 0.0;
                tmp1.w = tmp1.z / tmp0.w;
                tmp1.z = tmp1.z == 0.0;
                tmp0.w = tmp1.z ? tmp4.x : tmp0.w;
                tmp4.xyz = tmp1.www * tmp4.yzw + float3(1.0, 1.0, 1.0);
                tmp1.z = tmp0.w * tmp4.z;
                tmp4.xy = tmp0.ww * tmp4.xy + tmp7.xy;
                tmp4.z = tmp7.z * tmp1.z;
                tmp0.w = dot(tmp4.xyz, tmp4.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp1.zw = tmp0.ww * tmp4.xy;
                tmp4 = tex2Dbias(_HighlightTex, float4(tmp1.zw, 0, _GlobalMipBias.x));
                tmp4.xyz = tmp4.xyz * _Color.xyz;
                tmp1.xzw = tmp1.xxx * tmp4.xyz;
                tmp1.xzw = tmp1.xzw * _HighlightAmp.xxx;
                tmp0.w = _HighlightRotation * 0.01745329;
                tmp3.x = sin(tmp0.w);
                tmp4.x = cos(tmp0.w);
                tmp4.y = tmp3.x;
                tmp4.xy = tmp4.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                tmp4.xy = tmp4.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp4.zw = inp.interp.xy - float2(0.5, 0.5);
                tmp0.w = dot(tmp4.zw, tmp4.xy);
                tmp0.w = tmp0.w + 0.5;
                tmp2.w = _Time.y * _ScrollSpeed;
                tmp2.w = tmp2.w * -0.2 + _HighlightScrollOffset;
                tmp2.w = tmp2.w + 0.1;
                tmp0.w = tmp0.w * 0.1 + tmp2.w;
                tmp0.w = frac(tmp0.w);
                tmp2.w = 1.0 - tmp0.w;
                tmp0.w = tmp2.w * tmp0.w + -0.08;
                tmp0.w = tmp0.w * -10.0;
                tmp0.w = max(tmp0.w, 0.0);
                tmp2.w = tmp0.w * -2.0 + 3.0;
                tmp0.w = tmp0.w * tmp0.w;
                tmp0.w = tmp0.w * tmp2.w;
                tmp0.w = min(tmp0.w, 1.0);
                tmp1.xzw = tmp1.xzw * tmp0.www;
                tmp0.xyz = tmp2.xyz * tmp0.xyz + tmp1.xzw;
                tmp1.xzw = tmp3.yzw - tmp0.xyz;
                tmp0.xyz = tmp1.yyy * tmp1.xzw + tmp0.xyz;
                tmp1 = tex2Dbias(_LoadingTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp0.w = 1.0;
                tmp1 = tmp1 - tmp0;
                tmp0 = _LoadingBlend.xxxx * tmp1 + tmp0;
                tmp1.x = dot(tmp0.xyz, float4(0.299, 0.587, 0.114, 0.0));
                tmp1.xyz = tmp1.xxx - tmp0.xyz;
                tmp1.w = 0.0;
                tmp0 = _Monochrome.xxxx * tmp1 + tmp0;
                tmp0 = tmp0.yzwx * _TintColor;
                tmp1.xyz = tmp0.wxy;
                tmp1.w = 1.0;
                tmp1 = tmp1 * _AddColor;
                tmp2 = tex2Dbias(_Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp0.w = tmp2.x;
                tmp1 = tmp0.wwwz * tmp1;
                tmp0.x = 2.0;
                tmp0 = tmp1 * tmp0.xxxw;
                tmp1.x = _Time.y + _Time.y;
                tmp1.x = sin(tmp1.x);
                tmp1.x = tmp1.x + 1.0;
                tmp1.x = tmp1.x * 0.2 + 0.5;
                tmp1 = tmp0 * tmp1.xxxx;
                tmp2.x = _isFade != 0.0;
                tmp0 = tmp2.xxxx ? tmp1 : tmp0;
                tmp1.x = inp.interp2.w * 255.0;
                tmp1.x = round(tmp1.x);
                tmp1.w = tmp1.x * 0.00392157;
                tmp1.xyz = inp.interp2.xyz;
                tmp0 = tmp0 * tmp1;
                o.sv_target.xyz = tmp0.www * tmp0.xyz;
                o.sv_target.w = tmp0.w;
                return o;
            }
            #endif
            ENDCG
            
        }
    }
    Fallback "Hidden/Shader Graph/FallbackError"
}
