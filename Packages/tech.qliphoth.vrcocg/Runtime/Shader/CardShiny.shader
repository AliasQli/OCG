Shader "OCG/CardShiny"
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

        // Shiny effect

        _NormalMap ("Normal Map", 2D) = "bump" {}
        _FrameMask ("Frame Mask", 2D) = "black" {}
        [HDR] _KiraColor ("Kira Color", Color) = (0.3764706, 0.4, 0.5568628, 0.0)
        [NoScaleOffset] _KiraColorTex ("Kira Color Tex", 2D) = "white" {}
        _KiraMaskStrength ("Kira Mask Strength", Range(0, 1)) = 0.23921568627451
        _IllustContrast ("Illust Contrast", Float) = 0 // 1.3
        _IllustBrightness ("Illust Brightness", Float) = -0.2
        _EnhanceColorThreshold ("Enhance Color Threshold", Float) = 1.5 // 2
        _SpecularGloss ("Specular Gloss", Float) = 128
        _SpecularStrength ("Specular Strength", Range(0, 1)) = 1
        _RainbowStrength ("Rainbow Strength", Range(0, 1)) = 0.1
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
            };

            DEF_TEX_SAMPLER(_NormalMap);
            DEF_TEX_SAMPLER(_FrameMask);
            float4 _KiraColor;
            DEF_TEX_SAMPLER(_KiraColorTex);
            float _KiraMaskStrength;
            float _IllustContrast;
            float _IllustBrightness;
            float _EnhanceColorThreshold;
            float _SpecularGloss;
            float _SpecularStrength;
            float _RainbowStrength;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
				o.worldPos = mul(unity_ObjectToWorld, v.vertex);
                o.normal = UnityObjectToWorldNormal(v.normal);
                o.tangent = UnityObjectToWorldDir(v.tangent.xyz);
                o.bitangent = cross(o.normal, o.tangent) * v.tangent.w;
                return o;
            }

            float3 RainbowColor(float hue)
            {
                // return saturation = 0, value = 1 color
                float3 xyz0 = frac(hue + float3(0.0, 0.3333333, 0.6666667)) * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
                float3 xyz1 = saturate(abs(xyz0) - float3(1.0, 1.0, 1.0));
                return xyz1;
            }

            float3 KiraColor(float2 uv, float t)
            {
                float3 kiraColor = ProcessColor(_KiraColor.rgb);
                float4 kiraColorSampled = UNITY_SAMPLE_TEX2D(_KiraColorTex, uv);
                float3 multKiraColor = kiraColor * kiraColorSampled.rgb;
                return UnpackColor(multKiraColor, t);
            }

            float3 frag (v2f i) : SV_Target
            {
                float4 rawColor1 = RawColor(i.uv);              
                float kiraMask = rawColor1.a > 0 ? _KiraMaskStrength : 0;
                float3 rawColor = rawColor1.rgb;           

                // float3x3 tbn = transpose(float3x3(i.tangent, i.bitangent, i.normal));
                float3 normal = i.normal;

                float3 lightDir = normalize(_WorldSpaceLightPos0.xyz);
				float3 viewDir = normalize(_WorldSpaceCameraPos - i.worldPos);
                float3 halfDir = normalize(lightDir + viewDir);

				float3 lightColor = _LightColor0.rgb * _LightColor0.a;

                float3 kiraAtDelta = KiraAtColor(_Time.y) - rawColor;
                float3 kiraBaseColor = rawColor * (kiraMask * _IllustContrast + 1.0);
                float3 kiraShineColor = 4 * saturate(1.0 - _EnhanceColorThreshold * length(kiraAtDelta)) * KiraColor(i.uv, (sin(_Time.y) - 0.05) * 0.1);
                float3 kiraAddColor = saturate((kiraMask - 0.2176376) * 10.0 + 0.2176376) * _IllustBrightness + 0.06;
                float3 kiraColor = lerp(kiraBaseColor, kiraShineColor, kiraMask * saturate(- sin(_Time.y) + 0.5)) + kiraAddColor;
                float3 color = lerp(rawColor, kiraColor, saturate(kiraMask * 100));

                float3 baseT = normalize(cross(lightDir, i.normal));
                float3 baseB = cross(baseT, i.normal);
                // float3x3 baseTBN = float3x3(baseT, baseB, i.normal);
                float h_on_b = dot(baseB, halfDir);
                float spec = saturate(pow(1 - h_on_b * h_on_b, _SpecularGloss));
                float frameMask = REVERSE_SAMPLE(i.uv, _FrameMask).r;
                float3 specColor = lerp(RainbowColor(- h_on_b * 5 + 0.5) * _RainbowStrength, lightColor * _SpecularStrength, frameMask);
                float3 specular = spec * specColor;

                return color + saturate(specular);
            }
            ENDCG
        }
    }
}