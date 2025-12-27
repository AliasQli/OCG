// Upgrade NOTE: replaced 'glstate_matrix_projection' with 'UNITY_MATRIX_P'

Shader "Shader Graphs/ShineStyleUI" {
    Properties {
        [NoScaleOffset] _MainTex ("MainTex", 2D) = "white" {}
        [NoScaleOffset] _LoadingTex ("LoadingTex", 2D) = "white" {}
        _LoadingBlend ("LoadingBlend", Range(0, 1)) = 0
        [NoScaleOffset] _MonsterNameTex ("MonsterNameTex", 2D) = "black" {}
        _MonsterNameTextBold ("MonsterNameTextBold", Float) = 1.3
        [NoScaleOffset] _AttributeTex ("AttributeTex", 2D) = "white" {}
        _AttributeTile ("AttributeTile", Float) = 1
        _AttributeSize_Pos ("AttributeSize&Pos", Vector) = (9.85, 13.9, -3.7, -5.81)
        _MainTexMetal ("MainTexMetal", Float) = 0
        [NoScaleOffset] [Normal] _MainNormal ("MainNormal", 2D) = "bump" {}
        _FrameMetal ("FrameMetal", Float) = 1
        [NoScaleOffset] _FrameMask ("FrameMask", 2D) = "white" {}
        _MainNormalPower ("MainNormalPower", Float) = 0.86
        _EnvironmentPower ("EnvironmentPower", Float) = 1
        _EnvironmentColor ("EnvironmentColor", Color) = (1, 1, 1, 0)
        [HDR] _CardNameColor ("CardNameColor", Color) = (1, 1, 1, 0)
        [HDR] _KiraColor ("KiraColor", Color) = (0.3764706, 0.4, 0.5568628, 0)
        [NoScaleOffset] _KiraColorTexture ("KiraColorTexture", 2D) = "white" {}
        _KiraMetal ("KiraMetal", Float) = 1
        [NoScaleOffset] _KiraMask ("KiraMask", 2D) = "white" {}
        [NoScaleOffset] _KiraNormal01 ("Kira01", 2D) = "white" {}
        _Kira01Tile ("Kira01Tile", Float) = 1
        _KiraNormal01Power ("Kira01Power", Float) = 1
        _Kira02Tile ("Kira02Tile", Float) = 1
        _KiraNormal02Power ("Kira02Power", Float) = 1
        _CardDistortion ("CardDistortion", Float) = 0
        [NoScaleOffset] _HoloTex ("HoloTex", 2D) = "white" {}
        _HoloShift ("HoloShift", Float) = 1
        _HoloBrightness ("HoloBrightness", Float) = 0.7
        _SpecularColor ("SpecularColor", Color) = (0.7647059, 0.7647059, 0.7647059, 1)
        _Smoothness ("Smoothness", Float) = 0.5
        _AmbientColor ("AmbientColor", Color) = (0.0754717, 0.0754717, 0.0754717, 1)
        _AddColor ("AddColor", Color) = (0.5019608, 0.5019608, 0.5019608, 1)
        _Monochrome ("Monochrome", Range(0, 1)) = 0
        _DirectionalLightAmp ("DirectionalLightAmp", Float) = 1
        _ScrollSpeed ("ScrollSpeed", Float) = 1.5
        _HighlightAmp ("HighlightAmp", Float) = 1
        _HighlightScrollOffset ("HighlightScrollOffset", Float) = 0
        _HighlightRotation ("HighlightRotation", Float) = -30
        _IllustHoloPower ("IllustHoloPower", Float) = 1
        _IllustContrast ("IllustContrast", Float) = 0
        _IllustBrightness ("IllustBrightness", Float) = 0
        _FakeLightDirection ("FakeLightDirection", Vector) = (0.75, -0.75, 0, 0)
        _FakeLightColor ("FakeLightColor", Color) = (0, 0, 0, 0)
        _FakeViewDirection ("FakeViewDirection", Vector) = (0.75, 0.75, 0, 0)
        _FakeNormalDirection ("FakeNormalDirection", Vector) = (0.75, -0.75, 0, 0)
        _FakeBlend ("FakeBlend", Range(0, 1)) = 1
        _TintColor ("TintColor", Color) = (1, 1, 1, 1)
        _EnhanceColorThreshold ("EnhanceColorThreshold", Float) = 2
        _IllustRanbowPower ("IllustRanbowPower", Float) = 1
        [ToggleUI] _LinkOn_Off ("LinkOn_Off", Float) = 0
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
            // "IGNOREPROJECTOR"="true"
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
            // ColorMask 0
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

            // #pragma shader_feature UNITY_UI_ALPHACLIP
            // #pragma shader_feature UNITY_UI_CLIP_RECT
            

            #if UNITY_UI_CLIP_RECT
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
                float4 _ClipRect; // 608 (starting at cb2[38].x)
            // CBUFFER_END
            float _UIMaskSoftnessX; // 624 (starting at cb2[39].x)
            float _UIMaskSoftnessY; // 628 (starting at cb2[39].y)
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


            #if UNITY_UI_CLIP_RECT
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
            float _AttributeTile; // 112 (starting at cb1[7].x)
            float4 _AttributeSize_Pos; // 128 (starting at cb1[8].x)
            float _MainTexMetal; // 144 (starting at cb1[9].x)
            float _FrameMetal; // 176 (starting at cb1[11].x)
            float _MainNormalPower; // 208 (starting at cb1[13].x)
            float _EnvironmentPower; // 212 (starting at cb1[13].y)
            float4 _EnvironmentColor; // 224 (starting at cb1[14].x)
            float4 _CardNameColor; // 240 (starting at cb1[15].x)
            float4 _KiraColor; // 256 (starting at cb1[16].x)
            float _KiraMetal; // 288 (starting at cb1[18].x)
            float _Kira01Tile; // 336 (starting at cb1[21].x)
            float _KiraNormal01Power; // 340 (starting at cb1[21].y)
            float _Kira02Tile; // 344 (starting at cb1[21].z)
            float _KiraNormal02Power; // 348 (starting at cb1[21].w)
            float _CardDistortion; // 352 (starting at cb1[22].x)
            float _HoloShift; // 384 (starting at cb1[24].x)
            float _HoloBrightness; // 388 (starting at cb1[24].y)
            float4 _SpecularColor; // 400 (starting at cb1[25].x)
            float _Smoothness; // 416 (starting at cb1[26].x)
            float4 _AmbientColor; // 432 (starting at cb1[27].x)
            float4 _AddColor; // 448 (starting at cb1[28].x)
            float _Monochrome; // 464 (starting at cb1[29].x)
            float _DirectionalLightAmp; // 468 (starting at cb1[29].y)
            float _ScrollSpeed; // 472 (starting at cb1[29].z)
            float _HighlightAmp; // 476 (starting at cb1[29].w)
            float _HighlightScrollOffset; // 480 (starting at cb1[30].x)
            float _HighlightRotation; // 484 (starting at cb1[30].y)
            float _IllustHoloPower; // 488 (starting at cb1[30].z)
            float _IllustContrast; // 492 (starting at cb1[30].w)
            float _IllustBrightness; // 496 (starting at cb1[31].x)
            float3 _FakeLightDirection; // 500 (starting at cb1[31].y)
            float4 _FakeLightColor; // 512 (starting at cb1[32].x)
            float3 _FakeViewDirection; // 528 (starting at cb1[33].x)
            float3 _FakeNormalDirection; // 544 (starting at cb1[34].x)
            float _FakeBlend; // 556 (starting at cb1[34].w)
            float4 _TintColor; // 560 (starting at cb1[35].x)
            float _EnhanceColorThreshold; // 576 (starting at cb1[36].x)
            float _IllustRanbowPower; // 580 (starting at cb1[36].y)
            float _LinkOn_Off; // 584 (starting at cb1[36].z)
            // Textures for DX11PixelSM40
            sampler2D _Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D; // 0
            sampler2D _MainTex; // 1
            sampler2D _LoadingTex; // 2
            sampler2D _MonsterNameTex; // 3
            sampler2D _AttributeTex; // 4
            sampler2D _MainNormal; // 5
            sampler2D _FrameMask; // 6
            sampler2D _KiraColorTexture; // 7
            sampler2D _KiraMask; // 8
            sampler2D _KiraNormal01; // 9
            sampler2D _HoloTex; // 10

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
                float4 tmp12;
                float4 tmp13;
                tmp0.x = _AttributeTile + 0.00001;
                tmp0.x = tmp0.x * 0.0625;
                tmp0.y = tmp0.x >= -tmp0.x;
                tmp0.x = frac(abs(tmp0.x));
                tmp0.x = tmp0.y ? tmp0.x : -tmp0.x;
                tmp0.x = tmp0.x * 16.0;
                tmp0.x = floor(tmp0.x);
                tmp0.y = tmp0.x + 0.5;
                tmp0.y = tmp0.y * 0.25;
                tmp0.y = floor(tmp0.y);
                tmp1.x = -tmp0.y * 4.0 + tmp0.x;
                tmp0.x = tmp0.y + 1.0;
                tmp0.yz = _AttributeSize_Pos.xy * float2(0.5, 0.5) + float2(-0.5, -0.5);
                tmp0.yz = inp.interp.xy * _AttributeSize_Pos.xy + -tmp0.yz;
                tmp2.xy = tmp0.yz + _AttributeSize_Pos.zw;
                tmp1.y = tmp2.y - tmp0.x;
                tmp2.z = 4.0;
                tmp0.xy = tmp1.xy + tmp2.xz;
                tmp0.zw = tmp2.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.zw = abs(tmp0.zw) - float2(1.0, 1.0);
                tmp0.xy = tmp0.xy * float2(0.25, 0.25);
                tmp1 = tex2Dbias(_MonsterNameTex, float4(tmp0.xy, 0, _GlobalMipBias.x));
                tmp0.xy = inp.interp.xy * float2(1.0, 5.0) + float2(0.0, -4.0);
                tmp2 = tex2Dbias(_MonsterNameTex, float4(tmp0.xy, 0, _GlobalMipBias.x));
                tmp0.x = saturate(_MonsterNameTextBold * tmp2.w + tmp2.w);
                tmp1.yz = ddx(tmp0.zw);
                tmp2.xy = ddy(tmp0.zw);
                tmp1.yz = abs(tmp1.yz) + abs(tmp2.xy);
                tmp0.yz = tmp0.zw / tmp1.yz;
                tmp0.yz = saturate(float2(1.0, 1.0) - tmp0.yz);
                tmp0.y = min(tmp0.z, tmp0.y);
                tmp0.x = tmp1.x * tmp0.y + tmp0.x;
                tmp1 = tex2Dbias(_FrameMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp0.x = tmp0.x + tmp1.x;
                tmp0.y = tmp0.x * _HighlightAmp;
                tmp0.z = _HighlightRotation * 0.01745329;
                tmp1.x = sin(tmp0.z);
                tmp2.x = cos(tmp0.z);
                tmp2.y = tmp1.x;
                tmp0.zw = tmp2.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                tmp0.zw = tmp0.zw * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp1 = inp.interp.xyxy + float4(0.054, -0.421, -0.5, -0.5);
                tmp0.z = dot(tmp1.zw, tmp0.zw);
                tmp1.xy = tmp1.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp1.xy = abs(tmp1.xy) - float2(0.757, 0.062);
                tmp0.z = tmp0.z + 0.5;
                tmp0.w = _Time.y * _ScrollSpeed;
                tmp0.w = tmp0.w * -0.2 + _HighlightScrollOffset;
                tmp0.w = tmp0.w + 0.1;
                tmp0.z = tmp0.z * 0.1 + tmp0.w;
                tmp0.z = frac(tmp0.z);
                tmp0.w = 1.0 - tmp0.z;
                tmp0.z = tmp0.w * tmp0.z + -0.08;
                tmp0.z = tmp0.z * -10.0;
                tmp0.z = max(tmp0.z, 0.0);
                tmp0.w = tmp0.z * -2.0 + 3.0;
                tmp0.z = tmp0.z * tmp0.z;
                tmp0.z = tmp0.z * tmp0.w;
                tmp0.z = min(tmp0.z, 1.0);
                tmp0.y = tmp0.y * tmp0.z;
                tmp0.zw = inp.interp.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.zw = abs(tmp0.zw) - float2(0.9, 0.9);
                tmp1.zw = ddx(tmp0.zw);
                tmp2.xy = ddy(tmp0.zw);
                tmp1.zw = abs(tmp1.zw) + abs(tmp2.xy);
                tmp0.zw = tmp0.zw / tmp1.zw;
                tmp0.zw = saturate(float2(1.0, 1.0) - tmp0.zw);
                tmp0.z = min(tmp0.w, tmp0.z);
                tmp0.x = tmp0.x * tmp0.z;
                tmp0.zw = ddx(tmp1.xy);
                tmp1.zw = ddy(tmp1.xy);
                tmp0.zw = abs(tmp0.zw) + abs(tmp1.zw);
                tmp0.zw = tmp1.xy / tmp0.zw;
                tmp0.zw = saturate(float2(1.0, 1.0) - tmp0.zw);
                tmp0.z = min(tmp0.w, tmp0.z);
                tmp1 = inp.interp.xyxy - float4(0.37, 0.427, -0.0, 0.35);
                tmp1 = tmp1 * float4(2.0, 2.0, 2.0, 2.0) + float4(-1.0, -1.0, -1.0, -1.0);
                tmp2.xy = abs(tmp1.zw) - float2(0.91, 0.05);
                tmp1 = abs(tmp1) - float4(0.12, 0.085, 0.91, 0.0);
                tmp2.zw = ddx(tmp2.xy);
                tmp3.xy = ddy(tmp2.xy);
                tmp2.zw = abs(tmp2.zw) + abs(tmp3.xy);
                tmp2.xy = tmp2.xy / tmp2.zw;
                tmp2.xy = saturate(float2(1.0, 1.0) - tmp2.xy);
                tmp0.w = min(tmp2.y, tmp2.x);
                tmp2 = ddx(tmp1);
                tmp3 = ddy(tmp1);
                tmp2 = abs(tmp2) + abs(tmp3);
                tmp1 = tmp1 / tmp2;
                tmp1 = saturate(float4(1.0, 1.0, 1.0, 1.0) - tmp1);
                tmp1.xy = min(tmp1.yw, tmp1.xz);
                tmp1.z = _LinkOn_Off != 0.0;
                tmp0.w = tmp1.z ? tmp1.y : tmp0.w;
                tmp1.yzw = _EnvironmentPower.xxx * _EnvironmentColor.xyz;
                tmp2.xyz = -_EnvironmentPower.xxx * _EnvironmentColor.xyz + _EnvironmentPower.xxx;
                tmp1.xyz = tmp1.xxx * tmp2.xyz + tmp1.yzw;
                tmp2.xyz = _EnvironmentPower.xxx * float3(0.8980392, 0.8666667, 0.3254902) + -tmp1.xyz;
                tmp1.xyz = tmp0.www * tmp2.xyz + tmp1.xyz;
                tmp2.xyz = log(abs(_CardNameColor.xyz));
                tmp2.xyz = tmp2.xyz * float3(0.4166667, 0.4166667, 0.4166667);
                tmp2.xyz = pow(2.0, tmp2.xyz);
                tmp2.xyz = tmp2.xyz * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
                tmp3.xyz = _CardNameColor.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
                tmp4.xyz = _CardNameColor.xyz * float3(12.92321, 12.92321, 12.92321);
                tmp2.xyz = tmp3.xyz ? tmp4.xyz : tmp2.xyz;
                tmp2.xyz = _EnvironmentPower.xxx * tmp2.xyz + -tmp1.xyz;
                tmp1.xyz = tmp0.zzz * tmp2.xyz + tmp1.xyz;
                tmp2 = tex2Dbias(_KiraMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp0.z = tmp2.x * _IllustContrast + 1.0;
                tmp3 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp1.xyz = -tmp3.xyz * tmp0.zzz + tmp1.xyz;
                tmp2.yzw = tmp0.zzz * tmp3.xyz;
                tmp1.xyz = tmp0.xxx * tmp1.xyz + tmp2.yzw;
                tmp2.yzw = log(abs(_KiraColor.xyz));
                tmp2.yzw = tmp2.yzw * float3(0.4166667, 0.4166667, 0.4166667);
                tmp2.yzw = pow(2.0, tmp2.yzw);
                tmp2.yzw = tmp2.yzw * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
                tmp4.xyz = _KiraColor.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
                tmp5.xyz = _KiraColor.xyz * float3(12.92321, 12.92321, 12.92321);
                tmp2.yzw = tmp4.xyz ? tmp5.xyz : tmp2.yzw;
                tmp4 = tex2Dbias(_KiraColorTexture, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp5.xyw = tmp2.zwy * tmp4.yzx;
                tmp6.xy = tmp5.yx;
                tmp4.xy = tmp2.zw * tmp4.yz + -tmp6.xy;
                tmp0.w = tmp6.y >= tmp5.y;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp6.zw = float2(-1.0, 0.6666667);
                tmp4.zw = float2(1.0, -1.0);
                tmp4 = tmp0.wwww * tmp4 + tmp6;
                tmp0.w = tmp5.w >= tmp4.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp5.xyz = tmp4.xyw;
                tmp4.xyw = tmp5.wyx;
                tmp4 = tmp4 - tmp5;
                tmp4 = tmp0.wwww * tmp4 + tmp5;
                tmp0.w = tmp4.w - tmp4.y;
                tmp1.w = min(tmp4.y, tmp4.w);
                tmp1.w = tmp4.x - tmp1.w;
                tmp2.y = tmp1.w * 6.0 + 0.0;
                tmp0.w = tmp0.w / tmp2.y;
                tmp0.w = tmp0.w + tmp4.z;
                tmp2.y = sin(_Time.y);
                tmp2.yz = tmp2.yy + float2(0.5, -0.05);
                tmp0.w = tmp2.z * 0.1 + abs(tmp0.w);
                tmp2.y = saturate(tmp2.y);
                tmp2.z = tmp0.w > 1.0;
                tmp4.yz = tmp0.ww + float2(1.0, -1.0);
                tmp2.z = tmp2.z ? tmp4.z : tmp0.w;
                tmp0.w = tmp0.w < 0.0;
                tmp0.w = tmp0.w ? tmp4.y : tmp2.z;
                tmp4.yzw = tmp0.www + float3(1.0, 0.6666667, 0.3333333);
                tmp4.yzw = frac(tmp4.yzw);
                tmp4.yzw = tmp4.yzw * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                tmp4.yzw = saturate(abs(tmp4.yzw) - float3(1.0, 1.0, 1.0));
                tmp4.yzw = tmp4.yzw - float3(1.0, 1.0, 1.0);
                tmp0.w = tmp4.x + 0.0;
                tmp2.z = tmp1.w / tmp0.w;
                tmp1.w = tmp1.w == 0.0;
                tmp0.w = tmp1.w ? tmp4.x : tmp0.w;
                tmp4.xyz = tmp2.zzz * tmp4.yzw + float3(1.0, 1.0, 1.0);
                tmp4.xyz = tmp0.www * tmp4.xyz;
                tmp2.zw = float2(_Kira01Tile.x, _Kira02Tile.x) * float2(_Kira01Tile.x, _Kira02Tile.x);
                tmp5.xy = float2(1.00001, 1.00001) / tmp2.zw;
                tmp5.xy = frac(tmp5.xy);
                tmp2.zw = tmp2.zw * tmp5.xy;
                tmp2.zw = floor(tmp2.zw);
                tmp5.xy = tmp2.zw + float2(0.5, 0.5);
                tmp5.zw = float2(1.0, 1.0) / float2(_Kira01Tile.x, _Kira02Tile.x);
                tmp5.xy = tmp5.zw * tmp5.xy;
                tmp6.zw = floor(tmp5.xy);
                tmp2.zw = -float2(_Kira01Tile.x, _Kira02Tile.x) * tmp6.zw + tmp2.zw;
                tmp2.zw = tmp2.zw + float2(1.0, 1.0);
                tmp6.xy = float2(_Kira01Tile.x, _Kira02Tile.x) - tmp2.zw;
                tmp6 = tmp6.xzyw + inp.interp.xyxy;
                tmp5 = tmp6 * tmp5.zzww + float4(-0.5, -0.5, -0.5, -0.5);
                tmp0.w = -_Time.y * 0.25 + 1.0;
                tmp6.x = sin(tmp0.w);
                tmp7.x = cos(tmp0.w);
                tmp7.yz = tmp6.xx;
                tmp6.xyz = tmp7.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                tmp6.xyz = tmp6.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                tmp7.x = dot(tmp5.zw, tmp6.xz);
                tmp7.y = dot(tmp5.wz, tmp6.xy);
                tmp2.zw = tmp7.xy + float2(0.5, 0.5);
                tmp2.zw = tmp2.zw * float2(0.5, 0.5) + float2(0.25, 0.25);
                tmp6 = tex2Dbias(_KiraNormal01, float4(tmp2.zw, 0, _GlobalMipBias.x));
                tmp6.x = tmp6.x * tmp6.w;
                tmp6.xy = tmp6.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.w = dot(tmp6.xy, tmp6.xy);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp6.z = max(tmp0.w, 0.0);
                tmp6.xyz = saturate(tmp6.xyz);
                tmp6.xyz = tmp6.xyz - float3(0.0, 0.0, 1.0);
                tmp6.xyz = _KiraNormal02Power.xxx * tmp6.xyz + float3(0.0, 0.0, 1.0);
                tmp2.zw = _Time.yx * float2(0.25, 2.5);
                tmp7.x = sin(tmp2.z);
                tmp8.x = cos(tmp2.z);
                tmp9.x = sin(tmp2.w);
                tmp8.yz = tmp7.xx;
                tmp7.xyz = tmp8.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                tmp7.xyz = tmp7.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                tmp8.x = dot(tmp5.xy, tmp7.xz);
                tmp8.y = dot(tmp5.yx, tmp7.xy);
                tmp2.zw = tmp8.xy + float2(0.5, 0.5);
                tmp2.zw = tmp2.zw * float2(0.5, 0.5) + float2(0.25, 0.25);
                tmp5 = tex2Dbias(_KiraNormal01, float4(tmp2.zw, 0, _GlobalMipBias.x));
                tmp5.x = tmp5.x * tmp5.w;
                tmp7.xy = tmp5.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp5.xy = tmp5.xy + tmp5.xy;
                tmp0.w = dot(tmp7.xy, tmp7.xy);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp7.z = max(tmp0.w, 0.0);
                tmp7.xyw = saturate(tmp7.xyz);
                tmp5.z = tmp7.z;
                tmp5.xyz = tmp5.xyz - float3(1.0, 1.0, 1.0);
                tmp5.xyz = _CardDistortion.xxx * tmp5.xyz + float3(0.0, 0.0, 1.0);
                tmp7.xyz = tmp7.xyw - float3(0.0, 0.0, 1.0);
                tmp7.xyz = _KiraNormal01Power.xxx * tmp7.xyz + float3(0.0, 0.0, 1.0);
                tmp8.xy = tmp6.xy + tmp7.xy;
                tmp8.z = tmp6.z * tmp7.z;
                tmp0.w = dot(tmp8.xyz, tmp8.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp6.xyz = tmp0.www * tmp8.xyz;
                tmp0.w = dot(tmp6.xyz, tmp6.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp1.w = dot(inp.interp4.xyz, inp.interp4.xyz);
                tmp1.w = sqrt(tmp1.w);
                tmp1.w = 1.0 / tmp1.w;
                tmp7.xyz = tmp1.www * inp.interp4.xyz;
                tmp8.xyz = -tmp1.www * inp.interp4.xyz + _FakeNormalDirection;
                tmp7.xyz = _FakeBlend.xxx * tmp8.xyz + tmp7.xyz;
                tmp8.xyz = _WorldSpaceCameraPos - inp.interp3.xyz;
                tmp1.w = dot(tmp8.xyz, tmp8.xyz);
                tmp1.w = rsqrt(tmp1.w);
                tmp8.xyz = tmp1.www * tmp8.xyz;
                tmp1.w = unity_OrthoParams.w == 0.0;
                tmp10.x = tmp1.w ? tmp8.x : unity_MatrixV._m20;
                tmp10.y = tmp1.w ? tmp8.y : unity_MatrixV._m21;
                tmp10.z = tmp1.w ? tmp8.z : unity_MatrixV._m22;
                tmp8.xyz = _FakeViewDirection - tmp10.xyz;
                tmp8.xyz = _FakeBlend.xxx * tmp8.xyz + tmp10.xyz;
                tmp10.xyz = _FakeLightDirection - _MainLightPosition.xyz;
                tmp10.xyz = _FakeBlend.xxx * tmp10.xyz + _MainLightPosition.xyz;
                tmp11.xyz = tmp8.xyz + tmp10.xyz;
                tmp1.w = dot(tmp11.xyz, tmp11.xyz);
                tmp1.w = rsqrt(tmp1.w);
                tmp11.xyz = tmp1.www * tmp11.xyz;
                tmp1.w = dot(tmp11.xyz, tmp7.xyz);
                tmp7.xyz = tmp7.xyz + float3(0.0, 0.0, 1.0);
                tmp1.w = tmp1.w * _HoloShift;
                tmp11 = tex2Dbias(_HoloTex, float4(tmp1.ww, 0, _GlobalMipBias.x));
                tmp11.x = tmp11.x * tmp11.w;
                tmp2.zw = tmp11.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp11.xy = tmp6.xy * tmp0.ww + tmp2.zw;
                tmp1.w = dot(tmp2.zw, tmp2.zw);
                tmp1.w = min(tmp1.w, 1.0);
                tmp1.w = 1.0 - tmp1.w;
                tmp1.w = sqrt(tmp1.w);
                tmp1.w = max(tmp1.w, 0.0);
                tmp2.z = tmp0.w * tmp6.z;
                tmp11.z = tmp1.w * tmp2.z;
                tmp1.w = dot(tmp11.xyz, tmp11.xyz);
                tmp1.w = max(tmp1.w, 8388608.0);
                tmp1.w = rsqrt(tmp1.w);
                tmp2.w = tmp1.w * tmp11.z;
                tmp11.xy = tmp11.xy * tmp1.ww + tmp5.xy;
                tmp11.z = tmp2.w * tmp5.z;
                tmp1.w = dot(tmp11.xyz, tmp11.xyz);
                tmp1.w = max(tmp1.w, 8388608.0);
                tmp1.w = rsqrt(tmp1.w);
                tmp5.xyz = tmp1.www * tmp11.xyz;
                tmp5.yw = tmp5.yy * unity_MatrixV._m01_m11;
                tmp5.xy = unity_MatrixV._m00_m10 * tmp5.xx + tmp5.yw;
                tmp5.xy = unity_MatrixV._m02_m12 * tmp5.zz + tmp5.xy;
                tmp5.xy = tmp5.xy + unity_MatrixV._m03_m13;
                tmp5 = tex2Dbias(_HoloTex, float4(tmp5.xy, 0, _GlobalMipBias.x));
                tmp11.xyz = float3(1.0, 1.0, 1.0) - tmp5.xyz;
                tmp11.xyz = tmp11.xyz + tmp11.xyz;
                tmp1.w = 1.0 - _HoloBrightness;
                tmp11.xyz = -tmp11.xyz * tmp1.www + float3(1.0, 1.0, 1.0);
                tmp12.xyz = tmp5.xyz <= float3(0.5, 0.5, 0.5);
                tmp5.xyz = tmp5.xyz * _HoloBrightness.xxx;
                tmp5.xyz = tmp5.xyz + tmp5.xyz;
                tmp13.xyz = tmp12.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                tmp12.xyz = uint3(tmp12.xyz) & uint3(int3(1, 1, 1));
                tmp11.xyz = tmp11.xyz * tmp13.xyz;
                tmp5.xyz = saturate(tmp5.xyz * tmp12.xyz + tmp11.xyz);
                tmp5.xyz = tmp5.zzz + tmp5.xyz;
                tmp4.xyz = tmp4.xyz * tmp5.xyz;
                tmp4.xyz = tmp4.xyz * _IllustHoloPower.xxx;
                tmp5.xy = _Time.yx * float2(2.5, 2.5) + float2(2.09439, 4.18878);
                tmp9.yz = sin(tmp5.xy);
                tmp5.xyz = tmp9.xyz + float3(3.0, 3.0, 3.0);
                tmp5.xyz = tmp5.xyz * float3(0.2, 0.2, 0.2) + -tmp3.xyz;
                tmp1.w = dot(tmp5.xyz, tmp5.xyz);
                tmp1.w = sqrt(tmp1.w);
                tmp1.w = saturate(-_EnhanceColorThreshold * tmp1.w + 1.0);
                tmp1.w = dot(tmp1.ww, _IllustRanbowPower.xx);
                tmp4.xyz = tmp1.www * tmp4.xyz;
                tmp5.xyz = tmp3.xyz * tmp0.zzz + -tmp4.xyz;
                tmp3.xyz = tmp3.xyz + _AmbientColor.xyz;
                tmp0.z = 1.0 - tmp2.x;
                tmp4.xyz = tmp0.zzz * tmp5.xyz + tmp4.xyz;
                tmp0.z = tmp2.x - 0.2176376;
                tmp0.z = saturate(tmp0.z * 10.0 + 0.2176376);
                tmp4.xyz = tmp0.zzz * _IllustBrightness.xxx + tmp4.xyz;
                tmp4.xyz = tmp4.xyz + _AmbientColor.xyz;
                tmp1.xyz = tmp1.xyz - tmp4.xyz;
                tmp1.xyz = tmp0.xxx * tmp1.xyz + tmp4.xyz;
                tmp0.z = dot(tmp8.xyz, tmp8.xyz);
                tmp0.z = max(tmp0.z, 8388608.0);
                tmp0.z = rsqrt(tmp0.z);
                tmp4.xyz = tmp8.xyz * tmp0.zzz + tmp10.xyz;
                tmp0.z = dot(tmp4.xyz, tmp4.xyz);
                tmp0.z = max(tmp0.z, 8388608.0);
                tmp0.z = rsqrt(tmp0.z);
                tmp4.xyz = tmp0.zzz * tmp4.xyz;
                tmp5 = tex2Dbias(_MainNormal, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp5.x = tmp5.x * tmp5.w;
                tmp5.zw = tmp5.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp8.xy = tmp5.xy + tmp5.xy;
                tmp0.z = dot(tmp5.zw, tmp5.zw);
                tmp0.z = min(tmp0.z, 1.0);
                tmp0.z = 1.0 - tmp0.z;
                tmp0.z = sqrt(tmp0.z);
                tmp8.z = max(tmp0.z, 0.0);
                tmp5.xyz = tmp8.xyz - float3(1.0, 1.0, 1.0);
                tmp5.xyz = _MainNormalPower.xxx * tmp5.xyz + float3(0.0, 0.0, 1.0);
                tmp6.xy = tmp6.xy * tmp0.ww + tmp5.xy;
                tmp6.z = tmp2.z * tmp5.z;
                tmp0.z = dot(tmp6.xyz, tmp6.xyz);
                tmp0.z = max(tmp0.z, 8388608.0);
                tmp0.z = rsqrt(tmp0.z);
                tmp5.xyz = tmp0.zzz * tmp6.xyz;
                tmp5.xyz = tmp5.xyz * float3(-1.0, -1.0, 1.0);
                tmp0.z = dot(tmp7.xyz, tmp5.xyz);
                tmp6.xyz = tmp7.xyz / tmp7.zzz;
                tmp5.xyz = tmp6.xyz * tmp0.zzz + -tmp5.xyz;
                tmp0.z = dot(tmp5.xyz, tmp5.xyz);
                tmp0.z = rsqrt(tmp0.z);
                tmp6.xyz = tmp0.zzz * tmp5.xyz;
                tmp0.z = saturate(dot(tmp5.xyz, tmp10.xyz));
                tmp0.w = saturate(dot(tmp6.xyz, tmp4.xyz));
                tmp0.w = log(tmp0.w);
                tmp1.w = _Smoothness * 10.0 + 1.0;
                tmp1.w = pow(2.0, tmp1.w);
                tmp0.w = tmp0.w * tmp1.w;
                tmp0.w = pow(2.0, tmp0.w);
                tmp1.w = _KiraMetal - _MainTexMetal;
                tmp1.w = tmp2.x * tmp1.w + _MainTexMetal;
                tmp2.x = tmp2.x * 100.0;
                tmp2.x = max(tmp2.x, 0.0);
                tmp2.x = min(tmp2.y, tmp2.x);
                tmp2.y = _FrameMetal - tmp1.w;
                tmp0.x = tmp0.x * tmp2.y + tmp1.w;
                tmp2.yzw = tmp0.xxx * _SpecularColor.xyz;
                tmp2.yzw = tmp0.www * tmp2.yzw;
                tmp4.xyz = _FakeLightColor.xyz - _MainLightColor.xyz;
                tmp4.xyz = _FakeBlend.xxx * tmp4.xyz + _MainLightColor.xyz;
                tmp4.xyz = tmp4.xyz * _DirectionalLightAmp.xxx;
                tmp2.yzw = tmp2.yzw * tmp4.xyz;
                tmp0.xzw = tmp0.zzz * _DirectionalLightAmp.xxx + tmp2.yzw;
                tmp0.xzw = tmp0.xzw + _AmbientColor.xyz;
                tmp0.xyz = tmp0.xzw * tmp1.xyz + tmp0.yyy;
                tmp1.xyz = tmp3.xyz - tmp0.xyz;
                tmp0.xyz = tmp2.xxx * tmp1.xyz + tmp0.xyz;
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
            float _AttributeTile; // 112 (starting at cb1[7].x)
            float4 _AttributeSize_Pos; // 128 (starting at cb1[8].x)
            float _MainTexMetal; // 144 (starting at cb1[9].x)
            float _FrameMetal; // 176 (starting at cb1[11].x)
            float _MainNormalPower; // 208 (starting at cb1[13].x)
            float _EnvironmentPower; // 212 (starting at cb1[13].y)
            float4 _EnvironmentColor; // 224 (starting at cb1[14].x)
            float4 _CardNameColor; // 240 (starting at cb1[15].x)
            float4 _KiraColor; // 256 (starting at cb1[16].x)
            float _KiraMetal; // 288 (starting at cb1[18].x)
            float _Kira01Tile; // 336 (starting at cb1[21].x)
            float _KiraNormal01Power; // 340 (starting at cb1[21].y)
            float _Kira02Tile; // 344 (starting at cb1[21].z)
            float _KiraNormal02Power; // 348 (starting at cb1[21].w)
            float _CardDistortion; // 352 (starting at cb1[22].x)
            float _HoloShift; // 384 (starting at cb1[24].x)
            float _HoloBrightness; // 388 (starting at cb1[24].y)
            float4 _SpecularColor; // 400 (starting at cb1[25].x)
            float _Smoothness; // 416 (starting at cb1[26].x)
            float4 _AmbientColor; // 432 (starting at cb1[27].x)
            float4 _AddColor; // 448 (starting at cb1[28].x)
            float _Monochrome; // 464 (starting at cb1[29].x)
            float _DirectionalLightAmp; // 468 (starting at cb1[29].y)
            float _ScrollSpeed; // 472 (starting at cb1[29].z)
            float _HighlightAmp; // 476 (starting at cb1[29].w)
            float _HighlightScrollOffset; // 480 (starting at cb1[30].x)
            float _HighlightRotation; // 484 (starting at cb1[30].y)
            float _IllustHoloPower; // 488 (starting at cb1[30].z)
            float _IllustContrast; // 492 (starting at cb1[30].w)
            float _IllustBrightness; // 496 (starting at cb1[31].x)
            float3 _FakeLightDirection; // 500 (starting at cb1[31].y)
            float4 _FakeLightColor; // 512 (starting at cb1[32].x)
            float3 _FakeViewDirection; // 528 (starting at cb1[33].x)
            float3 _FakeNormalDirection; // 544 (starting at cb1[34].x)
            float _FakeBlend; // 556 (starting at cb1[34].w)
            float4 _TintColor; // 560 (starting at cb1[35].x)
            float _EnhanceColorThreshold; // 576 (starting at cb1[36].x)
            float _IllustRanbowPower; // 580 (starting at cb1[36].y)
            float _LinkOn_Off; // 584 (starting at cb1[36].z)
            // Textures for DX11PixelSM40
            sampler2D _Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D; // 0
            sampler2D _MainTex; // 1
            sampler2D _LoadingTex; // 2
            sampler2D _MonsterNameTex; // 3
            sampler2D _AttributeTex; // 4
            sampler2D _MainNormal; // 5
            sampler2D _FrameMask; // 6
            sampler2D _KiraColorTexture; // 7
            sampler2D _KiraMask; // 8
            sampler2D _KiraNormal01; // 9
            sampler2D _HoloTex; // 10

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
                float4 tmp12;
                float4 tmp13;
                tmp0.x = _AttributeTile + 0.00001;
                tmp0.x = tmp0.x * 0.0625;
                tmp0.y = tmp0.x >= -tmp0.x;
                tmp0.x = frac(abs(tmp0.x));
                tmp0.x = tmp0.y ? tmp0.x : -tmp0.x;
                tmp0.x = tmp0.x * 16.0;
                tmp0.x = floor(tmp0.x);
                tmp0.y = tmp0.x + 0.5;
                tmp0.y = tmp0.y * 0.25;
                tmp0.y = floor(tmp0.y);
                tmp1.x = -tmp0.y * 4.0 + tmp0.x;
                tmp0.x = tmp0.y + 1.0;
                tmp0.yz = _AttributeSize_Pos.xy * float2(0.5, 0.5) + float2(-0.5, -0.5);
                tmp0.yz = inp.interp.xy * _AttributeSize_Pos.xy + -tmp0.yz;
                tmp2.xy = tmp0.yz + _AttributeSize_Pos.zw;
                tmp1.y = tmp2.y - tmp0.x;
                tmp2.z = 4.0;
                tmp0.xy = tmp1.xy + tmp2.xz;
                tmp0.zw = tmp2.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.zw = abs(tmp0.zw) - float2(1.0, 1.0);
                tmp0.xy = tmp0.xy * float2(0.25, 0.25);
                tmp1 = tex2Dbias(_MonsterNameTex, float4(tmp0.xy, 0, _GlobalMipBias.x));
                tmp0.xy = inp.interp.xy * float2(1.0, 5.0) + float2(0.0, -4.0);
                tmp2 = tex2Dbias(_MonsterNameTex, float4(tmp0.xy, 0, _GlobalMipBias.x));
                tmp0.x = saturate(_MonsterNameTextBold * tmp2.w + tmp2.w);
                tmp1.yz = ddx(tmp0.zw);
                tmp2.xy = ddy(tmp0.zw);
                tmp1.yz = abs(tmp1.yz) + abs(tmp2.xy);
                tmp0.yz = tmp0.zw / tmp1.yz;
                tmp0.yz = saturate(float2(1.0, 1.0) - tmp0.yz);
                tmp0.y = min(tmp0.z, tmp0.y);
                tmp0.x = tmp1.x * tmp0.y + tmp0.x;
                tmp1 = tex2Dbias(_FrameMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp0.x = tmp0.x + tmp1.x;
                tmp0.y = tmp0.x * _HighlightAmp;
                tmp0.z = _HighlightRotation * 0.01745329;
                tmp1.x = sin(tmp0.z);
                tmp2.x = cos(tmp0.z);
                tmp2.y = tmp1.x;
                tmp0.zw = tmp2.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                tmp0.zw = tmp0.zw * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp1 = inp.interp.xyxy + float4(0.054, -0.421, -0.5, -0.5);
                tmp0.z = dot(tmp1.zw, tmp0.zw);
                tmp1.xy = tmp1.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp1.xy = abs(tmp1.xy) - float2(0.757, 0.062);
                tmp0.z = tmp0.z + 0.5;
                tmp0.w = _Time.y * _ScrollSpeed;
                tmp0.w = tmp0.w * -0.2 + _HighlightScrollOffset;
                tmp0.w = tmp0.w + 0.1;
                tmp0.z = tmp0.z * 0.1 + tmp0.w;
                tmp0.z = frac(tmp0.z);
                tmp0.w = 1.0 - tmp0.z;
                tmp0.z = tmp0.w * tmp0.z + -0.08;
                tmp0.z = tmp0.z * -10.0;
                tmp0.z = max(tmp0.z, 0.0);
                tmp0.w = tmp0.z * -2.0 + 3.0;
                tmp0.z = tmp0.z * tmp0.z;
                tmp0.z = tmp0.z * tmp0.w;
                tmp0.z = min(tmp0.z, 1.0);
                tmp0.y = tmp0.y * tmp0.z;
                tmp0.zw = inp.interp.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.zw = abs(tmp0.zw) - float2(0.9, 0.9);
                tmp1.zw = ddx(tmp0.zw);
                tmp2.xy = ddy(tmp0.zw);
                tmp1.zw = abs(tmp1.zw) + abs(tmp2.xy);
                tmp0.zw = tmp0.zw / tmp1.zw;
                tmp0.zw = saturate(float2(1.0, 1.0) - tmp0.zw);
                tmp0.z = min(tmp0.w, tmp0.z);
                tmp0.x = tmp0.x * tmp0.z;
                tmp0.zw = ddx(tmp1.xy);
                tmp1.zw = ddy(tmp1.xy);
                tmp0.zw = abs(tmp0.zw) + abs(tmp1.zw);
                tmp0.zw = tmp1.xy / tmp0.zw;
                tmp0.zw = saturate(float2(1.0, 1.0) - tmp0.zw);
                tmp0.z = min(tmp0.w, tmp0.z);
                tmp1 = inp.interp.xyxy - float4(0.37, 0.427, -0.0, 0.35);
                tmp1 = tmp1 * float4(2.0, 2.0, 2.0, 2.0) + float4(-1.0, -1.0, -1.0, -1.0);
                tmp2.xy = abs(tmp1.zw) - float2(0.91, 0.05);
                tmp1 = abs(tmp1) - float4(0.12, 0.085, 0.91, 0.0);
                tmp2.zw = ddx(tmp2.xy);
                tmp3.xy = ddy(tmp2.xy);
                tmp2.zw = abs(tmp2.zw) + abs(tmp3.xy);
                tmp2.xy = tmp2.xy / tmp2.zw;
                tmp2.xy = saturate(float2(1.0, 1.0) - tmp2.xy);
                tmp0.w = min(tmp2.y, tmp2.x);
                tmp2 = ddx(tmp1);
                tmp3 = ddy(tmp1);
                tmp2 = abs(tmp2) + abs(tmp3);
                tmp1 = tmp1 / tmp2;
                tmp1 = saturate(float4(1.0, 1.0, 1.0, 1.0) - tmp1);
                tmp1.xy = min(tmp1.yw, tmp1.xz);
                tmp1.z = _LinkOn_Off != 0.0;
                tmp0.w = tmp1.z ? tmp1.y : tmp0.w;
                tmp1.yzw = _EnvironmentPower.xxx * _EnvironmentColor.xyz;
                tmp2.xyz = -_EnvironmentPower.xxx * _EnvironmentColor.xyz + _EnvironmentPower.xxx;
                tmp1.xyz = tmp1.xxx * tmp2.xyz + tmp1.yzw;
                tmp2.xyz = _EnvironmentPower.xxx * float3(0.8980392, 0.8666667, 0.3254902) + -tmp1.xyz;
                tmp1.xyz = tmp0.www * tmp2.xyz + tmp1.xyz;
                tmp2.xyz = log(abs(_CardNameColor.xyz));
                tmp2.xyz = tmp2.xyz * float3(0.4166667, 0.4166667, 0.4166667);
                tmp2.xyz = pow(2.0, tmp2.xyz);
                tmp2.xyz = tmp2.xyz * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
                tmp3.xyz = _CardNameColor.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
                tmp4.xyz = _CardNameColor.xyz * float3(12.92321, 12.92321, 12.92321);
                tmp2.xyz = tmp3.xyz ? tmp4.xyz : tmp2.xyz;
                tmp2.xyz = _EnvironmentPower.xxx * tmp2.xyz + -tmp1.xyz;
                tmp1.xyz = tmp0.zzz * tmp2.xyz + tmp1.xyz;
                tmp2 = tex2Dbias(_KiraMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp0.z = tmp2.x * _IllustContrast + 1.0;
                tmp3 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp1.xyz = -tmp3.xyz * tmp0.zzz + tmp1.xyz;
                tmp2.yzw = tmp0.zzz * tmp3.xyz;
                tmp1.xyz = tmp0.xxx * tmp1.xyz + tmp2.yzw;
                tmp2.yzw = log(abs(_KiraColor.xyz));
                tmp2.yzw = tmp2.yzw * float3(0.4166667, 0.4166667, 0.4166667);
                tmp2.yzw = pow(2.0, tmp2.yzw);
                tmp2.yzw = tmp2.yzw * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
                tmp4.xyz = _KiraColor.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
                tmp5.xyz = _KiraColor.xyz * float3(12.92321, 12.92321, 12.92321);
                tmp2.yzw = tmp4.xyz ? tmp5.xyz : tmp2.yzw;
                tmp4 = tex2Dbias(_KiraColorTexture, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp5.xyw = tmp2.zwy * tmp4.yzx;
                tmp6.xy = tmp5.yx;
                tmp4.xy = tmp2.zw * tmp4.yz + -tmp6.xy;
                tmp0.w = tmp6.y >= tmp5.y;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp6.zw = float2(-1.0, 0.6666667);
                tmp4.zw = float2(1.0, -1.0);
                tmp4 = tmp0.wwww * tmp4 + tmp6;
                tmp0.w = tmp5.w >= tmp4.x;
                tmp0.w = uint1(tmp0.w) & uint1(1);
                tmp5.xyz = tmp4.xyw;
                tmp4.xyw = tmp5.wyx;
                tmp4 = tmp4 - tmp5;
                tmp4 = tmp0.wwww * tmp4 + tmp5;
                tmp0.w = tmp4.w - tmp4.y;
                tmp1.w = min(tmp4.y, tmp4.w);
                tmp1.w = tmp4.x - tmp1.w;
                tmp2.y = tmp1.w * 6.0 + 0.0;
                tmp0.w = tmp0.w / tmp2.y;
                tmp0.w = tmp0.w + tmp4.z;
                tmp2.y = sin(_Time.y);
                tmp2.yz = tmp2.yy + float2(0.5, -0.05);
                tmp0.w = tmp2.z * 0.1 + abs(tmp0.w);
                tmp2.y = saturate(tmp2.y);
                tmp2.z = tmp0.w > 1.0;
                tmp4.yz = tmp0.ww + float2(1.0, -1.0);
                tmp2.z = tmp2.z ? tmp4.z : tmp0.w;
                tmp0.w = tmp0.w < 0.0;
                tmp0.w = tmp0.w ? tmp4.y : tmp2.z;
                tmp4.yzw = tmp0.www + float3(1.0, 0.6666667, 0.3333333);
                tmp4.yzw = frac(tmp4.yzw);
                tmp4.yzw = tmp4.yzw * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                tmp4.yzw = saturate(abs(tmp4.yzw) - float3(1.0, 1.0, 1.0));
                tmp4.yzw = tmp4.yzw - float3(1.0, 1.0, 1.0);
                tmp0.w = tmp4.x + 0.0;
                tmp2.z = tmp1.w / tmp0.w;
                tmp1.w = tmp1.w == 0.0;
                tmp0.w = tmp1.w ? tmp4.x : tmp0.w;
                tmp4.xyz = tmp2.zzz * tmp4.yzw + float3(1.0, 1.0, 1.0);
                tmp4.xyz = tmp0.www * tmp4.xyz;
                tmp2.zw = float2(_Kira01Tile.x, _Kira02Tile.x) * float2(_Kira01Tile.x, _Kira02Tile.x);
                tmp5.xy = float2(1.00001, 1.00001) / tmp2.zw;
                tmp5.xy = frac(tmp5.xy);
                tmp2.zw = tmp2.zw * tmp5.xy;
                tmp2.zw = floor(tmp2.zw);
                tmp5.xy = tmp2.zw + float2(0.5, 0.5);
                tmp5.zw = float2(1.0, 1.0) / float2(_Kira01Tile.x, _Kira02Tile.x);
                tmp5.xy = tmp5.zw * tmp5.xy;
                tmp6.zw = floor(tmp5.xy);
                tmp2.zw = -float2(_Kira01Tile.x, _Kira02Tile.x) * tmp6.zw + tmp2.zw;
                tmp2.zw = tmp2.zw + float2(1.0, 1.0);
                tmp6.xy = float2(_Kira01Tile.x, _Kira02Tile.x) - tmp2.zw;
                tmp6 = tmp6.xzyw + inp.interp.xyxy;
                tmp5 = tmp6 * tmp5.zzww + float4(-0.5, -0.5, -0.5, -0.5);
                tmp0.w = -_Time.y * 0.25 + 1.0;
                tmp6.x = sin(tmp0.w);
                tmp7.x = cos(tmp0.w);
                tmp7.yz = tmp6.xx;
                tmp6.xyz = tmp7.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                tmp6.xyz = tmp6.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                tmp7.x = dot(tmp5.zw, tmp6.xz);
                tmp7.y = dot(tmp5.wz, tmp6.xy);
                tmp2.zw = tmp7.xy + float2(0.5, 0.5);
                tmp2.zw = tmp2.zw * float2(0.5, 0.5) + float2(0.25, 0.25);
                tmp6 = tex2Dbias(_KiraNormal01, float4(tmp2.zw, 0, _GlobalMipBias.x));
                tmp6.x = tmp6.x * tmp6.w;
                tmp6.xy = tmp6.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp0.w = dot(tmp6.xy, tmp6.xy);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp6.z = max(tmp0.w, 0.0);
                tmp6.xyz = saturate(tmp6.xyz);
                tmp6.xyz = tmp6.xyz - float3(0.0, 0.0, 1.0);
                tmp6.xyz = _KiraNormal02Power.xxx * tmp6.xyz + float3(0.0, 0.0, 1.0);
                tmp2.zw = _Time.yx * float2(0.25, 2.5);
                tmp7.x = sin(tmp2.z);
                tmp8.x = cos(tmp2.z);
                tmp9.x = sin(tmp2.w);
                tmp8.yz = tmp7.xx;
                tmp7.xyz = tmp8.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                tmp7.xyz = tmp7.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                tmp8.x = dot(tmp5.xy, tmp7.xz);
                tmp8.y = dot(tmp5.yx, tmp7.xy);
                tmp2.zw = tmp8.xy + float2(0.5, 0.5);
                tmp2.zw = tmp2.zw * float2(0.5, 0.5) + float2(0.25, 0.25);
                tmp5 = tex2Dbias(_KiraNormal01, float4(tmp2.zw, 0, _GlobalMipBias.x));
                tmp5.x = tmp5.x * tmp5.w;
                tmp7.xy = tmp5.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp5.xy = tmp5.xy + tmp5.xy;
                tmp0.w = dot(tmp7.xy, tmp7.xy);
                tmp0.w = min(tmp0.w, 1.0);
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = sqrt(tmp0.w);
                tmp7.z = max(tmp0.w, 0.0);
                tmp7.xyw = saturate(tmp7.xyz);
                tmp5.z = tmp7.z;
                tmp5.xyz = tmp5.xyz - float3(1.0, 1.0, 1.0);
                tmp5.xyz = _CardDistortion.xxx * tmp5.xyz + float3(0.0, 0.0, 1.0);
                tmp7.xyz = tmp7.xyw - float3(0.0, 0.0, 1.0);
                tmp7.xyz = _KiraNormal01Power.xxx * tmp7.xyz + float3(0.0, 0.0, 1.0);
                tmp8.xy = tmp6.xy + tmp7.xy;
                tmp8.z = tmp6.z * tmp7.z;
                tmp0.w = dot(tmp8.xyz, tmp8.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp6.xyz = tmp0.www * tmp8.xyz;
                tmp0.w = dot(tmp6.xyz, tmp6.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp1.w = dot(inp.interp4.xyz, inp.interp4.xyz);
                tmp1.w = sqrt(tmp1.w);
                tmp1.w = 1.0 / tmp1.w;
                tmp7.xyz = tmp1.www * inp.interp4.xyz;
                tmp8.xyz = -tmp1.www * inp.interp4.xyz + _FakeNormalDirection;
                tmp7.xyz = _FakeBlend.xxx * tmp8.xyz + tmp7.xyz;
                tmp8.xyz = _WorldSpaceCameraPos - inp.interp3.xyz;
                tmp1.w = dot(tmp8.xyz, tmp8.xyz);
                tmp1.w = rsqrt(tmp1.w);
                tmp8.xyz = tmp1.www * tmp8.xyz;
                tmp1.w = unity_OrthoParams.w == 0.0;
                tmp10.x = tmp1.w ? tmp8.x : unity_MatrixV._m20;
                tmp10.y = tmp1.w ? tmp8.y : unity_MatrixV._m21;
                tmp10.z = tmp1.w ? tmp8.z : unity_MatrixV._m22;
                tmp8.xyz = _FakeViewDirection - tmp10.xyz;
                tmp8.xyz = _FakeBlend.xxx * tmp8.xyz + tmp10.xyz;
                tmp10.xyz = _FakeLightDirection - _MainLightPosition.xyz;
                tmp10.xyz = _FakeBlend.xxx * tmp10.xyz + _MainLightPosition.xyz;
                tmp11.xyz = tmp8.xyz + tmp10.xyz;
                tmp1.w = dot(tmp11.xyz, tmp11.xyz);
                tmp1.w = rsqrt(tmp1.w);
                tmp11.xyz = tmp1.www * tmp11.xyz;
                tmp1.w = dot(tmp11.xyz, tmp7.xyz);
                tmp7.xyz = tmp7.xyz + float3(0.0, 0.0, 1.0);
                tmp1.w = tmp1.w * _HoloShift;
                tmp11 = tex2Dbias(_HoloTex, float4(tmp1.ww, 0, _GlobalMipBias.x));
                tmp11.x = tmp11.x * tmp11.w;
                tmp2.zw = tmp11.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp11.xy = tmp6.xy * tmp0.ww + tmp2.zw;
                tmp1.w = dot(tmp2.zw, tmp2.zw);
                tmp1.w = min(tmp1.w, 1.0);
                tmp1.w = 1.0 - tmp1.w;
                tmp1.w = sqrt(tmp1.w);
                tmp1.w = max(tmp1.w, 0.0);
                tmp2.z = tmp0.w * tmp6.z;
                tmp11.z = tmp1.w * tmp2.z;
                tmp1.w = dot(tmp11.xyz, tmp11.xyz);
                tmp1.w = max(tmp1.w, 8388608.0);
                tmp1.w = rsqrt(tmp1.w);
                tmp2.w = tmp1.w * tmp11.z;
                tmp11.xy = tmp11.xy * tmp1.ww + tmp5.xy;
                tmp11.z = tmp2.w * tmp5.z;
                tmp1.w = dot(tmp11.xyz, tmp11.xyz);
                tmp1.w = max(tmp1.w, 8388608.0);
                tmp1.w = rsqrt(tmp1.w);
                tmp5.xyz = tmp1.www * tmp11.xyz;
                tmp5.yw = tmp5.yy * unity_MatrixV._m01_m11;
                tmp5.xy = unity_MatrixV._m00_m10 * tmp5.xx + tmp5.yw;
                tmp5.xy = unity_MatrixV._m02_m12 * tmp5.zz + tmp5.xy;
                tmp5.xy = tmp5.xy + unity_MatrixV._m03_m13;
                tmp5 = tex2Dbias(_HoloTex, float4(tmp5.xy, 0, _GlobalMipBias.x));
                tmp11.xyz = float3(1.0, 1.0, 1.0) - tmp5.xyz;
                tmp11.xyz = tmp11.xyz + tmp11.xyz;
                tmp1.w = 1.0 - _HoloBrightness;
                tmp11.xyz = -tmp11.xyz * tmp1.www + float3(1.0, 1.0, 1.0);
                tmp12.xyz = tmp5.xyz <= float3(0.5, 0.5, 0.5);
                tmp5.xyz = tmp5.xyz * _HoloBrightness.xxx;
                tmp5.xyz = tmp5.xyz + tmp5.xyz;
                tmp13.xyz = tmp12.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                tmp12.xyz = uint3(tmp12.xyz) & uint3(int3(1, 1, 1));
                tmp11.xyz = tmp11.xyz * tmp13.xyz;
                tmp5.xyz = saturate(tmp5.xyz * tmp12.xyz + tmp11.xyz);
                tmp5.xyz = tmp5.zzz + tmp5.xyz;
                tmp4.xyz = tmp4.xyz * tmp5.xyz;
                tmp4.xyz = tmp4.xyz * _IllustHoloPower.xxx;
                tmp5.xy = _Time.yx * float2(2.5, 2.5) + float2(2.09439, 4.18878);
                tmp9.yz = sin(tmp5.xy);
                tmp5.xyz = tmp9.xyz + float3(3.0, 3.0, 3.0);
                tmp5.xyz = tmp5.xyz * float3(0.2, 0.2, 0.2) + -tmp3.xyz;
                tmp1.w = dot(tmp5.xyz, tmp5.xyz);
                tmp1.w = sqrt(tmp1.w);
                tmp1.w = saturate(-_EnhanceColorThreshold * tmp1.w + 1.0);
                tmp1.w = dot(tmp1.ww, _IllustRanbowPower.xx);
                tmp4.xyz = tmp1.www * tmp4.xyz;
                tmp5.xyz = tmp3.xyz * tmp0.zzz + -tmp4.xyz;
                tmp3.xyz = tmp3.xyz + _AmbientColor.xyz;
                tmp0.z = 1.0 - tmp2.x;
                tmp4.xyz = tmp0.zzz * tmp5.xyz + tmp4.xyz;
                tmp0.z = tmp2.x - 0.2176376;
                tmp0.z = saturate(tmp0.z * 10.0 + 0.2176376);
                tmp4.xyz = tmp0.zzz * _IllustBrightness.xxx + tmp4.xyz;
                tmp4.xyz = tmp4.xyz + _AmbientColor.xyz;
                tmp1.xyz = tmp1.xyz - tmp4.xyz;
                tmp1.xyz = tmp0.xxx * tmp1.xyz + tmp4.xyz;
                tmp0.z = dot(tmp8.xyz, tmp8.xyz);
                tmp0.z = max(tmp0.z, 8388608.0);
                tmp0.z = rsqrt(tmp0.z);
                tmp4.xyz = tmp8.xyz * tmp0.zzz + tmp10.xyz;
                tmp0.z = dot(tmp4.xyz, tmp4.xyz);
                tmp0.z = max(tmp0.z, 8388608.0);
                tmp0.z = rsqrt(tmp0.z);
                tmp4.xyz = tmp0.zzz * tmp4.xyz;
                tmp5 = tex2Dbias(_MainNormal, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp5.x = tmp5.x * tmp5.w;
                tmp5.zw = tmp5.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                tmp8.xy = tmp5.xy + tmp5.xy;
                tmp0.z = dot(tmp5.zw, tmp5.zw);
                tmp0.z = min(tmp0.z, 1.0);
                tmp0.z = 1.0 - tmp0.z;
                tmp0.z = sqrt(tmp0.z);
                tmp8.z = max(tmp0.z, 0.0);
                tmp5.xyz = tmp8.xyz - float3(1.0, 1.0, 1.0);
                tmp5.xyz = _MainNormalPower.xxx * tmp5.xyz + float3(0.0, 0.0, 1.0);
                tmp6.xy = tmp6.xy * tmp0.ww + tmp5.xy;
                tmp6.z = tmp2.z * tmp5.z;
                tmp0.z = dot(tmp6.xyz, tmp6.xyz);
                tmp0.z = max(tmp0.z, 8388608.0);
                tmp0.z = rsqrt(tmp0.z);
                tmp5.xyz = tmp0.zzz * tmp6.xyz;
                tmp5.xyz = tmp5.xyz * float3(-1.0, -1.0, 1.0);
                tmp0.z = dot(tmp7.xyz, tmp5.xyz);
                tmp6.xyz = tmp7.xyz / tmp7.zzz;
                tmp5.xyz = tmp6.xyz * tmp0.zzz + -tmp5.xyz;
                tmp0.z = dot(tmp5.xyz, tmp5.xyz);
                tmp0.z = rsqrt(tmp0.z);
                tmp6.xyz = tmp0.zzz * tmp5.xyz;
                tmp0.z = saturate(dot(tmp5.xyz, tmp10.xyz));
                tmp0.w = saturate(dot(tmp6.xyz, tmp4.xyz));
                tmp0.w = log(tmp0.w);
                tmp1.w = _Smoothness * 10.0 + 1.0;
                tmp1.w = pow(2.0, tmp1.w);
                tmp0.w = tmp0.w * tmp1.w;
                tmp0.w = pow(2.0, tmp0.w);
                tmp1.w = _KiraMetal - _MainTexMetal;
                tmp1.w = tmp2.x * tmp1.w + _MainTexMetal;
                tmp2.x = tmp2.x * 100.0;
                tmp2.x = max(tmp2.x, 0.0);
                tmp2.x = min(tmp2.y, tmp2.x);
                tmp2.y = _FrameMetal - tmp1.w;
                tmp0.x = tmp0.x * tmp2.y + tmp1.w;
                tmp2.yzw = tmp0.xxx * _SpecularColor.xyz;
                tmp2.yzw = tmp0.www * tmp2.yzw;
                tmp4.xyz = _FakeLightColor.xyz - _MainLightColor.xyz;
                tmp4.xyz = _FakeBlend.xxx * tmp4.xyz + _MainLightColor.xyz;
                tmp4.xyz = tmp4.xyz * _DirectionalLightAmp.xxx;
                tmp2.yzw = tmp2.yzw * tmp4.xyz;
                tmp0.xzw = tmp0.zzz * _DirectionalLightAmp.xxx + tmp2.yzw;
                tmp0.xzw = tmp0.xzw + _AmbientColor.xyz;
                tmp0.xyz = tmp0.xzw * tmp1.xyz + tmp0.yyy;
                tmp1.xyz = tmp3.xyz - tmp0.xyz;
                tmp0.xyz = tmp2.xxx * tmp1.xyz + tmp0.xyz;
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
