﻿// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/LuminanceShader"
{
	Properties
	{
		_CameraPos("_CameraPos", Vector) = (0,0,0)	// Camera position from main camera
		_Inverted("_Inverted", int) = 0
		_Bandwidth("_Bandwidth", float) = 0.25		// Used to allow user to control bandwidth
		_FirstBand("_FirstBand", float) = 1.0
	}
	SubShader
	{
		Tags{ "RenderType" = "Opaque" }

		PASS
		{
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag
		#include "UnityCG.cginc"

		// Values must be declared outside of property block as well
		float3 _CameraPos;
		int _Inverted;
		float _Bandwidth;
		float _FirstBand;

		// This is the data structure that the vertex program provides to the fragment
		struct v2f
		{
			float4 viewPos : SV_POSITION;
			float3 normal : NORMAL;
			float4 worldPos: TEXCOORD0;
		};

		// Returns the position of a vertex
		v2f vert(appdata_base v)
		{
			v2f o;

			// Calculate where the vertex is in view space.
			o.viewPos = UnityObjectToClipPos(v.vertex);

			// Calculate the normal in WorldSpace.
			o.normal = UnityObjectToWorldNormal(v.normal);

			// Calculate where the object is in world space.
			o.worldPos = mul(unity_ObjectToWorld, v.vertex);

			return o;
		}

		// Sets the color of a fragment based on the distance and strategy/color inputs
		fixed4 frag(v2f i) : SV_Target
		{
			// Declare return value and initialize RGBA to 0,0,0,1 (so we don't have to set every time below)
			fixed4 ret;
		    ret.r = 0; ret.g = 0; ret.b = 0; ret.a = 1;

			// Generate the distance value - distance here is distance from the user to the worldPos
			float x_dist = _CameraPos.x - i.worldPos.x;
			float x_sqrd = x_dist * x_dist;
			float y_dist = _CameraPos.y - i.worldPos.y;
			float y_sqrd = y_dist * y_dist;
			float z_dist = _CameraPos.z - i.worldPos.z;
			float z_sqrd = z_dist * z_dist;
			float total = x_sqrd + y_sqrd + z_sqrd;
			float distance = sqrt(total);

			if (distance <= _FirstBand + 2.5) 
			{
				ret.r = 165 / 255.0f;
				ret.g = 0 / 255.0f;
				ret.b = 38 / 255.0f;
			}
			else if (distance > _FirstBand + 2.5) 
			{
				ret.r = 49 / 255.0f;
				ret.g = 54 / 255.0f;
				ret.b = 149 / 255.0f;
			}
			
			// If the shader is not being inverted, go from high alpha to low alpha
			//if (_Inverted == 0)
			//{
			//	if (distance <= _FirstBand) {
			//		ret.a = 1.0;
			//	}
			//	else if ((distance > _FirstBand) && (distance <= _FirstBand + (_Bandwidth * 1))) {
			//		ret.a = 0.9;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 1)) && (distance <= _FirstBand + (_Bandwidth * 2))) {
			//		ret.a = 0.8;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 2)) && (distance <= _FirstBand + (_Bandwidth * 3))) {
			//		ret.a = 0.7;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 3)) && (distance <= _FirstBand + (_Bandwidth * 4))) {
			//		ret.a = 0.6;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 4)) && (distance <= _FirstBand + (_Bandwidth * 5))) {
			//		ret.a = 0.5;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 5)) && (distance <= _FirstBand + (_Bandwidth * 6))) {
			//		ret.a = 0.4;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 6)) && (distance <= _FirstBand + (_Bandwidth * 7))) {
			//		ret.a = 0.3;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 7)) && (distance <= _FirstBand + (_Bandwidth * 8))) {
			//		ret.a = 0.2;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 8)) && (distance <= _FirstBand + (_Bandwidth * 9))) {
			//		ret.a = 0.1;
			//	}
			//	else {
			//		ret.a = 0.0;
			//	}
			//}
			// If the shader is being inverted, go from low alpha to high alpha
			//else
			//{
			//	if (distance <= _FirstBand) {
			//		ret.a = 0.0;
			//	}
			//	else if ((distance > _FirstBand) && (distance <= _FirstBand + (_Bandwidth * 1))) {
			//		ret.a = 0.1;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 1)) && (distance <= _FirstBand + (_Bandwidth * 2))) {
			//		ret.a = 0.2;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 2)) && (distance <= _FirstBand + (_Bandwidth * 3))) {
			//		ret.a = 0.3;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 3)) && (distance <= _FirstBand + (_Bandwidth * 4))) {
			//		ret.a = 0.4;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 4)) && (distance <= _FirstBand + (_Bandwidth * 5))) {
			//		ret.a = 0.5;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 5)) && (distance <= _FirstBand + (_Bandwidth * 6))) {
			//		ret.a = 0.6;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 6)) && (distance <= _FirstBand + (_Bandwidth * 7))) {
			//		ret.a = 0.7;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 7)) && (distance <= _FirstBand + (_Bandwidth * 8))) {
			//		ret.a = 0.8;
			//	}
			//	else if ((distance > _FirstBand + (_Bandwidth * 8)) && (distance <= _FirstBand + (_Bandwidth * 9))) {
			//		ret.a = 0.9;
			//	}
			//	else {
			//		ret.a = 1.0;
			//	}
			//}

			return ret;
		}
		ENDCG
		}
	}
}
