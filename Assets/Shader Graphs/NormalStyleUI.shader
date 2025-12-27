// Upgrade NOTE: replaced 'glstate_matrix_projection' with 'UNITY_MATRIX_P'

Shader "Shader Graphs/NormalStyleUI" {
    Properties {
        [NoScaleOffset] _MainTex ("MainTex", 2D) = "white" {}
        [NoScaleOffset] _LoadingTex ("LoadingTex", 2D) = "white" {}
        _LoadingBlend ("LoadingBlend", Range(0, 1)) = 0
        _AmbientColor ("AmbientColor", Color) = (0.1019608, 0.1019608, 0.1019608, 1)
        _AddColor ("AddColor", Color) = (0.5019608, 0.5019608, 0.5019608, 1)
        _Monochrome ("Monochrome", Range(0, 1)) = 0
        _DirectionalLightAmp ("DirectionalLightAmp", Float) = 0.88
        _FakeLightColor ("FakeLightColor", Color) = (1, 0, 0, 1)
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
                float4 _ClipRect; // 224 (starting at cb2[14].x)
            // CBUFFER_END
            float _UIMaskSoftnessX; // 240 (starting at cb2[15].x)
            float _UIMaskSoftnessY; // 244 (starting at cb2[15].y)
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
                float4 _ClipRect; // 224 (starting at cb2[14].x)
            // CBUFFER_END
            float _UIMaskSoftnessX; // 240 (starting at cb2[15].x)
            float _UIMaskSoftnessY; // 244 (starting at cb2[15].y)
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
            float4 _TimeParameters; // 304 (starting at cb0[19].x)
            float _isFade; // 2128 (starting at cb0[133].x)
            // CBUFFER_START(UnityPerMaterial) // 1
            // CBUFFER_END
            float _LoadingBlend; // 48 (starting at cb1[3].x)
            float4 _AmbientColor; // 64 (starting at cb1[4].x)
            float4 _AddColor; // 80 (starting at cb1[5].x)
            float _Monochrome; // 96 (starting at cb1[6].x)
            float _DirectionalLightAmp; // 100 (starting at cb1[6].y)
            float3 _FakeLightDirection; // 128 (starting at cb1[8].x)
            float3 _FakeNormalDirection; // 160 (starting at cb1[10].x)
            float _FakeBlend; // 172 (starting at cb1[10].w)
            float4 _TintColor; // 176 (starting at cb1[11].x)
            // Textures for DX11PixelSM40
            sampler2D _Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D; // 0
            sampler2D _MainTex; // 1
            sampler2D _LoadingTex; // 2

            fout frag(v2f inp)
            {
                fout o;
                float4 tmp0;
                float4 tmp1;
                float4 tmp2;
                tmp0.x = dot(inp.interp4.xyz, inp.interp4.xyz);
                tmp0.x = sqrt(tmp0.x);
                tmp0.x = 1.0 / tmp0.x;
                tmp0.yzw = tmp0.xxx * inp.interp4.xyz;
                tmp1.xyz = -tmp0.xxx * inp.interp4.xyz + _FakeNormalDirection;
                tmp0.xyz = _FakeBlend.xxx * tmp1.xyz + tmp0.yzw;
                tmp1.xyz = _FakeLightDirection - _MainLightPosition.xyz;
                tmp1.xyz = _FakeBlend.xxx * tmp1.xyz + _MainLightPosition.xyz;
                tmp0.x = saturate(dot(tmp0.xyz, tmp1.xyz));
                tmp0.xyz = tmp0.xxx * _DirectionalLightAmp.xxx + _AmbientColor.xyz;
                tmp1 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp1.xyz = tmp1.xyz + _AmbientColor.xyz;
                tmp0.xyz = tmp0.xyz * tmp1.xyz;
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
            float4 _TimeParameters; // 304 (starting at cb0[19].x)
            float _isFade; // 2128 (starting at cb0[133].x)
            // CBUFFER_START(UnityPerMaterial) // 1
            // CBUFFER_END
            float _LoadingBlend; // 48 (starting at cb1[3].x)
            float4 _AmbientColor; // 64 (starting at cb1[4].x)
            float4 _AddColor; // 80 (starting at cb1[5].x)
            float _Monochrome; // 96 (starting at cb1[6].x)
            float _DirectionalLightAmp; // 100 (starting at cb1[6].y)
            float3 _FakeLightDirection; // 128 (starting at cb1[8].x)
            float3 _FakeNormalDirection; // 160 (starting at cb1[10].x)
            float _FakeBlend; // 172 (starting at cb1[10].w)
            float4 _TintColor; // 176 (starting at cb1[11].x)
            // Textures for DX11PixelSM40
            sampler2D _Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D; // 0
            sampler2D _MainTex; // 1
            sampler2D _LoadingTex; // 2

            fout frag(v2f inp)
            {
                fout o;
                float4 tmp0;
                float4 tmp1;
                float4 tmp2;
                tmp0.x = dot(inp.interp4.xyz, inp.interp4.xyz);
                tmp0.x = sqrt(tmp0.x);
                tmp0.x = 1.0 / tmp0.x;
                tmp0.yzw = tmp0.xxx * inp.interp4.xyz;
                tmp1.xyz = -tmp0.xxx * inp.interp4.xyz + _FakeNormalDirection;
                tmp0.xyz = _FakeBlend.xxx * tmp1.xyz + tmp0.yzw;
                tmp1.xyz = _FakeLightDirection - _MainLightPosition.xyz;
                tmp1.xyz = _FakeBlend.xxx * tmp1.xyz + _MainLightPosition.xyz;
                tmp0.x = saturate(dot(tmp0.xyz, tmp1.xyz));
                tmp0.xyz = tmp0.xxx * _DirectionalLightAmp.xxx + _AmbientColor.xyz;
                tmp1 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp1.xyz = tmp1.xyz + _AmbientColor.xyz;
                tmp0.xyz = tmp0.xyz * tmp1.xyz;
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
            float4 _TimeParameters; // 304 (starting at cb0[19].x)
            float _isFade; // 2128 (starting at cb0[133].x)
            // CBUFFER_START(UnityPerMaterial) // 1
                float _LoadingBlend; // 48 (starting at cb1[3].x)
            // CBUFFER_END
            float4 _AmbientColor; // 64 (starting at cb1[4].x)
            float4 _AddColor; // 80 (starting at cb1[5].x)
            float _Monochrome; // 96 (starting at cb1[6].x)
            float _DirectionalLightAmp; // 100 (starting at cb1[6].y)
            float3 _FakeLightDirection; // 128 (starting at cb1[8].x)
            float3 _FakeNormalDirection; // 160 (starting at cb1[10].x)
            float _FakeBlend; // 172 (starting at cb1[10].w)
            float4 _TintColor; // 176 (starting at cb1[11].x)
            // Textures for DX11PixelSM40
            sampler2D _Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D; // 0
            sampler2D _MainTex; // 1
            sampler2D _LoadingTex; // 2

            fout frag(v2f inp)
            {
                fout o;
                float4 tmp0;
                float4 tmp1;
                float4 tmp2;
                tmp0.x = dot(inp.interp4.xyz, inp.interp4.xyz);
                tmp0.x = sqrt(tmp0.x);
                tmp0.x = 1.0 / tmp0.x;
                tmp0.yzw = tmp0.xxx * inp.interp4.xyz;
                tmp1.xyz = -tmp0.xxx * inp.interp4.xyz + _FakeNormalDirection;
                tmp0.xyz = _FakeBlend.xxx * tmp1.xyz + tmp0.yzw;
                tmp1.xyz = _FakeLightDirection - _MainLightPosition.xyz;
                tmp1.xyz = _FakeBlend.xxx * tmp1.xyz + _MainLightPosition.xyz;
                tmp0.x = saturate(dot(tmp0.xyz, tmp1.xyz));
                tmp0.xyz = tmp0.xxx * _DirectionalLightAmp.xxx + _AmbientColor.xyz;
                tmp1 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp1.xyz = tmp1.xyz + _AmbientColor.xyz;
                tmp0.xyz = tmp0.xyz * tmp1.xyz;
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
            float4 _TimeParameters; // 304 (starting at cb0[19].x)
            float _isFade; // 2128 (starting at cb0[133].x)
            // CBUFFER_START(UnityPerMaterial) // 1
                float _LoadingBlend; // 48 (starting at cb1[3].x)
            // CBUFFER_END
            float4 _AmbientColor; // 64 (starting at cb1[4].x)
            float4 _AddColor; // 80 (starting at cb1[5].x)
            float _Monochrome; // 96 (starting at cb1[6].x)
            float _DirectionalLightAmp; // 100 (starting at cb1[6].y)
            float3 _FakeLightDirection; // 128 (starting at cb1[8].x)
            float3 _FakeNormalDirection; // 160 (starting at cb1[10].x)
            float _FakeBlend; // 172 (starting at cb1[10].w)
            float4 _TintColor; // 176 (starting at cb1[11].x)
            // Textures for DX11PixelSM40
            sampler2D _Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D; // 0
            sampler2D _MainTex; // 1
            sampler2D _LoadingTex; // 2

            fout frag(v2f inp)
            {
                fout o;
                float4 tmp0;
                float4 tmp1;
                float4 tmp2;
                tmp0.x = dot(inp.interp4.xyz, inp.interp4.xyz);
                tmp0.x = sqrt(tmp0.x);
                tmp0.x = 1.0 / tmp0.x;
                tmp0.yzw = tmp0.xxx * inp.interp4.xyz;
                tmp1.xyz = -tmp0.xxx * inp.interp4.xyz + _FakeNormalDirection;
                tmp0.xyz = _FakeBlend.xxx * tmp1.xyz + tmp0.yzw;
                tmp1.xyz = _FakeLightDirection - _MainLightPosition.xyz;
                tmp1.xyz = _FakeBlend.xxx * tmp1.xyz + _MainLightPosition.xyz;
                tmp0.x = saturate(dot(tmp0.xyz, tmp1.xyz));
                tmp0.xyz = tmp0.xxx * _DirectionalLightAmp.xxx + _AmbientColor.xyz;
                tmp1 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                tmp1.xyz = tmp1.xyz + _AmbientColor.xyz;
                tmp0.xyz = tmp0.xyz * tmp1.xyz;
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
