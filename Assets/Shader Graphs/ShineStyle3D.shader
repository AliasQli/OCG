Shader "Shader Graphs/ShineStyle3D" {
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
            float _isFade; // 588 (starting at cb1[36].w)
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

            fout pack(float3 color, float alpha)
            {
                fout o;
                o.sv_target = float4(color.rgb, alpha);
                return o;
            }

            fout frag(v2f inp)
            {
                fout o;
                // tmp0.x = _AttributeTile + 0.00001;
                float tmp0_x_0 = _AttributeTile + 0.00001;
                // tmp0.x = tmp0.x * 0.0625;
                float tmp0_x_1 = tmp0_x_0 * 0.0625;
                // tmp0.y = tmp0.x >= -tmp0.x;
                float tmp0_y_2 = tmp0_x_1 >= -tmp0_x_1;
                // tmp0.x = frac(abs(tmp0.x));
                float tmp0_x_3 = frac(abs(tmp0_x_1));
                // tmp0.x = tmp0.y ? tmp0.x : -tmp0.x;
                float tmp0_x_4 = tmp0_y_2 ? tmp0_x_3 : -tmp0_x_3;
                // tmp0.x = tmp0.x * 16.0;
                float tmp0_x_5 = tmp0_x_4 * 16.0;
                // tmp0.x = floor(tmp0.x);
                float tmp0_x_6 = floor(tmp0_x_5);
                // tmp0.y = tmp0.x + 0.5;
                float tmp0_y_7 = tmp0_x_6 + 0.5;
                // tmp0.y = tmp0.y * 0.25;
                float tmp0_y_8 = tmp0_y_7 * 0.25;
                // tmp0.y = floor(tmp0.y);
                float tmp0_y_9 = floor(tmp0_y_8);
                // tmp1.x = -tmp0.y * 4.0 + tmp0.x;
                float tmp1_x_10 = -tmp0_y_9 * 4.0 + tmp0_x_6;
                // tmp0.x = tmp0.y + 1.0;
                float tmp0_x_11 = tmp0_y_9 + 1.0;
                // tmp0.yz = _AttributeSize_Pos.xy * float2(0.5, 0.5) + float2(-0.5, -0.5);
                float2 tmp0_yz_12 = _AttributeSize_Pos.xy * float2(0.5, 0.5) + float2(-0.5, -0.5);
                // tmp0.yz = inp.interp.xy * _AttributeSize_Pos.xy + -tmp0.yz;
                float2 tmp0_yz_13 = inp.interp.xy * _AttributeSize_Pos.xy + -tmp0_yz_12;
                // tmp2.xy = tmp0.yz + _AttributeSize_Pos.zw;
                float2 tmp2_xy_14 = tmp0_yz_13 + _AttributeSize_Pos.zw;
                // tmp1.y = tmp2.y - tmp0.x;
                float tmp1_y_15 = tmp2_xy_14.y - tmp0_x_11;
                // tmp2.z = 4.0;
                float tmp2_z_16 = 4.0;
                // tmp0.xy = tmp1.xy + tmp2.xz;
                float2 tmp0_xy_17 = float2(tmp1_x_10, tmp1_y_15) + float2(tmp2_xy_14.x, tmp2_z_16);
                // tmp0.zw = tmp2.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 tmp0_zw_18 = tmp2_xy_14 * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // tmp0.zw = abs(tmp0.zw) - float2(1.0, 1.0);
                float2 tmp0_zw_19 = abs(tmp0_zw_18) - float2(1.0, 1.0);
                // tmp0.xy = tmp0.xy * float2(0.25, 0.25);
                float2 tmp0_xy_20 = tmp0_xy_17 * float2(0.25, 0.25);
                // tmp1 = tex2Dbias(_MonsterNameTex, float4(tmp0.xy, 0, _GlobalMipBias.x));
                float4 tmp1_xyzw_21 = tex2Dbias(_MonsterNameTex, float4(tmp0_xy_20, 0, _GlobalMipBias.x));
                // tmp0.xy = inp.interp.xy * float2(1.0, 5.0) + float2(0.0, -4.0);
                float2 tmp0_xy_22 = inp.interp.xy * float2(1.0, 5.0) + float2(0.0, -4.0);
                // tmp2 = tex2Dbias(_MonsterNameTex, float4(tmp0.xy, 0, _GlobalMipBias.x));
                float4 tmp2_xyzw_23 = tex2Dbias(_MonsterNameTex, float4(tmp0_xy_22, 0, _GlobalMipBias.x));
                // tmp0.x = saturate(_MonsterNameTextBold * tmp2.w + tmp2.w);
                float tmp0_x_24 = saturate(_MonsterNameTextBold * tmp2_xyzw_23.w + tmp2_xyzw_23.w);
                // tmp1.yz = ddx(tmp0.zw);
                float2 tmp1_yz_25 = ddx(tmp0_zw_19);
                // tmp2.xy = ddy(tmp0.zw);
                float2 tmp2_xy_26 = ddy(tmp0_zw_19);
                // tmp1.yz = abs(tmp1.yz) + abs(tmp2.xy);
                float2 tmp1_yz_27 = abs(tmp1_yz_25) + abs(tmp2_xy_26);
                // tmp0.yz = tmp0.zw / tmp1.yz;
                float2 tmp0_yz_28 = tmp0_zw_19 / tmp1_yz_27;
                // tmp0.yz = saturate(float2(1.0, 1.0) - tmp0.yz);
                float2 tmp0_yz_29 = saturate(float2(1.0, 1.0) - tmp0_yz_28);
                // tmp0.y = min(tmp0.z, tmp0.y);
                float tmp0_y_30 = min(tmp0_yz_29.y, tmp0_yz_29.x);
                // tmp0.x = tmp1.x * tmp0.y + tmp0.x;
                float tmp0_x_31 = tmp1_xyzw_21.x * tmp0_y_30 + tmp0_x_24;
                // tmp1 = tex2Dbias(_FrameMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 tmp1_xyzw_32 = tex2Dbias(_FrameMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // tmp0.x = tmp0.x + tmp1.x;
                float tmp0_x_33 = tmp0_x_31 + tmp1_xyzw_32.x;
                // tmp0.y = tmp0.x * _HighlightAmp;
                float tmp0_y_34 = tmp0_x_33 * _HighlightAmp;
                // tmp0.z = _HighlightRotation * 0.01745329;
                float tmp0_z_35 = _HighlightRotation * 0.01745329;
                // tmp1.x = sin(tmp0.z);
                float tmp1_x_36 = sin(tmp0_z_35);
                // tmp2.x = cos(tmp0.z);
                float tmp2_x_37 = cos(tmp0_z_35);
                // tmp2.y = tmp1.x;
                float tmp2_y_38 = tmp1_x_36;
                // tmp0.zw = tmp2.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                float2 tmp0_zw_39 = float2(tmp2_x_37, tmp2_y_38) * float2(0.5, 0.5) + float2(0.5, 0.5);
                // tmp0.zw = tmp0.zw * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 tmp0_zw_40 = tmp0_zw_39 * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // tmp1 = inp.interp.xyxy + float4(0.054, -0.421, -0.5, -0.5);
                float4 tmp1_xyzw_41 = inp.interp.xyxy + float4(0.054, -0.421, -0.5, -0.5);
                // tmp0.z = dot(tmp1.zw, tmp0.zw);
                float tmp0_z_42 = dot(tmp1_xyzw_41.zw, tmp0_zw_40);
                // tmp1.xy = tmp1.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 tmp1_xy_43 = tmp1_xyzw_41.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // tmp1.xy = abs(tmp1.xy) - float2(0.757, 0.062);
                float2 tmp1_xy_44 = abs(tmp1_xy_43) - float2(0.757, 0.062);
                // tmp0.z = tmp0.z + 0.5;
                float tmp0_z_45 = tmp0_z_42 + 0.5;
                // tmp0.w = _Time.y * _ScrollSpeed;
                float tmp0_w_46 = _Time.y * _ScrollSpeed;
                // tmp0.w = tmp0.w * -0.2 + _HighlightScrollOffset;
                float tmp0_w_47 = tmp0_w_46 * -0.2 + _HighlightScrollOffset;
                // tmp0.w = tmp0.w + 0.1;
                float tmp0_w_48 = tmp0_w_47 + 0.1;
                // tmp0.z = tmp0.z * 0.1 + tmp0.w;
                float tmp0_z_49 = tmp0_z_45 * 0.1 + tmp0_w_48;
                // tmp0.z = frac(tmp0.z);
                float tmp0_z_50 = frac(tmp0_z_49);
                // tmp0.w = 1.0 - tmp0.z;
                float tmp0_w_51 = 1.0 - tmp0_z_50;
                // tmp0.z = tmp0.w * tmp0.z + -0.08;
                float tmp0_z_52 = tmp0_w_51 * tmp0_z_50 + -0.08;
                // tmp0.z = tmp0.z * -10.0;
                float tmp0_z_53 = tmp0_z_52 * -10.0;
                // tmp0.z = max(tmp0.z, 0.0);
                float tmp0_z_54 = max(tmp0_z_53, 0.0);
                // tmp0.w = tmp0.z * -2.0 + 3.0;
                float tmp0_w_55 = tmp0_z_54 * -2.0 + 3.0;
                // tmp0.z = tmp0.z * tmp0.z;
                float tmp0_z_56 = tmp0_z_54 * tmp0_z_54;
                // tmp0.z = tmp0.z * tmp0.w;
                float tmp0_z_57 = tmp0_z_56 * tmp0_w_55;
                // tmp0.z = min(tmp0.z, 1.0);
                float tmp0_z_58 = min(tmp0_z_57, 1.0);
                // tmp0.y = tmp0.y * tmp0.z;
                float tmp0_y_59 = tmp0_y_34 * tmp0_z_58;
                // tmp2.xyz = log(abs(_KiraColor.xyz));
                float3 tmp2_xyz_60 = log(abs(_KiraColor.xyz));
                // tmp2.xyz = tmp2.xyz * float3(0.4166667, 0.4166667, 0.4166667);
                float3 tmp2_xyz_61 = tmp2_xyz_60 * float3(0.4166667, 0.4166667, 0.4166667);
                // tmp2.xyz = pow(2.0, tmp2.xyz);
                float3 tmp2_xyz_62 = pow(2.0, tmp2_xyz_61);
                // tmp2.xyz = tmp2.xyz * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
                float3 tmp2_xyz_63 = tmp2_xyz_62 * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
                // tmp3.xyz = _KiraColor.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
                float3 tmp3_xyz_64 = _KiraColor.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
                // tmp4.xyz = _KiraColor.xyz * float3(12.92321, 12.92321, 12.92321);
                float3 tmp4_xyz_65 = _KiraColor.xyz * float3(12.92321, 12.92321, 12.92321);
                // tmp2.xyz = tmp3.xyz ? tmp4.xyz : tmp2.xyz;
                float3 tmp2_xyz_66 = tmp3_xyz_64 ? tmp4_xyz_65 : tmp2_xyz_63;
                // tmp3 = tex2Dbias(_KiraColorTexture, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 tmp3_xyzw_67 = tex2Dbias(_KiraColorTexture, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // tmp4.xyw = tmp2.yzx * tmp3.yzx;
                float3 tmp4_xyw_68 = tmp2_xyz_66.yzx * tmp3_xyzw_67.yzx;
                // tmp5.xy = tmp4.yx;
                float2 tmp5_xy_69 = tmp4_xyw_68.yx;
                // tmp2.xy = tmp2.yz * tmp3.yz + -tmp5.xy;
                float2 tmp2_xy_70 = tmp2_xyz_66.yz * tmp3_xyzw_67.yz + -tmp5_xy_69;
                // tmp0.z = tmp5.y >= tmp4.y;
                float tmp0_z_71 = tmp5_xy_69.y >= tmp4_xyw_68.y;
                // tmp0.z = uint1(tmp0.z) & uint1(1);
                float tmp0_z_72 = uint1(tmp0_z_71) & uint1(1);
                // tmp5.zw = float2(-1.0, 0.6666667);
                float2 tmp5_zw_73 = float2(-1.0, 0.6666667);
                // tmp2.zw = float2(1.0, -1.0);
                float2 tmp2_zw_74 = float2(1.0, -1.0);
                // tmp2 = tmp0.zzzz * tmp2 + tmp5;
                float4 tmp2_xyzw_75 = tmp0_z_72.xxxx * float4(tmp2_xy_70, tmp2_zw_74) + float4(tmp5_xy_69, tmp5_zw_73);
                // tmp0.z = tmp4.w >= tmp2.x;
                float tmp0_z_76 = tmp4_xyw_68.z >= tmp2_xyzw_75.x;
                // tmp0.z = uint1(tmp0.z) & uint1(1);
                float tmp0_z_77 = uint1(tmp0_z_76) & uint1(1);
                // tmp4.xyz = tmp2.xyw;
                float3 tmp4_xyz_78 = tmp2_xyzw_75.xyw;
                // tmp2.xyw = tmp4.wyx;
                float3 tmp2_xyw_79 = float3(tmp4_xyw_68.z, tmp4_xyz_78.yx);
                // tmp2 = tmp2 - tmp4;
                float4 tmp2_xyzw_80 = float4(tmp2_xyw_79.xy, tmp2_xyzw_75.z, tmp2_xyw_79.z) - float4(tmp4_xyz_78, tmp4_xyw_68.z);    
                // tmp2 = tmp0.zzzz * tmp2 + tmp4;
                float4 tmp2_xyzw_81 = tmp0_z_77.xxxx * tmp2_xyzw_80 + float4(tmp4_xyz_78, tmp4_xyw_68.z);
                // tmp0.z = tmp2.w - tmp2.y;
                float tmp0_z_82 = tmp2_xyzw_81.w - tmp2_xyzw_81.y;
                // tmp0.w = min(tmp2.y, tmp2.w);
                float tmp0_w_83 = min(tmp2_xyzw_81.y, tmp2_xyzw_81.w);
                // tmp0.w = tmp2.x - tmp0.w;
                float tmp0_w_84 = tmp2_xyzw_81.x - tmp0_w_83;
                // tmp1.z = tmp0.w * 6.0 + 0.0;
                float tmp1_z_85 = tmp0_w_84 * 6.0 + 0.0;
                // tmp0.z = tmp0.z / tmp1.z;
                float tmp0_z_86 = tmp0_z_82 / tmp1_z_85;
                // tmp0.z = tmp0.z + tmp2.z;
                float tmp0_z_87 = tmp0_z_86 + tmp2_xyzw_81.z;
                // tmp1.z = sin(_Time.y);
                float tmp1_z_88 = sin(_Time.y);
                // tmp1.zw = tmp1.zz + float2(0.5, -0.05);
                float2 tmp1_zw_89 = tmp1_z_88.xx + float2(0.5, -0.05);
                // tmp0.z = tmp1.w * 0.1 + abs(tmp0.z);
                float tmp0_z_90 = tmp1_zw_89.y * 0.1 + abs(tmp0_z_87);
                // tmp1.z = saturate(tmp1.z);
                float tmp1_z_91 = saturate(tmp1_zw_89.x);
                // tmp1.w = tmp0.z > 1.0;
                float tmp1_w_92 = tmp0_z_90 > 1.0;
                // tmp2.yz = tmp0.zz + float2(1.0, -1.0);
                float2 tmp2_yz_93 = tmp0_z_90.xx + float2(1.0, -1.0);
                // tmp1.w = tmp1.w ? tmp2.z : tmp0.z;
                float tmp1_w_94 = tmp1_w_92 ? tmp2_yz_93.y : tmp0_z_90;
                // tmp0.z = tmp0.z < 0.0;
                float tmp0_z_95 = tmp0_z_90 < 0.0;
                // tmp0.z = tmp0.z ? tmp2.y : tmp1.w;
                float tmp0_z_96 = tmp0_z_95 ? tmp2_yz_93.x : tmp1_w_94;
                // tmp2.yzw = tmp0.zzz + float3(1.0, 0.6666667, 0.3333333);
                float3 tmp2_yzw_97 = tmp0_z_96.xxx + float3(1.0, 0.6666667, 0.3333333);
                // tmp2.yzw = frac(tmp2.yzw);
                float3 tmp2_yzw_98 = frac(tmp2_yzw_97);
                // tmp2.yzw = tmp2.yzw * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                float3 tmp2_yzw_99 = tmp2_yzw_98 * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                // tmp2.yzw = saturate(abs(tmp2.yzw) - float3(1.0, 1.0, 1.0));
                float3 tmp2_yzw_100 = saturate(abs(tmp2_yzw_99) - float3(1.0, 1.0, 1.0));
                // tmp2.yzw = tmp2.yzw - float3(1.0, 1.0, 1.0);
                float3 tmp2_yzw_101 = tmp2_yzw_100 - float3(1.0, 1.0, 1.0);
                // tmp0.z = tmp2.x + 0.0;
                float tmp0_z_102 = tmp2_xyzw_81.x + 0.0;
                // tmp1.w = tmp0.w / tmp0.z;
                float tmp1_w_103 = tmp0_w_84 / tmp0_z_102;
                // tmp0.w = tmp0.w == 0.0;
                float tmp0_w_104 = tmp0_w_84 == 0.0;
                // tmp0.z = tmp0.w ? tmp2.x : tmp0.z;
                float tmp0_z_105 = tmp0_w_104 ? tmp2_xyzw_81.x : tmp0_z_102;
                // tmp2.xyz = tmp1.www * tmp2.yzw + float3(1.0, 1.0, 1.0);
                float3 tmp2_xyz_106 = tmp1_w_103.xxx * tmp2_yzw_101 + float3(1.0, 1.0, 1.0);
                // tmp2.xyz = tmp0.zzz * tmp2.xyz;
                float3 tmp2_xyz_107 = tmp0_z_105.xxx * tmp2_xyz_106;
                // tmp0.zw = float2(_Kira01Tile.x, _Kira02Tile.x) * float2(_Kira01Tile.x, _Kira02Tile.x);
                float2 tmp0_zw_108 = float2(_Kira01Tile.x, _Kira02Tile.x) * float2(_Kira01Tile.x, _Kira02Tile.x);
                // tmp3.xy = float2(1.00001, 1.00001) / tmp0.zw;
                float2 tmp3_xy_109 = float2(1.00001, 1.00001) / tmp0_zw_108;
                // tmp3.xy = frac(tmp3.xy);
                float2 tmp3_xy_110 = frac(tmp3_xy_109);
                // tmp0.zw = tmp0.zw * tmp3.xy;
                float2 tmp0_zw_111 = tmp0_zw_108 * tmp3_xy_110;
                // tmp0.zw = floor(tmp0.zw);
                float2 tmp0_zw_112 = floor(tmp0_zw_111);
                // tmp3.xy = tmp0.zw + float2(0.5, 0.5);
                float2 tmp3_xy_113 = tmp0_zw_112 + float2(0.5, 0.5);
                // tmp3.zw = float2(1.0, 1.0) / float2(_Kira01Tile.x, _Kira02Tile.x);
                float2 tmp3_zw_114 = float2(1.0, 1.0) / float2(_Kira01Tile.x, _Kira02Tile.x);
                // tmp3.xy = tmp3.zw * tmp3.xy;
                float2 tmp3_xy_115 = tmp3_zw_114 * tmp3_xy_113;
                // tmp4.zw = floor(tmp3.xy);
                float2 tmp4_zw_116 = floor(tmp3_xy_115);
                // tmp0.zw = -float2(_Kira01Tile.x, _Kira02Tile.x) * tmp4.zw + tmp0.zw;
                float2 tmp0_zw_117 = -float2(_Kira01Tile.x, _Kira02Tile.x) * tmp4_zw_116 + tmp0_zw_112;
                // tmp0.zw = tmp0.zw + float2(1.0, 1.0);
                float2 tmp0_zw_118 = tmp0_zw_117 + float2(1.0, 1.0);
                // tmp4.xy = float2(_Kira01Tile.x, _Kira02Tile.x) - tmp0.zw;
                float2 tmp4_xy_119 = float2(_Kira01Tile.x, _Kira02Tile.x) - tmp0_zw_118;
                // tmp4 = tmp4.xzyw + inp.interp.xyxy;
                float4 tmp4_xyzw_120 = float4(tmp4_xy_119.x, tmp4_zw_116.x, tmp4_xy_119.y, tmp4_zw_116.y) + inp.interp.xyxy;
                // tmp3 = tmp4 * tmp3.zzww + float4(-0.5, -0.5, -0.5, -0.5);
                float4 tmp3_xyzw_121 = tmp4_xyzw_120 * tmp3_zw_114.xxyy + float4(-0.5, -0.5, -0.5, -0.5);
                // tmp0.z = -_Time.y * 0.25 + 1.0;
                float tmp0_z_122 = -_Time.y * 0.25 + 1.0;
                // tmp4.x = sin(tmp0.z);
                float tmp4_x_123 = sin(tmp0_z_122);
                // tmp5.x = cos(tmp0.z);
                float tmp5_x_124 = cos(tmp0_z_122);
                // tmp5.yz = tmp4.xx;
                float2 tmp5_yz_125 = tmp4_x_123.xx;
                // tmp4.xyz = tmp5.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                float3 tmp4_xyz_126 = float3(tmp5_x_124, tmp5_yz_125) * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                // tmp4.xyz = tmp4.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                float3 tmp4_xyz_127 = tmp4_xyz_126 * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                // tmp5.x = dot(tmp3.zw, tmp4.xz);
                float tmp5_x_128 = dot(tmp3_xyzw_121.zw, tmp4_xyz_127.xz);
                // tmp5.y = dot(tmp3.wz, tmp4.xy);
                float tmp5_y_129 = dot(tmp3_xyzw_121.wz, tmp4_xyz_127.xy);
                // tmp0.zw = tmp5.xy + float2(0.5, 0.5);
                float2 tmp0_zw_130 = float2(tmp5_x_128, tmp5_y_129) + float2(0.5, 0.5);
                // tmp0.zw = tmp0.zw * float2(0.5, 0.5) + float2(0.25, 0.25);
                float2 tmp0_zw_131 = tmp0_zw_130 * float2(0.5, 0.5) + float2(0.25, 0.25);
                // tmp4 = tex2Dbias(_KiraNormal01, float4(tmp0.zw, 0, _GlobalMipBias.x));
                float4 tmp4_xyzw_132 = tex2Dbias(_KiraNormal01, float4(tmp0_zw_131, 0, _GlobalMipBias.x));
                // tmp4.x = tmp4.x * tmp4.w;
                float tmp4_x_133 = tmp4_xyzw_132.x * tmp4_xyzw_132.w;
                // tmp4.xy = tmp4.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 tmp4_xy_134 = float2(tmp4_x_133, tmp4_xyzw_132.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // tmp0.z = dot(tmp4.xy, tmp4.xy);
                float tmp0_z_135 = dot(tmp4_xy_134, tmp4_xy_134);
                // tmp0.z = min(tmp0.z, 1.0);
                float tmp0_z_136 = min(tmp0_z_135, 1.0);
                // tmp0.z = 1.0 - tmp0.z;
                float tmp0_z_137 = 1.0 - tmp0_z_136;
                // tmp0.z = sqrt(tmp0.z);
                float tmp0_z_138 = sqrt(tmp0_z_137);
                // tmp4.z = max(tmp0.z, 0.0);
                float tmp4_z_139 = max(tmp0_z_138, 0.0);
                // tmp4.xyz = saturate(tmp4.xyz);
                float3 tmp4_xyz_140 = saturate(float3(tmp4_xy_134, tmp4_z_139));
                // tmp4.xyz = tmp4.xyz - float3(0.0, 0.0, 1.0);
                float3 tmp4_xyz_141 = tmp4_xyz_140 - float3(0.0, 0.0, 1.0);
                // tmp4.xyz = _KiraNormal02Power.xxx * tmp4.xyz + float3(0.0, 0.0, 1.0);
                float3 tmp4_xyz_142 = _KiraNormal02Power.xxx * tmp4_xyz_141 + float3(0.0, 0.0, 1.0);
                // tmp0.zw = _Time.yy * float2(0.25, 2.5);
                float2 tmp0_zw_143 = _Time.yy * float2(0.25, 2.5);
                // tmp5.x = sin(tmp0.z);
                float tmp5_x_144 = sin(tmp0_zw_143.x);
                // tmp6.x = cos(tmp0.z);
                float tmp6_x_145 = cos(tmp0_zw_143.x);
                // tmp7.x = sin(tmp0.w);
                float tmp7_x_146 = sin(tmp0_zw_143.y);
                // tmp6.yz = tmp5.xx;
                float2 tmp6_yz_147 = tmp5_x_144.xx;
                // tmp5.xyz = tmp6.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                float3 tmp5_xyz_148 = float3(tmp6_x_145, tmp6_yz_147) * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
                // tmp5.xyz = tmp5.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                float3 tmp5_xyz_149 = tmp5_xyz_148 * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
                // tmp6.x = dot(tmp3.xy, tmp5.xz);
                float tmp6_x_150 = dot(tmp3_xyzw_121.xy, tmp5_xyz_149.xz);
                // tmp6.y = dot(tmp3.yx, tmp5.xy);
                float tmp6_y_151 = dot(tmp3_xyzw_121.yx, tmp5_xyz_149.xy);
                // tmp0.zw = tmp6.xy + float2(0.5, 0.5);
                float2 tmp0_zw_152 = float2(tmp6_x_150, tmp6_y_151) + float2(0.5, 0.5);
                // tmp0.zw = tmp0.zw * float2(0.5, 0.5) + float2(0.25, 0.25);
                float2 tmp0_zw_153 = tmp0_zw_152 * float2(0.5, 0.5) + float2(0.25, 0.25);
                // tmp3 = tex2Dbias(_KiraNormal01, float4(tmp0.zw, 0, _GlobalMipBias.x));
                float4 tmp3_xyzw_154 = tex2Dbias(_KiraNormal01, float4(tmp0_zw_153, 0, _GlobalMipBias.x));
                // tmp3.x = tmp3.x * tmp3.w;
                float tmp3_x_155 = tmp3_xyzw_154.x * tmp3_xyzw_154.w;
                // tmp5.xy = tmp3.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 tmp5_xy_156 = float2(tmp3_x_155, tmp3_xyzw_154.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // tmp3.xy = tmp3.xy + tmp3.xy;
                float2 tmp3_xy_157 = float2(tmp3_x_155, tmp3_xyzw_154.y) + float2(tmp3_x_155, tmp3_xyzw_154.y);
                // tmp0.z = dot(tmp5.xy, tmp5.xy);
                float tmp0_z_158 = dot(tmp5_xy_156, tmp5_xy_156);
                // tmp0.z = min(tmp0.z, 1.0);
                float tmp0_z_159 = min(tmp0_z_158, 1.0);
                // tmp0.z = 1.0 - tmp0.z;
                float tmp0_z_160 = 1.0 - tmp0_z_159;
                // tmp0.z = sqrt(tmp0.z);
                float tmp0_z_161 = sqrt(tmp0_z_160);
                // tmp5.z = max(tmp0.z, 0.0);
                float tmp5_z_162 = max(tmp0_z_161, 0.0);
                // tmp5.xyw = saturate(tmp5.xyz);
                float3 tmp5_xyw_163 = saturate(float3(tmp5_xy_156, tmp5_z_162));
                // tmp3.z = tmp5.z;
                float tmp3_z_164 = tmp5_z_162;
                // tmp3.xyz = tmp3.xyz - float3(1.0, 1.0, 1.0);
                float3 tmp3_xyz_165 = float3(tmp3_xy_157, tmp3_z_164) - float3(1.0, 1.0, 1.0);
                // tmp3.xyz = _CardDistortion.xxx * tmp3.xyz + float3(0.0, 0.0, 1.0);
                float3 tmp3_xyz_166 = _CardDistortion.xxx * tmp3_xyz_165 + float3(0.0, 0.0, 1.0);
                // tmp5.xyz = tmp5.xyw - float3(0.0, 0.0, 1.0);
                float3 tmp5_xyz_167 = tmp5_xyw_163 - float3(0.0, 0.0, 1.0);
                // tmp5.xyz = _KiraNormal01Power.xxx * tmp5.xyz + float3(0.0, 0.0, 1.0);
                float3 tmp5_xyz_168 = _KiraNormal01Power.xxx * tmp5_xyz_167 + float3(0.0, 0.0, 1.0);
                // tmp6.xy = tmp4.xy + tmp5.xy;
                float2 tmp6_xy_169 = tmp4_xyz_142.xy + tmp5_xyz_168.xy;
                // tmp6.z = tmp4.z * tmp5.z;
                float tmp6_z_170 = tmp4_xyz_142.z * tmp5_xyz_168.z;
                // tmp0.z = dot(tmp6.xyz, tmp6.xyz);
                float tmp0_z_171 = dot(float3(tmp6_xy_169, tmp6_z_170), float3(tmp6_xy_169, tmp6_z_170));
                // tmp0.z = max(tmp0.z, 8388608.0);
                float tmp0_z_172 = max(tmp0_z_171, 8388608.0);
                // tmp0.z = rsqrt(tmp0.z);
                float tmp0_z_173 = rsqrt(tmp0_z_172);
                // tmp4.xyz = tmp0.zzz * tmp6.xyz;
                float3 tmp4_xyz_174 = tmp0_z_173.xxx * float3(tmp6_xy_169, tmp6_z_170);
                // tmp0.z = dot(tmp4.xyz, tmp4.xyz);
                float tmp0_z_175 = dot(tmp4_xyz_174, tmp4_xyz_174);
                // tmp0.z = max(tmp0.z, 8388608.0);
                float tmp0_z_176 = max(tmp0_z_175, 8388608.0);
                // tmp0.z = rsqrt(tmp0.z);
                float tmp0_z_177 = rsqrt(tmp0_z_176);
                // tmp0.w = dot(inp.interp2.xyz, inp.interp2.xyz);
                float tmp0_w_178 = dot(inp.interp2.xyz, inp.interp2.xyz);
                // tmp0.w = sqrt(tmp0.w);
                float tmp0_w_179 = sqrt(tmp0_w_178);
                // tmp0.w = 1.0 / tmp0.w;
                float tmp0_w_180 = 1.0 / tmp0_w_179;
                // tmp5.xyz = tmp0.www * inp.interp2.xyz;
                float3 tmp5_xyz_181 = tmp0_w_180.xxx * inp.interp2.xyz;
                // tmp6.xyz = -tmp0.www * inp.interp2.xyz + _FakeNormalDirection;
                float3 tmp6_xyz_182 = -tmp0_w_180.xxx * inp.interp2.xyz + _FakeNormalDirection;
                // tmp5.xyz = _FakeBlend.xxx * tmp6.xyz + tmp5.xyz;
                float3 tmp5_xyz_183 = _FakeBlend.xxx * tmp6_xyz_182 + tmp5_xyz_181;
                // tmp6.xyz = _WorldSpaceCameraPos - inp.interp1.xyz;
                float3 tmp6_xyz_184 = _WorldSpaceCameraPos - inp.interp1.xyz;
                // tmp0.w = dot(tmp6.xyz, tmp6.xyz);
                float tmp0_w_185 = dot(tmp6_xyz_184, tmp6_xyz_184);
                // tmp0.w = rsqrt(tmp0.w);
                float tmp0_w_186 = rsqrt(tmp0_w_185);
                // tmp6.xyz = tmp0.www * tmp6.xyz;
                float3 tmp6_xyz_187 = tmp0_w_186.xxx * tmp6_xyz_184;
                // tmp0.w = unity_OrthoParams.w == 0.0;
                float tmp0_w_188 = unity_OrthoParams.w == 0.0;
                // tmp8.x = tmp0.w ? tmp6.x : unity_MatrixV._m20;
                float tmp8_x_189 = tmp0_w_188 ? tmp6_xyz_187.x : unity_MatrixV._m20;
                // tmp8.y = tmp0.w ? tmp6.y : unity_MatrixV._m21;
                float tmp8_y_190 = tmp0_w_188 ? tmp6_xyz_187.y : unity_MatrixV._m21;
                // tmp8.z = tmp0.w ? tmp6.z : unity_MatrixV._m22;
                float tmp8_z_191 = tmp0_w_188 ? tmp6_xyz_187.z : unity_MatrixV._m22;
                // tmp6.xyz = _FakeViewDirection - tmp8.xyz;
                float3 tmp6_xyz_192 = _FakeViewDirection - float3(tmp8_x_189, tmp8_y_190, tmp8_z_191);
                // tmp6.xyz = _FakeBlend.xxx * tmp6.xyz + tmp8.xyz;
                float3 tmp6_xyz_193 = _FakeBlend.xxx * tmp6_xyz_192 + float3(tmp8_x_189, tmp8_y_190, tmp8_z_191);
                // tmp8.xyz = _FakeLightDirection - _MainLightPosition.xyz;
                float3 tmp8_xyz_194 = _FakeLightDirection - _MainLightPosition.xyz;
                // tmp8.xyz = _FakeBlend.xxx * tmp8.xyz + _MainLightPosition.xyz;
                float3 tmp8_xyz_195 = _FakeBlend.xxx * tmp8_xyz_194 + _MainLightPosition.xyz;
                // tmp9.xyz = tmp6.xyz + tmp8.xyz;
                float3 tmp9_xyz_196 = tmp6_xyz_193 + tmp8_xyz_195;
                // tmp0.w = dot(tmp9.xyz, tmp9.xyz);
                float tmp0_w_197 = dot(tmp9_xyz_196, tmp9_xyz_196);
                // tmp0.w = rsqrt(tmp0.w);
                float tmp0_w_198 = rsqrt(tmp0_w_197);
                // tmp9.xyz = tmp0.www * tmp9.xyz;
                float3 tmp9_xyz_199 = tmp0_w_198.xxx * tmp9_xyz_196;
                // tmp0.w = dot(tmp9.xyz, tmp5.xyz);
                float tmp0_w_200 = dot(tmp9_xyz_199, tmp5_xyz_183);
                // tmp5.xyz = tmp5.xyz + float3(0.0, 0.0, 1.0);
                float3 tmp5_xyz_201 = tmp5_xyz_183 + float3(0.0, 0.0, 1.0);
                // tmp0.w = tmp0.w * _HoloShift;
                float tmp0_w_202 = tmp0_w_200 * _HoloShift;
                // tmp9 = tex2Dbias(_HoloTex, float4(tmp0.ww, 0, _GlobalMipBias.x));
                float4 tmp9_xyzw_203 = tex2Dbias(_HoloTex, float4(tmp0_w_202.xx, 0, _GlobalMipBias.x));
                // tmp9.x = tmp9.x * tmp9.w;
                float tmp9_x_204 = tmp9_xyzw_203.x * tmp9_xyzw_203.w;
                // tmp9.xy = tmp9.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 tmp9_xy_205 = float2(tmp9_x_204, tmp9_xyzw_203.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // tmp10.xy = tmp4.xy * tmp0.zz + tmp9.xy;
                float2 tmp10_xy_206 = tmp4_xyz_174.xy * tmp0_z_177.xx + tmp9_xy_205;
                // tmp0.w = dot(tmp9.xy, tmp9.xy);
                float tmp0_w_207 = dot(tmp9_xy_205, tmp9_xy_205);
                // tmp0.w = min(tmp0.w, 1.0);
                float tmp0_w_208 = min(tmp0_w_207, 1.0);
                // tmp0.w = 1.0 - tmp0.w;
                float tmp0_w_209 = 1.0 - tmp0_w_208;
                // tmp0.w = sqrt(tmp0.w);
                float tmp0_w_210 = sqrt(tmp0_w_209);
                // tmp0.w = max(tmp0.w, 0.0);
                float tmp0_w_211 = max(tmp0_w_210, 0.0);
                // tmp1.w = tmp0.z * tmp4.z;
                float tmp1_w_212 = tmp0_z_177 * tmp4_xyz_174.z;
                // tmp10.z = tmp0.w * tmp1.w;
                float tmp10_z_213 = tmp0_w_211 * tmp1_w_212;
                // tmp0.w = dot(tmp10.xyz, tmp10.xyz);
                float tmp0_w_214 = dot(float3(tmp10_xy_206, tmp10_z_213), float3(tmp10_xy_206, tmp10_z_213));
                // tmp0.w = max(tmp0.w, 8388608.0);
                float tmp0_w_215 = max(tmp0_w_214, 8388608.0);
                // tmp0.w = rsqrt(tmp0.w);
                float tmp0_w_216 = rsqrt(tmp0_w_215);
                // tmp2.w = tmp0.w * tmp10.z;
                float tmp2_w_217 = tmp0_w_216 * tmp10_z_213;
                // tmp9.xy = tmp10.xy * tmp0.ww + tmp3.xy;
                float2 tmp9_xy_218 = tmp10_xy_206 * tmp0_w_216.xx + tmp3_xyz_166.xy;
                // tmp9.z = tmp2.w * tmp3.z;
                float tmp9_z_219 = tmp2_w_217 * tmp3_xyz_166.z;
                // tmp0.w = dot(tmp9.xyz, tmp9.xyz);
                float tmp0_w_220 = dot(float3(tmp9_xy_218, tmp9_z_219), float3(tmp9_xy_218, tmp9_z_219));
                // tmp0.w = max(tmp0.w, 8388608.0);
                float tmp0_w_221 = max(tmp0_w_220, 8388608.0);
                // tmp0.w = rsqrt(tmp0.w);
                float tmp0_w_222 = rsqrt(tmp0_w_221);
                // tmp3.xyz = tmp0.www * tmp9.xyz;
                float3 tmp3_xyz_223 = tmp0_w_222.xxx * float3(tmp9_xy_218, tmp9_z_219);
                // tmp3.yw = tmp3.yy * unity_MatrixV._m01_m11;
                float2 tmp3_yw_224 = tmp3_xyz_223.yy * unity_MatrixV._m01_m11;
                // tmp3.xy = unity_MatrixV._m00_m10 * tmp3.xx + tmp3.yw;
                float2 tmp3_xy_225 = unity_MatrixV._m00_m10 * tmp3_xyz_223.xx + tmp3_yw_224;
                // tmp3.xy = unity_MatrixV._m02_m12 * tmp3.zz + tmp3.xy;
                float2 tmp3_xy_226 = unity_MatrixV._m02_m12 * tmp3_xyz_223.zz + tmp3_xy_225;
                // tmp3.xy = tmp3.xy + unity_MatrixV._m03_m13;
                float2 tmp3_xy_227 = tmp3_xy_226 + unity_MatrixV._m03_m13;
                // tmp3 = tex2Dbias(_HoloTex, float4(tmp3.xy, 0, _GlobalMipBias.x));
                float4 tmp3_xyzw_228 = tex2Dbias(_HoloTex, float4(tmp3_xy_227, 0, _GlobalMipBias.x));
                // tmp9.xyz = float3(1.0, 1.0, 1.0) - tmp3.xyz;
                float3 tmp9_xyz_229 = float3(1.0, 1.0, 1.0) - tmp3_xyzw_228.xyz;
                // tmp9.xyz = tmp9.xyz + tmp9.xyz;
                float3 tmp9_xyz_230 = tmp9_xyz_229 + tmp9_xyz_229;
                // tmp0.w = 1.0 - _HoloBrightness;
                float tmp0_w_231 = 1.0 - _HoloBrightness;
                // tmp9.xyz = -tmp9.xyz * tmp0.www + float3(1.0, 1.0, 1.0);
                float3 tmp9_xyz_232 = -tmp9_xyz_230 * tmp0_w_231.xxx + float3(1.0, 1.0, 1.0);
                // tmp10.xyz = tmp3.xyz <= float3(0.5, 0.5, 0.5);
                float3 tmp10_xyz_233 = tmp3_xyzw_228.xyz <= float3(0.5, 0.5, 0.5);
                // tmp3.xyz = tmp3.xyz * _HoloBrightness.xxx;
                float3 tmp3_xyz_234 = tmp3_xyzw_228.xyz * _HoloBrightness.xxx;
                // tmp3.xyz = tmp3.xyz + tmp3.xyz;
                float3 tmp3_xyz_235 = tmp3_xyz_234 + tmp3_xyz_234;
                // tmp11.xyz = tmp10.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                float3 tmp11_xyz_236 = tmp10_xyz_233 ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
                // tmp10.xyz = uint3(tmp10.xyz) & uint3(int3(1, 1, 1));
                float3 tmp10_xyz_237 = uint3(tmp10_xyz_233) & uint3(int3(1, 1, 1));
                // tmp9.xyz = tmp9.xyz * tmp11.xyz;
                float3 tmp9_xyz_238 = tmp9_xyz_232 * tmp11_xyz_236;
                // tmp3.xyz = saturate(tmp3.xyz * tmp10.xyz + tmp9.xyz);
                float3 tmp3_xyz_239 = saturate(tmp3_xyz_235 * tmp10_xyz_237 + tmp9_xyz_238);
                // tmp3.xyz = tmp3.zzz + tmp3.xyz;
                float3 tmp3_xyz_240 = tmp3_xyz_239.zzz + tmp3_xyz_239;
                // tmp2.xyz = tmp2.xyz * tmp3.xyz;
                float3 tmp2_xyz_241 = tmp2_xyz_107 * tmp3_xyz_240;
                // tmp2.xyz = tmp2.xyz * _IllustHoloPower.xxx;
                float3 tmp2_xyz_242 = tmp2_xyz_241 * _IllustHoloPower.xxx;
                // tmp3.xy = _Time.yy * float2(2.5, 2.5) + float2(2.09439, 4.18878);
                float2 tmp3_xy_243 = _Time.yy * float2(2.5, 2.5) + float2(2.09439, 4.18878);
                // tmp7.yz = sin(tmp3.xy);
                float2 tmp7_yz_244 = sin(tmp3_xy_243);
                // tmp3.xyz = tmp7.xyz + float3(3.0, 3.0, 3.0);
                float3 tmp3_xyz_245 = float3(tmp7_x_146, tmp7_yz_244) + float3(3.0, 3.0, 3.0);
                // tmp7 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 tmp7_xyzw_246 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // tmp3.xyz = tmp3.xyz * float3(0.2, 0.2, 0.2) + -tmp7.xyz;
                float3 tmp3_xyz_247 = tmp3_xyz_245 * float3(0.2, 0.2, 0.2) + -tmp7_xyzw_246.xyz;
                // tmp0.w = dot(tmp3.xyz, tmp3.xyz);
                float tmp0_w_248 = dot(tmp3_xyz_247, tmp3_xyz_247);
                // tmp0.w = sqrt(tmp0.w);
                float tmp0_w_249 = sqrt(tmp0_w_248);
                // tmp0.w = saturate(-_EnhanceColorThreshold * tmp0.w + 1.0);
                float tmp0_w_250 = saturate(-_EnhanceColorThreshold * tmp0_w_249 + 1.0);
                // tmp0.w = dot(tmp0.ww, _IllustRanbowPower.xx);
                float tmp0_w_251 = dot(tmp0_w_250.xx, _IllustRanbowPower.xx);
                // tmp2.xyz = tmp0.www * tmp2.xyz;
                float3 tmp2_xyz_252 = tmp0_w_251.xxx * tmp2_xyz_242;
                return pack(tmp2_xyz_252, 1);
                // tmp3 = tex2Dbias(_KiraMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 tmp3_xyzw_253 = tex2Dbias(_KiraMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // tmp0.w = tmp3.x * _IllustContrast + 1.0;
                float tmp0_w_254 = tmp3_xyzw_253.x * _IllustContrast + 1.0;
                // tmp3.yzw = tmp7.xyz * tmp0.www + -tmp2.xyz;
                float3 tmp3_yzw_255 = tmp7_xyzw_246.xyz * tmp0_w_254.xxx + -tmp2_xyz_252;
                // tmp2.w = 1.0 - tmp3.x;
                float tmp2_w_256 = 1.0 - tmp3_xyzw_253.x;
                // tmp2.xyz = tmp2.www * tmp3.yzw + tmp2.xyz;
                float3 tmp2_xyz_257 = tmp2_w_256.xxx * tmp3_yzw_255 + tmp2_xyz_252;
                // tmp2.w = tmp3.x - 0.2176376;
                float tmp2_w_258 = tmp3_xyzw_253.x - 0.2176376;
                // tmp2.w = saturate(tmp2.w * 10.0 + 0.2176376);
                float tmp2_w_259 = saturate(tmp2_w_258 * 10.0 + 0.2176376);
                // tmp2.xyz = tmp2.www * _IllustBrightness.xxx + tmp2.xyz;
                float3 tmp2_xyz_260 = tmp2_w_259.xxx * _IllustBrightness.xxx + tmp2_xyz_257;
                // tmp2.xyz = tmp2.xyz + _AmbientColor.xyz;
                float3 tmp2_xyz_261 = tmp2_xyz_260 + _AmbientColor.xyz;
                // tmp3.yz = ddx(tmp1.xy);
                float2 tmp3_yz_262 = ddx(tmp1_xy_44);
                // tmp4.zw = ddy(tmp1.xy);
                float2 tmp4_zw_263 = ddy(tmp1_xy_44);
                // tmp3.yz = abs(tmp3.yz) + abs(tmp4.zw);
                float2 tmp3_yz_264 = abs(tmp3_yz_262) + abs(tmp4_zw_263);
                // tmp1.xy = tmp1.xy / tmp3.yz;
                float2 tmp1_xy_265 = tmp1_xy_44 / tmp3_yz_264;
                // tmp1.xy = saturate(float2(1.0, 1.0) - tmp1.xy);
                float2 tmp1_xy_266 = saturate(float2(1.0, 1.0) - tmp1_xy_265);
                // tmp1.x = min(tmp1.y, tmp1.x);
                float tmp1_x_267 = min(tmp1_xy_266.y, tmp1_xy_266.x);
                // tmp3.yzw = log(abs(_CardNameColor.xyz));
                float3 tmp3_yzw_268 = log(abs(_CardNameColor.xyz));
                // tmp3.yzw = tmp3.yzw * float3(0.4166667, 0.4166667, 0.4166667);
                float3 tmp3_yzw_269 = tmp3_yzw_268 * float3(0.4166667, 0.4166667, 0.4166667);
                // tmp3.yzw = pow(2.0, tmp3.yzw);
                float3 tmp3_yzw_270 = pow(2.0, tmp3_yzw_269);
                // tmp3.yzw = tmp3.yzw * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
                float3 tmp3_yzw_271 = tmp3_yzw_270 * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
                // tmp9.xyz = _CardNameColor.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
                float3 tmp9_xyz_272 = _CardNameColor.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
                // tmp10.xyz = _CardNameColor.xyz * float3(12.92321, 12.92321, 12.92321);
                float3 tmp10_xyz_273 = _CardNameColor.xyz * float3(12.92321, 12.92321, 12.92321);
                // tmp3.yzw = tmp9.xyz ? tmp10.xyz : tmp3.yzw;
                float3 tmp3_yzw_274 = tmp9_xyz_272 ? tmp10_xyz_273 : tmp3_yzw_271;
                // tmp9 = inp.interp.xyxy - float4(0.37, 0.427, -0.0, 0.35);
                float4 tmp9_xyzw_275 = inp.interp.xyxy - float4(0.37, 0.427, -0.0, 0.35);
                // tmp9 = tmp9 * float4(2.0, 2.0, 2.0, 2.0) + float4(-1.0, -1.0, -1.0, -1.0);
                float4 tmp9_xyzw_276 = tmp9_xyzw_275 * float4(2.0, 2.0, 2.0, 2.0) + float4(-1.0, -1.0, -1.0, -1.0);
                // tmp4.zw = abs(tmp9.zw) - float2(0.91, 0.05);
                float2 tmp4_zw_277 = abs(tmp9_xyzw_276.zw) - float2(0.91, 0.05);
                // tmp9 = abs(tmp9) - float4(0.12, 0.085, 0.91, 0.0);
                float4 tmp9_xyzw_278 = abs(tmp9_xyzw_276) - float4(0.12, 0.085, 0.91, 0.0);
                // tmp10.xy = ddx(tmp4.zw);
                float2 tmp10_xy_279 = ddx(tmp4_zw_277);
                // tmp10.zw = ddy(tmp4.zw);
                float2 tmp10_zw_280 = ddy(tmp4_zw_277);
                // tmp10.xy = abs(tmp10.zw) + abs(tmp10.xy);
                float2 tmp10_xy_281 = abs(tmp10_zw_280) + abs(tmp10_xy_279);
                // tmp4.zw = tmp4.zw / tmp10.xy;
                float2 tmp4_zw_282 = tmp4_zw_277 / tmp10_xy_281;
                // tmp4.zw = saturate(float2(1.0, 1.0) - tmp4.zw);
                float2 tmp4_zw_283 = saturate(float2(1.0, 1.0) - tmp4_zw_282);
                // tmp1.y = min(tmp4.w, tmp4.z);
                float tmp1_y_284 = min(tmp4_zw_283.y, tmp4_zw_283.x);
                // tmp10 = ddx(tmp9);
                float4 tmp10_xyzw_285 = ddx(tmp9_xyzw_278);
                // tmp11 = ddy(tmp9);
                float4 tmp11_xyzw_286 = ddy(tmp9_xyzw_278);
                // tmp10 = abs(tmp10) + abs(tmp11);
                float4 tmp10_xyzw_287 = abs(tmp10_xyzw_285) + abs(tmp11_xyzw_286);
                // tmp9 = tmp9 / tmp10;
                float4 tmp9_xyzw_288 = tmp9_xyzw_278 / tmp10_xyzw_287;
                // tmp9 = saturate(float4(1.0, 1.0, 1.0, 1.0) - tmp9);
                float4 tmp9_xyzw_289 = saturate(float4(1.0, 1.0, 1.0, 1.0) - tmp9_xyzw_288);
                // tmp4.zw = min(tmp9.yw, tmp9.xz);
                float2 tmp4_zw_290 = min(tmp9_xyzw_289.yw, tmp9_xyzw_289.xz);
                // tmp9.xy = float2(_LinkOn_Off.x, _isFade.x) != float2(0.0, 0.0);
                float2 tmp9_xy_291 = float2(_LinkOn_Off.x, _isFade.x) != float2(0.0, 0.0);
                // tmp1.y = tmp9.x ? tmp4.w : tmp1.y;
                float tmp1_y_292 = tmp9_xy_291.x ? tmp4_zw_290.y : tmp1_y_284;
                // tmp9.xzw = _EnvironmentPower.xxx * _EnvironmentColor.xyz;
                float3 tmp9_xzw_293 = _EnvironmentPower.xxx * _EnvironmentColor.xyz;
                // tmp10.xyz = -_EnvironmentPower.xxx * _EnvironmentColor.xyz + _EnvironmentPower.xxx;
                float3 tmp10_xyz_294 = -_EnvironmentPower.xxx * _EnvironmentColor.xyz + _EnvironmentPower.xxx;
                // tmp9.xzw = tmp4.zzz * tmp10.xyz + tmp9.xzw;
                float3 tmp9_xzw_295 = tmp4_zw_290.xxx * tmp10_xyz_294 + tmp9_xzw_293;
                // tmp10.xyz = _EnvironmentPower.xxx * float3(0.8980392, 0.8666667, 0.3254902) + -tmp9.xzw;
                float3 tmp10_xyz_296 = _EnvironmentPower.xxx * float3(0.8980392, 0.8666667, 0.3254902) + -tmp9_xzw_295;
                // tmp9.xzw = tmp1.yyy * tmp10.xyz + tmp9.xzw;
                float3 tmp9_xzw_297 = tmp1_y_292.xxx * tmp10_xyz_296 + tmp9_xzw_295;
                // tmp3.yzw = _EnvironmentPower.xxx * tmp3.yzw + -tmp9.xzw;
                float3 tmp3_yzw_298 = _EnvironmentPower.xxx * tmp3_yzw_274 + -tmp9_xzw_297;
                // tmp3.yzw = tmp1.xxx * tmp3.yzw + tmp9.xzw;
                float3 tmp3_yzw_299 = tmp1_x_267.xxx * tmp3_yzw_298 + tmp9_xzw_297;
                // tmp3.yzw = -tmp7.xyz * tmp0.www + tmp3.yzw;
                float3 tmp3_yzw_300 = -tmp7_xyzw_246.xyz * tmp0_w_254.xxx + tmp3_yzw_299;
                // tmp9.xzw = tmp0.www * tmp7.xyz;
                float3 tmp9_xzw_301 = tmp0_w_254.xxx * tmp7_xyzw_246.xyz;
                // tmp7.xyz = tmp7.xyz + _AmbientColor.xyz;
                float3 tmp7_xyz_302 = tmp7_xyzw_246.xyz + _AmbientColor.xyz;
                // tmp1.xy = inp.interp.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 tmp1_xy_303 = inp.interp.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // tmp1.xy = abs(tmp1.xy) - float2(0.9, 0.9);
                float2 tmp1_xy_304 = abs(tmp1_xy_303) - float2(0.9, 0.9);
                // tmp4.zw = ddx(tmp1.xy);
                float2 tmp4_zw_305 = ddx(tmp1_xy_304);
                // tmp10.xy = ddy(tmp1.xy);
                float2 tmp10_xy_306 = ddy(tmp1_xy_304);
                // tmp4.zw = abs(tmp4.zw) + abs(tmp10.xy);
                float2 tmp4_zw_307 = abs(tmp4_zw_305) + abs(tmp10_xy_306);
                // tmp1.xy = tmp1.xy / tmp4.zw;
                float2 tmp1_xy_308 = tmp1_xy_304 / tmp4_zw_307;
                // tmp1.xy = saturate(float2(1.0, 1.0) - tmp1.xy);
                float2 tmp1_xy_309 = saturate(float2(1.0, 1.0) - tmp1_xy_308);
                // tmp0.w = min(tmp1.y, tmp1.x);
                float tmp0_w_310 = min(tmp1_xy_309.y, tmp1_xy_309.x);
                // tmp0.x = tmp0.x * tmp0.w;
                float tmp0_x_311 = tmp0_x_33 * tmp0_w_310;
                // tmp3.yzw = tmp0.xxx * tmp3.yzw + tmp9.xzw;
                float3 tmp3_yzw_312 = tmp0_x_311.xxx * tmp3_yzw_300 + tmp9_xzw_301;
                // tmp3.yzw = tmp3.yzw - tmp2.xyz;
                float3 tmp3_yzw_313 = tmp3_yzw_312 - tmp2_xyz_261;
                // tmp2.xyz = tmp0.xxx * tmp3.yzw + tmp2.xyz;
                float3 tmp2_xyz_314 = tmp0_x_311.xxx * tmp3_yzw_313 + tmp2_xyz_261;
                // tmp0.w = dot(tmp6.xyz, tmp6.xyz);
                float tmp0_w_315 = dot(tmp6_xyz_193, tmp6_xyz_193);
                // tmp0.w = max(tmp0.w, 8388608.0);
                float tmp0_w_316 = max(tmp0_w_315, 8388608.0);
                // tmp0.w = rsqrt(tmp0.w);
                float tmp0_w_317 = rsqrt(tmp0_w_316);
                // tmp3.yzw = tmp6.xyz * tmp0.www + tmp8.xyz;
                float3 tmp3_yzw_318 = tmp6_xyz_193 * tmp0_w_317.xxx + tmp8_xyz_195;
                // tmp0.w = dot(tmp3.yzw, tmp3.yzw);
                float tmp0_w_319 = dot(tmp3_yzw_318, tmp3_yzw_318);
                // tmp0.w = max(tmp0.w, 8388608.0);
                float tmp0_w_320 = max(tmp0_w_319, 8388608.0);
                // tmp0.w = rsqrt(tmp0.w);
                float tmp0_w_321 = rsqrt(tmp0_w_320);
                // tmp3.yzw = tmp0.www * tmp3.yzw;
                float3 tmp3_yzw_322 = tmp0_w_321.xxx * tmp3_yzw_318;
                // tmp6 = tex2Dbias(_MainNormal, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 tmp6_xyzw_323 = tex2Dbias(_MainNormal, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // tmp6.x = tmp6.x * tmp6.w;
                float tmp6_x_324 = tmp6_xyzw_323.x * tmp6_xyzw_323.w;
                // tmp1.xy = tmp6.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float2 tmp1_xy_325 = float2(tmp6_x_324, tmp6_xyzw_323.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
                // tmp6.xy = tmp6.xy + tmp6.xy;
                float2 tmp6_xy_326 = float2(tmp6_x_324, tmp6_xyzw_323.y) + float2(tmp6_x_324, tmp6_xyzw_323.y);
                // tmp0.w = dot(tmp1.xy, tmp1.xy);
                float tmp0_w_327 = dot(tmp1_xy_325, tmp1_xy_325);
                // tmp0.w = min(tmp0.w, 1.0);
                float tmp0_w_328 = min(tmp0_w_327, 1.0);
                // tmp0.w = 1.0 - tmp0.w;
                float tmp0_w_329 = 1.0 - tmp0_w_328;
                // tmp0.w = sqrt(tmp0.w);
                float tmp0_w_330 = sqrt(tmp0_w_329);
                // tmp6.z = max(tmp0.w, 0.0);
                float tmp6_z_331 = max(tmp0_w_330, 0.0);
                // tmp6.xyz = tmp6.xyz - float3(1.0, 1.0, 1.0);
                float3 tmp6_xyz_332 = float3(tmp6_xy_326, tmp6_z_331) - float3(1.0, 1.0, 1.0);
                // tmp6.xyz = _MainNormalPower.xxx * tmp6.xyz + float3(0.0, 0.0, 1.0);
                float3 tmp6_xyz_333 = _MainNormalPower.xxx * tmp6_xyz_332 + float3(0.0, 0.0, 1.0);
                // tmp4.xy = tmp4.xy * tmp0.zz + tmp6.xy;
                float2 tmp4_xy_334 = tmp4_xyz_174.xy * tmp0_z_177.xx + tmp6_xyz_333.xy;
                // tmp4.z = tmp1.w * tmp6.z;
                float tmp4_z_335 = tmp1_w_212 * tmp6_xyz_333.z;
                // tmp0.z = dot(tmp4.xyz, tmp4.xyz);
                float tmp0_z_336 = dot(float3(tmp4_xy_334, tmp4_z_335), float3(tmp4_xy_334, tmp4_z_335));
                // tmp0.z = max(tmp0.z, 8388608.0);
                float tmp0_z_337 = max(tmp0_z_336, 8388608.0);
                // tmp0.z = rsqrt(tmp0.z);
                float tmp0_z_338 = rsqrt(tmp0_z_337);
                // tmp1.xyw = tmp0.zzz * tmp4.xyz;
                float3 tmp1_xyw_339 = tmp0_z_338.xxx * float3(tmp4_xy_334, tmp4_z_335);
                // tmp1.xyw = tmp1.xyw * float3(-1.0, -1.0, 1.0);
                float3 tmp1_xyw_340 = tmp1_xyw_339 * float3(-1.0, -1.0, 1.0);
                // tmp0.z = dot(tmp5.xyz, tmp1.xyw);
                float tmp0_z_341 = dot(tmp5_xyz_201, tmp1_xyw_340);
                // tmp4.xyz = tmp5.xyz / tmp5.zzz;
                float3 tmp4_xyz_342 = tmp5_xyz_201 / tmp5_xyz_201.zzz;
                // tmp1.xyw = tmp4.xyz * tmp0.zzz + -tmp1.xyw;
                float3 tmp1_xyw_343 = tmp4_xyz_342 * tmp0_z_341.xxx + -tmp1_xyw_340;
                // tmp0.z = dot(tmp1.xyw, tmp1.xyw);
                float tmp0_z_344 = dot(tmp1_xyw_343, tmp1_xyw_343);
                // tmp0.z = rsqrt(tmp0.z);
                float tmp0_z_345 = rsqrt(tmp0_z_344);
                // tmp4.xyz = tmp0.zzz * tmp1.xyw;
                float3 tmp4_xyz_346 = tmp0_z_345.xxx * tmp1_xyw_343;
                // tmp0.z = saturate(dot(tmp1.xyw, tmp8.xyz));
                float tmp0_z_347 = saturate(dot(tmp1_xyw_343, tmp8_xyz_195));
                // tmp0.w = saturate(dot(tmp4.xyz, tmp3.yzw));
                float tmp0_w_348 = saturate(dot(tmp4_xyz_346, tmp3_yzw_322));
                // tmp0.w = log(tmp0.w);
                float tmp0_w_349 = log(tmp0_w_348);
                // tmp1.x = _Smoothness * 10.0 + 1.0;
                float tmp1_x_350 = _Smoothness * 10.0 + 1.0;
                // tmp1.x = pow(2.0, tmp1.x);
                float tmp1_x_351 = pow(2.0, tmp1_x_350);
                // tmp0.w = tmp0.w * tmp1.x;
                float tmp0_w_352 = tmp0_w_349 * tmp1_x_351;
                // tmp0.w = pow(2.0, tmp0.w);
                float tmp0_w_353 = pow(2.0, tmp0_w_352);
                // tmp1.x = _KiraMetal - _MainTexMetal;
                float tmp1_x_354 = _KiraMetal - _MainTexMetal;
                // tmp1.x = tmp3.x * tmp1.x + _MainTexMetal;
                float tmp1_x_355 = tmp3_xyzw_253.x * tmp1_x_354 + _MainTexMetal;
                // tmp1.y = tmp3.x * 100.0;
                float tmp1_y_356 = tmp3_xyzw_253.x * 100.0;
                // tmp1.y = max(tmp1.y, 0.0);
                float tmp1_y_357 = max(tmp1_y_356, 0.0);
                // tmp1.y = min(tmp1.z, tmp1.y);
                float tmp1_y_358 = min(tmp1_z_91, tmp1_y_357);
                // tmp1.z = _FrameMetal - tmp1.x;
                float tmp1_z_359 = _FrameMetal - tmp1_x_355;
                // tmp0.x = tmp0.x * tmp1.z + tmp1.x;
                float tmp0_x_360 = tmp0_x_311 * tmp1_z_359 + tmp1_x_355;
                // tmp1.xzw = tmp0.xxx * _SpecularColor.xyz;
                float3 tmp1_xzw_361 = tmp0_x_360.xxx * _SpecularColor.xyz;
                // tmp1.xzw = tmp0.www * tmp1.xzw;
                float3 tmp1_xzw_362 = tmp0_w_353.xxx * tmp1_xzw_361;
                // tmp3.xyz = _FakeLightColor.xyz - _MainLightColor.xyz;
                float3 tmp3_xyz_363 = _FakeLightColor.xyz - _MainLightColor.xyz;
                // tmp3.xyz = _FakeBlend.xxx * tmp3.xyz + _MainLightColor.xyz;
                float3 tmp3_xyz_364 = _FakeBlend.xxx * tmp3_xyz_363 + _MainLightColor.xyz;
                // tmp3.xyz = tmp3.xyz * _DirectionalLightAmp.xxx;
                float3 tmp3_xyz_365 = tmp3_xyz_364 * _DirectionalLightAmp.xxx;
                // tmp1.xzw = tmp1.xzw * tmp3.xyz;
                float3 tmp1_xzw_366 = tmp1_xzw_362 * tmp3_xyz_365;
                // tmp0.xzw = tmp0.zzz * _DirectionalLightAmp.xxx + tmp1.xzw;
                float3 tmp0_xzw_367 = tmp0_z_347.xxx * _DirectionalLightAmp.xxx + tmp1_xzw_366;
                // tmp0.xzw = tmp0.xzw + _AmbientColor.xyz;
                float3 tmp0_xzw_368 = tmp0_xzw_367 + _AmbientColor.xyz;
                // tmp0.xyz = tmp0.xzw * tmp2.xyz + tmp0.yyy;
                float3 tmp0_xyz_369 = tmp0_xzw_368 * tmp2_xyz_314 + tmp0_y_59.xxx;
                // tmp1.xzw = tmp7.xyz - tmp0.xyz;
                float3 tmp1_xzw_370 = tmp7_xyz_302 - tmp0_xyz_369;
                // tmp0.xyz = tmp1.yyy * tmp1.xzw + tmp0.xyz;
                float3 tmp0_xyz_371 = tmp1_y_358.xxx * tmp1_xzw_370 + tmp0_xyz_369;
                // tmp1 = tex2Dbias(_LoadingTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 tmp1_xyzw_372 = tex2Dbias(_LoadingTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // tmp0.w = 1.0;
                float tmp0_w_373 = 1.0;
                // tmp1 = tmp1 - tmp0;
                float4 tmp1_xyzw_374 = tmp1_xyzw_372 - float4(tmp0_xyz_371, tmp0_w_373);
                // tmp0 = _LoadingBlend.xxxx * tmp1 + tmp0;
                float4 tmp0_xyzw_375 = _LoadingBlend.xxxx * tmp1_xyzw_374 + float4(tmp0_xyz_371, tmp0_w_373);
                // tmp1.x = dot(tmp0.xyz, float4(0.299, 0.587, 0.114, 0.0));
                float tmp1_x_376 = dot(tmp0_xyzw_375.xyz, float4(0.299, 0.587, 0.114, 0.0));
                // tmp1.xyz = tmp1.xxx - tmp0.xyz;
                float3 tmp1_xyz_377 = tmp1_x_376.xxx - tmp0_xyzw_375.xyz;
                // tmp1.w = 0.0;
                float tmp1_w_378 = 0.0;
                // tmp0 = _Monochrome.xxxx * tmp1 + tmp0;
                float4 tmp0_xyzw_379 = _Monochrome.xxxx * float4(tmp1_xyz_377, tmp1_w_378) + tmp0_xyzw_375;
                // tmp0 = tmp0.yzwx * _TintColor;
                float4 tmp0_xyzw_380 = tmp0_xyzw_379.yzwx * _TintColor;
                // tmp1.xyz = tmp0.wxy;
                float3 tmp1_xyz_381 = tmp0_xyzw_380.wxy;
                // tmp1.w = 1.0;
                float tmp1_w_382 = 1.0;
                // tmp1 = tmp1 * _AddColor;
                float4 tmp1_xyzw_383 = float4(tmp1_xyz_381, tmp1_w_382) * _AddColor;
                // tmp2 = tex2Dbias(_Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                float4 tmp2_xyzw_384 = tex2Dbias(_Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D, float4(inp.interp.xy, 0, _GlobalMipBias.x));
                // tmp0.w = tmp2.x;
                float tmp0_w_385 = tmp2_xyzw_384.x;
                // tmp1 = tmp0.wwwz * tmp1;
                float4 tmp1_xyzw_386 = float4(tmp0_w_385.xxx, tmp0_xyzw_380.z) * tmp1_xyzw_383;
                // tmp0.x = 2.0;
                float tmp0_x_387 = 2.0;
                // tmp0 = tmp1 * tmp0.xxxw;
                float4 tmp0_xyzw_388 = tmp1_xyzw_386 * float4(tmp0_x_387.xxx, tmp0_w_385);
                // tmp1.x = _Time.y + _Time.y;
                float tmp1_x_389 = _Time.y + _Time.y;
                // tmp1.x = sin(tmp1.x);
                float tmp1_x_390 = sin(tmp1_x_389);
                // tmp1.x = tmp1.x + 1.0;
                float tmp1_x_391 = tmp1_x_390 + 1.0;
                // tmp1.x = tmp1.x * 0.2 + 0.5;
                float tmp1_x_392 = tmp1_x_391 * 0.2 + 0.5;
                // tmp1 = tmp0 * tmp1.xxxx;
                float4 tmp1_xyzw_393 = tmp0_xyzw_388 * tmp1_x_392.xxxx;
                // o.sv_target = tmp9.yyyy ? tmp1 : tmp0;
                o.sv_target = tmp9_xy_291.yyyy ? tmp1_xyzw_393 : tmp0_xyzw_388;
                return o;
            }

            // fout frag(v2f inp)
            // {
            //     fout o;
            //     // tmp0.x = _AttributeTile + 0.00001;
            //     // tmp0.x = tmp0.x * 0.0625;
            //     float x0 = (_AttributeTile + 0.00001) * 0.0625;
            //     // tmp0.y = tmp0.x >= -tmp0.x;
            //     // tmp0.x = frac(abs(tmp0.x));
            //     float x1 = frac(abs(x0));
            //     // tmp0.x = tmp0.y ? tmp0.x : -tmp0.x;
            //     // tmp0.x = tmp0.x * 16.0;
            //     // tmp0.x = floor(tmp0.x);
            //     float x2 = floor((x0 >= 0 ? x1 : -x1) * 16.0);
            //     // tmp0.y = tmp0.x + 0.5;
            //     // tmp0.y = tmp0.y * 0.25;
            //     // tmp0.y = floor(tmp0.y);
            //     float x3 = floor((x2 + 0.5) * 0.25);
            //     // tmp1.x = -tmp0.y * 4.0 + tmp0.x;
            //     // tmp0.x = tmp0.y + 1.0;
            //     // tmp0.yz = _AttributeSize_Pos.xy * float2(0.5, 0.5) + float2(-0.5, -0.5);
            //     // tmp0.yz = inp.interp.xy * _AttributeSize_Pos.xy + -tmp0.yz;
            //     // tmp2.xy = tmp0.yz + _AttributeSize_Pos.zw;
            //     float2 pos1 = (inp.interp.xy - float2(0.5, 0.5)) * _AttributeSize_Pos.xy + float2(0.5, 0.5) + _AttributeSize_Pos.zw;
            //     // tmp1.y = tmp2.y - tmp0.x;
            //     // tmp2.z = 4.0;
            //     // tmp0.xy = tmp1.xy + tmp2.xz;
            //     // tmp0.zw = tmp2.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
            //     // tmp0.zw = abs(tmp0.zw) - float2(1.0, 1.0);
            //     // tmp0.xy = tmp0.xy * float2(0.25, 0.25);
            //     float2 monsterNameTexUV = (pos1 + float2(x2 - x3 * 4.0, 3 - x3)) * float2(0.25, 0.25);
            //     // tmp1 = tex2Dbias(_MonsterNameTex, float4(tmp0.xy, 0, _GlobalMipBias.x));
            //     float4 monsterNameColor = tex2Dbias(_MonsterNameTex, float4(monsterNameTexUV, 0, _GlobalMipBias.x));
            //     // tmp0.xy = inp.interp.xy * float2(1.0, 5.0) + float2(0.0, -4.0);
            //     float2 monsterNameTexUV2 = inp.interp.xy * float2(1.0, 5.0) + float2(0.0, -4.0);
            //     // tmp2 = tex2Dbias(_MonsterNameTex, float4(tmp0.xy, 0, _GlobalMipBias.x));
            //     float4 monsterNameColor2 = tex2Dbias(_MonsterNameTex, float4(monsterNameTexUV2, 0, _GlobalMipBias.x));
            //     // tmp0.x = saturate(_MonsterNameTextBold * tmp2.w + tmp2.w);
            //     float bold = saturate((_MonsterNameTextBold + 1) * monsterNameColor2.a);
            //     // tmp1.yz = ddx(tmp0.zw);
            //     // tmp2.xy = ddy(tmp0.zw);
            //     // tmp1.yz = abs(tmp1.yz) + abs(tmp2.xy);
            //     // tmp0.yz = tmp0.zw / tmp1.yz;
            //     // tmp0.yz = saturate(float2(1.0, 1.0) - tmp0.yz);
            //     float2 pos2 = abs(pos1 * float2(2.0, 2.0) - float2(1.0, 1.0)) - float2(1.0, 1.0);
            //     float2 pos3 = saturate(float2(1.0, 1.0) - pos2 / (abs(ddx(pos2)) + abs(ddy(pos2))));
            //     // tmp0.y = min(tmp0.z, tmp0.y);
            //     // tmp0.x = tmp1.x * tmp0.y + tmp0.x;
            //     // tmp1 = tex2Dbias(_FrameMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
            //     float4 frameMaskColor = tex2Dbias(_FrameMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
            //     // tmp0.x = tmp0.x + tmp1.x;
            //     float highlightMask = monsterNameColor.r * min(pos3.x, pos3.y) + frameMaskColor.r;
            //     // tmp0.y = tmp0.x * _HighlightAmp;
            //     float highlight = highlightMask * _HighlightAmp;
            //     // tmp0.z = _HighlightRotation * 0.01745329;
            //     // tmp1.x = sin(tmp0.z);
            //     // tmp2.x = cos(tmp0.z);
            //     // tmp2.y = tmp1.x;
            //     // tmp0.zw = tmp2.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
            //     float2 pos4 = float2(cos(_HighlightRotation * 0.01745329), sin(_HighlightRotation * 0.01745329)) * float2(0.5, 0.5) + float2(0.5, 0.5);
            //     // tmp0.zw = tmp0.zw * float2(2.0, 2.0) + float2(-1.0, -1.0);
            //     // tmp1 = inp.interp.xyxy + float4(0.054, -0.421, -0.5, -0.5);
            //     // tmp0.z = dot(tmp1.zw, tmp0.zw);
            //     // tmp1.xy = tmp1.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
            //     // tmp1.xy = abs(tmp1.xy) - float2(0.757, 0.062);
            //     float2 tmp1_xy_44 = abs((inp.interp.xy + float2(0.054, -0.421)) * float2(2.0, 2.0) + float2(-1.0, -1.0)) - float2(0.757, 0.062);
            //     // tmp0.z = tmp0.z + 0.5;
            //     float x4 = dot(inp.interp.xy - float2(0.5, 0.5), pos4 * float2(2.0, 2.0) + float2(-1.0, -1.0)) + 0.5;
            //     // tmp0.w = _Time.y * _ScrollSpeed;
            //     // tmp0.w = tmp0.w * -0.2 + _HighlightScrollOffset;
            //     // tmp0.w = tmp0.w + 0.1;
            //     // tmp0.z = tmp0.z * 0.1 + tmp0.w;
            //     // tmp0.z = frac(tmp0.z);
            //     float x5 = frac(x4 * 0.1 + (_Time.y * _ScrollSpeed) * -0.2 + _HighlightScrollOffset + 0.1);
            //     // tmp0.w = 1.0 - tmp0.z;
            //     // tmp0.z = tmp0.w * tmp0.z + -0.08;
            //     // tmp0.z = tmp0.z * -10.0;
            //     // tmp0.z = max(tmp0.z, 0.0);
            //     float x6 = max(((1.0 - x5) * x5 + -0.08) * -10.0, 0.0);
            //     // tmp0.w = tmp0.z * -2.0 + 3.0;
            //     // tmp0.z = tmp0.z * tmp0.z;
            //     // tmp0.z = tmp0.z * tmp0.w;
            //     // tmp0.z = min(tmp0.z, 1.0);
            //     // tmp0.y = tmp0.y * tmp0.z;
            //     float tmp0_y_59 = highlight * min(x6 * x6 * (x6 * -2.0 + 3.0), 1.0);
            //     // tmp2.xyz = log(abs(_KiraColor.xyz));
            //     // tmp2.xyz = tmp2.xyz * float3(0.4166667, 0.4166667, 0.4166667);
            //     // tmp2.xyz = pow(2.0, tmp2.xyz);
            //     float3 color0 = pow(2.0, log(abs(_KiraColor.rgb)) * float3(0.4166667, 0.4166667, 0.4166667));
            //     // tmp2.xyz = tmp2.xyz * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
            //     float3 color1 = color0 * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
            //     // tmp3.xyz = _KiraColor.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
            //     // tmp4.xyz = _KiraColor.xyz * float3(12.92321, 12.92321, 12.92321);
            //     // tmp2.xyz = tmp3.xyz ? tmp4.xyz : tmp2.xyz;
            //     float3 kiraColor = _KiraColor.rgb <= float3(0.0031308, 0.0031308, 0.0031308) ? _KiraColor.rgb * float3(12.92321, 12.92321, 12.92321) : color1;
            //     // tmp3 = tex2Dbias(_KiraColorTexture, float4(inp.interp.xy, 0, _GlobalMipBias.x));
            //     float4 kiraColorSampled = tex2Dbias(_KiraColorTexture, float4(inp.interp.xy, 0, _GlobalMipBias.x));
            //     // tmp4.xyw = tmp2.yzx * tmp3.yzx;
            //     float3 multKiraColor = kiraColor * kiraColorSampled.rgb;
            //     // tmp5.xy = tmp4.yx;
            //     // tmp2.xy = tmp2.yz * tmp3.yz + -tmp5.xy;
            //     // tmp0.z = tmp5.y >= tmp4.y;
            //     // tmp0.z = uint1(tmp0.z) & uint1(1);
            //     // tmp5.zw = float2(-1.0, 0.6666667);
            //     // tmp2.zw = float2(1.0, -1.0);
            //     // tmp2 = tmp0.zzzz * tmp2 + tmp5;

            //     // float4 tmp2_xyzw_75 = tmp0_z_72.xxxx * float4(kiraGBDelta, float2(1.0, -1.0)) + float4(multKiraColor.bg, float2(-1.0, 0.6666667));
            //     float kiraColorBGMax = max(multKiraColor.g, multKiraColor.b);
            //     float kiraColorBGMin = min(multKiraColor.g, multKiraColor.b);
            //     float z0 = -1.0;
            //     float w0 = 0.6666667;
            //     if (multKiraColor.g >= multKiraColor.b)
            //     {
            //         z0 = 0;
            //         w0 -= 1.0;
            //     }
            //     // tmp0.z = tmp4.w >= tmp2.x;
            //     // tmp0.z = uint1(tmp0.z) & uint1(1);
            //     // tmp4.xyz = tmp2.xyw;
            //     // tmp2.xyw = tmp4.wyx;
            //     // tmp2 = tmp2 - tmp4;
            //     // tmp2 = tmp0.zzzz * tmp2 + tmp4;
            //     // float4 tmp2_xyzw_81 = tmp0_z_77.xxxx * tmp2_xyzw_80 + float4(kiraColorBGMax, kiraColorBGMin, w0, multKiraColor.r);
            //     float color2_x = kiraColorBGMax;
            //     float color2_y = kiraColorBGMin;
            //     float color2_z = w0;
            //     float color2_w = multKiraColor.r;
            //     if (multKiraColor.r >= kiraColorBGMax)
            //     {
            //         color2_x = multKiraColor.r;
            //         color2_y = kiraColorBGMin;
            //         color2_z = z0;
            //         color2_w = kiraColorBGMax;
            //     }
            //     // tmp0.z = tmp2.w - tmp2.y;
            //     // tmp0.w = min(tmp2.y, tmp2.w);
            //     // tmp0.w = tmp2.x - tmp0.w;
            //     float x7 = color2_x - min(color2_y, color2_w);
            //     // tmp1.z = tmp0.w * 6.0 + 0.0;
            //     // tmp0.z = tmp0.z / tmp1.z;
            //     // tmp0.z = tmp0.z + tmp2.z;
            //     // tmp1.z = sin(_Time.y);
            //     // tmp1.zw = tmp1.zz + float2(0.5, -0.05);
            //     // tmp0.z = tmp1.w * 0.1 + abs(tmp0.z);
            //     float x8 = (sin(_Time.y) - 0.05) * 0.1 + abs((color2_w - color2_y) / (x7 * 6.0) + color2_z);
            //     // tmp1.z = saturate(tmp1.z);
            //     float tmp1_z_91 = saturate(sin(_Time.y) + 0.5);
            //     // tmp1.w = tmp0.z > 1.0;
            //     // tmp2.yz = tmp0.zz + float2(1.0, -1.0);
            //     // tmp1.w = tmp1.w ? tmp2.z : tmp0.z;
            //     // tmp0.z = tmp0.z < 0.0;
            //     // tmp0.z = tmp0.z ? tmp2.y : tmp1.w;
            //     float x9 = x8 < 0.0 ? (x8 + 1.0) : (x8 > 1.0 ? (x8 - 1.0) : x8);
            //     // tmp2.yzw = tmp0.zzz + float3(1.0, 0.6666667, 0.3333333);
            //     float3 xyz10 = x9.xxx + float3(1.0, 0.6666667, 0.3333333);
            //     // tmp2.yzw = frac(tmp2.yzw);
            //     // tmp2.yzw = tmp2.yzw * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
            //     float3 xyz11 = frac(xyz10) * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
            //     // tmp2.yzw = saturate(abs(tmp2.yzw) - float3(1.0, 1.0, 1.0));
            //     float3 xyz12 = saturate(abs(xyz11) - float3(1.0, 1.0, 1.0));
            //     // tmp2.yzw = tmp2.yzw - float3(1.0, 1.0, 1.0);
            //     float3 xyz13 = xyz12 - float3(1.0, 1.0, 1.0);
            //     // tmp0.z = tmp2.x + 0.0;
            //     // tmp1.w = tmp0.w / tmp0.z;
            //     // tmp0.w = tmp0.w == 0.0;
            //     // tmp0.z = tmp0.w ? tmp2.x : tmp0.z;
            //     // tmp2.xyz = tmp1.www * tmp2.yzw + float3(1.0, 1.0, 1.0);
            //     // tmp2.xyz = tmp0.zzz * tmp2.xyz;
            //     float3 calcKiraColor = (x7 / color2_x * xyz13 + float3(1.0, 1.0, 1.0)) * color2_x;
            //     // tmp0.zw = float2(_Kira01Tile.x, _Kira02Tile.x) * float2(_Kira01Tile.x, _Kira02Tile.x);
            //     float2 tmp0_zw_108 = float2(_Kira01Tile.x, _Kira02Tile.x) * float2(_Kira01Tile.x, _Kira02Tile.x);
            //     // tmp3.xy = float2(1.00001, 1.00001) / tmp0.zw;
            //     float2 tmp3_xy_109 = float2(1.00001, 1.00001) / tmp0_zw_108;
            //     // tmp3.xy = frac(tmp3.xy);
            //     float2 tmp3_xy_110 = frac(tmp3_xy_109);
            //     // tmp0.zw = tmp0.zw * tmp3.xy;
            //     float2 tmp0_zw_111 = tmp0_zw_108 * tmp3_xy_110;
            //     // tmp0.zw = floor(tmp0.zw);
            //     float2 tmp0_zw_112 = floor(tmp0_zw_111);
            //     // tmp3.xy = tmp0.zw + float2(0.5, 0.5);
            //     float2 tmp3_xy_113 = tmp0_zw_112 + float2(0.5, 0.5);
            //     // tmp3.zw = float2(1.0, 1.0) / float2(_Kira01Tile.x, _Kira02Tile.x);
            //     float2 tmp3_zw_114 = float2(1.0, 1.0) / float2(_Kira01Tile.x, _Kira02Tile.x);
            //     // tmp3.xy = tmp3.zw * tmp3.xy;
            //     float2 tmp3_xy_115 = tmp3_zw_114 * tmp3_xy_113;
            //     // tmp4.zw = floor(tmp3.xy);
            //     float2 tmp4_zw_116 = floor(tmp3_xy_115);
            //     // tmp0.zw = -float2(_Kira01Tile.x, _Kira02Tile.x) * tmp4.zw + tmp0.zw;
            //     float2 tmp0_zw_117 = -float2(_Kira01Tile.x, _Kira02Tile.x) * tmp4_zw_116 + tmp0_zw_112;
            //     // tmp0.zw = tmp0.zw + float2(1.0, 1.0);
            //     float2 tmp0_zw_118 = tmp0_zw_117 + float2(1.0, 1.0);
            //     // tmp4.xy = float2(_Kira01Tile.x, _Kira02Tile.x) - tmp0.zw;
            //     float2 tmp4_xy_119 = float2(_Kira01Tile.x, _Kira02Tile.x) - tmp0_zw_118;
            //     // tmp4 = tmp4.xzyw + inp.interp.xyxy;
            //     float4 tmp4_xyzw_120 = float4(tmp4_xy_119.x, tmp4_zw_116.x, tmp4_xy_119.y, tmp4_zw_116.y) + inp.interp.xyxy;
            //     // tmp3 = tmp4 * tmp3.zzww + float4(-0.5, -0.5, -0.5, -0.5);
            //     float4 tmp3_xyzw_121 = tmp4_xyzw_120 * tmp3_zw_114.xxyy + float4(-0.5, -0.5, -0.5, -0.5);
            //     // tmp0.z = -_Time.y * 0.25 + 1.0;
            //     float tmp0_z_122 = -_Time.y * 0.25 + 1.0;
            //     // tmp4.x = sin(tmp0.z);
            //     float tmp4_x_123 = sin(tmp0_z_122);
            //     // tmp5.x = cos(tmp0.z);
            //     float tmp5_x_124 = cos(tmp0_z_122);
            //     // tmp5.yz = tmp4.xx;
            //     float2 tmp5_yz_125 = tmp4_x_123.xx;
            //     // tmp4.xyz = tmp5.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
            //     float3 tmp4_xyz_126 = float3(tmp5_x_124, tmp5_yz_125) * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
            //     // tmp4.xyz = tmp4.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
            //     float3 tmp4_xyz_127 = tmp4_xyz_126 * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
            //     // tmp5.x = dot(tmp3.zw, tmp4.xz);
            //     float tmp5_x_128 = dot(tmp3_xyzw_121.zw, tmp4_xyz_127.xz);
            //     // tmp5.y = dot(tmp3.wz, tmp4.xy);
            //     float tmp5_y_129 = dot(tmp3_xyzw_121.wz, tmp4_xyz_127.xy);
            //     // tmp0.zw = tmp5.xy + float2(0.5, 0.5);
            //     float2 tmp0_zw_130 = float2(tmp5_x_128, tmp5_y_129) + float2(0.5, 0.5);
            //     // tmp0.zw = tmp0.zw * float2(0.5, 0.5) + float2(0.25, 0.25);
            //     float2 tmp0_zw_131 = tmp0_zw_130 * float2(0.5, 0.5) + float2(0.25, 0.25);
            //     // tmp4 = tex2Dbias(_KiraNormal01, float4(tmp0.zw, 0, _GlobalMipBias.x));
            //     float4 tmp4_xyzw_132 = tex2Dbias(_KiraNormal01, float4(tmp0_zw_131, 0, _GlobalMipBias.x));
            //     // tmp4.x = tmp4.x * tmp4.w;
            //     float tmp4_x_133 = tmp4_xyzw_132.x * tmp4_xyzw_132.w;
            //     // tmp4.xy = tmp4.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
            //     float2 tmp4_xy_134 = float2(tmp4_x_133, tmp4_xyzw_132.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
            //     // tmp0.z = dot(tmp4.xy, tmp4.xy);
            //     float tmp0_z_135 = dot(tmp4_xy_134, tmp4_xy_134);
            //     // tmp0.z = min(tmp0.z, 1.0);
            //     float tmp0_z_136 = min(tmp0_z_135, 1.0);
            //     // tmp0.z = 1.0 - tmp0.z;
            //     float tmp0_z_137 = 1.0 - tmp0_z_136;
            //     // tmp0.z = sqrt(tmp0.z);
            //     float tmp0_z_138 = sqrt(tmp0_z_137);
            //     // tmp4.z = max(tmp0.z, 0.0);
            //     float tmp4_z_139 = max(tmp0_z_138, 0.0);
            //     // tmp4.xyz = saturate(tmp4.xyz);
            //     float3 tmp4_xyz_140 = saturate(float3(tmp4_xy_134, tmp4_z_139));
            //     // tmp4.xyz = tmp4.xyz - float3(0.0, 0.0, 1.0);
            //     float3 tmp4_xyz_141 = tmp4_xyz_140 - float3(0.0, 0.0, 1.0);
            //     // tmp4.xyz = _KiraNormal02Power.xxx * tmp4.xyz + float3(0.0, 0.0, 1.0);
            //     float3 tmp4_xyz_142 = _KiraNormal02Power.xxx * tmp4_xyz_141 + float3(0.0, 0.0, 1.0);
            //     // tmp0.zw = _Time.yy * float2(0.25, 2.5);
            //     float2 tmp0_zw_143 = _Time.yy * float2(0.25, 2.5);
            //     // tmp5.x = sin(tmp0.z);
            //     float tmp5_x_144 = sin(_Time.y * 0.25);
            //     // tmp6.x = cos(tmp0.z);
            //     float tmp6_x_145 = cos(_Time.y * 0.25);
            //     // tmp7.x = sin(tmp0.w);
            //     float tmp7_x_146 = sin(_Time.y * 2.5);
            //     // tmp6.yz = tmp5.xx;
            //     float2 tmp6_yz_147 = tmp5_x_144.xx;
            //     // tmp5.xyz = tmp6.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
            //     float3 tmp5_xyz_148 = float3(tmp6_x_145, tmp6_yz_147) * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
            //     // tmp5.xyz = tmp5.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
            //     float3 tmp5_xyz_149 = tmp5_xyz_148 * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
            //     // tmp6.x = dot(tmp3.xy, tmp5.xz);
            //     float tmp6_x_150 = dot(tmp3_xyzw_121.xy, tmp5_xyz_149.xz);
            //     // tmp6.y = dot(tmp3.yx, tmp5.xy);
            //     float tmp6_y_151 = dot(tmp3_xyzw_121.yx, tmp5_xyz_149.xy);
            //     // tmp0.zw = tmp6.xy + float2(0.5, 0.5);
            //     float2 tmp0_zw_152 = float2(tmp6_x_150, tmp6_y_151) + float2(0.5, 0.5);
            //     // tmp0.zw = tmp0.zw * float2(0.5, 0.5) + float2(0.25, 0.25);
            //     float2 tmp0_zw_153 = tmp0_zw_152 * float2(0.5, 0.5) + float2(0.25, 0.25);
            //     // tmp3 = tex2Dbias(_KiraNormal01, float4(tmp0.zw, 0, _GlobalMipBias.x));
            //     float4 tmp3_xyzw_154 = tex2Dbias(_KiraNormal01, float4(tmp0_zw_153, 0, _GlobalMipBias.x));
            //     // tmp3.x = tmp3.x * tmp3.w;
            //     float tmp3_x_155 = tmp3_xyzw_154.x * tmp3_xyzw_154.w;
            //     // tmp5.xy = tmp3.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
            //     float2 tmp5_xy_156 = float2(tmp3_x_155, tmp3_xyzw_154.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
            //     // tmp3.xy = tmp3.xy + tmp3.xy;
            //     float2 tmp3_xy_157 = float2(tmp3_x_155, tmp3_xyzw_154.y) + float2(tmp3_x_155, tmp3_xyzw_154.y);
            //     // tmp0.z = dot(tmp5.xy, tmp5.xy);
            //     float tmp0_z_158 = dot(tmp5_xy_156, tmp5_xy_156);
            //     // tmp0.z = min(tmp0.z, 1.0);
            //     float tmp0_z_159 = min(tmp0_z_158, 1.0);
            //     // tmp0.z = 1.0 - tmp0.z;
            //     float tmp0_z_160 = 1.0 - tmp0_z_159;
            //     // tmp0.z = sqrt(tmp0.z);
            //     float tmp0_z_161 = sqrt(tmp0_z_160);
            //     // tmp5.z = max(tmp0.z, 0.0);
            //     float tmp5_z_162 = max(tmp0_z_161, 0.0);
            //     // tmp5.xyw = saturate(tmp5.xyz);
            //     float3 tmp5_xyw_163 = saturate(float3(tmp5_xy_156, tmp5_z_162));
            //     // tmp3.z = tmp5.z;
            //     float tmp3_z_164 = tmp5_z_162;
            //     // tmp3.xyz = tmp3.xyz - float3(1.0, 1.0, 1.0);
            //     float3 tmp3_xyz_165 = float3(tmp3_xy_157, tmp3_z_164) - float3(1.0, 1.0, 1.0);
            //     // tmp3.xyz = _CardDistortion.xxx * tmp3.xyz + float3(0.0, 0.0, 1.0);
            //     float3 tmp3_xyz_166 = _CardDistortion.xxx * tmp3_xyz_165 + float3(0.0, 0.0, 1.0);
            //     // tmp5.xyz = tmp5.xyw - float3(0.0, 0.0, 1.0);
            //     float3 tmp5_xyz_167 = tmp5_xyw_163 - float3(0.0, 0.0, 1.0);
            //     // tmp5.xyz = _KiraNormal01Power.xxx * tmp5.xyz + float3(0.0, 0.0, 1.0);
            //     float3 tmp5_xyz_168 = _KiraNormal01Power.xxx * tmp5_xyz_167 + float3(0.0, 0.0, 1.0);
            //     // tmp6.xy = tmp4.xy + tmp5.xy;
            //     float2 tmp6_xy_169 = tmp4_xyz_142.xy + tmp5_xyz_168.xy;
            //     // tmp6.z = tmp4.z * tmp5.z;
            //     float tmp6_z_170 = tmp4_xyz_142.z * tmp5_xyz_168.z;
            //     // tmp0.z = dot(tmp6.xyz, tmp6.xyz);
            //     float tmp0_z_171 = dot(float3(tmp6_xy_169, tmp6_z_170), float3(tmp6_xy_169, tmp6_z_170));
            //     // tmp0.z = max(tmp0.z, 8388608.0);
            //     float tmp0_z_172 = max(tmp0_z_171, 8388608.0);
            //     // tmp0.z = rsqrt(tmp0.z);
            //     float tmp0_z_173 = rsqrt(tmp0_z_172);
            //     // tmp4.xyz = tmp0.zzz * tmp6.xyz;
            //     float3 tmp4_xyz_174 = tmp0_z_173.xxx * float3(tmp6_xy_169, tmp6_z_170);
            //     // tmp0.z = dot(tmp4.xyz, tmp4.xyz);
            //     float tmp0_z_175 = dot(tmp4_xyz_174, tmp4_xyz_174);
            //     // tmp0.z = max(tmp0.z, 8388608.0);
            //     float tmp0_z_176 = max(tmp0_z_175, 8388608.0);
            //     // tmp0.z = rsqrt(tmp0.z);
            //     float tmp0_z_177 = rsqrt(tmp0_z_176);
            //     // tmp0.w = dot(inp.interp2.xyz, inp.interp2.xyz);
            //     float tmp0_w_178 = dot(inp.interp2.xyz, inp.interp2.xyz);
            //     // tmp0.w = sqrt(tmp0.w);
            //     float tmp0_w_179 = sqrt(tmp0_w_178);
            //     // tmp0.w = 1.0 / tmp0.w;
            //     float tmp0_w_180 = 1.0 / tmp0_w_179;
            //     // tmp5.xyz = tmp0.www * inp.interp2.xyz;
            //     float3 tmp5_xyz_181 = tmp0_w_180.xxx * inp.interp2.xyz;
            //     // tmp6.xyz = -tmp0.www * inp.interp2.xyz + _FakeNormalDirection;
            //     float3 tmp6_xyz_182 = -tmp0_w_180.xxx * inp.interp2.xyz + _FakeNormalDirection;
            //     // tmp5.xyz = _FakeBlend.xxx * tmp6.xyz + tmp5.xyz;
            //     float3 tmp5_xyz_183 = _FakeBlend.xxx * tmp6_xyz_182 + tmp5_xyz_181;
            //     // tmp6.xyz = _WorldSpaceCameraPos - inp.interp1.xyz;
            //     float3 tmp6_xyz_184 = _WorldSpaceCameraPos - inp.interp1.xyz;
            //     // tmp0.w = dot(tmp6.xyz, tmp6.xyz);
            //     float tmp0_w_185 = dot(tmp6_xyz_184, tmp6_xyz_184);
            //     // tmp0.w = rsqrt(tmp0.w);
            //     float tmp0_w_186 = rsqrt(tmp0_w_185);
            //     // tmp6.xyz = tmp0.www * tmp6.xyz;
            //     float3 tmp6_xyz_187 = tmp0_w_186.xxx * tmp6_xyz_184;
            //     // tmp0.w = unity_OrthoParams.w == 0.0;
            //     float tmp0_w_188 = unity_OrthoParams.w == 0.0;
            //     // tmp8.x = tmp0.w ? tmp6.x : unity_MatrixV._m20;
            //     float tmp8_x_189 = tmp0_w_188 ? tmp6_xyz_187.x : unity_MatrixV._m20;
            //     // tmp8.y = tmp0.w ? tmp6.y : unity_MatrixV._m21;
            //     float tmp8_y_190 = tmp0_w_188 ? tmp6_xyz_187.y : unity_MatrixV._m21;
            //     // tmp8.z = tmp0.w ? tmp6.z : unity_MatrixV._m22;
            //     float tmp8_z_191 = tmp0_w_188 ? tmp6_xyz_187.z : unity_MatrixV._m22;
            //     // tmp6.xyz = _FakeViewDirection - tmp8.xyz;
            //     float3 tmp6_xyz_192 = _FakeViewDirection - float3(tmp8_x_189, tmp8_y_190, tmp8_z_191);
            //     // tmp6.xyz = _FakeBlend.xxx * tmp6.xyz + tmp8.xyz;
            //     float3 tmp6_xyz_193 = _FakeBlend.xxx * tmp6_xyz_192 + float3(tmp8_x_189, tmp8_y_190, tmp8_z_191);
            //     // tmp8.xyz = _FakeLightDirection - _MainLightPosition.xyz;
            //     float3 tmp8_xyz_194 = _FakeLightDirection - _MainLightPosition.xyz;
            //     // tmp8.xyz = _FakeBlend.xxx * tmp8.xyz + _MainLightPosition.xyz;
            //     float3 tmp8_xyz_195 = _FakeBlend.xxx * tmp8_xyz_194 + _MainLightPosition.xyz;
            //     // tmp9.xyz = tmp6.xyz + tmp8.xyz;
            //     float3 tmp9_xyz_196 = tmp6_xyz_193 + tmp8_xyz_195;
            //     // tmp0.w = dot(tmp9.xyz, tmp9.xyz);
            //     float tmp0_w_197 = dot(tmp9_xyz_196, tmp9_xyz_196);
            //     // tmp0.w = rsqrt(tmp0.w);
            //     float tmp0_w_198 = rsqrt(tmp0_w_197);
            //     // tmp9.xyz = tmp0.www * tmp9.xyz;
            //     float3 tmp9_xyz_199 = tmp0_w_198.xxx * tmp9_xyz_196;
            //     // tmp0.w = dot(tmp9.xyz, tmp5.xyz);
            //     float tmp0_w_200 = dot(tmp9_xyz_199, tmp5_xyz_183);
            //     // tmp5.xyz = tmp5.xyz + float3(0.0, 0.0, 1.0);
            //     float3 tmp5_xyz_201 = tmp5_xyz_183 + float3(0.0, 0.0, 1.0);
            //     // tmp0.w = tmp0.w * _HoloShift;
            //     float tmp0_w_202 = tmp0_w_200 * _HoloShift;
            //     // tmp9 = tex2Dbias(_HoloTex, float4(tmp0.ww, 0, _GlobalMipBias.x));
            //     float4 tmp9_xyzw_203 = tex2Dbias(_HoloTex, float4(tmp0_w_202.xx, 0, _GlobalMipBias.x));
            //     // tmp9.x = tmp9.x * tmp9.w;
            //     float tmp9_x_204 = tmp9_xyzw_203.x * tmp9_xyzw_203.w;
            //     // tmp9.xy = tmp9.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
            //     float2 tmp9_xy_205 = float2(tmp9_x_204, tmp9_xyzw_203.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
            //     // tmp10.xy = tmp4.xy * tmp0.zz + tmp9.xy;
            //     float2 tmp10_xy_206 = tmp4_xyz_174.xy * tmp0_z_177.xx + tmp9_xy_205;
            //     // tmp0.w = dot(tmp9.xy, tmp9.xy);
            //     float tmp0_w_207 = dot(tmp9_xy_205, tmp9_xy_205);
            //     // tmp0.w = min(tmp0.w, 1.0);
            //     float tmp0_w_208 = min(tmp0_w_207, 1.0);
            //     // tmp0.w = 1.0 - tmp0.w;
            //     float tmp0_w_209 = 1.0 - tmp0_w_208;
            //     // tmp0.w = sqrt(tmp0.w);
            //     float tmp0_w_210 = sqrt(tmp0_w_209);
            //     // tmp0.w = max(tmp0.w, 0.0);
            //     // tmp1.w = tmp0.z * tmp4.z;
            //     float tmp1_w_212 = tmp0_z_177 * tmp4_xyz_174.z;
            //     // tmp10.z = tmp0.w * tmp1.w;
            //     float tmp10_z_213 = max(sqrt(1.0 - min(tmp0_w_207, 1.0)), 0.0) * tmp1_w_212;
            //     // tmp0.w = dot(tmp10.xyz, tmp10.xyz);
            //     // tmp0.w = max(tmp0.w, 8388608.0);
            //     // tmp0.w = rsqrt(tmp0.w);
            //     // tmp2.w = tmp0.w * tmp10.z;
            //     // tmp9.xy = tmp10.xy * tmp0.ww + tmp3.xy;
            //     // tmp9.z = tmp2.w * tmp3.z;
            //     float3 tmp3_xyz_223_v = normalize(float3(tmp10_xy_206, tmp10_z_213));
            //     // tmp0.w = dot(tmp9.xyz, tmp9.xyz);
            //     // tmp0.w = max(tmp0.w, 8388608.0);
            //     // tmp0.w = rsqrt(tmp0.w);
            //     // tmp3.xyz = tmp0.www * tmp9.xyz;
            //     float3 tmp3_xyz_223 = normalize(float3(tmp3_xyz_223_v.xy + tmp3_xyz_166.xy, tmp3_xyz_223_v.z * tmp3_xyz_166.z));
            //     // tmp3.yw = tmp3.yy * unity_MatrixV._m01_m11;
            //     // tmp3.xy = unity_MatrixV._m00_m10 * tmp3.xx + tmp3.yw;
            //     // tmp3.xy = unity_MatrixV._m02_m12 * tmp3.zz + tmp3.xy;
            //     // tmp3.xy = tmp3.xy + unity_MatrixV._m03_m13;
            //     float2 tmp3_xy_227 = mul(unity_WorldToCamera, float4(tmp3_xyz_223, 0)).xy;
            //     // tmp3 = tex2Dbias(_HoloTex, float4(tmp3.xy, 0, _GlobalMipBias.x));
            //     float4 holoColor = tex2Dbias(_HoloTex, float4(tmp3_xy_227, 0, _GlobalMipBias.x));
            //     // tmp9.xyz = float3(1.0, 1.0, 1.0) - tmp3.xyz;
            //     // tmp9.xyz = tmp9.xyz + tmp9.xyz;
            //     // tmp0.w = 1.0 - _HoloBrightness;
            //     // tmp9.xyz = -tmp9.xyz * tmp0.www + float3(1.0, 1.0, 1.0);
            //     float3 tmp9_xyz_232 = -2 * (float3(1.0, 1.0, 1.0) - holoColor.xyz) * (1.0 - _HoloBrightness) + float3(1.0, 1.0, 1.0);
            //     // tmp10.xyz = tmp3.xyz <= float3(0.5, 0.5, 0.5);
            //     // tmp3.xyz = tmp3.xyz * _HoloBrightness.xxx;
            //     // tmp3.xyz = tmp3.xyz + tmp3.xyz;
            //     // tmp11.xyz = tmp10.xyz ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0);
            //     // tmp10.xyz = uint3(tmp10.xyz) & uint3(int3(1, 1, 1));
            //     // tmp9.xyz = tmp9.xyz * tmp11.xyz;
            //     // tmp3.xyz = saturate(tmp3.xyz * tmp10.xyz + tmp9.xyz);
            //     float3 tmp3_xyz_239 = holoColor.xyz > float3(0.5, 0.5, 0.5) ? saturate(2 * holoColor.xyz * _HoloBrightness + tmp9_xyz_232) : float3(0.0, 0.0, 0.0);
            //     // tmp3.xyz = tmp3.zzz + tmp3.xyz;
            //     // tmp2.xyz = tmp2.xyz * tmp3.xyz;
            //     // tmp2.xyz = tmp2.xyz * _IllustHoloPower.xxx;
            //     float3 kiraHoloColor = calcKiraColor * (tmp3_xyz_239.zzz + tmp3_xyz_239) * _IllustHoloPower;
            //     // tmp3.xy = _Time.yy * float2(2.5, 2.5) + float2(2.09439, 4.18878);
            //     // tmp7.yz = sin(tmp3.xy);
            //     // tmp3.xyz = tmp7.xyz + float3(3.0, 3.0, 3.0);
            //     float3 kiraAtColor = float3(sin(_Time.y * 2.5), sin(_Time.y * 2.5 + 2.09439), sin(_Time.y * 2.5 + 4.18878)) + float3(3.0, 3.0, 3.0);
            //     // tmp7 = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
            //     float4 mainColor = tex2Dbias(_MainTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
            //     // tmp3.xyz = tmp3.xyz * float3(0.2, 0.2, 0.2) + -tmp7.xyz;
            //     float3 kiraAtDelta = kiraAtColor * float3(0.2, 0.2, 0.2) - mainColor.rgb;
            //     // tmp0.w = dot(tmp3.xyz, tmp3.xyz);
            //     // tmp0.w = sqrt(tmp0.w);
            //     // tmp0.w = saturate(-_EnhanceColorThreshold * tmp0.w + 1.0);
            //     // tmp0.w = dot(tmp0.ww, _IllustRanbowPower.xx);
            //     // tmp2.xyz = tmp0.www * tmp2.xyz;
            //     float3 kiraShineColor = 2 * _IllustRanbowPower * saturate(1.0 - _EnhanceColorThreshold * length(kiraAtDelta)) * kiraHoloColor;
            //     // tmp3 = tex2Dbias(_KiraMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
            //     float4 kiraMaskColor = tex2Dbias(_KiraMask, float4(inp.interp.xy, 0, _GlobalMipBias.x));
            //     float kiraMask = kiraMaskColor.r > 0 ? (61.0 / 255.0) : 0.0;
            //     // tmp0.w = tmp3.x * _IllustContrast + 1.0;
            //     float kiraContrast = kiraMask * _IllustContrast + 1.0;
            //     // tmp3.yzw = tmp7.xyz * tmp0.www + -tmp2.xyz;
            //     // tmp2.w = 1.0 - tmp3.x;
            //     // tmp2.xyz = tmp2.www * tmp3.yzw + tmp2.xyz;
            //     // float3 tmp2_xyz_257 = (1.0 - kiraMaskColor.r) * (mainColor.rgb * kiraContrast - kiraShineColor) + kiraShineColor;
            //     // tmp2.w = tmp3.x - 0.2176376;
            //     // tmp2.w = saturate(tmp2.w * 10.0 + 0.2176376);
            //     // tmp2.xyz = tmp2.www * _IllustBrightness.xxx + tmp2.xyz;
            //     float3 kiraMaskedColor = saturate((kiraMask - 0.2176376) * 10.0 + 0.2176376) * _IllustBrightness + 
            //             lerp(mainColor.rgb * kiraContrast, kiraShineColor, kiraMask * 3);
            //     // tmp2.xyz = tmp2.xyz + _AmbientColor.xyz;
            //     return pack(kiraShineColor, 1);
            //     float3 kiraMaskedAmbColor = kiraMaskedColor + _AmbientColor.xyz;
            //     // tmp3.yz = ddx(tmp1.xy);
            //     // tmp4.zw = ddy(tmp1.xy);
            //     // tmp3.yz = abs(tmp3.yz) + abs(tmp4.zw);
            //     // tmp1.xy = tmp1.xy / tmp3.yz;
            //     // tmp1.xy = saturate(float2(1.0, 1.0) - tmp1.xy);
            //     float2 tmp1_xy_266 = saturate(float2(1.0, 1.0) - tmp1_xy_44 / (abs(ddx(tmp1_xy_44)) + abs(ddy(tmp1_xy_44))));
            //     // tmp1.x = min(tmp1.y, tmp1.x);
            //     float tmp1_x_267 = min(tmp1_xy_266.y, tmp1_xy_266.x);
            //     // tmp3.yzw = log(abs(_CardNameColor.xyz));
            //     float3 tmp3_yzw_268 = log(abs(_CardNameColor.xyz));
            //     // tmp3.yzw = tmp3.yzw * float3(0.4166667, 0.4166667, 0.4166667);
            //     float3 tmp3_yzw_269 = tmp3_yzw_268 * float3(0.4166667, 0.4166667, 0.4166667);
            //     // tmp3.yzw = pow(2.0, tmp3.yzw);
            //     float3 tmp3_yzw_270 = pow(2.0, tmp3_yzw_269);
            //     // tmp3.yzw = tmp3.yzw * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
            //     float3 tmp3_yzw_271 = tmp3_yzw_270 * float3(1.055, 1.055, 1.055) + float3(-0.055, -0.055, -0.055);
            //     // tmp9.xyz = _CardNameColor.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
            //     float3 tmp9_xyz_272 = _CardNameColor.xyz <= float3(0.0031308, 0.0031308, 0.0031308);
            //     // tmp10.xyz = _CardNameColor.xyz * float3(12.92321, 12.92321, 12.92321);
            //     float3 tmp10_xyz_273 = _CardNameColor.xyz * float3(12.92321, 12.92321, 12.92321);
            //     // tmp3.yzw = tmp9.xyz ? tmp10.xyz : tmp3.yzw;
            //     float3 tmp3_yzw_274 = tmp9_xyz_272 ? tmp10_xyz_273 : tmp3_yzw_271;
            //     // tmp9 = inp.interp.xyxy - float4(0.37, 0.427, -0.0, 0.35);
            //     float4 tmp9_xyzw_275 = inp.interp.xyxy - float4(0.37, 0.427, -0.0, 0.35);
            //     // tmp9 = tmp9 * float4(2.0, 2.0, 2.0, 2.0) + float4(-1.0, -1.0, -1.0, -1.0);
            //     float4 tmp9_xyzw_276 = tmp9_xyzw_275 * float4(2.0, 2.0, 2.0, 2.0) + float4(-1.0, -1.0, -1.0, -1.0);
            //     // tmp4.zw = abs(tmp9.zw) - float2(0.91, 0.05);
            //     float2 tmp4_zw_277 = abs(tmp9_xyzw_276.zw) - float2(0.91, 0.05);
            //     // tmp9 = abs(tmp9) - float4(0.12, 0.085, 0.91, 0.0);
            //     float4 tmp9_xyzw_278 = abs(tmp9_xyzw_276) - float4(0.12, 0.085, 0.91, 0.0);
            //     // tmp10.xy = ddx(tmp4.zw);
            //     float2 tmp10_xy_279 = ddx(tmp4_zw_277);
            //     // tmp10.zw = ddy(tmp4.zw);
            //     float2 tmp10_zw_280 = ddy(tmp4_zw_277);
            //     // tmp10.xy = abs(tmp10.zw) + abs(tmp10.xy);
            //     float2 tmp10_xy_281 = abs(tmp10_zw_280) + abs(tmp10_xy_279);
            //     // tmp4.zw = tmp4.zw / tmp10.xy;
            //     float2 tmp4_zw_282 = tmp4_zw_277 / tmp10_xy_281;
            //     // tmp4.zw = saturate(float2(1.0, 1.0) - tmp4.zw);
            //     float2 tmp4_zw_283 = saturate(float2(1.0, 1.0) - tmp4_zw_282);
            //     // tmp1.y = min(tmp4.w, tmp4.z);
            //     float tmp1_y_284 = min(tmp4_zw_283.y, tmp4_zw_283.x);
            //     // tmp10 = ddx(tmp9);
            //     float4 tmp10_xyzw_285 = ddx(tmp9_xyzw_278);
            //     // tmp11 = ddy(tmp9);
            //     float4 tmp11_xyzw_286 = ddy(tmp9_xyzw_278);
            //     // tmp10 = abs(tmp10) + abs(tmp11);
            //     float4 tmp10_xyzw_287 = abs(tmp10_xyzw_285) + abs(tmp11_xyzw_286);
            //     // tmp9 = tmp9 / tmp10;
            //     float4 tmp9_xyzw_288 = tmp9_xyzw_278 / tmp10_xyzw_287;
            //     // tmp9 = saturate(float4(1.0, 1.0, 1.0, 1.0) - tmp9);
            //     float4 tmp9_xyzw_289 = saturate(float4(1.0, 1.0, 1.0, 1.0) - tmp9_xyzw_288);
            //     // tmp4.zw = min(tmp9.yw, tmp9.xz);
            //     float2 tmp4_zw_290 = min(tmp9_xyzw_289.yw, tmp9_xyzw_289.xz);
            //     // tmp9.xy = float2(_LinkOn_Off.x, _isFade.x) != float2(0.0, 0.0);
            //     float2 tmp9_xy_291 = float2(_LinkOn_Off.x, _isFade.x) != float2(0.0, 0.0);
            //     // tmp1.y = tmp9.x ? tmp4.w : tmp1.y;
            //     float tmp1_y_292 = _LinkOn_Off != 0 ? tmp4_zw_290.y : tmp1_y_284;
            //     // tmp9.xzw = _EnvironmentPower.xxx * _EnvironmentColor.xyz;
            //     float3 tmp9_xzw_293 = _EnvironmentPower.xxx * _EnvironmentColor.xyz;
            //     // tmp10.xyz = -_EnvironmentPower.xxx * _EnvironmentColor.xyz + _EnvironmentPower.xxx;
            //     float3 tmp10_xyz_294 = -_EnvironmentPower.xxx * _EnvironmentColor.xyz + _EnvironmentPower.xxx;
            //     // tmp9.xzw = tmp4.zzz * tmp10.xyz + tmp9.xzw;
            //     float3 tmp9_xzw_295 = tmp4_zw_290.xxx * tmp10_xyz_294 + tmp9_xzw_293;
            //     // tmp10.xyz = _EnvironmentPower.xxx * float3(0.8980392, 0.8666667, 0.3254902) + -tmp9.xzw;
            //     float3 tmp10_xyz_296 = _EnvironmentPower.xxx * float3(0.8980392, 0.8666667, 0.3254902) + -tmp9_xzw_295;
            //     // tmp9.xzw = tmp1.yyy * tmp10.xyz + tmp9.xzw;
            //     float3 tmp9_xzw_297 = tmp1_y_292 * tmp10_xyz_296 + tmp9_xzw_295;
            //     // tmp3.yzw = _EnvironmentPower.xxx * tmp3.yzw + -tmp9.xzw;
            //     // float3 tmp3_yzw_298 = _EnvironmentPower.xxx * tmp3_yzw_274 + -tmp9_xzw_297;
            //     // tmp3.yzw = tmp1.xxx * tmp3.yzw + tmp9.xzw;
            //     float3 tmp3_yzw_299 = lerp(tmp9_xzw_297, _EnvironmentPower * tmp3_yzw_274, tmp1_x_267); // tmp1_x_267.xxx * tmp3_yzw_298 + tmp9_xzw_297;
            //     // tmp3.yzw = -tmp7.xyz * tmp0.www + tmp3.yzw;
            //     // float3 tmp3_yzw_300 = -mainColor.rgb * kiraContrast + tmp3_yzw_299;
            //     // tmp9.xzw = tmp0.www * tmp7.xyz;
            //     // float3 tmp9_xzw_301 = kiraContrast * mainColor.rgb;
            //     // tmp7.xyz = tmp7.xyz + _AmbientColor.xyz;
            //     float3 tmp7_xyz_302 = mainColor.rgb + _AmbientColor.rgb;
            //     // tmp1.xy = inp.interp.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
            //     // tmp1.xy = abs(tmp1.xy) - float2(0.9, 0.9);
            //     float2 tmp1_xy_304 = abs(inp.interp.xy * float2(2.0, 2.0) - float2(1.0, 1.0)) - float2(0.9, 0.9);
            //     // tmp4.zw = ddx(tmp1.xy);
            //     // tmp10.xy = ddy(tmp1.xy);
            //     // tmp4.zw = abs(tmp4.zw) + abs(tmp10.xy);
            //     // tmp1.xy = tmp1.xy / tmp4.zw;
            //     float2 tmp1_xy_308 = tmp1_xy_304 / (abs(ddx(tmp1_xy_304)) + abs(ddy(tmp1_xy_304)));
            //     // tmp1.xy = saturate(float2(1.0, 1.0) - tmp1.xy);
            //     float2 tmp1_xy_309 = saturate(float2(1.0, 1.0) - tmp1_xy_308);
            //     // tmp0.w = min(tmp1.y, tmp1.x);
            //     // tmp0.x = tmp0.x * tmp0.w;
            //     float tmp0_x_311 = highlightMask * min(tmp1_xy_309.x, tmp1_xy_309.y);
            //     // tmp3.yzw = tmp0.xxx * tmp3.yzw + tmp9.xzw;
            //     float3 tmp3_yzw_312 = lerp(kiraContrast * mainColor.rgb, 1, tmp0_x_311); // tmp0_x_311 * tmp3_yzw_300 + tmp9_xzw_301;
            //     // tmp3.yzw = tmp3.yzw - tmp2.xyz;
            //     // tmp2.xyz = tmp0.xxx * tmp3.yzw + tmp2.xyz;
            //     float3 tmp2_xyz_314 = lerp(kiraMaskedAmbColor, tmp3_yzw_312, tmp0_x_311); // tmp0_x_311.xxx * (tmp3_yzw_312 - kiraMaskedAmbColor) + kiraMaskedAmbColor;
            //     return pack(kiraMaskedAmbColor, 1.0);
            //     // tmp0.w = dot(tmp6.xyz, tmp6.xyz);
            //     float tmp0_w_315 = dot(tmp6_xyz_193, tmp6_xyz_193);
            //     // tmp0.w = max(tmp0.w, 8388608.0);
            //     float tmp0_w_316 = max(tmp0_w_315, 8388608.0);
            //     // tmp0.w = rsqrt(tmp0.w);
            //     float tmp0_w_317 = rsqrt(tmp0_w_316);
            //     // tmp3.yzw = tmp6.xyz * tmp0.www + tmp8.xyz;
            //     float3 tmp3_yzw_318 = tmp6_xyz_193 * tmp0_w_317.xxx + tmp8_xyz_195;
            //     // tmp0.w = dot(tmp3.yzw, tmp3.yzw);
            //     float tmp0_w_319 = dot(tmp3_yzw_318, tmp3_yzw_318);
            //     // tmp0.w = max(tmp0.w, 8388608.0);
            //     float tmp0_w_320 = max(tmp0_w_319, 8388608.0);
            //     // tmp0.w = rsqrt(tmp0.w);
            //     float tmp0_w_321 = rsqrt(tmp0_w_320);
            //     // tmp3.yzw = tmp0.www * tmp3.yzw;
            //     float3 tmp3_yzw_322 = tmp0_w_321.xxx * tmp3_yzw_318;
            //     // tmp6 = tex2Dbias(_MainNormal, float4(inp.interp.xy, 0, _GlobalMipBias.x));
            //     float4 tmp6_xyzw_323 = tex2Dbias(_MainNormal, float4(inp.interp.xy, 0, _GlobalMipBias.x));
            //     // tmp6.x = tmp6.x * tmp6.w;
            //     float tmp6_x_324 = tmp6_xyzw_323.x * tmp6_xyzw_323.w;
            //     // tmp1.xy = tmp6.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
            //     float2 tmp1_xy_325 = float2(tmp6_x_324, tmp6_xyzw_323.y) * float2(2.0, 2.0) + float2(-1.0, -1.0);
            //     // tmp6.xy = tmp6.xy + tmp6.xy;
            //     float2 tmp6_xy_326 = float2(tmp6_x_324, tmp6_xyzw_323.y) + float2(tmp6_x_324, tmp6_xyzw_323.y);
            //     // tmp0.w = dot(tmp1.xy, tmp1.xy);
            //     float tmp0_w_327 = dot(tmp1_xy_325, tmp1_xy_325);
            //     // tmp0.w = min(tmp0.w, 1.0);
            //     float tmp0_w_328 = min(tmp0_w_327, 1.0);
            //     // tmp0.w = 1.0 - tmp0.w;
            //     float tmp0_w_329 = 1.0 - tmp0_w_328;
            //     // tmp0.w = sqrt(tmp0.w);
            //     float tmp0_w_330 = sqrt(tmp0_w_329);
            //     // tmp6.z = max(tmp0.w, 0.0);
            //     float tmp6_z_331 = max(tmp0_w_330, 0.0);
            //     // tmp6.xyz = tmp6.xyz - float3(1.0, 1.0, 1.0);
            //     float3 tmp6_xyz_332 = float3(tmp6_xy_326, tmp6_z_331) - float3(1.0, 1.0, 1.0);
            //     // tmp6.xyz = _MainNormalPower.xxx * tmp6.xyz + float3(0.0, 0.0, 1.0);
            //     float3 tmp6_xyz_333 = _MainNormalPower.xxx * tmp6_xyz_332 + float3(0.0, 0.0, 1.0);
            //     // tmp4.xy = tmp4.xy * tmp0.zz + tmp6.xy;
            //     float2 tmp4_xy_334 = tmp4_xyz_174.xy * tmp0_z_177.xx + tmp6_xyz_333.xy;
            //     // tmp4.z = tmp1.w * tmp6.z;
            //     float tmp4_z_335 = tmp1_w_212 * tmp6_xyz_333.z;
            //     // tmp0.z = dot(tmp4.xyz, tmp4.xyz);
            //     float tmp0_z_336 = dot(float3(tmp4_xy_334, tmp4_z_335), float3(tmp4_xy_334, tmp4_z_335));
            //     // tmp0.z = max(tmp0.z, 8388608.0);
            //     float tmp0_z_337 = max(tmp0_z_336, 8388608.0);
            //     // tmp0.z = rsqrt(tmp0.z);
            //     float tmp0_z_338 = rsqrt(tmp0_z_337);
            //     // tmp1.xyw = tmp0.zzz * tmp4.xyz;
            //     float3 tmp1_xyw_339 = tmp0_z_338.xxx * float3(tmp4_xy_334, tmp4_z_335);
            //     // tmp1.xyw = tmp1.xyw * float3(-1.0, -1.0, 1.0);
            //     float3 tmp1_xyw_340 = tmp1_xyw_339 * float3(-1.0, -1.0, 1.0);
            //     // tmp0.z = dot(tmp5.xyz, tmp1.xyw);
            //     float tmp0_z_341 = dot(tmp5_xyz_201, tmp1_xyw_340);
            //     // tmp4.xyz = tmp5.xyz / tmp5.zzz;
            //     float3 tmp4_xyz_342 = tmp5_xyz_201 / tmp5_xyz_201.zzz;
            //     // tmp1.xyw = tmp4.xyz * tmp0.zzz + -tmp1.xyw;
            //     float3 tmp1_xyw_343 = tmp4_xyz_342 * tmp0_z_341.xxx + -tmp1_xyw_340;
            //     // tmp0.z = dot(tmp1.xyw, tmp1.xyw);
            //     float tmp0_z_344 = dot(tmp1_xyw_343, tmp1_xyw_343);
            //     // tmp0.z = rsqrt(tmp0.z);
            //     float tmp0_z_345 = rsqrt(tmp0_z_344);
            //     // tmp4.xyz = tmp0.zzz * tmp1.xyw;
            //     float3 tmp4_xyz_346 = tmp0_z_345.xxx * tmp1_xyw_343;
            //     // tmp0.z = saturate(dot(tmp1.xyw, tmp8.xyz));
            //     float tmp0_z_347 = saturate(dot(tmp1_xyw_343, tmp8_xyz_195));
            //     // tmp0.w = saturate(dot(tmp4.xyz, tmp3.yzw));
            //     float tmp0_w_348 = saturate(dot(tmp4_xyz_346, tmp3_yzw_322));
            //     // tmp0.w = log(tmp0.w);
            //     float tmp0_w_349 = log(tmp0_w_348);
            //     // tmp1.x = _Smoothness * 10.0 + 1.0;
            //     float tmp1_x_350 = _Smoothness * 10.0 + 1.0;
            //     // tmp1.x = pow(2.0, tmp1.x);
            //     float tmp1_x_351 = pow(2.0, tmp1_x_350);
            //     // tmp0.w = tmp0.w * tmp1.x;
            //     float tmp0_w_352 = tmp0_w_349 * tmp1_x_351;
            //     // tmp0.w = pow(2.0, tmp0.w);
            //     float tmp0_w_353 = pow(2.0, tmp0_w_352);
            //     // tmp1.x = _KiraMetal - _MainTexMetal;
            //     float tmp1_x_354 = _KiraMetal - _MainTexMetal;
            //     // tmp1.x = tmp3.x * tmp1.x + _MainTexMetal;
            //     float tmp1_x_355 = kiraMaskColor.x * tmp1_x_354 + _MainTexMetal;
            //     // tmp1.y = tmp3.x * 100.0;
            //     float tmp1_y_356 = kiraMaskColor.x * 100.0;
            //     // tmp1.y = max(tmp1.y, 0.0);
            //     float tmp1_y_357 = max(kiraMaskColor.x * 100.0, 0.0);
            //     // tmp1.y = min(tmp1.z, tmp1.y);
            //     float tmp1_y_358 = min(saturate(sin(_Time.y) + 0.5), max(kiraMask * 100.0, 0.0));
            //     // tmp1.z = _FrameMetal - tmp1.x;
            //     float tmp1_z_359 = _FrameMetal - tmp1_x_355;
            //     // tmp0.x = tmp0.x * tmp1.z + tmp1.x;
            //     float tmp0_x_360 = tmp0_x_311 * tmp1_z_359 + tmp1_x_355;
            //     // tmp1.xzw = tmp0.xxx * _SpecularColor.xyz;
            //     float3 tmp1_xzw_361 = tmp0_x_360.xxx * _SpecularColor.xyz;
            //     // tmp1.xzw = tmp0.www * tmp1.xzw;
            //     float3 tmp1_xzw_362 = tmp0_w_353.xxx * tmp1_xzw_361;
            //     // tmp3.xyz = _FakeLightColor.xyz - _MainLightColor.xyz;
            //     float3 tmp3_xyz_363 = _FakeLightColor.xyz - _MainLightColor.xyz;
            //     // tmp3.xyz = _FakeBlend.xxx * tmp3.xyz + _MainLightColor.xyz;
            //     float3 tmp3_xyz_364 = _FakeBlend.xxx * tmp3_xyz_363 + _MainLightColor.xyz;
            //     // tmp3.xyz = tmp3.xyz * _DirectionalLightAmp.xxx;
            //     float3 tmp3_xyz_365 = tmp3_xyz_364 * _DirectionalLightAmp.xxx;
            //     // tmp1.xzw = tmp1.xzw * tmp3.xyz;
            //     float3 tmp1_xzw_366 = tmp1_xzw_362 * tmp3_xyz_365;
            //     // tmp0.xzw = tmp0.zzz * _DirectionalLightAmp.xxx + tmp1.xzw;
            //     float3 tmp0_xzw_367 = tmp0_z_347.xxx * _DirectionalLightAmp.xxx + tmp1_xzw_366;
            //     // tmp0.xzw = tmp0.xzw + _AmbientColor.xyz;
            //     float3 tmp0_xzw_368 = tmp0_xzw_367 + _AmbientColor.xyz;
            //     // tmp0.xyz = tmp0.xzw * tmp2.xyz + tmp0.yyy;
            //     float3 tmp0_xyz_369 = tmp0_xzw_368 * tmp2_xyz_314 + tmp0_y_59.xxx;
            //     // tmp1.xzw = tmp7.xyz - tmp0.xyz;
            //     float3 tmp1_xzw_370 = tmp7_xyz_302 - tmp0_xyz_369;
            //     // tmp0.xyz = tmp1.yyy * tmp1.xzw + tmp0.xyz;
            //     float3 tmp0_xyz_371 = tmp1_y_358.xxx * tmp1_xzw_370 + tmp0_xyz_369;
            //     // same
            //     float4 loadingColor = tex2Dbias(_LoadingTex, float4(inp.interp.xy, 0, _GlobalMipBias.x));
            //     float3 loadingBlendedColor = lerp(tmp0_xyz_371, loadingColor.rgb, _LoadingBlend);
            //     float mostMonochrome = dot(loadingBlendedColor, float3(0.299, 0.587, 0.114));
            //     float3 monoColor = lerp(loadingBlendedColor, mostMonochrome.xxx, _Monochrome);
            //     float4 textureColor = tex2Dbias(_Texture2DAsset_90c6e35ef4304f289c279037152a03b7_Out_0_Texture2D, float4(inp.interp.xy, 0, _GlobalMipBias.x));
            //     float textureMask = textureColor.r;
            //     float4 maskedColor = textureMask * _AddColor * _TintColor.wxyz * float4(monoColor, 1) * float4(2.0, 2.0, 2.0, 1.0);
            //     float timeFactor = (sin(2 * _Time.y) + 1.0) * 0.2 + 0.5;
            //     o.sv_target = _isFade != 0.0 ? maskedColor * timeFactor : maskedColor;
            //     return o;
            // }
            ENDCG
            
        }
        Pass {
            Name "DepthOnly"
            ColorMask B
            ZClip On
            Tags {
                "DisableBatching"="False"
                "LIGHTMODE"="DepthOnly"
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
                float4 sv_target : SV_TARGET;
            };

            // CBs for DX11PixelSM40
            // Textures for DX11PixelSM40

            fout frag(v2f inp)
            {
                fout o;
                o.sv_target = inp.position.zzzz;
                return o;
            }
            ENDCG
            
        }
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
        Pass {
            Name "DepthNormalsOnly"
            ZClip On
            Tags {
                "DisableBatching"="False"
                "LIGHTMODE"="DepthNormalsOnly"
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
            // Textures for DX11PixelSM40

            fout frag(v2f inp)
            {
                fout o;
                float4 tmp0;
                tmp0.x = dot(inp.interp2.xyz, inp.interp2.xyz);
                tmp0.x = rsqrt(tmp0.x);
                o.sv_target.xyz = tmp0.xxx * inp.interp2.xyz;
                o.sv_target.w = 0.0;
                return o;
            }
            ENDCG
            
        }
        Pass {
            Name "ShadowCaster"
            ColorMask 0
            ZClip On
            Tags {
                "DisableBatching"="False"
                "LIGHTMODE"="SHADOWCASTER"
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
            float4 _ShadowBias; // 2064 (starting at cb0[129].x)
            float3 _LightDirection; // 2080 (starting at cb0[130].x)
            // Textures for DX11VertexSM40

            v2f vert(appdata v)
            {
                v2f o;
                float4 tmp0;
                float4 tmp1;
                float4 tmp2;
                tmp0.x = dot(v.normal.xyz, unity_WorldToObject._m00_m10_m20);
                tmp0.y = dot(v.normal.xyz, unity_WorldToObject._m01_m11_m21);
                tmp0.z = dot(v.normal.xyz, unity_WorldToObject._m02_m12_m22);
                tmp0.w = dot(tmp0.xyz, tmp0.xyz);
                tmp0.w = max(tmp0.w, 8388608.0);
                tmp0.w = rsqrt(tmp0.w);
                tmp0.xyz = tmp0.www * tmp0.xyz;
                tmp0.w = saturate(dot(_LightDirection, tmp0.xyz));
                tmp0.w = 1.0 - tmp0.w;
                tmp0.w = tmp0.w * _ShadowBias.y;
                tmp1.xyz = v.vertex.yyy * unity_ObjectToWorld._m01_m11_m21;
                tmp1.xyz = unity_ObjectToWorld._m00_m10_m20 * v.vertex.xxx + tmp1.xyz;
                tmp1.xyz = unity_ObjectToWorld._m02_m12_m22 * v.vertex.zzz + tmp1.xyz;
                tmp1.xyz = tmp1.xyz + unity_ObjectToWorld._m03_m13_m23;
                tmp2.xyz = _LightDirection * _ShadowBias.xxx + tmp1.xyz;
                o.interp1.xyz = tmp1.xyz;
                tmp1.xyz = tmp0.xyz * tmp0.www + tmp2.xyz;
                o.interp2.xyz = tmp0.xyz;
                tmp0 = tmp1.yyyy * unity_MatrixVP._m01_m11_m21_m31;
                tmp0 = unity_MatrixVP._m00_m10_m20_m30 * tmp1.xxxx + tmp0;
                tmp0 = unity_MatrixVP._m02_m12_m22_m32 * tmp1.zzzz + tmp0;
                tmp0 = tmp0 + unity_MatrixVP._m03_m13_m23_m33;
                tmp1.x = min(tmp0.w, tmp0.z);
                tmp1.x = tmp1.x - tmp0.z;
                tmp1.y = round(_ShadowBias.z);
                tmp1.y = tmp1.y == 1.0;
                tmp1.y = uint1(tmp1.y) & uint1(1);
                o.position.z = tmp1.y * tmp1.x + tmp0.z;
                o.position.xyw = tmp0.xyw;
                o.interp = v.texcoord;
                return o;
            }

            struct fout
            {
                float4 sv_target : SV_TARGET;
            };

            // CBs for DX11PixelSM40
            // Textures for DX11PixelSM40

            fout frag(v2f inp)
            {
                fout o;
                o.sv_target = float4(0.0, 0.0, 0.0, 0.0);
                return o;
            }
            ENDCG
            
        }
    }
    Fallback "Hidden/Shader Graph/FallbackError"
}
