Shader "OCG/Card"
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

        _SpecularGloss ("Specular Gloss", Float) = 64
        _SpecularStrength ("Specular Strength", Range(0, 1)) = 0.5
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

            float _SpecularGloss;
            float _SpecularStrength;

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


            float3 frag (v2f i) : SV_Target
            {
                float3 rawColor = RawColor(i.uv).rgb;
                float3 normal = i.normal;
                float3 lightDir = normalize(_WorldSpaceLightPos0.xyz);
				float3 viewDir = normalize(_WorldSpaceCameraPos - i.worldPos);
				float3 lightColor = _LightColor0.rgb * _LightColor0.a;

                float3 halfDir = normalize(lightDir + viewDir);
                float spec = pow(CDOT(normal, halfDir), _SpecularGloss);
                float3 specular = lightColor * spec * _SpecularStrength;

                return rawColor + specular;
            }
            ENDCG
        }
    }
}