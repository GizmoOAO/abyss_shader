Shader "Abyss/Show/UnlitColor"
{
  Properties
  {
    _Color ("Main Color", Color) = (1,1,1,1)
  }
  SubShader
  {
    Tags {
      "RenderType"="Opaque"
      "Queue" = "Transparent+8"
    }
    LOD 100
    Stencil {
      Ref 5
      Comp Greater
    }

    Pass
    {
      CGPROGRAM
      #pragma vertex vert
      #pragma fragment frag
      #pragma multi_compile_fog
      
      #include "UnityCG.cginc"

      struct appdata
      {
        float4 vertex : POSITION;
        float2 uv : TEXCOORD0;
      };

      struct v2f
      {
        float2 uv : TEXCOORD0;
        UNITY_FOG_COORDS(1)
        float4 vertex : SV_POSITION;
      };

      float4 _Color;
      
      v2f vert (appdata v)
      {
        v2f o;
        o.vertex = UnityObjectToClipPos(v.vertex);
        UNITY_TRANSFER_FOG(o,o.vertex);
        return o;
      }
      
      fixed4 frag (v2f i) : SV_Target
      {
        fixed4 col = _Color;
        UNITY_APPLY_FOG(i.fogCoord, col);
        return col;
      }
      ENDCG
    }
  }
}
