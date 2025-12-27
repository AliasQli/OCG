Shader "Shader Graphs/NormalStyle3D" {
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
            // // "RenderPipeline"="UniversalPipeline"
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
                // // "RenderPipeline"="UniversalPipeline"
                "RenderType"="Transparent"
                "ShaderGraphShader"="true"
                "ShaderGraphTargetId"="UniversalUnlitSubTarget"
                "UniversalMaterialType"="Unlit"
            }
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag

            

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
                float4 interp : INTERP;  // uv
                float3 interp1 : INTERP1; // worldpos
                float3 interp2 : INTERP2; // worldnormal
            };

            // CBs for DX11VertexSM40
            // Textures for DX11VertexSM40

            v2f vert(appdata v)
            {
                v2f o;
                // tmp0.xyz = v.vertex.yyy * unity_ObjectToWorld._m01_m11_m21;
                float3 tmp0_xyz_0 = v.vertex.yyy * unity_ObjectToWorld._m01_m11_m21;
                // tmp0.xyz = unity_ObjectToWorld._m00_m10_m20 * v.vertex.xxx + tmp0.xyz;
                float3 tmp0_xyz_1 = unity_ObjectToWorld._m00_m10_m20 * v.vertex.xxx + tmp0_xyz_0;
                // tmp0.xyz = unity_ObjectToWorld._m02_m12_m22 * v.vertex.zzz + tmp0.xyz;
                float3 tmp0_xyz_2 = unity_ObjectToWorld._m02_m12_m22 * v.vertex.zzz + tmp0_xyz_1;
                // tmp0.xyz = tmp0.xyz + unity_ObjectToWorld._m03_m13_m23;
                float3 tmp0_xyz_3 = tmp0_xyz_2 + unity_ObjectToWorld._m03_m13_m23;
                // o.interp1.xyz = tmp0.xyz;
                o.interp1.xyz = tmp0_xyz_3;

                // tmp1 = tmp0.yyyy * unity_MatrixVP._m01_m11_m21_m31;
                float4 tmp1_xyzw_4 = tmp0_xyz_3.yyyy * unity_MatrixVP._m01_m11_m21_m31;
                // tmp1 = unity_MatrixVP._m00_m10_m20_m30 * tmp0.xxxx + tmp1;
                float4 tmp1_xyzw_5 = unity_MatrixVP._m00_m10_m20_m30 * tmp0_xyz_3.xxxx + tmp1_xyzw_4;
                // tmp1 = unity_MatrixVP._m02_m12_m22_m32 * tmp0.zzzz + tmp1;
                float4 tmp1_xyzw_6 = unity_MatrixVP._m02_m12_m22_m32 * tmp0_xyz_3.zzzz + tmp1_xyzw_5;
                // o.position = tmp1 + unity_MatrixVP._m03_m13_m23_m33;
                o.position = tmp1_xyzw_6 + unity_MatrixVP._m03_m13_m23_m33;

                // o.interp = v.texcoord;
                o.interp = v.texcoord;

                // tmp0.x = dot(v.normal.xyz, unity_WorldToObject._m00_m10_m20);
                float tmp0_x_7 = dot(v.normal.xyz, unity_WorldToObject._m00_m10_m20);
                // tmp0.y = dot(v.normal.xyz, unity_WorldToObject._m01_m11_m21);
                float tmp0_y_8 = dot(v.normal.xyz, unity_WorldToObject._m01_m11_m21);
                // tmp0.z = dot(v.normal.xyz, unity_WorldToObject._m02_m12_m22);
                float tmp0_z_9 = dot(v.normal.xyz, unity_WorldToObject._m02_m12_m22);
                // tmp0.w = dot(tmp0.xyz, tmp0.xyz);
                float tmp0_w_10 = dot(float3(tmp0_x_7, tmp0_y_8, tmp0_z_9), float3(tmp0_x_7, tmp0_y_8, tmp0_z_9));
                // tmp0.w = max(tmp0.w, 8388608.0);
                float tmp0_w_11 = max(tmp0_w_10, 8388608.0);
                // tmp0.w = rsqrt(tmp0.w);
                float tmp0_w_12 = rsqrt(tmp0_w_11);
                // o.interp2.xyz = tmp0.www * tmp0.xyz;
                o.interp2.xyz = tmp0_w_12.xxx * float3(tmp0_x_7, tmp0_y_8, tmp0_z_9);
                return o;
            }

            struct fout
            {
                float4 sv_target : SV_Target;
            };

            // CBs for DX11PixelSM40
            float2 _GlobalMipBias; // 64 (starting at cb0[4].x)
            float4 _MainLightPosition; // 80 (starting at cb0[5].x)
            float4 _TimeParameters; // 304 (starting at cb0[19].x)
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
            float _isFade; // 192 (starting at cb1[12].x)
            // Textures for DX11PixelSM40
            sampler2D _Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D; // 0
            sampler2D _MainTex; // 1
            sampler2D _LoadingTex; // 2

            fout frag(v2f inp)
            {
                fout o;
                // tmp0.x = dot(inp.interp2.xyz, inp.interp2.xyz);
                // tmp0.x = sqrt(tmp0.x);
                // tmp0.x = 1.0 / tmp0.x;
                // tmp0.yzw = tmp0.xxx * inp.interp2.xyz;
                // tmp1.xyz = -tmp0.xxx * inp.interp2.xyz + _FakeNormalDirection;
                // tmp0.xyz = _FakeBlend.xxx * tmp1.xyz + tmp0.yzw;
                float3 normalDir = lerp(normalize(inp.interp2.xyz), _FakeNormalDirection.xyz, _FakeBlend);
                // tmp1.xyz = _FakeLightDirection - _MainLightPosition.xyz;
                // tmp1.xyz = _FakeBlend.xxx * tmp1.xyz + _MainLightPosition.xyz;
                float3 lightDir = lerp(_WorldSpaceLightPos0.xyz, _FakeLightDirection.xyz, _FakeBlend);
                // tmp0.x = saturate(dot(tmp0.xyz, tmp1.xyz));
                // tmp0.xyz = tmp0.xxx * _DirectionalLightAmp.xxx + _AmbientColor.xyz;
                float3 ambAndDiff = saturate(dot(normalDir, lightDir)) * _DirectionalLightAmp + _AmbientColor.xyz;
                // tmp1 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // tmp1.xyz = tmp1.xyz + _AmbientColor.xyz;
                float3 mainColor = (float3)tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x)) + _AmbientColor.xyz;
                // tmp0.xyz = tmp0.xyz * tmp1.xyz;
                float3 ambAndDiffColor = ambAndDiff * mainColor;
                // same
                // tmp1 = tex2Dbias(_LoadingTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 loadingColor = tex2Dbias(_LoadingTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // tmp0.w = 1.0;
                // tmp1 = tmp1 - tmp0;
                // tmp0 = _LoadingBlend.xxxx * tmp1 + tmp0;
                float3 loadingBlendedColor = lerp(ambAndDiffColor, loadingColor.rgb, _LoadingBlend);
                // tmp1.x = dot(tmp0.xyz, float4(0.299, 0.587, 0.114, 0.0));
                float mostMonochrome = dot(loadingBlendedColor, float3(0.299, 0.587, 0.114));
                // tmp1.xyz = tmp1.xxx - tmp0.xyz;
                // tmp1.w = 0.0;
                // tmp0 = _Monochrome.xxxx * tmp1 + tmp0;
                float3 monoColor = lerp(loadingBlendedColor, mostMonochrome.xxx, _Monochrome);
                // tmp0 = tmp0.yzwx * _TintColor;
                // tmp1.xyz = tmp0.wxy;
                // tmp1.w = 1.0;
                // tmp1 = tmp1 * _AddColor;
                // tmp2 = tex2Dbias(_Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 textureColor = tex2Dbias(_Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // tmp0.w = tmp2.x;
                float textureMask = textureColor.r;
                // tmp1 = tmp0.wwwz * tmp1;
                // tmp0.x = 2.0;
                // tmp0 = tmp1 * tmp0.xxxw;
                float4 maskedColor = textureMask * _AddColor * _TintColor.wxyz * float4(monoColor, 1) * float4(2.0, 2.0, 2.0, 1.0);
                // tmp1.x = _Time.y + _Time.y;
                // tmp1.x = sin(tmp1.x);
                // tmp1.x = tmp1.x + 1.0;
                // tmp1.x = tmp1.x * 0.2 + 0.5;
                float timeFactor = (sin(2 * _Time.y) + 1.0) * 0.2 + 0.5;
                // tmp1 = tmp0 * tmp1.xxxx;
                // tmp2.x = _isFade != 0.0;
                // o.sv_target = tmp2.xxxx ? tmp1 : tmp0;
                o.sv_target = _isFade != 0.0 ? maskedColor * timeFactor : maskedColor;
                // o.sv_target = textureColor;
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
        //         // // "RenderPipeline"="UniversalPipeline"
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
        // // Pass {
        // //     Name "MotionVectors"
        // //     ColorMask GB
        // //     ZClip On
        // //     Tags {
        // //         "DisableBatching"="False"
        // //         "LIGHTMODE"="MOTIONVECTORS"
        // //         "QUEUE"="Transparent"
        // //         // // "RenderPipeline"="UniversalPipeline"
        // //         "RenderType"="Transparent"
        // //         "ShaderGraphShader"="true"
        // //         "ShaderGraphTargetId"="UniversalUnlitSubTarget"
        // //         "UniversalMaterialType"="Unlit"
        // //     }
        // //     CGPROGRAM
            
        // //     #pragma vertex vert
        // //     #pragma fragment frag

            

        // //     struct appdata
        // //     {
        // //         float3 vertex : POSITION;
        // //         float3 normal : NORMAL;
        // //         float4 texcoord : TEXCOORD;
        // //         float3 texcoord4 : TEXCOORD4;
        // //     };
        // //     struct v2f
        // //     {
        // //         float3 clip_position_no_jitter : CLIP_POSITION_NO_JITTER;
        // //         float3 previous_clip_position_no_jitter : PREVIOUS_CLIP_POSITION_NO_JITTER;
        // //         float4 position : SV_POSITION;
        // //         float4 interp : INTERP;
        // //         float3 interp1 : INTERP1;
        // //         float3 interp2 : INTERP2;
        // //     };

        // //     // CBs for DX11VertexSM40
        // //     float4x4 _PrevViewProjMatrix; // 1424 (starting at cb0[89].x)
        // //     float4x4 _NonJitteredViewProjMatrix; // 1488 (starting at cb0[93].x)
        // //     // CBUFFER_START(UnityPerDraw) // 1
        // //         float4x4 unity_MatrixPreviousM; // 544 (starting at cb1[34].x)
        // //     // CBUFFER_END
        // //     float4 unity_MotionVectorsParams; // 672 (starting at cb1[42].x)
        // //     // Textures for DX11VertexSM40

        // //     v2f vert(appdata v)
        // //     {
        // //         v2f o;
        // //         float4 tmp0;
        // //         float4 tmp1;
        // //         float4 tmp2;
        // //         tmp0.xyz = v.vertex.yyy * unity_ObjectToWorld._m01_m11_m21;
        // //         tmp0.xyz = unity_ObjectToWorld._m00_m10_m20 * v.vertex.xxx + tmp0.xyz;
        // //         tmp0.xyz = unity_ObjectToWorld._m02_m12_m22 * v.vertex.zzz + tmp0.xyz;
        // //         tmp0.xyz = tmp0.xyz + unity_ObjectToWorld._m03_m13_m23;
        // //         tmp1.x = dot(v.normal.xyz, unity_WorldToObject._m00_m10_m20);
        // //         tmp1.y = dot(v.normal.xyz, unity_WorldToObject._m01_m11_m21);
        // //         tmp1.z = dot(v.normal.xyz, unity_WorldToObject._m02_m12_m22);
        // //         tmp0.w = dot(tmp1.xyz, tmp1.xyz);
        // //         tmp0.w = max(tmp0.w, 8388608.0);
        // //         tmp0.w = rsqrt(tmp0.w);
        // //         o.interp2.xyz = tmp0.www * tmp1.xyz;
        // //         tmp1 = tmp0.yyyy * unity_MatrixVP._m01_m11_m21_m31;
        // //         tmp1 = unity_MatrixVP._m00_m10_m20_m30 * tmp0.xxxx + tmp1;
        // //         tmp1 = unity_MatrixVP._m02_m12_m22_m32 * tmp0.zzzz + tmp1;
        // //         o.position = tmp1 + unity_MatrixVP._m03_m13_m23_m33;
        // //         tmp0.w = unity_MotionVectorsParams.y != 0.0;
        // //         if (tmp0.w) {
        // //             tmp0.w = unity_MotionVectorsParams.x == 1.0;
        // //             tmp1.xyz = tmp0.www ? v.texcoord4.xyz : v.vertex.xyz;
        // //             tmp2.xyz = tmp0.yyy * _NonJitteredViewProjMatrix._m01_m11_m31;
        // //             tmp2.xyz = _NonJitteredViewProjMatrix._m00_m10_m30 * tmp0.xxx + tmp2.xyz;
        // //             tmp2.xyz = _NonJitteredViewProjMatrix._m02_m12_m32 * tmp0.zzz + tmp2.xyz;
        // //             o.clip_position_no_jitter.xyz = tmp2.xyz + _NonJitteredViewProjMatrix._m03_m13_m33;
        // //             tmp2 = tmp1.yyyy * unity_MatrixPreviousM._m01_m11_m21_m31;
        // //             tmp2 = unity_MatrixPreviousM._m00_m10_m20_m30 * tmp1.xxxx + tmp2;
        // //             tmp1 = unity_MatrixPreviousM._m02_m12_m22_m32 * tmp1.zzzz + tmp2;
        // //             tmp1 = tmp1 + unity_MatrixPreviousM._m03_m13_m23_m33;
        // //             tmp2.xyz = tmp1.yyy * _PrevViewProjMatrix._m01_m11_m31;
        // //             tmp2.xyz = _PrevViewProjMatrix._m00_m10_m30 * tmp1.xxx + tmp2.xyz;
        // //             tmp1.xyz = _PrevViewProjMatrix._m02_m12_m32 * tmp1.zzz + tmp2.xyz;
        // //             o.previous_clip_position_no_jitter.xyz = _PrevViewProjMatrix._m03_m13_m33 * tmp1.www + tmp1.xyz;
        // //         } else {
        // //             o.clip_position_no_jitter.xyz = float3(0.0, 0.0, 0.0);
        // //             o.previous_clip_position_no_jitter.xyz = float3(0.0, 0.0, 0.0);
        // //         }
        // //         o.interp = v.texcoord;
        // //         o.interp1.xyz = tmp0.xyz;
        // //         return o;
        // //     }

        // //     struct fout
        // //     {
        // //         float4 sv_target : SV_Target;
        // //     };

        // //     // CBs for DX11PixelSM40
        // //     // CBUFFER_START(UnityPerDraw) // 0
        // //     // CBUFFER_END
        // //     // Textures for DX11PixelSM40

        // //     fout frag(v2f inp)
        // //     {
        // //         fout o;
        // //         float4 tmp0;
        // //         tmp0.x = 1.0 / inp.previous_clip_position_no_jitter.z;
        // //         tmp0.xy = tmp0.xx * inp.previous_clip_position_no_jitter.xy;
        // //         tmp0.z = 1.0 / inp.clip_position_no_jitter.z;
        // //         tmp0.xy = inp.clip_position_no_jitter.xy * tmp0.zz + -tmp0.xy;
        // //         tmp0.xy = tmp0.xy * float2(0.5, -0.5);
        // //         tmp0.z = unity_MotionVectorsParams.y != 0.0;
        // //         o.sv_target.xy = uint2(tmp0.xy) & uint2(tmp0.zz);
        // //         o.sv_target.zw = float2(0.0, 0.0);
        // //         return o;
        // //     }
        // //     ENDCG
            
        // // }
        // Pass {
        //     Name "DepthNormalsOnly"
        //     ZClip On
        //     Tags {
        //         "DisableBatching"="False"
        //         "LIGHTMODE"="DepthNormalsOnly"
        //         "QUEUE"="Transparent"
        //         // // "RenderPipeline"="UniversalPipeline"
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
        //     // ColorMask 0
        //     ZClip On
        //     Tags {
        //         "DisableBatching"="False"
        //         "LIGHTMODE"="SHADOWCASTER"
        //         "QUEUE"="Transparent"
        //         // // "RenderPipeline"="UniversalPipeline"
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
