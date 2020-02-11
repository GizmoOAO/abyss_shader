Shader "Abyss/Window"
{
	SubShader
	{
		Tags { 
			"RenderType" = "Opaque" 
			"Queue" = "Transparent+7"
		}
		Stencil{
			Ref 5
			Comp Always
			Pass Replace
		}
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
			};

			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				return float4(0,0,1,0);
			}
			ENDCG
		}
	}
}
