Shader "OCG/CardRoyal"
{
    Properties
    {
        // The behavior of tiling and offset of these textures is changed.
        _MainTex ("Card Image", 2D) = "white" {}
        _PendulumTex ("Pendulum Card Image", 2D) = "white" {}
        _BaseTex ("Card Base", 2D) = "black" {}
        [NoScaleOffset] _MaskTex ("Normal Card Mask", 2D) = "black" {}
        [NoScaleOffset] _PendulumMaskTex ("PendulumCard Mask", 2D) = "black" {}
        _AttrTex ("Attribute", 2D) = "black" {}
        _IconTex ("Icon", 2D) = "black" {}
        _LevelTex ("Level Tex", 2D) = "black" {}
        [NoScaleOffset] _ArrowOnTex ("Link Arrow On Tex", 2D) = "black" {}
        [NoScaleOffset] _ArrowOffTex ("Link Arrow Off Tex", 2D) = "black" {}
        _Arrow ("Arrow", Integer) = -1
        _IsPendulum ("Is Pendulum", Integer) = 0

        // Royal Effect
        _NormalMap ("Normal Map", 2D) = "bump" {}
        _FrameMask ("Frame Mask", 2D) = "black" {}
        [HDR] _KiraColor ("Kira Color", Color) = (0.4352941, 0.3960784, 0.6588235, 0)
        [NoScaleOffset] _KiraColorTex ("Kira Color Tex", 2D) = "white" {}
        _KiraMaskStrength ("Kira Mask Strength", Range(0, 1)) = 0.23921568627451
        _IllustContrast ("Illust Contrast", Float) = 1.3
        _EnhanceColorThreshold ("Enhance Color Threshold", Float) = 1.5 // 2
        _SpecularGloss ("Specular Gloss", Float) = 256
        _HighlightStrength ("Highlight Strength", Range(0, 1)) = 1

        [NoScaleOffset] _HighlightTex ("HighlightTex", 2D) = "white" {}
        [NoScaleOffset] _HighlightNormal ("HighlightNormal", 2D) = "bump" {}
        _HighlightColor ("Highlight Color", Color) = (1, 0.9385045, 0.7232704, 1)
        _HighlightNormalTile ("Highlight Normal Tile", Float) = 0.5
        _HighlightNormalPower ("Highlight Normal Power", Float) = 1

        [NoScaleOffset] _NoiseNormal ("Noise Normal", 2D) = "bump" {}
        _NoiseNormalTile ("Noise Normal Tile", Float) = 2
        _NoiseNormalPower ("Noise Normal Power", Float) = -2.19

        [NoScaleOffset] _RadialNormal ("Radial Normal", 2D) = "bump" {}
        _RadialNormalTile1 ("Radial Normal 01 Tile", Float) = 1
        _RadialNormalTile2 ("Radial Normal 02 Tile", Float) = 1
        _RadialNormalPower1 ("Radial Normal 01 Power", Float) = -2
        _RadialNormalPower2 ("Radial Normal 02 Power", Float) = 0.49
    }
    SubShader
    {
        Tags { "RenderType" = "Opaque" "Queue"="Geometry" }
        LOD 100

        Pass
        {
			Tags { "LightMode" = "ForwardBase" }
            CGPROGRAM
            #include "./inc/util.cginc"
            #include "./inc/rawColor.cginc"

            DEF_TEX_NOSAMPLER(_NormalMap);
            DEF_TEX_NOSAMPLER(_FrameMask);
            float4 _KiraColor;
            DEF_TEX_SAMPLER(_KiraColorTex);
            float _KiraMaskStrength;
            float _IllustContrast;
            float _EnhanceColorThreshold;
            float _SpecularGloss;
            float _HighlightStrength;

            DEF_TEX_SAMPLER(_HighlightTex);
            DEF_TEX_SAMPLER(_HighlightNormal);
            float4 _HighlightColor;
            float _HighlightNormalTile ;
            float _HighlightNormalPower;
            DEF_TEX_SAMPLER(_NoiseNormal);
            float _NoiseNormalTile;
            float _NoiseNormalPower;
            DEF_TEX_SAMPLER(_RadialNormal);
            float _RadialNormalTile1;
            float _RadialNormalTile2;
            float _RadialNormalPower1;
            float _RadialNormalPower2;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
                float3 normal : NORMAL;
                float3 tangent : TEXCOORD1;
                float3 bitangent : TEXCOORD3;
				float3 worldPos : TEXCOORD2;
                float3 centerWorldPos : TEXCOORD4;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
				o.worldPos = mul(unity_ObjectToWorld, v.vertex);
                o.centerWorldPos = mul(unity_ObjectToWorld, float4(0.5, 0.5, 0.5, 1)).xyz;
                o.normal = UnityObjectToWorldNormal(v.normal);
                o.tangent = UnityObjectToWorldDir(v.tangent.xyz);
                o.bitangent = cross(o.normal, o.tangent) * v.tangent.w;
                return o;
            }

            float3 KiraColor(float2 uv, float t)
            {
                float3 kiraColor = ProcessColor(_KiraColor.rgb);
                float4 kiraColorSampled = UNITY_SAMPLE_TEX2D(_KiraColorTex, uv);
                float3 multKiraColor = kiraColor * kiraColorSampled.rgb;
                return UnpackColor(multKiraColor, t);
            }

            float Shadow(v2f i, float frameMask, float t) // T = 80pi
            {

                static const float3 objectSpaceNormal = float3(0, 0, 1);

                float2 tile1UV = TileToUV(_HighlightNormalTile, i.uv);
                float3 hNormal = UnpackNormal(UNITY_SAMPLE_TEX2D(_HighlightNormal, tile1UV));
                float3 unpackedHNormal = UnpackColor(hNormal, sin(t) * 0.1388889); // T = 2pi

                float2 tile2UV1 = TileToUV(_NoiseNormalTile, i.uv).yx + float2(-0.77, -0.61);
                float tmp0_w_138 = length(tile2UV1) * 0.77;
                float tmp4_y_145 = t * 0.05 + cos(tmp0_w_138) * tile2UV1.x + tile2UV1.y * sin(tmp0_w_138) + 0.77;
                float tmp4_x_147 = t * 0.05 + cos(tmp0_w_138) * tile2UV1.y - tile2UV1.x * sin(tmp0_w_138) + 0.61;
                // float2 kiraNormalUV = t * 0.05 + float2(0.77, 0.61) + mul(float2x2(cos(tmp0_w_138), -sin(tmp0_w_138), sin(tmp0_w_138), cos(tmp0_w_138), tile2UV1.yx));
                float3 kiraNormal = UnpackNormal(UNITY_SAMPLE_TEX2D(_NoiseNormal, float2(tmp4_x_147, tmp4_y_145))); // T = 20

                float3 tmp3_xyz_272 = float3(cos(sin(0.25 * t)), -sin(0.25 * t), sin(0.25 * t));
                float tmp9_x_287 = dot(TileToUV(_RadialNormalTile1, i.uv) - 0.5, tmp3_xyz_272.xz);
                float tmp9_y_288 = dot(TileToUV(_RadialNormalTile1, i.uv) - 0.5, tmp3_xyz_272.yx);
                float2 tmp3_xy_290_uv = float2(tmp9_x_287, tmp9_y_288) * 0.5 + 0.5;
                float3 radialNormal1 = UnpackNormal(UNITY_SAMPLE_TEX2D(_RadialNormal, tmp3_xy_290_uv)); // T = 16pi

                float tmp4_z_302 = -t * 0.25 + 1.0;
                float3 tmp9_xyz_307 = float3(cos(tmp4_z_302), -sin(tmp4_z_302), sin(tmp4_z_302));
                float tmp8_x_308 = dot(TileToUV(_RadialNormalTile2, i.uv) - 0.5, tmp9_xyz_307.xz);
                float tmp8_y_309 = dot(TileToUV(_RadialNormalTile2, i.uv) - 0.5, tmp9_xyz_307.yx);
                float2 tmp8_xy_310 = float2(tmp8_x_308, tmp8_y_309) + 0.5;
                float2 tmp8_xy_311_uv = float2(tmp8_x_308, tmp8_y_309) * 0.5 + 0.5;
                float3 radialNormal2 = UnpackNormal(UNITY_SAMPLE_TEX2D(_RadialNormal, tmp8_xy_311_uv)); // T = 16pi

                float3 kiraCombinedNormal = CombineNormal(
                    CombineNormal(
                        ScaleNormal(radialNormal1, _RadialNormalPower1),
                        ScaleNormal(radialNormal2, _RadialNormalPower2)),
                    ScaleNormal(
                        CombineNormal(
                            ScaleNormal(saturate(unpackedHNormal), _HighlightNormalPower), 
                            ScaleNormal((kiraNormal), _NoiseNormalPower)), 
                        frameMask));
                float3 mainNormal = UnpackNormal(REVERSE_SAMPLE(i.uv, _NormalMap)); 
                float shadow = CDOT(CombineNormal(CombineNormal(kiraCombinedNormal, mainNormal), objectSpaceNormal), objectSpaceNormal);
                return shadow;
            }

            float3 frag (v2f i) : SV_Target
            {
                float4 rawColor1 = RawColor(i.uv);              
                float kiraMask = rawColor1.a > 0 ? _KiraMaskStrength : 0;
                float3 rawColor = rawColor1.rgb;

                float3x3 tbn = transpose(float3x3(i.tangent, i.bitangent, i.normal));
                float3 normalDir = i.normal;

                static const float3 objectSpaceNormal = float3(0, 0, 1);

                static float3 lightDir = normalize(_WorldSpaceLightPos0.xyz);
				float3 viewDir = normalize(_WorldSpaceCameraPos - i.worldPos);
                float3 centerViewDir = normalize(_WorldSpaceCameraPos - i.centerWorldPos);
                float3 halfDir = normalize(lightDir + viewDir);

				static float3 lightColor = _LightColor0.rgb * _LightColor0.a;
                float frameMask = REVERSE_SAMPLE(i.uv, _FrameMask).r;

                float3 calcKiraColor = KiraColor(i.uv, _Time.y * 0.1111111);
                float3 kiraCalcKiraColor = Formula0(ProcessColor(_KiraColor.rgb), calcKiraColor);
                float3 kiraAtDelta = KiraAtColor(_Time.y) - rawColor;
                float3 kiraBaseColor = rawColor * (kiraMask * _IllustContrast + 1.0);
                float3 kiraShineColor = 4 * saturate(1.0 - _EnhanceColorThreshold * length(kiraAtDelta)) * calcKiraColor;
                float3 kiraColor = lerp(kiraBaseColor, kiraShineColor, kiraMask * saturate(- sin(_Time.y) + 0.5));
                float3 tmp0_xyz_380 = lerp(kiraColor, saturate(lerp(1, kiraCalcKiraColor, 1.2)), frameMask);
                float3 color = tmp0_xyz_380 * lerp(1, Shadow(i, frameMask, _Time.y), frameMask ? 0.5 : 0.7);

                float4 tmp6_xyzw_480 = UNITY_SAMPLE_TEX2D(_HighlightNormal, i.uv * 1.5);
                float3 highlightNormal = CombineNormal(UnpackColor(UnpackNormal(tmp6_xyzw_480), frac(_Time.y * 0.5)), objectSpaceNormal);
                float3 highlight = UNITY_SAMPLE_TEX2D(_HighlightTex, highlightNormal.xy).rgb;
                highlight = saturate(max(kiraMask, frameMask) + 0.2) * highlight * _HighlightColor.rgb * 3;
                float3 specColor = highlight * _HighlightStrength;
                float r = -30 * 0.01745329;
                float c = frac((dot(float2(cos(r), sin(r)), i.uv - 0.5) + 0.5) * 0.1 + _Time.y * 1.5 * -0.2 + 0.1);
                float tmp0_w_549 = ((1.0 - c) * c - 0.08) * -10.0;
                float tmp0_w_550 = max(tmp0_w_549, 0.0);
                float tmp0_w_553 = tmp0_w_550 * tmp0_w_550 * (tmp0_w_550 * -2.0 + 3.0);
                float spec = min(tmp0_w_550 * tmp0_w_550 * (tmp0_w_550 * -2.0 + 3.0), 1.0);
                float3 specular = spec * specColor;

                return color + specular;
            }
/*
            // void f()
            // {
            //     float2 tile1UV = TileToUV(_HighlightNormalTile, i.uv);
            //     float4 rawHNormal = tex2D(_HighlightNormal, tile1UV);
            //     float3 calcNormal = UnpackColor(UnpackNormal(rawHNormal), sin(_Time.y) * 0.1388889);
            //     float2 tile2UV_rev = TileToUV(_Kira01_02Tile, i.uv).yx;
            //     float2 tile2UV1 = tile2UV_rev + float2(-0.77, -0.61);
            //     float tmp0_w_138 = length(tile2UV1) * 0.77;
            //     float tmp4_y_145 = _Time.y * 0.05 + cos(tmp0_w_138) * tile2UV1.x + tile2UV1.y * sin(tmp0_w_138) + 0.77;
            //     float tmp4_x_147 = _Time.y * 0.05 + cos(tmp0_w_138) * tile2UV1.y - tile2UV1.x * sin(tmp0_w_138) + 0.61;
            //     // float2 kiraNormalUV = _Time.y * 0.05 + float2(0.77, 0.61) + mul(float2x2(cos(tmp0_w_138), -sin(tmp0_w_138), sin(tmp0_w_138), cos(tmp0_w_138), tile2UV1.yx));
            //     float4 rawKiraNormal2 = tex2D(_KiraNormal01_02, float2(tmp4_x_147, tmp4_y_145));
            //     float3 kiraNormal2 = UnpackNormal(rawKiraNormal2);
            //     float3 combined0102Normal = CombineNormal(
            //         ScaleNormal(saturate(calcNormal), _HighlightNormalPower), 
            //         ScaleNormal(saturate(kiraNormal2), _Kira01_02Power));
            //     float3 maskedKiraNormal = ScaleNormal(combined0102Normal, frameMask);

            //     float3 offsetLightDir = lightDir + float3(0.0, 1.0, 0.0);
            //     float offsetDiff = dot(normalize(offsetLightDir), normalDir);
            //     float tmp5_w_214 = offsetDiff * _HoloShift01;
            //     float tmp4_z_215 = offsetDiff * _HoloShift02;
            //     float4 rawHolo2 = tex2D(_HoloTex, tmp4_z_215.xx);
            //     float4 rawHolo1 = tex2D(_HoloTex, tmp5_w_214.xx);
            //     float3 multipleCombinedNormal = CombineNormal(
            //         CombineNormal(maskedKiraNormal, UnpackNormal(rawHolo1)),
            //         ScaleNormal(calcNormal, _CardDistortion01));
            //     float2 multipleCombinedNormalUV = mul(unity_MatrixV, float4(multipleCombinedNormal, 0)).xy;
            //     float4 holo3 = tex2D(_HoloTex, multipleCombinedNormalUV);
                
            //     float3 kiraCalcKiraColor = Formula0(kiraColor, calcKiraColor)
            //     float3 tmp3_xyz_252 = saturate(Formula0(holo3.xyz, _HoloBrightness02));
            //     // float3 tmp3_xyz_253 = tmp3_xyz_252.zzz + tmp3_xyz_252;
            //     float3 tmp3_xyz_253 = tmp3_xyz_252.zzz + tmp3_xyz_252;
            //     // float3 tmp1_xyz_254 = saturate(tmp1_xyz_55 * tmp3_xyz_253);
            //     float3 kiraHoloColor0 = saturate(kiraCalcKiraColor * tmp3_xyz_253);

            //     float4 tmp8_xyzw_286 = float4(TileToUV(_RadialNormalTile1, i.uv), TileToUV(_Kira2_02Tile, i.uv)) - 0.5;
            //     float3 tmp3_xyz_272 = float3(cos(sin(0.25 * _Time.y)), -sin(0.25 * _Time.y), sin(0.25 * _Time.y));
            //     float tmp9_x_287 = dot(tmp8_xyzw_286.xy, tmp3_xyz_272.xz);
            //     float tmp9_y_288 = dot(tmp8_xyzw_286.yx, tmp3_xyz_272.xy);
            //     float2 tmp3_xy_290_uv = float2(tmp9_x_287, tmp9_y_288) * 0.5 + 0.5;
            //     float4 rawKira0201 = tex2D(_Kira02_01, tmp3_xy_290_uv);

            //     float tmp4_z_302 = -_Time.y * 0.25 + 1.0;
            //     float3 tmp9_xyz_307 = float3(cos(tmp4_z_302), -sin(tmp4_z_302), sin(tmp4_z_302));
            //     float tmp8_x_308 = dot(tmp8_xyzw_286.zw, tmp9_xyz_307.xz);
            //     float tmp8_y_309 = dot(tmp8_xyzw_286.wz, tmp9_xyz_307.xy);
            //     float2 tmp8_xy_310 = float2(tmp8_x_308, tmp8_y_309) + 0.5;
            //     float2 tmp8_xy_311_uv = float2(tmp8_x_308, tmp8_y_309) * 0.5 + 0.5;
            //     float4 rawKira02012 = tex2D(_Kira02_01, tmp8_xy_311_uv);
                

            //     float3 kiraCombinedNormal = CombineNormal(
            //         CombineNormal(
            //             ScaleNormal(UnpackNormal(rawKira0201), _Kira02_01Power),
            //             ScaleNormal(UnpackNormal(rawKira02012), _Kira02_02Power)),
            //         maskedKiraNormal);

            //     float3 tmp6_xyz_356 = normalize(CombineNormal(kiraCombinedNormal, UnpackNormal(rawHolo2)) + float3(_CardDistortion02, _CardDistortion02, 0.0));
            //     float2 tmp3_yz_360_uv = mul(unity_MatrixV, float4(tmp6_xyz_356, 0)).xy;
            //     float4 holo4 = tex2D(_HoloTex, tmp3_yz_360_uv);

            //     float3 tmp6_xyz_372 = saturate(Formula0(holo4, _HoloBrightness));
            //     float3 tmp6_xyz_373 = tmp6_xyz_372.zzz + tmp6_xyz_372;
            //     float3 tmp0_xyz_378 = lerp(kiraBaseColor, tmp6_xyz_373 * kiraShineColor, kiraMask);
            //     float3 tmp0_xyz_380 = lerp(tmp0_xyz_378, kiraHoloColor0, frameMask);
            // }
*/
            ENDCG
        }
    }
}