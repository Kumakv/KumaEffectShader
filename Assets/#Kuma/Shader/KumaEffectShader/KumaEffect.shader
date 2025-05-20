// Made with Amplify Shader Editor v1.9.6.3
// Available at the Unity Asset Store - http://u3d.as/y3X 

// Copyright © 2024 Kuma_kv
// License: http://opensource.org/licenses/MIT
// GitHub: https://github.com/Kumakv/KumaEffectShader
// Version: 1.6.2 (2025/05/20)
Shader "Kuma/KumaEffect"
{
	Properties
	{
		[HideInInspector] _VTInfoBlock( "VT( auto )", Vector ) = ( 0, 0, 0, 0 )
		_Noise2("Noise2", 2D) = "white" {}
		_Mask("Mask", 2D) = "white" {}
		_FadeStart("Fade Start", Range( 0 , 2)) = 1
		_FadeEnd("Fade End", Range( 0 , 5)) = 3
		_Noise1("Noise1", 2D) = "white" {}
		[HDR]_MainColor("Main Color", Color) = (1,1,1,1)
		[Toggle(_ISUVDISTORTION2_ON)] _isUVDistortion2("is UV Distortion2", Float) = 0
		[Toggle(_ISUVDISTORTIOND_ON)] _isUVDistortionD("is UV DistortionD", Float) = 0
		[Toggle(_ISUVDISTORTIONM_ON)] _isUVDistortionM("is UV DistortionM", Float) = 0
		[Toggle(_ISUVDISTORTION1_ON)] _isUVDistortion1("is UV Distortion1", Float) = 0
		_UVDistortion1Panning("UVDistortion1Panning", Vector) = (0,0,0,0)
		_UVDistortion2Panning("UVDistortion2Panning", Vector) = (0,0,0,0)
		_UVDistortionDPanning("UVDistortionDPanning", Vector) = (0,0,0,0)
		_UVDistortionMPanning("UVDistortionMPanning", Vector) = (0,0,0,0)
		_Noise1Power("Noise1Power", Range( 0 , 6)) = 1
		_DistortionDIntensity("DistortionD Intensity", Range( 0 , 1)) = 0.5
		_Distortion2Intensity("Distortion2 Intensity", Range( 0 , 1)) = 0.5
		_Distortion1Intensity("Distortion1 Intensity", Range( 0 , 1)) = 0
		_Noise1Panning("Noise1Panning", Vector) = (0.1,0.4,0,0)
		_Noise2Power("Noise2Power", Range( 0 , 6)) = 1
		_Noise2Panning("Noise2Panning", Vector) = (-0.1,0.3,0,0)
		_RandomMulY("RandomMulY", Range( 0 , 2)) = 0
		_RandomMul("RandomMul", Range( 0 , 2)) = 0
		[Toggle(_ISBOTHDISSOLVE_ON)] _isBothDissolve("isBothDissolve", Float) = 0
		_SoftParticle("Soft Particle", Range( 0 , 5)) = 0
		[Toggle(_ISSOFTPARTICLE_ON)] _isSoftParticle("isSoftParticle", Float) = 0
		_Threshold("Threshold", Range( 0 , 1)) = 0.16
		_AlphaFadeThreshold("AlphaFadeThreshold", Range( 0 , 1)) = 0
		[Toggle(_ISLIFETIMEDISSOLVE_ON)] _isLifetimeDissolve("isLifetimeDissolve", Float) = 0
		[Toggle(_ISLIFETIMEALPHAFADE_ON)] _isLifetimeAlphaFade("isLifetimeAlphaFade", Float) = 0
		_StartDissolve("Start Dissolve", Range( 0 , 1)) = 0
		_StartAlphaFade("Start Alpha Fade", Range( 0 , 1)) = 0
		_EdgeWidth("Edge Width", Range( 0 , 1)) = 0.03
		[HDR]_EdgeColor("Edge Color", Color) = (1,0,0,1)
		_DissolveTiling("Dissolve Tiling", Vector) = (1,1,0,0)
		_AlphaFadeTiling("AlphaFade Tiling", Vector) = (1,1,0,0)
		_AlphaFadePanning("AlphaFadePanning", Vector) = (0,0,0,0)
		_DissolvePanning("DissolvePanning", Vector) = (0,0,0,0)
		_Noise1Tiling("Noise1Tiling", Vector) = (1,1,0,0)
		_Noise2Tiling("Noise2Tiling", Vector) = (1,1,0,0)
		_EmissionIntensity("EmissionIntensity", Range( 0 , 20)) = 0
		_UVDistortionMap("_UVDistortionMap", 2D) = "white" {}
		_UVDistortionDMap("UV DistortionD Map", 2D) = "white" {}
		_UVDistortion2Map("UV Distortion2 Map", 2D) = "white" {}
		[Toggle(_ISSUBTRACT_ON)] _isSubtract("isSubtract", Float) = 0
		[Toggle(_ISTRAILEDGEDISSOLVE_ON)] _isTrailEdgeDissolve("isTrailEdgeDissolve", Float) = 0
		_GradientNoiseMap("Gradient Noise Map", 2D) = "white" {}
		_TrailEdgeDissolveMap("TrailEdge Dissolve Map", 2D) = "white" {}
		_GradientMaskTilling("Gradient Mask Tilling", Vector) = (1,1,0,0)
		_TrailEdgeDissolveTilling("TrailEdge Dissolve Tilling", Vector) = (1,1,0,0)
		_GradientMaskPanning("Gradient Mask Panning", Vector) = (0,0,0,0)
		_TrailEdgeDissolveScroll("TrailEdge Dissolve Scroll", Vector) = (-1,0,0,0)
		[Toggle(_USEGENERATENOISE2_ON)] _useGenerateNoise2("useGenerateNoise2", Float) = 0
		_TrailEdgeDissolveNoisePower("TrailEdge Dissolve Noise Power", Range( 0 , 5)) = 1
		_MaskNoisePower("Mask Noise Power", Range( 0 , 5)) = 0
		[Toggle(_USEGENERATENOISED_ON)] _useGenerateNoiseD("useGenerateNoiseD", Float) = 0
		[Toggle(_USEGENERATENOISEM_ON)] _useGenerateNoiseM("useGenerateNoiseM", Float) = 0
		_TrailEdgeDissolveThreshold("TrailEdge Dissolve Threshold", Range( 0 , 3)) = 0
		_HorizontalBorder("Horizontal Border", Range( 0 , 3)) = 3
		_VerticalBorder("Vertical Border", Range( 0 , 3)) = 3
		_VerticalLength("Vertical Length", Range( 0 , 1)) = 1
		_HorizontalLength("Horizontal Length", Range( 0 , 1)) = 1
		_TrailEdgeDissolveLength("TrailEdge Dissolve Length", Range( -1 , 1)) = 0
		_GenerateNoise1Strength("GenerateNoise1 Strength", Float) = 2
		_GenerateNoise2Strength("GenerateNoise2 Strength", Float) = 2
		_GenerateNoiseMStrength("GenerateNoiseM Strength", Float) = 2
		_GenerateNoiseDStrength("GenerateNoiseD Strength", Float) = 2
		[Toggle(_USEGENERATENOISE1_ON)] _useGenerateNoise1("useGenerateNoise1", Float) = 0
		[Enum(UnityEngine.Rendering.CullMode)]_Cull("Cull", Float) = 2
		[Enum(UnityEngine.Rendering.BlendMode)]_SrcBlend("SrcBlend", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("DstBlend", Float) = 1
		[Toggle]_ZWrite("ZWrite", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_ZTest("ZTest", Float) = 4
		[Enum(Additive,0,Alpha Blend,1)]_Blending("Blending", Float) = 0
		_MainOffset("Main Offset", Vector) = (0,0,0,0)
		[HideInInspector]_isFirst("isFirst", Float) = 1
		[Toggle(_ISCUSTOMDATAOFFSET_ON)] _isCustomDataOffset("isCustomDataOffset", Float) = 0
		[Toggle(_ISCUSTOMINTENSITY_ON)] _isCustomIntensity("isCustomIntensity", Float) = 0
		[Toggle(_ISNOISE1POLAR_ON)] _isNoise1Polar("isNoise1Polar", Float) = 0
		[Toggle(_ISNOISE2POLAR_ON)] _isNoise2Polar("isNoise2Polar", Float) = 0
		_DissolveMap("Dissolve Map", 2D) = "white" {}
		[Toggle(_ISDISSOLVEPOLAR_ON)] _isDissolvePolar("isDissolvePolar", Float) = 0
		_DissolveShearX("DissolveShear X", Range( 0 , 1)) = 0
		_Noise2ShearX("Noise2Shear X", Range( 0 , 1)) = 0
		_Noise1ShearX("Noise1Shear X", Range( 0 , 1)) = 0
		_Noise1ShearY("Noise1Shear Y", Range( 0 , 1)) = 0
		_Noise2ShearY("Noise2Shear Y", Range( 0 , 1)) = 0
		_DissolveShearY("DissolveShear Y", Range( 0 , 1)) = 0
		_SecondMask("SecondMask", 2D) = "white" {}
		[Enum(UnityEngine.Rendering.StencilOp)]_Pass("Pass", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_Comp("Comp", Float) = 0
		[Enum(Ref,0)]_Ref("Ref", Float) = 0
		_SecondOffset("SecondOffset", Vector) = (0,0,0,0)
		[Toggle(_ISCAMERAFADE_ON)] _isCameraFade("isCameraFade", Float) = 0
		_FresnelWidth("Fresnel Width", Float) = 3
		_FresnelIntensity("FresnelIntensity", Float) = 1
		[Toggle(_USEFRESNEL_ON)] _useFresnel("use Fresnel", Float) = 0
		_UVDistortionMTiling("UVDistortionMTiling", Vector) = (1,1,0,0)
		_UVDistortionDTiling("UVDistortionDTiling", Vector) = (1,1,0,0)
		_UVDistortion1Tiling("UVDistortion1Tiling", Vector) = (1,1,0,0)
		_UVDistortion2Tiling("UVDistortion2Tiling", Vector) = (1,1,0,0)
		[Toggle(_ISCUSTOMDATADISSOLVE_ON)] _isCustomDataDissolve("isCustomDataDissolve", Float) = 0
		[Toggle(_ISCUSTOMDATAALPHAFADE_ON)] _isCustomDataAlphaFade("isCustomDataAlphaFade", Float) = 0
		_CausticsNoisePanning("CausticsNoise Panning", Vector) = (0,0,0,0)
		_CausticsNoiseTiling("CausticsNoise Tiling", Vector) = (1,1,0,0)
		_CausticsNoiseIntensity("CausticsNoise Intensity", Range( 0 , 1)) = 0
		_VoronoiScale("Voronoi Scale", Float) = 5.5
		_VoronoiAngleSpeed("Voronoi Angle Speed", Float) = 1
		_ChromaticAberration("Chromatic Aberration", Range( 0 , 1)) = 0.1
		_VoronoiPower("VoronoiPower", Range( 0 , 20)) = 1
		_VoronoiPanning("Voronoi Panning", Vector) = (0,0,0,0)
		[Toggle(_USECACAUSTICS_ON)] _useCACaustics("useCACaustics", Float) = 0
		_CausticsNoiseScale("CausticsNoise Scale", Float) = 2
		_VoronoiIntensity("Voronoi Intensity", Range( 0 , 10)) = 1
		[Toggle(_USENOISE1_ON)] _useNoise1("useNoise1", Float) = 0
		[Toggle(_USENOISE2_ON)] _useNoise2("useNoise2", Float) = 0
		[Toggle(_USEDISSOLVE_ON)] _useDissolve("useDissolve", Float) = 0
		[Toggle(_USESECONDMASK_ON)] _useSecondMask("useSecondMask", Float) = 0
		[Toggle(_ISFRESNELINVERSE_ON)] _isFresnelInverse("isFresnelInverse", Float) = 0
		_SecondColorThreshold("SecondColorThreshold", Range( 0 , 1)) = 0
		[HDR]_SecondColor("SecondColor", Color) = (1,1,1,1)
		_Hue("Hue", Range( 0 , 1)) = 0
		_Saturation("Saturation", Range( -1 , 1)) = 0
		_VertexNoiseTex("VertexNoiseTex", 2D) = "white" {}
		_VertexIntensity("Vertex Intensity", Float) = 1
		[Toggle(_USEVERTEXOFFSET_ON)] _useVertexOffset("useVertexOffset", Float) = 0
		_VertexBorder("VertexBorder", Range( -1 , 1)) = -0.5
		_VertexNoisePanning("VertexNoisePanning", Vector) = (0,0,0,0)
		_VertexNoiseTiling("VertexNoiseTiling", Vector) = (1,1,0,0)
		_CenterSize("Center Size", Range( 0 , 1)) = 0.94
		_Size("Size", Range( 0 , 1)) = 1
		_OutsideSize("Outside Size", Range( 0 , 1)) = 1
		_OutsideStrength("Outside Strength", Range( 0 , 3)) = 1
		_CenterStrength("Center Strength", Range( 0.1 , 5)) = 1.31
		[Toggle(_USEDUST_ON)] _useDust("useDust", Float) = 0
		[Toggle(_USECIRCLE_ON)] _useCircle("useCircle", Float) = 0
		[Toggle(_USEGRADIENTMASK_ON)] _useGradientMask("useGradientMask", Float) = 0
		[Toggle(_USEGLITTER_ON)] _useGlitter("useGlitter", Float) = 0
		_CircleWidth("CircleWidth", Range( 0 , 1)) = 0
		[Toggle(_USEGENENOISE4AF_ON)] _useGeneNoise4AF("useGeneNoise4AF", Float) = 0
		_AlphaFadeMap("Alpha Fade Map", 2D) = "white" {}
		_AFNoiseStrength("AFNoiseStrength", Float) = 2
		_AFNoisePower("AFNoisePower", Range( 0 , 6)) = 0
		[Toggle(_USEALPHAFADE_ON)] _useAlphaFade("useAlphaFade", Float) = 0
		_MatCapTex("MatCapTex", 2D) = "white" {}
		[Toggle(_USEMATCAP_ON)] _useMatCap("useMatCap", Float) = 0
		_matcapIntensity("matcapIntensity", Range( 0 , 1)) = 0
		_MainPolarCenter("MainPolarCenter", Vector) = (1,1,0,0)
		[Toggle(_ISMAINPOLAR_ON)] _isMainPolar("isMainPolar", Float) = 0
		_GradientMap("Gradient Map", 2D) = "white" {}
		_GradientColor("Gradient Color", Color) = (1,1,1,1)
		_TestFloat("TestFloat", Float) = 1
		[Toggle(_TOGGLEXY_ON)] _ToggleXY("ToggleXY", Float) = 0
		_UVDistortionMMap("UV DistortionM Map", 2D) = "white" {}
		_DistortionMIntensity("DistortionM Intensity", Range( 0 , 1)) = 0.5

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" "Queue"="Transparent" }
	LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend [_SrcBlend] [_DstBlend]
		AlphaToMask Off
		Cull [_Cull]
		ColorMask RGBA
		ZWrite [_ZWrite]
		ZTest [_ZTest]
		Offset 0 , 0
		Stencil
		{
			Ref [_Ref]
			Comp [_Comp]
			Pass [_Pass]
		}
		
		
		Pass
		{
			Name "Unlit"

			CGPROGRAM
// Upgrade NOTE: excluded shader from OpenGL ES 2.0 because it uses non-square matrices
#pragma exclude_renderers gles

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#include "UnityStandardBRDF.cginc"
			#include "cginc/TiledVoronoi.cginc"
			#include "cginc/TiledGradientNoise.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _USEVERTEXOFFSET_ON
			#pragma shader_feature_local _ISCUSTOMINTENSITY_ON
			#pragma shader_feature_local _USEMATCAP_ON
			#pragma shader_feature_local _ISTRAILEDGEDISSOLVE_ON
			#pragma shader_feature_local _USECACAUSTICS_ON
			#pragma shader_feature_local _USEDISSOLVE_ON
			#pragma shader_feature_local _USESECONDMASK_ON
			#pragma shader_feature_local _USEFRESNEL_ON
			#pragma shader_feature_local _ISSUBTRACT_ON
			#pragma shader_feature_local _USENOISE1_ON
			#pragma shader_feature_local _ISNOISE1POLAR_ON
			#pragma shader_feature_local _ISUVDISTORTION1_ON
			#pragma shader_feature_local _USEGENERATENOISE1_ON
			#pragma shader_feature_local _USENOISE2_ON
			#pragma shader_feature_local _ISNOISE2POLAR_ON
			#pragma shader_feature_local _ISUVDISTORTION2_ON
			#pragma shader_feature_local _USEGENERATENOISE2_ON
			#pragma shader_feature_local _ISFRESNELINVERSE_ON
			#pragma shader_feature_local _ISCUSTOMDATADISSOLVE_ON
			#pragma shader_feature_local _ISLIFETIMEDISSOLVE_ON
			#pragma shader_feature_local _ISDISSOLVEPOLAR_ON
			#pragma shader_feature_local _ISUVDISTORTIOND_ON
			#pragma shader_feature_local _USEGENERATENOISED_ON
			#pragma shader_feature_local _ISMAINPOLAR_ON
			#pragma shader_feature_local _ISUVDISTORTIONM_ON
			#pragma shader_feature_local _ISCUSTOMDATAOFFSET_ON
			#pragma shader_feature_local _USEGENERATENOISEM_ON
			#pragma shader_feature_local _TOGGLEXY_ON
			#pragma shader_feature_local _ISBOTHDISSOLVE_ON
			#pragma shader_feature_local _USECIRCLE_ON
			#pragma shader_feature_local _USEDUST_ON
			#pragma shader_feature_local _USEGLITTER_ON
			#pragma shader_feature_local _USEGRADIENTMASK_ON
			#pragma shader_feature_local _USEALPHAFADE_ON
			#pragma shader_feature_local _USEGENENOISE4AF_ON
			#pragma shader_feature_local _ISCUSTOMDATAALPHAFADE_ON
			#pragma shader_feature_local _ISLIFETIMEALPHAFADE_ON
			#pragma shader_feature_local _ISSOFTPARTICLE_ON
			#pragma shader_feature_local _ISCAMERAFADE_ON
			#pragma instancing_options procedural:vertInstancingSetup
			#define UNITY_PARTICLE_INSTANCE_DATA MyParticleInstanceData
			#define UNITY_PARTICLE_INSTANCE_DATA_NO_ANIM_FRAME
			struct MyParticleInstanceData { float3x4 transform; uint color; float2 stableRandomXY; float4	customXYZW;	 float agePercent; float2 custom2XY; float intensity; float customDissolve; 	};
			#include "UnityStandardParticleInstancing.cginc"


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_color : COLOR;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform float _Cull;
			uniform float _SrcBlend;
			uniform float _DstBlend;
			uniform float _Blending;
			uniform float _ZWrite;
			uniform float _Comp;
			uniform float _ZTest;
			uniform float _Pass;
			uniform float _Ref;
			uniform float _VertexIntensity;
			uniform sampler2D _VertexNoiseTex;
			uniform float2 _VertexNoisePanning;
			uniform float2 _VertexNoiseTiling;
			uniform float _VertexBorder;
			uniform sampler2D _MatCapTex;
			uniform float _matcapIntensity;
			uniform float4 _MainColor;
			uniform sampler2D _Noise1;
			uniform float _RandomMul;
			uniform float2 _Noise1Panning;
			uniform float _RandomMulY;
			uniform float2 _Noise1Tiling;
			uniform float _Noise1ShearX;
			uniform float _Noise1ShearY;
			uniform sampler2D _UVDistortionMap;
			uniform float2 _UVDistortion1Panning;
			uniform float2 _UVDistortion1Tiling;
			uniform float _GenerateNoise1Strength;
			uniform float _Distortion1Intensity;
			uniform float _Noise1Power;
			uniform sampler2D _Noise2;
			uniform float2 _Noise2Panning;
			uniform float2 _Noise2Tiling;
			uniform float _Noise2ShearX;
			uniform float _Noise2ShearY;
			uniform sampler2D _UVDistortion2Map;
			uniform float2 _UVDistortion2Panning;
			uniform float2 _UVDistortion2Tiling;
			uniform float _GenerateNoise2Strength;
			uniform float _Distortion2Intensity;
			uniform float _Noise2Power;
			uniform float _EmissionIntensity;
			uniform float _FresnelWidth;
			uniform float _FresnelIntensity;
			uniform float _EdgeWidth;
			uniform float _Threshold;
			uniform float _StartDissolve;
			uniform sampler2D _DissolveMap;
			uniform float2 _DissolvePanning;
			uniform float2 _DissolveTiling;
			uniform sampler2D _UVDistortionDMap;
			uniform float2 _UVDistortionDPanning;
			uniform float2 _UVDistortionDTiling;
			uniform float _GenerateNoiseDStrength;
			uniform float _DistortionDIntensity;
			uniform float _DissolveShearX;
			uniform float _DissolveShearY;
			uniform float4 _EdgeColor;
			uniform sampler2D _Mask;
			uniform float2 _MainOffset;
			uniform sampler2D _UVDistortionMMap;
			uniform float2 _UVDistortionMPanning;
			uniform float2 _UVDistortionMTiling;
			uniform float _DistortionMIntensity;
			uniform float _GenerateNoiseMStrength;
			uniform float2 _MainPolarCenter;
			uniform sampler2D _SecondMask;
			uniform float2 _SecondOffset;
			uniform float2 _CausticsNoisePanning;
			uniform float2 _CausticsNoiseTiling;
			uniform float _CausticsNoiseScale;
			uniform float _CausticsNoiseIntensity;
			uniform float2 _VoronoiPanning;
			uniform float _VoronoiAngleSpeed;
			uniform float _ChromaticAberration;
			uniform float _VoronoiScale;
			uniform float _VoronoiPower;
			uniform float _VoronoiIntensity;
			uniform sampler2D _TrailEdgeDissolveMap;
			uniform float2 _TrailEdgeDissolveScroll;
			uniform float2 _TrailEdgeDissolveTilling;
			uniform float _TrailEdgeDissolveNoisePower;
			uniform float _TrailEdgeDissolveThreshold;
			uniform float _TrailEdgeDissolveLength;
			uniform float _CircleWidth;
			uniform float _OutsideStrength;
			uniform float _Size;
			uniform float _OutsideSize;
			uniform float _CenterSize;
			uniform float _CenterStrength;
			uniform sampler2D _GradientNoiseMap;
			uniform float2 _GradientMaskPanning;
			uniform float2 _GradientMaskTilling;
			uniform float _MaskNoisePower;
			uniform float _HorizontalBorder;
			uniform float _HorizontalLength;
			uniform float _VerticalBorder;
			uniform float _VerticalLength;
			uniform sampler2D _AlphaFadeMap;
			uniform float2 _AlphaFadePanning;
			uniform float2 _AlphaFadeTiling;
			uniform float _AFNoisePower;
			uniform float _AFNoiseStrength;
			uniform float _AlphaFadeThreshold;
			uniform float _StartAlphaFade;
			uniform float4 _GradientColor;
			uniform sampler2D _GradientMap;
			uniform float _TestFloat;
			uniform float _Hue;
			uniform float4 _SecondColor;
			uniform float _Saturation;
			uniform float _SecondColorThreshold;
			UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
			uniform float4 _CameraDepthTexture_TexelSize;
			uniform float _SoftParticle;
			uniform float _FadeStart;
			uniform float _FadeEnd;
			uniform float _isFirst;
			float InstancingRandomY( float In0 )
			{
				#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)
				UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID];
				return data.stableRandomXY.y;
				#else
				return In0;
				#endif
			}
			
			float InstancingRandomX( float In0 )
			{
				#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)
				UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID];
				return data.stableRandomXY.x;
				#else
				return In0;
				#endif
			}
			
			inline float2 MyCustomExpression501( float2 UV, float2 Shear )
			{
				return UV.xy + UV.yx * Shear.xy;
			}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			
			float4 MyCustomExpression407( float2 Inuv, sampler2D InTex )
			{
				float2 dx = ddx(Inuv), dy = ddy(Inuv);
				dx = frac(dx + 0.5) - 0.5;
				dy = frac(dy + 0.5) - 0.5;
				float4 c = tex2Dgrad(InTex, Inuv, dx, dy);
				return c;
			}
			
			inline float2 MyCustomExpression508( float2 UV, float2 Shear )
			{
				return UV.xy + UV.yx * Shear.xy;
			}
			
			float4 MyCustomExpression411( float2 Inuv, sampler2D InTex )
			{
				float2 dx = ddx(Inuv), dy = ddy(Inuv);
				dx = frac(dx + 0.5) - 0.5;
				dy = frac(dy + 0.5) - 0.5;
				float4 c = tex2Dgrad(InTex, Inuv, dx, dy);
				return c;
			}
			
			float InstancingAgePercent( float InAge )
			{
				#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)
				UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID];
				return data.agePercent;
				#else
				return InAge;
				#endif
			}
			
			float InstancingCustomDissolve( float In0 )
			{
				#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)
				UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID];
				return data.customDissolve;
				#else
				return In0;
				#endif
			}
			
			inline float2 MyCustomExpression512( float2 UV, float2 Shear )
			{
				return UV.xy + UV.yx * Shear.xy;
			}
			
			float MyCustomExpression441( float2 Inuv, sampler2D InTex )
			{
				float2 dx = ddx(Inuv), dy = ddy(Inuv);
				dx = frac(dx + 0.5) - 0.5;
				dy = frac(dy + 0.5) - 0.5;
				float4 c = tex2Dgrad(InTex, Inuv, dx, dy);
				return c;
			}
			
			float InstancingOffsetX( float In0 )
			{
				#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)
				UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID];
				return data.custom2XY.x;
				#else
				return In0;
				#endif
			}
			
			float InstancingOffsetY( float In0 )
			{
				#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)
				UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID];
				return data.custom2XY.y;
				#else
				return In0;
				#endif
			}
			
			float4 MyCustomExpression1090( float2 Inuv, sampler2D InTex )
			{
				float2 dx = ddx(Inuv), dy = ddy(Inuv);
				dx = frac(dx + 0.5) - 0.5;
				dy = frac(dy + 0.5) - 0.5;
				float4 c = tex2Dgrad(InTex, Inuv, dx, dy);
				return c;
			}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float InstancingIntensity( float In0 )
			{
				#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)
				UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID];
				return data.intensity;
				#else
				return In0;
				#endif
			}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 temp_cast_0 = (0.0).xxx;
				float In0364 = v.ase_texcoord.w;
				float localInstancingRandomY364 = InstancingRandomY( In0364 );
				float randomOffset2101 = localInstancingRandomY364;
				float2 appendResult731 = (float2(( 0.2 + randomOffset2101 ) , randomOffset2101));
				float2 texCoord721 = v.ase_texcoord * _VertexNoiseTiling + appendResult731;
				float2 panner722 = ( 1.0 * _Time.y * _VertexNoisePanning + texCoord721);
				float4 tex2DNode705 = tex2Dlod( _VertexNoiseTex, float4( panner722, 0, 0.0) );
				float3 appendResult708 = (float3(tex2DNode705.r , tex2DNode705.g , tex2DNode705.b));
				float3 temp_cast_1 = (_VertexBorder).xxx;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				#ifdef _USEVERTEXOFFSET_ON
				float3 staticSwitch713 = ( ( _VertexIntensity * ( appendResult708 - temp_cast_1 ) ) * ase_worldNormal );
				#else
				float3 staticSwitch713 = temp_cast_0;
				#endif
				float3 vertex_offset709 = staticSwitch713;
				
				o.ase_texcoord1.xyz = ase_worldNormal;
				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord5 = screenPos;
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord2;
				o.ase_texcoord4.xy = v.ase_texcoord4.xy;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				o.ase_texcoord4.zw = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertex_offset709;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float4 temp_cast_0 = (1.0).xxxx;
				float3 ase_worldNormal = i.ase_texcoord1.xyz;
				float4 lerpResult1088 = lerp( float4( 1,1,1,0 ) , saturate( ( tex2D( _MatCapTex, ( 0.5 + ( 0.5 * (mul( UNITY_MATRIX_V, float4( ase_worldNormal , 0.0 ) ).xyz).xy ) ) ) * _matcapIntensity ) ) , _matcapIntensity);
				#ifdef _USEMATCAP_ON
				float4 staticSwitch1080 = lerpResult1088;
				#else
				float4 staticSwitch1080 = temp_cast_0;
				#endif
				float4 MatCap1082 = staticSwitch1080;
				float4 temp_cast_3 = (1.0).xxxx;
				float In0361 = i.ase_texcoord2.z;
				float localInstancingRandomX361 = InstancingRandomX( In0361 );
				float localInstancingColor613 = ( 0.0 );
				{
				#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)
				                    vertInstancingColor(i.ase_color);
				                    i.ase_color.rgb = min(1, i.ase_color.rgb);
				                #endif
				}
				float randomOffset1100 = ( localInstancingRandomX361 + localInstancingColor613 );
				float In0364 = i.ase_texcoord2.w;
				float localInstancingRandomY364 = InstancingRandomY( In0364 );
				float randomOffset2101 = localInstancingRandomY364;
				float2 appendResult472 = (float2(randomOffset1100 , randomOffset2101));
				float randomIntesity456 = _RandomMul;
				float randomIntensityY482 = _RandomMulY;
				float2 appendResult68 = (float2(( ( randomOffset1100 * randomIntesity456 ) + _Noise1Panning.x ) , ( _Noise1Panning.y + ( randomOffset2101 * randomIntensityY482 ) )));
				float2 appendResult119 = (float2(randomOffset1100 , randomOffset2101));
				#ifdef _ISNOISE1POLAR_ON
				float2 staticSwitch475 = float2( 0,0 );
				#else
				float2 staticSwitch475 = appendResult119;
				#endif
				float2 texCoord39 = i.ase_texcoord2.xy * _Noise1Tiling + staticSwitch475;
				float2 panner64 = ( 1.0 * _Time.y * appendResult68 + texCoord39);
				float2 Noise1UV285 = ( appendResult472 + panner64 );
				float2 temp_output_34_0_g5 = ( texCoord39 - ( _Noise1Tiling * float2( 0.5,0.5 ) ) );
				float2 break39_g5 = temp_output_34_0_g5;
				float2 appendResult50_g5 = (float2(( 1.0 * ( length( temp_output_34_0_g5 ) * 2.0 ) ) , ( ( atan2( break39_g5.x , break39_g5.y ) * ( 1.0 / 6.28318548202515 ) ) * 1.0 )));
				float2 UV501 = appendResult50_g5;
				float2 appendResult504 = (float2(_Noise1ShearX , _Noise1ShearY));
				float2 Shear501 = appendResult504;
				float2 localMyCustomExpression501 = MyCustomExpression501( UV501 , Shear501 );
				float2 panner415 = ( 1.0 * _Time.y * appendResult68 + localMyCustomExpression501);
				float2 appendResult468 = (float2(randomOffset1100 , randomOffset2101));
				float2 PolarNoise1UV423 = ( panner415 + appendResult468 );
				#ifdef _ISNOISE1POLAR_ON
				float2 staticSwitch435 = PolarNoise1UV423;
				#else
				float2 staticSwitch435 = Noise1UV285;
				#endif
				float2 appendResult86 = (float2(( ( randomIntesity456 * randomOffset1100 ) + _UVDistortion1Panning.x ) , ( _UVDistortion1Panning.y + ( randomOffset2101 * randomIntensityY482 ) )));
				float2 appendResult291 = (float2(randomOffset1100 , randomOffset2101));
				float2 texCoord54 = i.ase_texcoord2.xy * _UVDistortion1Tiling + appendResult291;
				float2 panner53 = ( 2.0 * _Time.y * appendResult86 + texCoord54);
				float simplePerlin2D292 = snoise( panner53*_GenerateNoise1Strength );
				simplePerlin2D292 = simplePerlin2D292*0.5 + 0.5;
				float4 temp_cast_6 = (simplePerlin2D292).xxxx;
				#ifdef _USEGENERATENOISE1_ON
				float4 staticSwitch295 = temp_cast_6;
				#else
				float4 staticSwitch295 = tex2D( _UVDistortionMap, panner53 );
				#endif
				float4 lerpResult140 = lerp( float4( staticSwitch435, 0.0 , 0.0 ) , staticSwitch295 , _Distortion1Intensity);
				#ifdef _ISUVDISTORTION1_ON
				float4 staticSwitch60 = lerpResult140;
				#else
				float4 staticSwitch60 = float4( staticSwitch435, 0.0 , 0.0 );
				#endif
				float4 UV_Distortion1287 = staticSwitch60;
				float2 Inuv407 = UV_Distortion1287.rg;
				sampler2D InTex407 = _Noise1;
				float4 localMyCustomExpression407 = MyCustomExpression407( Inuv407 , InTex407 );
				#ifdef _ISNOISE1POLAR_ON
				float4 staticSwitch404 = localMyCustomExpression407;
				#else
				float4 staticSwitch404 = tex2D( _Noise1, UV_Distortion1287.rg );
				#endif
				float4 temp_cast_10 = (_Noise1Power).xxxx;
				float4 Noise119 = saturate( pow( staticSwitch404 , temp_cast_10 ) );
				#ifdef _USENOISE1_ON
				float4 staticSwitch616 = Noise119;
				#else
				float4 staticSwitch616 = temp_cast_3;
				#endif
				float4 temp_cast_11 = (1.0).xxxx;
				float2 appendResult72 = (float2(( ( randomIntesity456 * randomOffset1100 ) + _Noise2Panning.x ) , ( _Noise2Panning.y + ( randomIntensityY482 * randomOffset2101 ) )));
				float2 appendResult219 = (float2(randomOffset1100 , randomOffset2101));
				#ifdef _ISNOISE2POLAR_ON
				float2 staticSwitch476 = float2( 0,0 );
				#else
				float2 staticSwitch476 = appendResult219;
				#endif
				float2 texCoord220 = i.ase_texcoord2.xy * _Noise2Tiling + staticSwitch476;
				float2 panner14 = ( 1.0 * _Time.y * appendResult72 + texCoord220);
				float2 Noise2UV286 = panner14;
				float2 temp_output_34_0_g6 = ( texCoord220 - ( _Noise2Tiling * float2( 0.5,0.5 ) ) );
				float2 break39_g6 = temp_output_34_0_g6;
				float2 appendResult50_g6 = (float2(( 1.0 * ( length( temp_output_34_0_g6 ) * 2.0 ) ) , ( ( atan2( break39_g6.x , break39_g6.y ) * ( 1.0 / 6.28318548202515 ) ) * 1.0 )));
				float2 UV508 = appendResult50_g6;
				float2 appendResult506 = (float2(_Noise2ShearX , _Noise2ShearY));
				float2 Shear508 = appendResult506;
				float2 localMyCustomExpression508 = MyCustomExpression508( UV508 , Shear508 );
				float2 panner436 = ( 1.0 * _Time.y * appendResult72 + localMyCustomExpression508);
				float2 appendResult477 = (float2(randomOffset1100 , randomOffset2101));
				float2 PolarNoise2UV437 = ( panner436 + appendResult477 );
				#ifdef _ISNOISE2POLAR_ON
				float2 staticSwitch439 = PolarNoise2UV437;
				#else
				float2 staticSwitch439 = Noise2UV286;
				#endif
				float2 appendResult301 = (float2(( ( randomIntesity456 * randomOffset1100 ) + _UVDistortion2Panning.x ) , ( _UVDistortion2Panning.y + ( randomOffset2101 * randomIntensityY482 ) )));
				float2 appendResult305 = (float2(randomOffset1100 , randomOffset2101));
				float2 texCoord302 = i.ase_texcoord2.xy * _UVDistortion2Tiling + appendResult305;
				float2 panner306 = ( 2.0 * _Time.y * appendResult301 + texCoord302);
				float simplePerlin2D308 = snoise( panner306*_GenerateNoise2Strength );
				simplePerlin2D308 = simplePerlin2D308*0.5 + 0.5;
				float4 temp_cast_14 = (simplePerlin2D308).xxxx;
				#ifdef _USEGENERATENOISE2_ON
				float4 staticSwitch310 = temp_cast_14;
				#else
				float4 staticSwitch310 = tex2D( _UVDistortion2Map, panner306 );
				#endif
				float4 lerpResult311 = lerp( float4( staticSwitch439, 0.0 , 0.0 ) , staticSwitch310 , _Distortion2Intensity);
				#ifdef _ISUVDISTORTION2_ON
				float4 staticSwitch315 = lerpResult311;
				#else
				float4 staticSwitch315 = float4( staticSwitch439, 0.0 , 0.0 );
				#endif
				float4 UV_Distortion2314 = staticSwitch315;
				float2 Inuv411 = UV_Distortion2314.rg;
				sampler2D InTex411 = _Noise2;
				float4 localMyCustomExpression411 = MyCustomExpression411( Inuv411 , InTex411 );
				#ifdef _ISNOISE2POLAR_ON
				float4 staticSwitch409 = localMyCustomExpression411;
				#else
				float4 staticSwitch409 = tex2D( _Noise2, UV_Distortion2314.rg );
				#endif
				float4 temp_cast_18 = (_Noise2Power).xxxx;
				float4 Noise218 = saturate( pow( staticSwitch409 , temp_cast_18 ) );
				#ifdef _USENOISE2_ON
				float4 staticSwitch618 = Noise218;
				#else
				float4 staticSwitch618 = temp_cast_11;
				#endif
				float4 temp_cast_19 = (1.0).xxxx;
				#ifdef _USENOISE1_ON
				float4 staticSwitch619 = Noise119;
				#else
				float4 staticSwitch619 = temp_cast_19;
				#endif
				float4 temp_cast_20 = (1.0).xxxx;
				#ifdef _USENOISE2_ON
				float4 staticSwitch620 = Noise218;
				#else
				float4 staticSwitch620 = temp_cast_20;
				#endif
				#ifdef _ISSUBTRACT_ON
				float4 staticSwitch234 = saturate( ( staticSwitch619 - staticSwitch620 ) );
				#else
				float4 staticSwitch234 = ( staticSwitch616 * staticSwitch618 );
				#endif
				float4 temp_output_222_0 = ( ( staticSwitch234 * 4.0 ) * (1.0 + (_EmissionIntensity - 0.0) * (2.0 - 1.0) / (1.0 - 0.0)) );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = Unity_SafeNormalize( ase_worldViewDir );
				float dotResult541 = dot( ase_worldViewDir , ase_worldNormal );
				float temp_output_542_0 = abs( dotResult541 );
				#ifdef _ISFRESNELINVERSE_ON
				float staticSwitch632 = temp_output_542_0;
				#else
				float staticSwitch632 = ( 1.0 - temp_output_542_0 );
				#endif
				float fresnel552 = max( ( pow( staticSwitch632 , _FresnelWidth ) * _FresnelIntensity ) , 0.0 );
				#ifdef _USEFRESNEL_ON
				float4 staticSwitch548 = ( fresnel552 * temp_output_222_0 );
				#else
				float4 staticSwitch548 = temp_output_222_0;
				#endif
				float InAge359 = i.ase_texcoord3.xy.x;
				float localInstancingAgePercent359 = InstancingAgePercent( InAge359 );
				#ifdef _ISLIFETIMEDISSOLVE_ON
				float staticSwitch175 = (0.0 + (localInstancingAgePercent359 - (0.0 + (_StartDissolve - 0.0) * (0.9 - 0.0) / (1.0 - 0.0))) * (1.0 - 0.0) / (1.0 - (0.0 + (_StartDissolve - 0.0) * (0.9 - 0.0) / (1.0 - 0.0))));
				#else
				float staticSwitch175 = (-1.0 + (_Threshold - 0.0) * (1.0 - -1.0) / (1.0 - 0.0));
				#endif
				float In0561 = i.ase_texcoord4.xy.x;
				float localInstancingCustomDissolve561 = InstancingCustomDissolve( In0561 );
				#ifdef _ISCUSTOMDATADISSOLVE_ON
				float staticSwitch558 = localInstancingCustomDissolve561;
				#else
				float staticSwitch558 = staticSwitch175;
				#endif
				float2 appendResult401 = (float2(( ( randomOffset1100 * randomIntesity456 ) + _DissolvePanning.x ) , ( _DissolvePanning.y + ( randomOffset2101 * randomIntensityY482 ) )));
				float2 appendResult227 = (float2(randomOffset1100 , randomOffset2101));
				#ifdef _ISDISSOLVEPOLAR_ON
				float2 staticSwitch462 = float2( 0,0 );
				#else
				float2 staticSwitch462 = appendResult227;
				#endif
				float2 texCoord171 = i.ase_texcoord2.xy * _DissolveTiling + staticSwitch462;
				float2 panner213 = ( 1.0 * _Time.y * appendResult401 + texCoord171);
				float2 DissolveUV338 = panner213;
				float2 appendResult325 = (float2(( ( randomIntesity456 * randomOffset1100 ) + _UVDistortionDPanning.x ) , ( _UVDistortionDPanning.y + ( randomOffset2101 * randomIntensityY482 ) )));
				float2 appendResult324 = (float2(randomOffset1100 , randomOffset2101));
				float2 texCoord326 = i.ase_texcoord2.xy * _UVDistortionDTiling + appendResult324;
				float2 panner327 = ( 2.0 * _Time.y * appendResult325 + texCoord326);
				float simplePerlin2D329 = snoise( panner327*_GenerateNoiseDStrength );
				simplePerlin2D329 = simplePerlin2D329*0.5 + 0.5;
				float4 temp_cast_23 = (simplePerlin2D329).xxxx;
				#ifdef _USEGENERATENOISED_ON
				float4 staticSwitch333 = temp_cast_23;
				#else
				float4 staticSwitch333 = tex2D( _UVDistortionDMap, panner327 );
				#endif
				float4 lerpResult334 = lerp( float4( DissolveUV338, 0.0 , 0.0 ) , staticSwitch333 , _DistortionDIntensity);
				#ifdef _ISUVDISTORTIOND_ON
				float4 staticSwitch339 = lerpResult334;
				#else
				float4 staticSwitch339 = float4( DissolveUV338, 0.0 , 0.0 );
				#endif
				float4 UV_Distortion_D335 = staticSwitch339;
				float2 temp_output_34_0_g7 = ( texCoord171 - ( _DissolveTiling * float2( 0.5,0.5 ) ) );
				float2 break39_g7 = temp_output_34_0_g7;
				float2 appendResult50_g7 = (float2(( 1.0 * ( length( temp_output_34_0_g7 ) * 2.0 ) ) , ( ( atan2( break39_g7.x , break39_g7.y ) * ( 1.0 / 6.28318548202515 ) ) * 1.0 )));
				float2 UV512 = appendResult50_g7;
				float2 appendResult511 = (float2(_DissolveShearX , _DissolveShearY));
				float2 Shear512 = appendResult511;
				float2 localMyCustomExpression512 = MyCustomExpression512( UV512 , Shear512 );
				float2 panner443 = ( 1.0 * _Time.y * appendResult401 + localMyCustomExpression512);
				float2 appendResult465 = (float2(randomOffset1100 , randomOffset2101));
				float2 Inuv441 = ( panner443 + appendResult465 );
				sampler2D InTex441 = _DissolveMap;
				float localMyCustomExpression441 = MyCustomExpression441( Inuv441 , InTex441 );
				#ifdef _ISDISSOLVEPOLAR_ON
				float staticSwitch446 = localMyCustomExpression441;
				#else
				float staticSwitch446 = tex2D( _DissolveMap, UV_Distortion_D335.rg ).r;
				#endif
				float4 dissolveEdge187 = ( ( ( 1.0 - step( ( (0.0 + (_EdgeWidth - 0.0) * (0.1 - 0.0) / (1.0 - 0.0)) + staticSwitch558 ) , staticSwitch446 ) ) * _EdgeColor ) * 5.0 );
				#ifdef _USEDISSOLVE_ON
				float4 staticSwitch625 = ( dissolveEdge187 + staticSwitch548 );
				#else
				float4 staticSwitch625 = staticSwitch548;
				#endif
				float In0374 = i.ase_texcoord3.xyz.y;
				float localInstancingOffsetX374 = InstancingOffsetX( In0374 );
				float In0377 = i.ase_texcoord3.xyz.z;
				float localInstancingOffsetY377 = InstancingOffsetY( In0377 );
				float2 appendResult375 = (float2(localInstancingOffsetX374 , localInstancingOffsetY377));
				#ifdef _ISCUSTOMDATAOFFSET_ON
				float2 staticSwitch373 = appendResult375;
				#else
				float2 staticSwitch373 = _MainOffset;
				#endif
				float2 texCoord351 = i.ase_texcoord2.xy * float2( 1,1 ) + staticSwitch373;
				float2 mainUV1157 = texCoord351;
				float2 appendResult1182 = (float2(( ( randomIntesity456 * randomOffset1100 ) + _UVDistortionMPanning.x ) , ( _UVDistortionMPanning.y + ( randomOffset2101 * randomIntensityY482 ) )));
				float2 appendResult1178 = (float2(randomOffset1100 , randomOffset2101));
				float2 texCoord1183 = i.ase_texcoord2.xy * _UVDistortionMTiling + appendResult1178;
				float2 panner1184 = ( 2.0 * _Time.y * appendResult1182 + texCoord1183);
				float temp_output_1189_0 = (0.0 + (_DistortionMIntensity - 0.0) * (0.5 - 0.0) / (1.0 - 0.0));
				float simplePerlin2D1168 = snoise( panner1184*_GenerateNoiseMStrength );
				simplePerlin2D1168 = simplePerlin2D1168*0.5 + 0.5;
				#ifdef _USEGENERATENOISEM_ON
				float staticSwitch1166 = ( temp_output_1189_0 * simplePerlin2D1168 );
				#else
				float staticSwitch1166 = ( tex2D( _UVDistortionMMap, panner1184 ).r * temp_output_1189_0 );
				#endif
				#ifdef _ISUVDISTORTIONM_ON
				float2 staticSwitch1164 = ( mainUV1157 + staticSwitch1166 );
				#else
				float2 staticSwitch1164 = mainUV1157;
				#endif
				float2 DistortedMainUV1165 = staticSwitch1164;
				float2 temp_output_34_0_g8 = ( i.ase_texcoord2.xy - ( _MainPolarCenter * float2( 0.5,0.5 ) ) );
				float2 break39_g8 = temp_output_34_0_g8;
				float2 appendResult50_g8 = (float2(( 1.0 * ( length( temp_output_34_0_g8 ) * 2.0 ) ) , ( ( atan2( break39_g8.x , break39_g8.y ) * ( 1.0 / 6.28318548202515 ) ) * 1.0 )));
				float2 appendResult1094 = (float2(randomOffset1100 , randomOffset2101));
				float2 Inuv1090 = ( ( appendResult50_g8 + staticSwitch373 ) + appendResult1094 );
				sampler2D InTex1090 = _Mask;
				float4 localMyCustomExpression1090 = MyCustomExpression1090( Inuv1090 , InTex1090 );
				#ifdef _ISMAINPOLAR_ON
				float4 staticSwitch1112 = localMyCustomExpression1090;
				#else
				float4 staticSwitch1112 = tex2D( _Mask, DistortedMainUV1165 );
				#endif
				float4 temp_output_196_0 = ( staticSwitch625 * staticSwitch1112 );
				float2 texCoord515 = i.ase_texcoord2.xy * float2( 1,1 ) + _SecondOffset;
				#ifdef _USESECONDMASK_ON
				float4 staticSwitch627 = ( temp_output_196_0 * tex2D( _SecondMask, texCoord515 ) );
				#else
				float4 staticSwitch627 = temp_output_196_0;
				#endif
				float dissolve186 = step( staticSwitch558 , staticSwitch446 );
				#ifdef _USEDISSOLVE_ON
				float4 staticSwitch626 = ( dissolve186 * staticSwitch627 );
				#else
				float4 staticSwitch626 = staticSwitch627;
				#endif
				float2 appendResult598 = (float2(randomOffset1100 , randomOffset2101));
				float2 texCoord563 = i.ase_texcoord2.xy * _CausticsNoiseTiling + appendResult598;
				float2 panner564 = ( 1.0 * _Time.y * _CausticsNoisePanning + texCoord563);
				float2 UV612 = panner564;
				float Scale612 = _CausticsNoiseScale;
				float localUnityTiledGradientNoise612 = UnityTiledGradientNoise( UV612 , Scale612 );
				float2 appendResult1131 = (float2(( _Time.y * _VoronoiPanning.x ) , ( _Time.y * _VoronoiPanning.y )));
				float2 appendResult601 = (float2(randomOffset1100 , randomOffset2101));
				float2 texCoord562 = i.ase_texcoord2.xy * float2( 1,1 ) + ( appendResult1131 + appendResult601 );
				float2 temp_output_605_0 = ( ( localUnityTiledGradientNoise612 * _CausticsNoiseIntensity ) + texCoord562 );
				float2 UV611 = temp_output_605_0;
				float temp_output_584_0 = ( _Time.y * _VoronoiAngleSpeed );
				float AngleOffset611 = ( temp_output_584_0 - _ChromaticAberration );
				float CellDensity611 = _VoronoiScale;
				float3 localUnityTiledVoronoi611 = UnityTiledVoronoi( UV611 , AngleOffset611 , CellDensity611 );
				float2 UV610 = temp_output_605_0;
				float AngleOffset610 = temp_output_584_0;
				float CellDensity610 = _VoronoiScale;
				float3 localUnityTiledVoronoi610 = UnityTiledVoronoi( UV610 , AngleOffset610 , CellDensity610 );
				float2 UV609 = temp_output_605_0;
				float AngleOffset609 = ( temp_output_584_0 + _ChromaticAberration );
				float CellDensity609 = _VoronoiScale;
				float3 localUnityTiledVoronoi609 = UnityTiledVoronoi( UV609 , AngleOffset609 , CellDensity609 );
				float3 appendResult569 = (float3(localUnityTiledVoronoi611.x , localUnityTiledVoronoi610.x , localUnityTiledVoronoi609.x));
				float3 temp_cast_29 = (_VoronoiPower).xxx;
				float3 CACaustics588 = ( pow( appendResult569 , temp_cast_29 ) * _VoronoiIntensity );
				float4 appendResult629 = (float4(CACaustics588 , 1.0));
				#ifdef _USECACAUSTICS_ON
				float4 staticSwitch592 = ( appendResult629 * staticSwitch626 );
				#else
				float4 staticSwitch592 = staticSwitch626;
				#endif
				float2 appendResult284 = (float2(randomOffset1100 , randomOffset2101));
				float2 texCoord251 = i.ase_texcoord2.xy * _TrailEdgeDissolveTilling + appendResult284;
				float2 panner254 = ( 1.0 * _Time.y * _TrailEdgeDissolveScroll + texCoord251);
				float4 temp_cast_32 = (_TrailEdgeDissolveNoisePower).xxxx;
				float4 temp_output_275_0 = pow( tex2D( _TrailEdgeDissolveMap, panner254 ) , temp_cast_32 );
				float2 texCoord1134 = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TOGGLEXY_ON
				float staticSwitch1136 = texCoord1134.y;
				#else
				float staticSwitch1136 = texCoord1134.x;
				#endif
				float TrailEdgeUV1133 = staticSwitch1136;
				float temp_output_258_0 = ( 1.0 - TrailEdgeUV1133 );
				float4 temp_cast_33 = (TrailEdgeUV1133).xxxx;
				float temp_output_264_0 = (0.0 + (_TrailEdgeDissolveLength - 0.0) * (-1.0 - 0.0) / (1.0 - 0.0));
				float4 temp_cast_34 = (temp_output_264_0).xxxx;
				float4 temp_cast_35 = (1.0).xxxx;
				float4 temp_cast_36 = (temp_output_258_0).xxxx;
				float4 temp_cast_37 = (temp_output_264_0).xxxx;
				#ifdef _ISBOTHDISSOLVE_ON
				float4 staticSwitch271 = ( ( ( temp_output_275_0 + ( TrailEdgeUV1133 * _TrailEdgeDissolveThreshold ) ) - temp_cast_36 ) - temp_cast_37 );
				#else
				float4 staticSwitch271 = temp_cast_35;
				#endif
				float4 EdgeDissolve276 = saturate( ( ( ( ( temp_output_275_0 + ( temp_output_258_0 * _TrailEdgeDissolveThreshold ) ) - temp_cast_33 ) - temp_cast_34 ) * staticSwitch271 ) );
				#ifdef _ISTRAILEDGEDISSOLVE_ON
				float4 staticSwitch278 = ( EdgeDissolve276 * staticSwitch592 );
				#else
				float4 staticSwitch278 = staticSwitch592;
				#endif
				float2 texCoord804 = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _USECIRCLE_ON
				float staticSwitch862 = saturate( (1.18 + (abs( ( 0.45 - distance( texCoord804 , float2( 0.5,0.5 ) ) ) ) - 0.0) * ((-23.0 + ((1.0 + (_CircleWidth - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) - 0.0) * (-100.0 - -23.0) / (1.0 - 0.0)) - 1.18) / (1.0 - 0.0)) );
				#else
				float staticSwitch862 = 1.0;
				#endif
				float Ring853 = staticSwitch862;
				float2 texCoord742 = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_cast_38 = (0.5).xx;
				float2 temp_cast_39 = (2.0).xx;
				float2 break750 = pow( abs( ( texCoord742 - temp_cast_38 ) ) , temp_cast_39 );
				float temp_output_755_0 = ( 1.0 - ( ( break750.x + break750.y ) * (100.0 + (_Size - 0.0) * (4.0 - 100.0) / (1.0 - 0.0)) ) );
				float smoothstepResult766 = smoothstep( 0.0 , 0.33 , ( pow( temp_output_755_0 , (200.0 + (_CenterSize - 0.0) * (2.0 - 200.0) / (1.0 - 0.0)) ) * _CenterStrength ));
				#ifdef _USEDUST_ON
				float staticSwitch779 = saturate( ( ( (0.0 + (_OutsideStrength - 0.0) * (0.1 - 0.0) / (1.0 - 0.0)) * pow( temp_output_755_0 , (50.0 + (_OutsideSize - 0.0) * (2.0 - 50.0) / (1.0 - 0.0)) ) ) + smoothstepResult766 ) );
				#else
				float staticSwitch779 = 1.0;
				#endif
				float Dust778 = staticSwitch779;
				float2 texCoord875 = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_cast_40 = (0.5).xx;
				float2 temp_cast_41 = (0.25).xx;
				float2 break881 = pow( ( abs( ( texCoord875 - temp_cast_40 ) ) * 2.16 ) , temp_cast_41 );
				float smoothstepResult887 = smoothstep( -0.4 , 0.18 , ( 1.0 - pow( ( break881.x + break881.y ) , 1.99 ) ));
				#ifdef _USEGLITTER_ON
				float staticSwitch924 = ( ( smoothstepResult887 * pow( ( pow( saturate( ( texCoord875.x - 0.19 ) ) , 0.81 ) * pow( saturate( ( ( 1.0 - texCoord875.x ) - 0.19 ) ) , 0.81 ) * pow( saturate( ( texCoord875.y - 0.19 ) ) , 0.81 ) * pow( saturate( ( ( 1.0 - texCoord875.y ) - 0.19 ) ) , 0.81 ) ) , 0.57 ) ) * 8.0 );
				#else
				float staticSwitch924 = 1.0;
				#endif
				float Glitter889 = staticSwitch924;
				float4 temp_cast_42 = (1.0).xxxx;
				float2 appendResult953 = (float2(randomOffset1100 , randomOffset2101));
				float2 texCoord954 = i.ase_texcoord2.xy * _GradientMaskTilling + appendResult953;
				float2 panner956 = ( 1.0 * _Time.y * _GradientMaskPanning + texCoord954);
				float4 temp_cast_43 = (_MaskNoisePower).xxxx;
				float4 temp_output_962_0 = pow( tex2D( _GradientNoiseMap, panner956 ) , temp_cast_43 );
				float2 texCoord957 = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_963_0 = ( 1.0 - texCoord957.x );
				float4 temp_cast_44 = (texCoord957.x).xxxx;
				float temp_output_969_0 = (2.0 + (_HorizontalLength - 0.0) * (-1.0 - 2.0) / (1.0 - 0.0));
				float4 temp_cast_45 = (temp_output_969_0).xxxx;
				float4 temp_cast_46 = (temp_output_963_0).xxxx;
				float4 temp_cast_47 = (temp_output_969_0).xxxx;
				float2 texCoord1001 = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_1000_0 = ( 1.0 - texCoord1001.y );
				float4 temp_cast_48 = (texCoord1001.y).xxxx;
				float temp_output_986_0 = (2.0 + (_VerticalLength - 0.0) * (-1.0 - 2.0) / (1.0 - 0.0));
				float4 temp_cast_49 = (temp_output_986_0).xxxx;
				float4 temp_cast_50 = (temp_output_1000_0).xxxx;
				float4 temp_cast_51 = (temp_output_986_0).xxxx;
				#ifdef _USEGRADIENTMASK_ON
				float4 staticSwitch1005 = ( saturate( ( ( ( ( temp_output_962_0 + ( temp_output_963_0 * _HorizontalBorder ) ) - temp_cast_44 ) - temp_cast_45 ) * ( ( ( temp_output_962_0 + ( texCoord957.x * _HorizontalBorder ) ) - temp_cast_46 ) - temp_cast_47 ) ) ) * saturate( ( ( ( ( temp_output_962_0 + ( temp_output_1000_0 * _VerticalBorder ) ) - temp_cast_48 ) - temp_cast_49 ) * ( ( ( temp_output_962_0 + ( texCoord1001.y * _VerticalBorder ) ) - temp_cast_50 ) - temp_cast_51 ) ) ) );
				#else
				float4 staticSwitch1005 = temp_cast_42;
				#endif
				float4 GradientMask1006 = staticSwitch1005;
				float2 appendResult1148 = (float2(( ( randomOffset1100 * randomIntesity456 ) + _AlphaFadePanning.x ) , ( _AlphaFadePanning.y + ( randomOffset2101 * randomIntensityY482 ) )));
				float2 appendResult1139 = (float2(randomOffset1100 , randomOffset2101));
				float2 texCoord1141 = i.ase_texcoord2.xy * _AlphaFadeTiling + appendResult1139;
				float2 panner1142 = ( 1.0 * _Time.y * appendResult1148 + texCoord1141);
				float simplePerlin2D1014 = snoise( panner1142*_AFNoiseStrength );
				simplePerlin2D1014 = simplePerlin2D1014*0.5 + 0.5;
				#ifdef _USEGENENOISE4AF_ON
				float staticSwitch1045 = saturate( pow( simplePerlin2D1014 , _AFNoisePower ) );
				#else
				float staticSwitch1045 = saturate( pow( tex2D( _AlphaFadeMap, panner1142 ).r , _AFNoisePower ) );
				#endif
				float InstancedAgePercent1042 = localInstancingAgePercent359;
				#ifdef _ISLIFETIMEALPHAFADE_ON
				float staticSwitch1034 = (0.0 + (InstancedAgePercent1042 - (0.0 + (_StartAlphaFade - 0.0) * (0.9 - 0.0) / (1.0 - 0.0))) * (1.0 - 0.0) / (1.0 - (0.0 + (_StartAlphaFade - 0.0) * (0.9 - 0.0) / (1.0 - 0.0))));
				#else
				float staticSwitch1034 = (-1.0 + (_AlphaFadeThreshold - 0.0) * (1.0 - -1.0) / (1.0 - 0.0));
				#endif
				float InstancedCustomDissolve1041 = localInstancingCustomDissolve561;
				#ifdef _ISCUSTOMDATAALPHAFADE_ON
				float staticSwitch1036 = InstancedCustomDissolve1041;
				#else
				float staticSwitch1036 = staticSwitch1034;
				#endif
				#ifdef _USEALPHAFADE_ON
				float staticSwitch1053 = saturate( ( staticSwitch1045 - staticSwitch1036 ) );
				#else
				float staticSwitch1053 = 1.0;
				#endif
				float AlphaFade1025 = staticSwitch1053;
				float4 temp_output_857_0 = ( staticSwitch278 * Ring853 * Dust778 * Glitter889 * GradientMask1006 * AlphaFade1025 );
				float2 texCoord1120 = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_cast_52 = (0.5).xx;
				float3 hsvTorgb699 = RGBToHSV( _SecondColor.rgb );
				float3 hsvTorgb700 = HSVToRGB( float3(( _Hue + hsvTorgb699.x ),( hsvTorgb699.y + _Saturation ),hsvTorgb699.z) );
				float4 lerpResult696 = lerp( i.ase_color , float4( hsvTorgb700 , 0.0 ) , _SecondColorThreshold);
				float4 temp_output_127_0 = ( ( MatCap1082 * ( ( _MainColor * temp_output_857_0 ) * ( _GradientColor * tex2D( _GradientMap, ( 0.5 + ( ( texCoord1120 - temp_cast_52 ) * _TestFloat ) ) ) ) ) ) * lerpResult696 );
				float In0381 = i.ase_texcoord3.w;
				float localInstancingIntensity381 = InstancingIntensity( In0381 );
				float2 temp_cast_55 = (0.5).xx;
				#ifdef _ISCUSTOMINTENSITY_ON
				float4 staticSwitch387 = ( localInstancingIntensity381 * temp_output_127_0 );
				#else
				float4 staticSwitch387 = temp_output_127_0;
				#endif
				float4 screenPos = i.ase_texcoord5;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth166 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
				float distanceDepth166 = abs( ( screenDepth166 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _SoftParticle ) );
				#ifdef _ISSOFTPARTICLE_ON
				float staticSwitch150 = saturate( distanceDepth166 );
				#else
				float staticSwitch150 = 1.0;
				#endif
				float SoftParticle157 = staticSwitch150;
				float smoothstepResult527 = smoothstep( _FadeStart , _FadeEnd , distance( _WorldSpaceCameraPos , WorldPosition ));
				#ifdef _ISCAMERAFADE_ON
				float staticSwitch529 = smoothstepResult527;
				#else
				float staticSwitch529 = 1.0;
				#endif
				float cameraFade531 = staticSwitch529;
				float4 Emission41 = ( staticSwitch387 * i.ase_color.a * SoftParticle157 * cameraFade531 );
				float4 MaskAlpha688 = temp_output_857_0;
				float Main_Color_Alpha1155 = _MainColor.a;
				float Alpha664 = ( MaskAlpha688.g * SoftParticle157 * cameraFade531 * i.ase_color.a * Main_Color_Alpha1155 );
				float4 appendResult677 = (float4(Emission41.rgb , Alpha664));
				float isFirst356 = ( _isFirst * 0.0 );
				
				
				finalColor = ( appendResult677 + isFirst356 );
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "KumaEffectShaderGUI"
	
	Fallback Off
}
/*ASEBEGIN
Version=19603
Node;AmplifyShaderEditor.TexCoordVertexDataNode;97;-4496,2832;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;365;-4544,2784;Inherit;False;1230.853;704.6045;Comment;6;613;630;361;364;100;101;StableRandom;1,1,1,1;0;0
Node;AmplifyShaderEditor.CustomExpressionNode;613;-4016,3104;Inherit;False;#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)$                    vertInstancingColor(i.ase_color)@$                    i.ase_color.rgb = min(1, i.ase_color.rgb)@$                #endif;7;Create;0;Instancing Color;False;False;0;;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;361;-4112,3024;Inherit;False;#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)$$UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID]@$$return data.stableRandomXY.x@$$#else$return In0@$#endif;1;Create;1;True;In0;FLOAT;0;In;;Inherit;False;InstancingRandomX;False;False;0;;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;630;-3808,3024;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;364;-4112,3168;Inherit;False;#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)$$UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID]@$$return data.stableRandomXY.y@$$#else$return In0@$#endif;1;Create;1;True;In0;FLOAT;0;In;;Inherit;False;InstancingRandomY;False;False;0;;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;100;-3648,3024;Inherit;False;randomOffset1;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;25;-6128,-6176;Inherit;False;5438.785;3416.42;Comment;66;19;404;405;407;64;471;473;474;472;285;121;120;119;215;475;39;111;110;458;484;133;452;453;389;390;68;502;503;535;406;504;469;470;501;468;415;467;423;408;288;22;79;141;411;409;412;413;316;437;410;508;478;479;436;477;480;103;457;483;104;134;455;454;391;392;72;BlendNoise;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;101;-3643,3232;Inherit;False;randomOffset2;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;115;-4016,2832;Inherit;False;Property;_RandomMul;RandomMul;22;0;Create;True;0;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;481;-4016,2912;Inherit;False;Property;_RandomMulY;RandomMulY;21;0;Create;True;0;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;216;-6096,-4128;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;217;-6080,-3984;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;121;-6048,-5840;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;120;-6048,-5968;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;456;-3664,2832;Inherit;False;randomIntesity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;482;-3664,2912;Inherit;False;randomIntensityY;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;219;-5808,-4064;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;119;-5744,-5872;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;476;-5616,-4064;Inherit;False;Property;_Keyword5;Keyword 5;79;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;409;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;221;-5568,-4224;Inherit;False;Property;_Noise2Tiling;Noise2Tiling;39;0;Create;True;0;0;0;False;0;False;1,1;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;111;-6032,-5232;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;110;-6032,-5520;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;458;-6032,-5648;Inherit;False;456;randomIntesity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;484;-6048,-5120;Inherit;False;482;randomIntensityY;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;215;-5568,-5984;Inherit;False;Property;_Noise1Tiling;Noise1Tiling;38;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.StaticSwitch;475;-5568,-5824;Inherit;False;Property;_isNoise1Polar1;isNoise1Polar;78;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;404;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;103;-6016,-3680;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;457;-6032,-3808;Inherit;False;456;randomIntesity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;483;-6016,-3296;Inherit;False;482;randomIntensityY;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;104;-6016,-3408;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;220;-5264,-4112;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;505;-5072,-3520;Inherit;False;Property;_Noise2ShearX;Noise2Shear X;83;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;507;-5072,-3440;Inherit;False;Property;_Noise2ShearY;Noise2Shear Y;86;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;534;-5166.472,-3822.128;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;133;-6016,-5408;Inherit;False;Property;_Noise1Panning;Noise1Panning;18;0;Create;True;0;0;0;False;0;False;0.1,0.4;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;452;-5712,-5232;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;453;-5712,-5504;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;502;-5248,-4656;Inherit;False;Property;_Noise1ShearX;Noise1Shear X;84;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;503;-5248,-4576;Inherit;False;Property;_Noise1ShearY;Noise1Shear Y;85;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;39;-5312,-5936;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;134;-6016,-3584;Inherit;False;Property;_Noise2Panning;Noise2Panning;20;0;Create;True;0;0;0;False;0;False;-0.1,0.3;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;455;-5728,-3440;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;454;-5728,-3712;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;535;-5421.797,-4898.542;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;65;-10544,-2448;Inherit;False;4529.927;4158.46;Comment;107;335;339;334;331;332;333;330;329;328;327;326;325;314;287;557;398;397;324;60;315;319;487;488;321;320;311;140;489;486;318;317;295;435;439;310;312;46;292;309;440;307;308;294;229;434;313;306;293;53;54;302;301;86;556;555;305;396;395;393;394;291;135;491;490;297;304;303;495;494;290;289;493;492;296;298;497;496;122;123;1159;1160;1161;1162;1163;1164;1165;1166;1167;1168;1173;1175;1176;1177;1178;1179;1180;1181;1182;1183;1184;1171;1169;1170;1172;1174;1186;1189;UV Distortion;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;123;-10496,-1936;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;122;-10496,-2144;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;496;-10496,-2224;Inherit;False;456;randomIntesity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;497;-10496,-1856;Inherit;False;482;randomIntensityY;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;298;-10512,-944;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;296;-10512,-1152;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;492;-10512,-832;Inherit;False;482;randomIntensityY;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;506;-4752,-3520;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;493;-10512,-1248;Inherit;False;456;randomIntesity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;389;-5504,-5440;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;390;-5504,-5232;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;406;-5216,-4928;Inherit;True;Polar Coordinates;-1;;5;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;1;False;3;FLOAT2;0;FLOAT;55;FLOAT;56
Node;AmplifyShaderEditor.DynamicAppendNode;504;-4928,-4656;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;410;-4880,-3840;Inherit;True;Polar Coordinates;-1;;6;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;1;False;3;FLOAT2;0;FLOAT;55;FLOAT;56
Node;AmplifyShaderEditor.SimpleAddOpNode;391;-5488,-3664;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;392;-5488,-3536;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;289;-10288,-1760;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;290;-10288,-1664;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;494;-10256,-2160;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;495;-10256,-1952;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;303;-10144,-832;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;304;-10144,-736;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;297;-10512,-1072;Inherit;False;Property;_UVDistortion2Panning;UVDistortion2Panning;11;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;490;-10272,-1184;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;491;-10272,-944;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;135;-10496,-2064;Inherit;False;Property;_UVDistortion1Panning;UVDistortion1Panning;10;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;473;-4928,-5584;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;474;-4928,-5488;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;68;-5344,-5312;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;469;-4688,-4720;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;470;-4688,-4624;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;501;-4832,-4928;Inherit;False;UV.xy + UV.yx * Shear.xy;2;Create;2;True;UV;FLOAT2;0,0;In;;Inherit;False;True;Shear;FLOAT2;0,0;In;;Inherit;False;My Custom Expression;True;False;0;;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CustomExpressionNode;508;-4464,-3808;Inherit;False;UV.xy + UV.yx * Shear.xy;2;Create;2;True;UV;FLOAT2;0,0;In;;Inherit;False;True;Shear;FLOAT2;0,0;In;;Inherit;False;My Custom Expression;True;False;0;;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;479;-4464,-3376;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;478;-4464,-3472;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;72;-5312,-3584;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;291;-10000,-1760;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;394;-10096,-2016;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;393;-10096,-2128;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;395;-10096,-1152;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;396;-10096,-1008;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;305;-9856,-832;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;555;-9968,-1600;Inherit;False;Property;_UVDistortion1Tiling;UVDistortion1Tiling;99;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;556;-9936,-656;Inherit;False;Property;_UVDistortion2Tiling;UVDistortion2Tiling;100;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.DynamicAppendNode;472;-4656,-5552;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;64;-4784,-5392;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;468;-4416,-4688;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;415;-4528,-4928;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;436;-4208,-3792;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;477;-4192,-3440;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;86;-9952,-2144;Inherit;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;301;-9872,-1152;Inherit;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;14;-4832,-4096;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.1,0.3;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;302;-9664,-880;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;54;-9760,-1808;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;471;-4512,-5424;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;467;-4208,-4928;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;480;-3936,-3792;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;53;-9536,-2144;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;293;-9376,-1792;Inherit;False;Property;_GenerateNoise1Strength;GenerateNoise1 Strength;63;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;306;-9360,-1072;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;286;-4592,-4096;Inherit;False;Noise2UV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;285;-4352,-5424;Inherit;False;Noise1UV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;423;-4048,-4928;Inherit;False;PolarNoise1UV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;313;-9344,-704;Inherit;False;Property;_GenerateNoise2Strength;GenerateNoise2 Strength;64;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;437;-3760,-3792;Inherit;False;PolarNoise2UV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;434;-8560,-2256;Inherit;False;423;PolarNoise1UV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;229;-9088,-2160;Inherit;True;Property;_UVDistortionMap;_UVDistortionMap;41;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;294;-8528,-2352;Inherit;False;285;Noise1UV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;308;-9040,-800;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;307;-9056,-1008;Inherit;True;Property;_UVDistortion2Map;UV Distortion2 Map;43;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;440;-8528,-1152;Inherit;False;437;PolarNoise2UV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;309;-8512,-1248;Inherit;False;286;Noise2UV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;292;-9040,-1920;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;225;-11500,2338;Inherit;False;6131.545;3259.738;Comment;36;170;338;441;359;561;176;178;174;209;560;210;177;180;175;211;558;179;1042;1041;337;212;214;228;226;227;171;213;401;459;402;403;485;460;461;399;400;Dissolve;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;46;-8416,-1856;Inherit;False;Property;_Distortion1Intensity;Distortion1 Intensity;17;0;Create;True;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;312;-8672,-784;Inherit;False;Property;_Distortion2Intensity;Distortion2 Intensity;16;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;310;-8704,-976;Inherit;False;Property;_useGenerateNoise2;useGenerateNoise2;52;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;439;-8224,-1168;Inherit;False;Property;_Keyword3;Keyword 3;79;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;409;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;435;-8272,-2288;Inherit;False;Property;_Keyword2;Keyword 2;78;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;404;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;295;-8544,-2160;Inherit;False;Property;_useGenerateNoise1;useGenerateNoise1;67;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;228;-11340,3474;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;226;-11340,3378;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;459;-11020,3714;Inherit;False;456;randomIntesity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;403;-11036,4114;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;485;-11036,4226;Inherit;False;482;randomIntensityY;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;402;-11020,3810;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;317;-10496,-352;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;318;-10496,-144;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;486;-10496,-448;Inherit;False;456;randomIntesity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;489;-10496,-48;Inherit;False;482;randomIntensityY;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;140;-8016,-2080;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;311;-7984,-992;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;227;-11068,3410;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;460;-10684,4066;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;461;-10748,3794;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;214;-11004,3938;Inherit;False;Property;_DissolvePanning;DissolvePanning;37;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;320;-10192,64;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;321;-10496,-272;Inherit;False;Property;_UVDistortionDPanning;UVDistortionDPanning;12;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;488;-10256,-160;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;487;-10256,-384;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;319;-10192,-32;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;315;-7584,-1024;Inherit;False;Property;_isUVDistortion2;is UV Distortion2;6;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;60;-7696,-2096;Inherit;False;Property;_isUVDistortion1;is UV Distortion1;9;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;462;-10892,3410;Inherit;False;Property;_Keyword4;Keyword 4;81;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;446;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;212;-10908,3218;Inherit;False;Property;_DissolveTiling;Dissolve Tiling;34;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleAddOpNode;399;-10556,3794;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;400;-10556,3922;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;324;-9904,-32;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;397;-10096,-352;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;398;-10096,-224;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;557;-9936,160;Inherit;False;Property;_UVDistortionDTiling;UVDistortionDTiling;98;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RegisterLocalVarNode;287;-7360,-2096;Inherit;False;UV Distortion1;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;314;-7264,-1024;Inherit;False;UV Distortion2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;171;-10572,3282;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;401;-10412,3794;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;325;-9872,-352;Inherit;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;326;-9664,-80;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VirtualTextureObject;408;-3392,-6048;Inherit;True;Property;_Noise1;Noise1;4;0;Create;True;0;0;0;False;0;False;-1;None;None;False;white;Auto;Unity5;0;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode;288;-3376,-5776;Inherit;False;287;UV Distortion1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.VirtualTextureObject;412;-3312,-4240;Inherit;True;Property;_Noise2;Noise2;0;0;Create;True;0;0;0;False;0;False;-1;None;None;False;white;Auto;Unity5;0;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode;316;-3376,-3920;Inherit;False;314;UV Distortion2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.PannerNode;213;-10236,3218;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;327;-9360,-272;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;328;-9344,96;Inherit;False;Property;_GenerateNoiseDStrength;GenerateNoiseD Strength;66;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;405;-3056,-5872;Inherit;True;Property;_TextureSample0;Texture Sample 0;63;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode;338;-9996,3042;Inherit;False;DissolveUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CustomExpressionNode;407;-3038.107,-5616;Inherit;False;float2 dx = ddx(Inuv), dy = ddy(Inuv)@$dx = frac(dx + 0.5) - 0.5@$dy = frac(dy + 0.5) - 0.5@$float4 c = tex2Dgrad(InTex, Inuv, dx, dy)@$$return c@;4;Create;2;True;Inuv;FLOAT2;0,0;In;;Inherit;False;True;InTex;SAMPLER2D;;In;;Inherit;False;My Custom Expression;True;False;0;;False;2;0;FLOAT2;0,0;False;1;SAMPLER2D;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode;413;-2960,-4016;Inherit;True;Property;_TextureSample1;Texture Sample 0;63;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.CustomExpressionNode;411;-2912,-3744;Inherit;False;float2 dx = ddx(Inuv), dy = ddy(Inuv)@$dx = frac(dx + 0.5) - 0.5@$dy = frac(dy + 0.5) - 0.5@$float4 c = tex2Dgrad(InTex, Inuv, dx, dy)@$$return c@;4;Create;2;True;Inuv;FLOAT2;0,0;In;;Inherit;False;True;InTex;SAMPLER2D;;In;;Inherit;False;My Custom Expression;True;False;0;;False;2;0;FLOAT2;0,0;False;1;SAMPLER2D;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;329;-9040,0;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;330;-9056,-208;Inherit;True;Property;_UVDistortionDMap;UV DistortionD Map;42;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;23;-2096,-4000;Inherit;False;Property;_Noise2Power;Noise2Power;19;0;Create;True;0;0;0;False;0;False;1;-2.07;0;6;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;550;2720,224;Inherit;False;2714.418;849.9965;Comment;12;552;554;632;545;546;544;547;543;542;541;537;636;Fresnel;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;509;-10316,3906;Inherit;False;Property;_DissolveShearX;DissolveShear X;82;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;510;-10316,3986;Inherit;False;Property;_DissolveShearY;DissolveShear Y;87;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;536;-10421.46,3570.081;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;404;-2688,-5872;Inherit;False;Property;_isNoise1Polar;isNoise1Polar;78;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-2208,-5472;Inherit;False;Property;_Noise1Power;Noise1Power;14;0;Create;True;0;0;0;False;0;False;1;3.57;0;6;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;409;-2560,-3776;Inherit;False;Property;_isNoise2Polar;isNoise2Polar;79;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;331;-8560,-368;Inherit;False;338;DissolveUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;333;-8704,-176;Inherit;False;Property;_useGenerateNoiseD;useGenerateNoiseD;55;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;332;-8672,16;Inherit;False;Property;_DistortionDIntensity;DistortionD Intensity;15;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1171;-10528,272;Inherit;False;456;randomIntesity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1169;-10528,368;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1170;-10528,576;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1172;-10528,672;Inherit;False;482;randomIntensityY;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;80;-1888,-4256;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;334;-8288,-208;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;511;-9996,3906;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;442;-10156,3602;Inherit;False;Polar Coordinates;-1;;7;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;1;False;3;FLOAT2;0;FLOAT;55;FLOAT;56
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;537;3002.048,475.5349;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PowerNode;79;-1984,-5648;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;178;-11136,2912;Inherit;False;Property;_StartDissolve;Start Dissolve;30;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;176;-11200,2752;Inherit;False;2;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldNormalVector;636;3006.142,663.3355;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode;340;-513,-6143;Inherit;False;9773.453;4008.118;Comment;101;693;41;128;387;532;158;386;381;688;127;1083;385;696;1084;700;698;126;63;857;703;701;1026;1007;893;860;858;278;702;704;699;277;697;280;592;591;629;626;594;202;201;627;513;514;196;1112;515;625;521;1090;77;197;1089;1095;351;193;548;1113;1094;551;373;1091;1096;1092;553;222;352;375;224;1111;628;374;377;223;1110;621;234;378;231;242;241;616;618;620;619;233;232;27;617;28;1115;1116;1117;1120;1122;1123;1124;1125;1126;1155;1157;1158;Main;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1175;-10288,560;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1176;-10288,336;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;1174;-10528,448;Inherit;False;Property;_UVDistortionMPanning;UVDistortionMPanning;13;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SaturateNode;142;-1728,-4256;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;464;-9708,3794;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;463;-9708,3890;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;512;-9868,3602;Inherit;False;UV.xy + UV.yx * Shear.xy;2;Create;2;True;UV;FLOAT2;0,0;In;;Inherit;False;True;Shear;FLOAT2;0,0;In;;Inherit;False;My Custom Expression;True;False;0;;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DotProductOpNode;541;3306.048,475.5349;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;141;-1776,-5648;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;174;-10880,2384;Inherit;False;Property;_Threshold;Threshold;26;0;Create;True;0;0;0;False;0;False;0.16;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;209;-10752,2896;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.9;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;359;-10877,2775;Inherit;False;#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)$$UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID]@$$return data.agePercent@$$#else$return InAge@$$#endif;1;Create;1;True;InAge;FLOAT;0;In;;Inherit;False;InstancingAgePercent;False;False;0;;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;378;176,-5184;Inherit;False;2;3;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;339;-7936,-208;Inherit;False;Property;_isUVDistortionD;is UV DistortionD;7;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1173;-10224,784;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1177;-10224,688;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1179;-10128,368;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1180;-10128,496;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;1181;-9968,880;Inherit;False;Property;_UVDistortionMTiling;UVDistortionMTiling;97;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RegisterLocalVarNode;18;-1568,-4256;Inherit;True;Noise2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;335;-7584,-208;Inherit;False;UV Distortion D;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;465;-9436,3826;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;443;-9612,3602;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;19;-1584,-5648;Inherit;True;Noise1;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.AbsOpNode;542;3594.232,476.4186;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;560;-10928,2544;Inherit;False;4;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;210;-10576,2416;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;177;-10480,2832;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;377;512,-5072;Inherit;False;#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)$$UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID]@$$return data.custom2XY.y@$$#else$return In0@$#endif;1;Create;1;True;In0;FLOAT;0;In;;Inherit;False;InstancingOffsetY;False;False;0;;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;374;512,-5168;Inherit;False;#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)$$UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID]@$$return data.custom2XY.x@$$#else$return In0@$#endif;1;Create;1;True;In0;FLOAT;0;In;;Inherit;False;InstancingOffsetX;False;False;0;;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1178;-9936,688;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1182;-9904,368;Inherit;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1183;-9696,640;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;28;-454.4488,-5535;Inherit;False;18;Noise2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;617;-454.4488,-5727;Inherit;False;Constant;_Float9;Float 9;97;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;27;-454.4488,-5631;Inherit;False;19;Noise1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;444;-9580,2866;Inherit;True;Property;_DissolveMap;Dissolve Map;80;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleAddOpNode;466;-9324,3554;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;543;3819.142,296.4494;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;180;-10092,2402;Inherit;False;Property;_EdgeWidth;Edge Width;32;0;Create;True;0;0;0;False;0;False;0.03;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;175;-10208,2544;Inherit;False;Property;_isLifetimeDissolve;isLifetimeDissolve;28;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;561;-10624,2624;Inherit;False;#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)$$UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID]@$$return data.customDissolve@$$#else$return In0@$$#endif;1;Create;1;True;In0;FLOAT;0;In;;Inherit;False;InstancingCustomDissolve;False;False;0;;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;337;-9980,3346;Inherit;False;335;UV Distortion D;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;375;768,-5168;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;352;768,-5488;Inherit;False;Property;_MainOffset;Main Offset;74;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.PannerNode;1184;-9392,448;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;232;-454.4488,-5823;Inherit;False;18;Noise2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;233;-454.4488,-5935;Inherit;False;19;Noise1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;619;-169.707,-5735.927;Inherit;False;Property;_useNoise3;useNoise1;114;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;616;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;620;-169.707,-5623.927;Inherit;False;Property;_Keyword0;Keyword 0;115;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;618;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;632;4080.479,439.3693;Inherit;False;Property;_isFresnelInverse;isFresnelInverse;118;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;547;4030.791,738.2327;Inherit;False;Property;_FresnelWidth;Fresnel Width;94;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;581;-864,3296;Inherit;False;4871.049;1943.041;Comment;39;588;603;604;574;587;569;609;611;610;583;605;573;577;606;586;590;584;612;582;589;585;562;576;595;564;601;578;563;600;599;598;580;597;596;1128;1127;1129;1130;1131;Chromatic Caustics;1,1,1,1;0;0
Node;AmplifyShaderEditor.CustomExpressionNode;441;-9084,3458;Inherit;False;float2 dx = ddx(Inuv), dy = ddy(Inuv)@$dx = frac(dx + 0.5) - 0.5@$dy = frac(dy + 0.5) - 0.5@$float4 c = tex2Dgrad(InTex, Inuv, dx, dy)@$$return c@;1;Create;2;True;Inuv;FLOAT2;0,0;In;;Inherit;False;True;InTex;SAMPLER2D;_Sampler1441;In;;Inherit;False;My Custom Expression;True;False;0;;False;2;0;FLOAT2;0,0;False;1;SAMPLER2D;_Sampler1441;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;211;-9788,2402;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;558;-9888,2592;Inherit;False;Property;_isCustomDataDissolve;isCustomDataDissolve;101;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;170;-9132,3058;Inherit;True;Property;_DissolveMap1;Dissolve Map1;21;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.StaticSwitch;373;992,-5424;Inherit;False;Property;_isCustomDataOffset;isCustomDataOffset;76;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1167;-9440,912;Inherit;False;Property;_GenerateNoiseMStrength;GenerateNoiseM Strength;65;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1163;-9248,608;Inherit;False;Property;_DistortionMIntensity;DistortionM Intensity;154;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1160;-9040,384;Inherit;True;Property;_UVDistortionMMap;UV DistortionM Map;153;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.StaticSwitch;618;-169.707,-5863.927;Inherit;False;Property;_useNoise2;useNoise2;115;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;616;-169.707,-5959.927;Inherit;False;Property;_useNoise1;useNoise1;114;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;241;116.9756,-5736.723;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;446;-8748,3090;Inherit;False;Property;_isDissolvePolar;isDissolvePolar;81;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;544;4355.427,443.4014;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;4.98;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;546;4413.027,697.8014;Inherit;False;Property;_FresnelIntensity;FresnelIntensity;95;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;596;-832,3888;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;597;-832,3760;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;179;-9548,2546;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;351;1408,-5664;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NoiseGeneratorNode;1168;-9120,800;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1189;-8912,608;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1162;-8672,384;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;242;287.8925,-5735.028;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;231;159.8942,-5943.307;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StepOpNode;181;-7648,2560;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;545;4675.428,443.4014;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;580;-512,3616;Inherit;False;Property;_CausticsNoiseTiling;CausticsNoise Tiling;104;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.DynamicAppendNode;598;-544,3824;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;890;7787.274,1421.385;Inherit;False;3653.366;1182.889;Comment;29;774;750;756;749;757;764;754;769;765;755;770;763;777;768;775;776;766;771;772;780;779;778;742;745;743;746;748;747;935;Dust Shape;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;281;-4528,1520;Inherit;False;3825.937;1084.366;Comment;32;276;255;256;262;282;283;250;284;251;252;254;253;273;259;275;258;260;261;265;263;264;266;267;268;269;271;270;272;1132;1133;1136;1134;TrailEdgeDissolve;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleTimeNode;1128;-592,4112;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;589;-592,4192;Inherit;False;Property;_VoronoiPanning;Voronoi Panning;110;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RegisterLocalVarNode;1157;1648,-5776;Inherit;False;mainUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1186;-8624,656;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;977;7899.816,5543.709;Inherit;False;4587.314;2501.731;Comment;44;1003;987;960;1002;1001;1000;999;988;986;985;984;983;982;981;980;979;978;957;963;964;959;962;958;952;955;956;953;951;950;954;971;966;969;967;965;961;976;975;973;970;968;1004;1005;1006;Gradient Shape;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;892;7786.699,3501.011;Inherit;False;4704.569;1624.066;Comment;34;914;889;924;925;926;923;887;900;922;921;920;919;883;905;906;902;896;884;904;899;882;881;880;879;885;886;878;877;876;875;946;947;948;949;Glitter Shape;1,1,1,1;0;0
Node;AmplifyShaderEditor.StaticSwitch;234;517.7846,-5942.948;Inherit;False;Property;_isSubtract;isSubtract;44;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;182;-7392,2560;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;184;-7424,2656;Inherit;False;Property;_EdgeColor;Edge Color;33;1;[HDR];Create;True;0;0;0;False;0;False;1,0,0,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TextureCoordinatesNode;563;-240,3600;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;578;-304,3824;Inherit;False;Property;_CausticsNoisePanning;CausticsNoise Panning;103;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMaxOpNode;554;4896.177,442.0472;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;745;7901.274,1997.711;Inherit;False;Constant;_Float8;Float 8;110;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;742;7842.274,1817.711;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;282;-4464,1728;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;283;-4480,1824;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;621;684.2747,-5784.106;Inherit;False;Constant;_Float0;Float 0;98;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;1110;560,-4784;Inherit;False;Property;_MainPolarCenter;MainPolarCenter;147;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;223;576,-5680;Inherit;False;Property;_EmissionIntensity;EmissionIntensity;40;0;Create;True;0;0;0;False;0;False;0;0;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1129;-288,4112;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1130;-288,4224;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;600;-544,4384;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;599;-544,4512;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1159;-7664,256;Inherit;False;1157;mainUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;1166;-7568,448;Inherit;False;Property;_useGenerateNoiseM;useGenerateNoiseM;56;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;950;7917.316,5731.89;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;951;7901.316,5827.89;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;875;7836.699,3568.845;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;183;-7168,2560;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;206;-6960,2688;Inherit;False;Constant;_Float2;Float 2;22;0;Create;True;0;0;0;False;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;552;5187.152,444.5302;Inherit;False;fresnel;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;595;-288,4000;Inherit;False;Property;_CausticsNoiseScale;CausticsNoise Scale;112;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;743;8117.273,1819.711;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;876;7900.699,3735.845;Inherit;False;Constant;_Float12;Float 8;110;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;250;-4464,1584;Inherit;False;Property;_TrailEdgeDissolveTilling;TrailEdge Dissolve Tilling;49;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.DynamicAppendNode;284;-4224,1760;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;628;895.443,-5931.786;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1111;816,-4784;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TFHCRemapNode;224;928,-5680;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;564;48,3600;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1131;-112,4112;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;601;-240,4480;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1134;-4384,2208;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;1161;-7216,416;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;953;8157.316,5763.89;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;952;7965.816,5593.709;Inherit;False;Property;_GradientMaskTilling;Gradient Mask Tilling;48;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleSubtractOpNode;877;8116.697,3557.845;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;208;-6800,2560;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleTimeNode;576;592,3376;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;585;560,3488;Inherit;False;Property;_VoronoiAngleSpeed;Voronoi Angle Speed;107;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;582;272,4192;Inherit;False;Property;_CausticsNoiseIntensity;CausticsNoise Intensity;105;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;748;8316.433,1919.496;Inherit;False;Constant;_Float10;Float 10;110;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;746;8329.034,1822.896;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;251;-3984,1584;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;252;-4000,1744;Inherit;False;Property;_TrailEdgeDissolveScroll;TrailEdge Dissolve Scroll;51;0;Create;True;0;0;0;False;0;False;-1,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;222;1191.659,-5920.611;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;553;1117.411,-6092.766;Inherit;False;552;fresnel;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1092;1072,-4608;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1096;1072,-4704;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1091;1088,-5008;Inherit;True;Polar Coordinates;-1;;8;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;1;False;3;FLOAT2;0;FLOAT;55;FLOAT;56
Node;AmplifyShaderEditor.SimpleAddOpNode;1127;48,4256;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CustomExpressionNode;612;304,3600;Inherit;False; ;1;File;2;True;UV;FLOAT2;0,0;In;;Inherit;False;True;Scale;FLOAT;0;In;;Inherit;False;UnityTiledGradientNoise;False;False;0;a839f3563020d86428878e0d6db33d75;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1136;-4144,2224;Inherit;False;Property;_ToggleXY;ToggleXY;152;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1150;-12800,6976;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1151;-12800,7088;Inherit;False;482;randomIntensityY;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1149;-12784,6576;Inherit;False;456;randomIntesity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1152;-12784,6672;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1164;-7056,256;Inherit;False;Property;_isUVDistortionM;is UV DistortionM;8;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;954;8331.601,5569.483;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;955;8356.084,5745.95;Inherit;False;Property;_GradientMaskPanning;Gradient Mask Panning;50;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.AbsOpNode;878;8357.455,3564.029;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;886;8360.403,3663.011;Inherit;False;Constant;_Float14;Float 14;116;0;Create;True;0;0;0;False;0;False;2.16;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;187;-6512,2560;Inherit;False;dissolveEdge;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;584;912,3376;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;586;848,3984;Inherit;False;Property;_ChromaticAberration;Chromatic Aberration;108;0;Create;True;0;0;0;False;0;False;0.1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;606;608,3600;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;747;8514.036,1823.296;Inherit;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;254;-3696,1584;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;551;1373.411,-6092.766;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;1094;1344,-4672;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1113;1536,-5008;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;562;192,3872;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1133;-3824,2240;Inherit;False;TrailEdgeUV;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1137;-12784,6464;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1138;-12784,6368;Inherit;False;100;randomOffset1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1143;-12448,6928;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1144;-12512,6656;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;1145;-12768,6800;Inherit;False;Property;_AlphaFadePanning;AlphaFadePanning;36;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RegisterLocalVarNode;1165;-6672,256;Inherit;False;DistortedMainUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;956;8625.167,5572.37;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1001;8975.126,7280.483;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;885;8542.404,3551.011;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;879;8525.848,3732.725;Inherit;False;Constant;_Float13;Float 10;110;0;Create;True;0;0;0;False;0;False;0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;577;1296,3968;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;573;1216,3376;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;605;816,3584;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;583;864,3856;Inherit;False;Property;_VoronoiScale;Voronoi Scale;106;0;Create;True;0;0;0;False;0;False;5.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;750;8761.013,1822.543;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;756;8653.58,2044.983;Inherit;False;Property;_Size;Size;130;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;273;-3472,1584;Inherit;True;Property;_TrailEdgeDissolveMap;TrailEdge Dissolve Map;47;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;255;-3376,1792;Inherit;False;Property;_TrailEdgeDissolveNoisePower;TrailEdge Dissolve Noise Power;53;0;Create;True;0;0;0;False;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;256;-3264,2112;Inherit;False;Property;_TrailEdgeDissolveThreshold;TrailEdge Dissolve Threshold;57;0;Create;True;0;0;0;False;0;False;0;0.83;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;548;1528.107,-5916.168;Inherit;False;Property;_useFresnel;use Fresnel;96;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;193;1578.537,-6070.904;Inherit;False;187;dissolveEdge;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;957;8965.436,6209.849;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;1095;1744,-5008;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1132;-3440,1920;Inherit;False;1133;TrailEdgeUV;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1139;-12512,6400;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1147;-12320,6784;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;1140;-12576,6208;Inherit;False;Property;_AlphaFadeTiling;AlphaFade Tiling;35;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleAddOpNode;1146;-12320,6656;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VirtualTextureObject;1089;1680,-5376;Inherit;True;Property;_Mask;Mask;1;0;Create;True;0;0;0;False;0;False;-1;None;None;False;white;Auto;Unity5;0;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode;1158;1792,-5616;Inherit;False;1165;DistortedMainUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;1000;9294.957,7119.516;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;958;8891.516,5585.911;Inherit;True;Property;_GradientNoiseMap;Gradient Noise Map;46;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;959;8893.811,5804.91;Inherit;False;Property;_MaskNoisePower;Mask Noise Power;54;0;Create;True;0;0;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1055;-11580.97,6206.73;Inherit;False;3035.069;1659.411;Comment;23;1049;1027;1014;1029;1044;1050;1028;1046;1017;1031;1032;1051;1019;1043;1052;1034;1045;1036;1022;1024;1054;1053;1025;Alpha Fade;1,1,1,1;0;0
Node;AmplifyShaderEditor.PowerNode;880;8707.258,3555.729;Inherit;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CustomExpressionNode;610;1584,3792;Inherit;False; ;3;File;3;True;UV;FLOAT2;0,0;In;;Inherit;False;True;AngleOffset;FLOAT;0;In;;Inherit;False;True;CellDensity;FLOAT;0;In;;Inherit;False;UnityTiledVoronoi;False;False;0;3ee02382461c6674fa861a8f40144e08;False;3;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;611;1584,3632;Inherit;False; ;3;File;3;True;UV;FLOAT2;0,0;In;;Inherit;False;True;AngleOffset;FLOAT;0;In;;Inherit;False;True;CellDensity;FLOAT;0;In;;Inherit;False;UnityTiledVoronoi;False;False;0;3ee02382461c6674fa861a8f40144e08;False;3;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;609;1584,3952;Inherit;False; ;3;File;3;True;UV;FLOAT2;0,0;In;;Inherit;False;True;AngleOffset;FLOAT;0;In;;Inherit;False;True;CellDensity;FLOAT;0;In;;Inherit;False;UnityTiledVoronoi;False;False;0;3ee02382461c6674fa861a8f40144e08;False;3;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;749;8927.015,1828.543;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;757;8996.993,2045.884;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;100;False;4;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;904;8489.073,4588.966;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;899;8470.429,4095.168;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;259;-2896,2080;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;275;-2992,1584;Inherit;True;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;258;-3136,1920;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;963;9295.734,5957.66;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;960;9156.725,6457.813;Inherit;False;Property;_HorizontalBorder;Horizontal Border;58;0;Create;True;0;0;0;False;0;False;3;0.83;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1002;8992.306,7673.884;Inherit;False;Property;_VerticalBorder;Vertical Border;59;0;Create;True;0;0;0;False;0;False;3;0.83;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;197;1882.537,-6070.904;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CustomExpressionNode;1090;2144,-5328;Inherit;False;float2 dx = ddx(Inuv), dy = ddy(Inuv)@$dx = frac(dx + 0.5) - 0.5@$dy = frac(dy + 0.5) - 0.5@$float4 c = tex2Dgrad(InTex, Inuv, dx, dy)@$$return c@;4;Create;2;True;Inuv;FLOAT2;0,0;In;;Inherit;False;True;InTex;SAMPLER2D;;In;;Inherit;False;My Custom Expression;True;False;0;;False;2;0;FLOAT2;0,0;False;1;SAMPLER2D;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Vector2Node;521;1792,-4498;Inherit;False;Property;_SecondOffset;SecondOffset;92;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;1141;-12240,6272;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1148;-12176,6656;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;77;2088.521,-5602.797;Inherit;True;Property;_MaskMain;MaskMain;5;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.CommentaryNode;1079;3887.279,1256.517;Inherit;False;2912.334;749.7571;Comment;15;1088;1087;1085;1086;1082;1080;1081;1074;1077;1076;1078;1075;1070;1071;1069;MatCap;1,1,1,1;0;0
Node;AmplifyShaderEditor.PowerNode;962;9268.214,5592.109;Inherit;True;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;983;9529.256,7594.904;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;999;9478.173,6945.702;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;881;8952.527,3557.146;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;569;2416,3488;Inherit;True;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;891;7803.529,2812.618;Inherit;False;2433.027;577.8418;Comment;10;853;862;861;854;810;807;806;927;805;804;Ring Shape;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;754;9208.993,1822.884;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;9.38;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;764;9215.567,2242.411;Inherit;False;Property;_CenterSize;Center Size;129;0;Create;True;0;0;0;False;0;False;0.94;15.85;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;905;8713.689,4099.542;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.19;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;896;8700.479,3862.56;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.19;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;902;8720.8,4345.706;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.19;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;906;8728.124,4590.384;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.19;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;260;-2896,1856;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;261;-2608,1888;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;262;-2464.002,1920;Inherit;False;Property;_TrailEdgeDissolveLength;TrailEdge Dissolve Length;62;0;Create;True;0;0;0;False;0;False;0;0.32;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;961;9530.033,6433.048;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;964;9531.934,5956.352;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1042;-10630.67,2737.479;Inherit;False;InstancedAgePercent;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1049;-11196.09,6451.049;Inherit;False;Property;_AFNoiseStrength;AFNoiseStrength;141;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1027;-11496.62,7659.141;Inherit;False;Property;_StartAlphaFade;Start Alpha Fade;31;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;625;2105.12,-5908.875;Inherit;False;Property;_useDissolve;useDissolve;116;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;515;2032,-4548;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;1112;2384,-5600;Inherit;False;Property;_isMainPolar;isMainPolar;148;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;587;2352,3792;Inherit;False;Property;_VoronoiPower;VoronoiPower;109;0;Create;True;0;0;0;False;0;False;1;0;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;1142;-11904,6208;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewMatrixNode;1069;3998.211,1372.017;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.WorldNormalVector;1071;3937.279,1453.185;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;984;9817.256,7402.904;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;978;9736.172,6753.165;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;882;9121.526,3561.146;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;173;-7552,2944;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;574;2736,3488;Inherit;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;604;2752,3760;Inherit;False;Property;_VoronoiIntensity;Voronoi Intensity;113;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;765;9523.271,2241.083;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;200;False;4;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;755;9451.993,1830.884;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;769;9236.269,1616.66;Inherit;False;Property;_OutsideSize;Outside Size;131;0;Create;True;0;0;0;False;0;False;1;15.85;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;949;8919.322,4595.591;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;948;8917.554,4347.275;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;946;8919.775,4103.525;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;947;8931.012,3865.655;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;265;-2224,2112;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;263;-2592,1584;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;264;-2176,1920;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;968;9837.807,5593.709;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;965;9818.033,6241.048;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;1014;-10881.42,6256.73;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;6.59;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1029;-11115.24,7657.141;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.9;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1044;-11201.48,7486.041;Inherit;False;1042;InstancedAgePercent;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1050;-10858.13,6510.93;Inherit;False;Property;_AFNoisePower;AFNoisePower;142;0;Create;True;0;0;0;False;0;False;0;0;0;6;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1028;-11244.25,7145.14;Inherit;False;Property;_AlphaFadeThreshold;AlphaFadeThreshold;27;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;966;9952.242,5932.496;Inherit;False;Property;_HorizontalLength;Horizontal Length;61;0;Create;True;0;0;0;False;0;False;1;0.32;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;987;9951.465,7094.352;Inherit;False;Property;_VerticalLength;Vertical Length;60;0;Create;True;0;0;0;False;0;False;1;0.32;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;804;7853.529,2991.154;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1046;-10852.87,6616.733;Inherit;True;Property;_AlphaFadeMap;Alpha Fade Map;140;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;196;2504.369,-5908.81;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;514;2288,-4564;Inherit;True;Property;_SecondMask;SecondMask;88;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1070;4224.279,1370.185;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;985;10201.25,7626.904;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;986;10240.46,7094.352;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;2;False;4;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;979;10030.07,6750.953;Inherit;True;2;0;COLOR;0.74,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;884;9384.098,3566.105;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1.99;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;186;-7120,2944;Inherit;False;dissolve;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;603;3072,3488;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;770;9545.394,1615.332;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;50;False;4;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;763;9781.257,2219.939;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;777;9730.255,2491.275;Inherit;False;Property;_CenterStrength;Center Strength;133;0;Create;True;0;0;0;False;0;False;1.31;5.52;0.1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;774;9630.208,1471.385;Inherit;False;Property;_OutsideStrength;Outside Strength;132;0;Create;True;0;0;0;False;0;False;1;1;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;919;9158.143,3866.171;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;0.81;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;920;9167.325,4103.905;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;0.81;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;921;9172.756,4347.93;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;0.81;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;922;9175.854,4595.78;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;0.81;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;266;-2208,1584;Inherit;True;2;0;COLOR;0.74,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;267;-1904,1936;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;268;-1888,1856;Inherit;False;Constant;_Float3;Float 0;17;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;970;10221.81,5593.709;Inherit;True;2;0;COLOR;0.74,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;967;10202.03,6465.048;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1041;-10342.67,2694.479;Inherit;False;InstancedCustomDissolve;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;1017;-10559.05,6257.648;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;3.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1031;-10939.24,7177.14;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1032;-10843.24,7593.141;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;969;10241.24,5932.496;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;2;False;4;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;805;8234.662,2984.597;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;927;8201.648,3247.556;Inherit;False;Property;_CircleWidth;CircleWidth;138;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;1051;-10466.99,6595.166;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;513;2747.18,-5732.514;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;1075;4428.884,1372.047;Inherit;False;True;True;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1078;4547.006,1306.517;Inherit;False;Constant;_Float17;Float 17;138;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;980;10477.03,6771.566;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;988;10474.96,7070.221;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;883;9591.098,3569.105;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;588;3296,3488;Inherit;False;CACaustics;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;768;9777.032,1825.767;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;775;9910.507,1621.984;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;776;10055.49,2226.274;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;900;9534.664,3907.242;Inherit;True;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;269;-1952,1600;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;271;-1680,1872;Inherit;False;Property;_isBothDissolve;isBothDissolve;23;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;973;10477.81,5609.709;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;971;10475.74,5908.365;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1019;-10297.5,6258.67;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1043;-10651.89,7521.754;Inherit;False;1041;InstancedCustomDissolve;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1034;-10571.24,7305.14;Inherit;False;Property;_isLifetimeAlphaFade;isLifetimeAlphaFade;29;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;806;8541.617,2984.746;Inherit;True;2;0;FLOAT;0.45;False;1;FLOAT;0.45;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;930;8578.686,3246.777;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1052;-10254.91,6561.051;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;627;2918.74,-5915.825;Inherit;False;Property;_useSecondMask;useSecondMask;117;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;201;2902.665,-6075.199;Inherit;False;186;dissolve;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1076;4700.679,1400.087;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SmoothstepOpNode;887;9827.923,3589.479;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;-0.4;False;2;FLOAT;0.18;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;766;10245.63,2224.844;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.33;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;771;10258.42,1829.307;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0.06;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;923;9854.275,3906.715;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;0.57;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;270;-1456,1584;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;975;10973.81,5593.709;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1045;-9933.048,6464.097;Inherit;False;Property;_useGeneNoise4AF;useGeneNoise4AF;139;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1036;-10251.24,7353.141;Inherit;False;Property;_isCustomDataAlphaFade;isCustomDataAlphaFade;102;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;981;10973.03,6755.566;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;928;8856.458,3244.656;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-23;False;4;FLOAT;-100;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;807;8784.043,2982.092;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;202;3229.356,-5996.654;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;594;3328.52,-6089.585;Inherit;False;588;CACaustics;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1077;4922.263,1339.024;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;914;10385.4,3594.891;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;772;10547.42,1843.995;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;272;-1168,1584;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;976;11261.81,5593.709;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;982;11261.03,6755.566;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;810;9058.977,2977.55;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1.18;False;4;FLOAT;-32.64;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1022;-9622.78,6615.77;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;1.02;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;626;3422.045,-5882.449;Inherit;False;Property;_Keyword1;Keyword 1;116;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;625;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;629;3562.718,-6091.458;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode;1074;5093.959,1367.322;Inherit;True;Property;_MatCapTex;MatCapTex;144;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;1086;5074.443,1598.931;Inherit;False;Property;_matcapIntensity;matcapIntensity;146;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;276;-896,1584;Inherit;False;EdgeDissolve;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;780;10663.21,1786.453;Inherit;False;Constant;_Float7;Float 7;115;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;935;10766.27,1859.011;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;926;10664.95,3596.891;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;8;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1003;11498.83,6417.515;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;925;11255.58,3531.738;Inherit;False;Constant;_Float15;Float 15;117;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1004;11594.53,6310.72;Inherit;False;Constant;_Float16;Float 15;117;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1054;-9350.123,6521.32;Inherit;False;Constant;_Float5;Float 5;137;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;854;9403.457,3005.921;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;861;9408.176,2862.618;Inherit;False;Constant;_Float11;Float 7;115;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1024;-9358.29,6617.174;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;591;3740.388,-6024.791;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1123;3872,-5040;Inherit;False;Constant;_Float19;Float 19;144;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1120;3824,-4768;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1085;5409.102,1365.844;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;779;10928.89,1791.164;Inherit;False;Property;_useDust;useDust;134;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;924;11468.74,3549.589;Inherit;False;Property;_useGlitter;useGlitter;137;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1005;11807.69,6328.571;Inherit;False;Property;_useGradientMask;useGradientMask;136;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1053;-9134.123,6594.32;Inherit;False;Property;_useAlphaFade;useAlphaFade;143;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;862;9619.176,2899.618;Inherit;False;Property;_useCircle;useCircle;135;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;592;3941.74,-5892.962;Inherit;False;Property;_useCACaustics;useCACaustics;111;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;280;3918.206,-6054.726;Inherit;False;276;EdgeDissolve;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1122;4176,-4976;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1125;4240,-4720;Inherit;False;Property;_TestFloat;TestFloat;151;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;715;180.5303,1496.31;Inherit;False;3301.464;1176.99;Comment;18;709;713;714;719;710;716;711;708;717;720;705;722;724;721;731;723;734;732;Vertex Offset;1,1,1,1;0;0
Node;AmplifyShaderEditor.SaturateNode;1087;5659.371,1363.217;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;778;11198.64,1893.87;Inherit;False;Dust;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;889;11804.55,3584.488;Inherit;False;Glitter;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1006;12207.49,6326.95;Inherit;False;GradientMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1025;-8787.895,6597.177;Inherit;False;AlphaFade;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;853;9911.799,2999.241;Inherit;False;Ring;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;277;4206.208,-6054.726;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1124;4480,-4960;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;732;443.0872,1903.865;Inherit;False;101;randomOffset2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1081;5246.978,1286.081;Inherit;False;Constant;_Float18;Float 18;139;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1088;5846.504,1393.946;Inherit;True;3;0;COLOR;1,1,1,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;697;6480,-5312;Inherit;False;Property;_SecondColor;SecondColor;120;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.StaticSwitch;278;4375.272,-5890.858;Inherit;False;Property;_isTrailEdgeDissolve;isTrailEdgeDissolve;45;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;858;4382.999,-5666.472;Inherit;False;853;Ring;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;860;4379.6,-5572.823;Inherit;False;778;Dust;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;893;4381.092,-5487.2;Inherit;False;889;Glitter;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1007;4353.426,-5406.459;Inherit;False;1006;GradientMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1026;4389.09,-5324.529;Inherit;False;1025;AlphaFade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1126;4672,-5040;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;734;711.6765,1844.906;Inherit;False;2;2;0;FLOAT;0.2;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;528;736,222;Inherit;False;1608.401;643.5182;Comment;1;523;Camera Fade;1,1,1,1;0;0
Node;AmplifyShaderEditor.StaticSwitch;1080;6131.6,1319.509;Inherit;False;Property;_useMatCap;useMatCap;145;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RGBToHSVNode;699;6704,-5312;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;704;6624,-5104;Inherit;False;Property;_Saturation;Saturation;122;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;702;6592,-5408;Inherit;False;Property;_Hue;Hue;121;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;857;4706.639,-5841.479;Inherit;False;6;6;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;5;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;1115;5168,-5344;Inherit;True;Property;_GradientMap;Gradient Map;149;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;1116;5232,-5600;Inherit;False;Property;_GradientColor;Gradient Color;150;0;Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;63;4732.534,-6069.166;Inherit;False;Property;_MainColor;Main Color;5;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;14.57592,0,0,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;162;-784,416;Inherit;False;Property;_SoftParticle;Soft Particle;24;0;Create;True;0;0;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceCameraPos;522;786,272;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector2Node;723;783.0096,1683.717;Inherit;False;Property;_VertexNoiseTiling;VertexNoiseTiling;128;0;Create;True;0;0;0;False;0;False;1,1;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.DynamicAppendNode;731;850.0616,1877.278;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldPosInputsNode;523;834,480;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;1082;6339.857,1314.079;Inherit;False;MatCap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;701;6960,-5376;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;703;6960,-5184;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;693;5056,-5856;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1117;5520,-5520;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DepthFade;166;-480,400;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;526;1170,352;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;524;1186,512;Inherit;False;Property;_FadeStart;Fade Start;2;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;525;1186,608;Inherit;False;Property;_FadeEnd;Fade End;3;0;Create;True;0;0;0;False;0;False;3;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;721;1098.928,1656.69;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;724;1122.225,1809.175;Inherit;False;Property;_VertexNoisePanning;VertexNoisePanning;127;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.VertexColorNode;126;7216,-5744;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.HSVToRGBNode;700;7232,-5328;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;698;7152,-5520;Inherit;False;Property;_SecondColorThreshold;SecondColorThreshold;119;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1084;7184,-6048;Inherit;False;1082;MatCap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1119;5831.124,-5841.912;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;167;-192,400;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;527;1522,368;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;163;-304,304;Inherit;False;Constant;_Float1;Float 1;15;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;530;1536,288;Inherit;False;Constant;_Float6;Float 1;15;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;722;1367.215,1656.083;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;385;7536,-6160;Inherit;False;2;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;696;7552,-5760;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1083;7440,-5888;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;150;-32,352;Inherit;False;Property;_isSoftParticle;isSoftParticle;25;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;529;1776,352;Inherit;False;Property;_isCameraFade;isCameraFade;93;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;663;2835.11,-1669.926;Inherit;False;1588.992;969.8273;Comment;8;660;664;689;690;694;695;1153;1156;Alpha for AlphaBlend;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;705;1583.628,1655.099;Inherit;True;Property;_VertexNoiseTex;VertexNoiseTex;123;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;127;7872,-5888;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CustomExpressionNode;381;7840,-6064;Inherit;False;#if defined(UNITY_PARTICLE_INSTANCING_ENABLED)$$UNITY_PARTICLE_INSTANCE_DATA data = unity_ParticleInstanceData[unity_InstanceID]@$$return data.intensity@$$#else$return In0@$#endif;1;Create;1;True;In0;FLOAT;0;In;;Inherit;False;InstancingIntensity;False;False;0;;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;688;4976,-5584;Inherit;False;MaskAlpha;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;157;320,336;Inherit;False;SoftParticle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;531;2096,352;Inherit;False;cameraFade;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;717;1755.561,1851.656;Inherit;False;Property;_VertexBorder;VertexBorder;126;0;Create;True;0;0;0;False;0;False;-0.5;-0.5;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;708;1892.596,1679.5;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;386;8064,-5984;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;689;2915.713,-1536.083;Inherit;False;688;MaskAlpha;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1155;5056,-6032;Inherit;False;Main Color Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;690;3139.335,-1535.61;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;711;2065.813,1579.261;Inherit;False;Property;_VertexIntensity;Vertex Intensity;124;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;716;2097.056,1676.197;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;158;8464,-5552;Inherit;False;157;SoftParticle;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;532;8464,-5456;Inherit;False;531;cameraFade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;387;8448,-5936;Inherit;False;Property;_isCustomIntensity;isCustomIntensity;77;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;694;2912,-1376;Inherit;False;157;SoftParticle;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;695;2912,-1280;Inherit;False;531;cameraFade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;1153;2912,-1184;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1156;2880,-1008;Inherit;False;1155;Main Color Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;-368,736;Inherit;False;Property;_isFirst;isFirst;75;1;[HideInInspector];Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;660;3465.756,-1528.253;Inherit;False;5;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;710;2292.977,1653.296;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;720;2284.645,1847.255;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;128;8816,-5936;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;354;-208,736;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;719;2574.953,1650.053;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;714;2728.675,1584.405;Inherit;False;Constant;_Float4;Float 4;107;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;41;9040,-5920;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;664;3720.386,-1540.245;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;356;0,736;Inherit;False;isFirst;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;42;-330.5645,-190.7778;Inherit;False;41;Emission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;692;-216.845,-23.97266;Inherit;False;664;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;713;2901.67,1661.302;Inherit;False;Property;_useVertexOffset;useVertexOffset;125;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;677;184.4711,-185.1903;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;358;96.85946,94.19144;Inherit;False;356;isFirst;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;709;3230.722,1662.689;Inherit;False;vertex offset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;341;-784,736;Inherit;False;Property;_Cull;Cull;68;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;344;-784,816;Inherit;False;Property;_SrcBlend;SrcBlend;69;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;345;-784,896;Inherit;False;Property;_DstBlend;DstBlend;70;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;350;-608,896;Inherit;False;Property;_Blending;Blending;73;1;[Enum];Create;True;0;2;Additive;0;Alpha Blend;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;346;-608,736;Inherit;False;Property;_ZWrite;ZWrite;71;1;[Toggle];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;516;-368,816;Inherit;False;Property;_Comp;Comp;90;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;347;-608,816;Inherit;False;Property;_ZTest;ZTest;72;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;517;-368,976;Inherit;False;Property;_Pass;Pass;89;1;[Enum];Create;True;0;1;Pass;0;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;520;-368,896;Inherit;False;Property;_Ref;Ref;91;1;[Enum];Create;True;0;1;Ref;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;357;432,0;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;712;335.7974,141.2381;Inherit;False;709;vertex offset;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PannerNode;590;544,4048;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;253;-3728,1920;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;200;694,-1;Float;False;True;-1;2;KumaEffectShaderGUI;100;5;Kuma/KumaEffect;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;True;4;1;True;_SrcBlend;1;True;_DstBlend;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;2;True;_Cull;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;True;True;True;0;True;_Ref;255;False;;255;False;;0;True;_Comp;0;True;_Pass;0;False;;0;False;;0;False;_Comp;0;False;;0;False;;0;False;;True;True;2;True;_ZWrite;True;3;True;_ZTest;True;True;0;False;;0;False;;True;2;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;6;Include;;False;;Native;False;0;0;;Pragma;instancing_options procedural:vertInstancingSetup;False;;Custom;False;0;0;;Define;UNITY_PARTICLE_INSTANCE_DATA MyParticleInstanceData;False;;Custom;False;0;0;;Define;UNITY_PARTICLE_INSTANCE_DATA_NO_ANIM_FRAME;False;;Custom;False;0;0;;Custom;struct MyParticleInstanceData { float3x4 transform@ uint color@ float2 stableRandomXY@ float4	customXYZW@	 float agePercent@ float2 custom2XY@ float intensity@ float customDissolve@ 	}@;False;;Custom;False;0;0;;Include;UnityStandardParticleInstancing.cginc;False;;Custom;False;0;0;;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
Node;AmplifyShaderEditor.CommentaryNode;168;-832,256;Inherit;False;1389.802;280.2186;Comment;0;Soft Particle;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;342;-816,672;Inherit;False;1092.085;368.3826;Comment;0;Enum;1,1,1,1;0;0
WireConnection;361;0;97;3
WireConnection;630;0;361;0
WireConnection;630;1;613;0
WireConnection;364;0;97;4
WireConnection;100;0;630;0
WireConnection;101;0;364;0
WireConnection;456;0;115;0
WireConnection;482;0;481;0
WireConnection;219;0;216;0
WireConnection;219;1;217;0
WireConnection;119;0;120;0
WireConnection;119;1;121;0
WireConnection;476;1;219;0
WireConnection;475;1;119;0
WireConnection;220;0;221;0
WireConnection;220;1;476;0
WireConnection;534;0;221;0
WireConnection;452;0;111;0
WireConnection;452;1;484;0
WireConnection;453;0;110;0
WireConnection;453;1;458;0
WireConnection;39;0;215;0
WireConnection;39;1;475;0
WireConnection;455;0;483;0
WireConnection;455;1;104;0
WireConnection;454;0;457;0
WireConnection;454;1;103;0
WireConnection;535;0;215;0
WireConnection;506;0;505;0
WireConnection;506;1;507;0
WireConnection;389;0;453;0
WireConnection;389;1;133;1
WireConnection;390;0;133;2
WireConnection;390;1;452;0
WireConnection;406;1;39;0
WireConnection;406;2;535;0
WireConnection;504;0;502;0
WireConnection;504;1;503;0
WireConnection;410;1;220;0
WireConnection;410;2;534;0
WireConnection;391;0;454;0
WireConnection;391;1;134;1
WireConnection;392;0;134;2
WireConnection;392;1;455;0
WireConnection;494;0;496;0
WireConnection;494;1;122;0
WireConnection;495;0;123;0
WireConnection;495;1;497;0
WireConnection;490;0;493;0
WireConnection;490;1;296;0
WireConnection;491;0;298;0
WireConnection;491;1;492;0
WireConnection;68;0;389;0
WireConnection;68;1;390;0
WireConnection;501;0;406;0
WireConnection;501;1;504;0
WireConnection;508;0;410;0
WireConnection;508;1;506;0
WireConnection;72;0;391;0
WireConnection;72;1;392;0
WireConnection;291;0;289;0
WireConnection;291;1;290;0
WireConnection;394;0;135;2
WireConnection;394;1;495;0
WireConnection;393;0;494;0
WireConnection;393;1;135;1
WireConnection;395;0;490;0
WireConnection;395;1;297;1
WireConnection;396;0;297;2
WireConnection;396;1;491;0
WireConnection;305;0;303;0
WireConnection;305;1;304;0
WireConnection;472;0;473;0
WireConnection;472;1;474;0
WireConnection;64;0;39;0
WireConnection;64;2;68;0
WireConnection;468;0;469;0
WireConnection;468;1;470;0
WireConnection;415;0;501;0
WireConnection;415;2;68;0
WireConnection;436;0;508;0
WireConnection;436;2;72;0
WireConnection;477;0;478;0
WireConnection;477;1;479;0
WireConnection;86;0;393;0
WireConnection;86;1;394;0
WireConnection;301;0;395;0
WireConnection;301;1;396;0
WireConnection;14;0;220;0
WireConnection;14;2;72;0
WireConnection;302;0;556;0
WireConnection;302;1;305;0
WireConnection;54;0;555;0
WireConnection;54;1;291;0
WireConnection;471;0;472;0
WireConnection;471;1;64;0
WireConnection;467;0;415;0
WireConnection;467;1;468;0
WireConnection;480;0;436;0
WireConnection;480;1;477;0
WireConnection;53;0;54;0
WireConnection;53;2;86;0
WireConnection;306;0;302;0
WireConnection;306;2;301;0
WireConnection;286;0;14;0
WireConnection;285;0;471;0
WireConnection;423;0;467;0
WireConnection;437;0;480;0
WireConnection;229;1;53;0
WireConnection;308;0;306;0
WireConnection;308;1;313;0
WireConnection;307;1;306;0
WireConnection;292;0;53;0
WireConnection;292;1;293;0
WireConnection;310;1;307;0
WireConnection;310;0;308;0
WireConnection;439;1;309;0
WireConnection;439;0;440;0
WireConnection;435;1;294;0
WireConnection;435;0;434;0
WireConnection;295;1;229;0
WireConnection;295;0;292;0
WireConnection;140;0;435;0
WireConnection;140;1;295;0
WireConnection;140;2;46;0
WireConnection;311;0;439;0
WireConnection;311;1;310;0
WireConnection;311;2;312;0
WireConnection;227;0;226;0
WireConnection;227;1;228;0
WireConnection;460;0;403;0
WireConnection;460;1;485;0
WireConnection;461;0;402;0
WireConnection;461;1;459;0
WireConnection;488;0;318;0
WireConnection;488;1;489;0
WireConnection;487;0;486;0
WireConnection;487;1;317;0
WireConnection;315;1;439;0
WireConnection;315;0;311;0
WireConnection;60;1;435;0
WireConnection;60;0;140;0
WireConnection;462;1;227;0
WireConnection;399;0;461;0
WireConnection;399;1;214;1
WireConnection;400;0;214;2
WireConnection;400;1;460;0
WireConnection;324;0;319;0
WireConnection;324;1;320;0
WireConnection;397;0;487;0
WireConnection;397;1;321;1
WireConnection;398;0;321;2
WireConnection;398;1;488;0
WireConnection;287;0;60;0
WireConnection;314;0;315;0
WireConnection;171;0;212;0
WireConnection;171;1;462;0
WireConnection;401;0;399;0
WireConnection;401;1;400;0
WireConnection;325;0;397;0
WireConnection;325;1;398;0
WireConnection;326;0;557;0
WireConnection;326;1;324;0
WireConnection;213;0;171;0
WireConnection;213;2;401;0
WireConnection;327;0;326;0
WireConnection;327;2;325;0
WireConnection;405;0;408;0
WireConnection;405;1;288;0
WireConnection;338;0;213;0
WireConnection;407;0;288;0
WireConnection;407;1;408;0
WireConnection;413;0;412;0
WireConnection;413;1;316;0
WireConnection;411;0;316;0
WireConnection;411;1;412;0
WireConnection;329;0;327;0
WireConnection;329;1;328;0
WireConnection;330;1;327;0
WireConnection;536;0;212;0
WireConnection;404;1;405;0
WireConnection;404;0;407;0
WireConnection;409;1;413;0
WireConnection;409;0;411;0
WireConnection;333;1;330;0
WireConnection;333;0;329;0
WireConnection;80;0;409;0
WireConnection;80;1;23;0
WireConnection;334;0;331;0
WireConnection;334;1;333;0
WireConnection;334;2;332;0
WireConnection;511;0;509;0
WireConnection;511;1;510;0
WireConnection;442;1;171;0
WireConnection;442;2;536;0
WireConnection;79;0;404;0
WireConnection;79;1;22;0
WireConnection;1175;0;1170;0
WireConnection;1175;1;1172;0
WireConnection;1176;0;1171;0
WireConnection;1176;1;1169;0
WireConnection;142;0;80;0
WireConnection;512;0;442;0
WireConnection;512;1;511;0
WireConnection;541;0;537;0
WireConnection;541;1;636;0
WireConnection;141;0;79;0
WireConnection;209;0;178;0
WireConnection;359;0;176;1
WireConnection;339;1;331;0
WireConnection;339;0;334;0
WireConnection;1179;0;1176;0
WireConnection;1179;1;1174;1
WireConnection;1180;0;1174;2
WireConnection;1180;1;1175;0
WireConnection;18;0;142;0
WireConnection;335;0;339;0
WireConnection;465;0;464;0
WireConnection;465;1;463;0
WireConnection;443;0;512;0
WireConnection;443;2;401;0
WireConnection;19;0;141;0
WireConnection;542;0;541;0
WireConnection;210;0;174;0
WireConnection;177;0;359;0
WireConnection;177;1;209;0
WireConnection;377;0;378;3
WireConnection;374;0;378;2
WireConnection;1178;0;1177;0
WireConnection;1178;1;1173;0
WireConnection;1182;0;1179;0
WireConnection;1182;1;1180;0
WireConnection;1183;0;1181;0
WireConnection;1183;1;1178;0
WireConnection;466;0;443;0
WireConnection;466;1;465;0
WireConnection;543;0;542;0
WireConnection;175;1;210;0
WireConnection;175;0;177;0
WireConnection;561;0;560;1
WireConnection;375;0;374;0
WireConnection;375;1;377;0
WireConnection;1184;0;1183;0
WireConnection;1184;2;1182;0
WireConnection;619;1;617;0
WireConnection;619;0;27;0
WireConnection;620;1;617;0
WireConnection;620;0;28;0
WireConnection;632;1;543;0
WireConnection;632;0;542;0
WireConnection;441;0;466;0
WireConnection;441;1;444;0
WireConnection;211;0;180;0
WireConnection;558;1;175;0
WireConnection;558;0;561;0
WireConnection;170;0;444;0
WireConnection;170;1;337;0
WireConnection;373;1;352;0
WireConnection;373;0;375;0
WireConnection;1160;1;1184;0
WireConnection;618;1;617;0
WireConnection;618;0;232;0
WireConnection;616;1;617;0
WireConnection;616;0;233;0
WireConnection;241;0;619;0
WireConnection;241;1;620;0
WireConnection;446;1;170;1
WireConnection;446;0;441;0
WireConnection;544;0;632;0
WireConnection;544;1;547;0
WireConnection;179;0;211;0
WireConnection;179;1;558;0
WireConnection;351;1;373;0
WireConnection;1168;0;1184;0
WireConnection;1168;1;1167;0
WireConnection;1189;0;1163;0
WireConnection;1162;0;1160;1
WireConnection;1162;1;1189;0
WireConnection;242;0;241;0
WireConnection;231;0;616;0
WireConnection;231;1;618;0
WireConnection;181;0;179;0
WireConnection;181;1;446;0
WireConnection;545;0;544;0
WireConnection;545;1;546;0
WireConnection;598;0;597;0
WireConnection;598;1;596;0
WireConnection;1157;0;351;0
WireConnection;1186;0;1189;0
WireConnection;1186;1;1168;0
WireConnection;234;1;231;0
WireConnection;234;0;242;0
WireConnection;182;0;181;0
WireConnection;563;0;580;0
WireConnection;563;1;598;0
WireConnection;554;0;545;0
WireConnection;1129;0;1128;0
WireConnection;1129;1;589;1
WireConnection;1130;0;1128;0
WireConnection;1130;1;589;2
WireConnection;1166;1;1162;0
WireConnection;1166;0;1186;0
WireConnection;183;0;182;0
WireConnection;183;1;184;0
WireConnection;552;0;554;0
WireConnection;743;0;742;0
WireConnection;743;1;745;0
WireConnection;284;0;282;0
WireConnection;284;1;283;0
WireConnection;628;0;234;0
WireConnection;628;1;621;0
WireConnection;1111;0;1110;0
WireConnection;224;0;223;0
WireConnection;564;0;563;0
WireConnection;564;2;578;0
WireConnection;1131;0;1129;0
WireConnection;1131;1;1130;0
WireConnection;601;0;600;0
WireConnection;601;1;599;0
WireConnection;1161;0;1159;0
WireConnection;1161;1;1166;0
WireConnection;953;0;950;0
WireConnection;953;1;951;0
WireConnection;877;0;875;0
WireConnection;877;1;876;0
WireConnection;208;0;183;0
WireConnection;208;1;206;0
WireConnection;746;0;743;0
WireConnection;251;0;250;0
WireConnection;251;1;284;0
WireConnection;222;0;628;0
WireConnection;222;1;224;0
WireConnection;1091;2;1111;0
WireConnection;1127;0;1131;0
WireConnection;1127;1;601;0
WireConnection;612;0;564;0
WireConnection;612;1;595;0
WireConnection;1136;1;1134;1
WireConnection;1136;0;1134;2
WireConnection;1164;1;1159;0
WireConnection;1164;0;1161;0
WireConnection;954;0;952;0
WireConnection;954;1;953;0
WireConnection;878;0;877;0
WireConnection;187;0;208;0
WireConnection;584;0;576;0
WireConnection;584;1;585;0
WireConnection;606;0;612;0
WireConnection;606;1;582;0
WireConnection;747;0;746;0
WireConnection;747;1;748;0
WireConnection;254;0;251;0
WireConnection;254;2;252;0
WireConnection;551;0;553;0
WireConnection;551;1;222;0
WireConnection;1094;0;1096;0
WireConnection;1094;1;1092;0
WireConnection;1113;0;1091;0
WireConnection;1113;1;373;0
WireConnection;562;1;1127;0
WireConnection;1133;0;1136;0
WireConnection;1143;0;1150;0
WireConnection;1143;1;1151;0
WireConnection;1144;0;1152;0
WireConnection;1144;1;1149;0
WireConnection;1165;0;1164;0
WireConnection;956;0;954;0
WireConnection;956;2;955;0
WireConnection;885;0;878;0
WireConnection;885;1;886;0
WireConnection;577;0;584;0
WireConnection;577;1;586;0
WireConnection;573;0;584;0
WireConnection;573;1;586;0
WireConnection;605;0;606;0
WireConnection;605;1;562;0
WireConnection;750;0;747;0
WireConnection;273;1;254;0
WireConnection;548;1;222;0
WireConnection;548;0;551;0
WireConnection;1095;0;1113;0
WireConnection;1095;1;1094;0
WireConnection;1139;0;1138;0
WireConnection;1139;1;1137;0
WireConnection;1147;0;1145;2
WireConnection;1147;1;1143;0
WireConnection;1146;0;1144;0
WireConnection;1146;1;1145;1
WireConnection;1000;0;1001;2
WireConnection;958;1;956;0
WireConnection;880;0;885;0
WireConnection;880;1;879;0
WireConnection;610;0;605;0
WireConnection;610;1;584;0
WireConnection;610;2;583;0
WireConnection;611;0;605;0
WireConnection;611;1;573;0
WireConnection;611;2;583;0
WireConnection;609;0;605;0
WireConnection;609;1;577;0
WireConnection;609;2;583;0
WireConnection;749;0;750;0
WireConnection;749;1;750;1
WireConnection;757;0;756;0
WireConnection;904;0;875;2
WireConnection;899;0;875;1
WireConnection;259;0;1132;0
WireConnection;259;1;256;0
WireConnection;275;0;273;0
WireConnection;275;1;255;0
WireConnection;258;0;1132;0
WireConnection;963;0;957;1
WireConnection;197;0;193;0
WireConnection;197;1;548;0
WireConnection;1090;0;1095;0
WireConnection;1090;1;1089;0
WireConnection;1141;0;1140;0
WireConnection;1141;1;1139;0
WireConnection;1148;0;1146;0
WireConnection;1148;1;1147;0
WireConnection;77;0;1089;0
WireConnection;77;1;1158;0
WireConnection;962;0;958;0
WireConnection;962;1;959;0
WireConnection;983;0;1001;2
WireConnection;983;1;1002;0
WireConnection;999;0;1000;0
WireConnection;999;1;1002;0
WireConnection;881;0;880;0
WireConnection;569;0;611;0
WireConnection;569;1;610;0
WireConnection;569;2;609;0
WireConnection;754;0;749;0
WireConnection;754;1;757;0
WireConnection;905;0;899;0
WireConnection;896;0;875;1
WireConnection;902;0;875;2
WireConnection;906;0;904;0
WireConnection;260;0;258;0
WireConnection;260;1;256;0
WireConnection;261;0;275;0
WireConnection;261;1;259;0
WireConnection;961;0;957;1
WireConnection;961;1;960;0
WireConnection;964;0;963;0
WireConnection;964;1;960;0
WireConnection;1042;0;359;0
WireConnection;625;1;548;0
WireConnection;625;0;197;0
WireConnection;515;1;521;0
WireConnection;1112;1;77;0
WireConnection;1112;0;1090;0
WireConnection;1142;0;1141;0
WireConnection;1142;2;1148;0
WireConnection;984;0;962;0
WireConnection;984;1;983;0
WireConnection;978;0;962;0
WireConnection;978;1;999;0
WireConnection;882;0;881;0
WireConnection;882;1;881;1
WireConnection;173;0;558;0
WireConnection;173;1;446;0
WireConnection;574;0;569;0
WireConnection;574;1;587;0
WireConnection;765;0;764;0
WireConnection;755;0;754;0
WireConnection;949;0;906;0
WireConnection;948;0;902;0
WireConnection;946;0;905;0
WireConnection;947;0;896;0
WireConnection;265;0;261;0
WireConnection;265;1;258;0
WireConnection;263;0;275;0
WireConnection;263;1;260;0
WireConnection;264;0;262;0
WireConnection;968;0;962;0
WireConnection;968;1;964;0
WireConnection;965;0;962;0
WireConnection;965;1;961;0
WireConnection;1014;0;1142;0
WireConnection;1014;1;1049;0
WireConnection;1029;0;1027;0
WireConnection;1046;1;1142;0
WireConnection;196;0;625;0
WireConnection;196;1;1112;0
WireConnection;514;1;515;0
WireConnection;1070;0;1069;0
WireConnection;1070;1;1071;0
WireConnection;985;0;984;0
WireConnection;985;1;1000;0
WireConnection;986;0;987;0
WireConnection;979;0;978;0
WireConnection;979;1;1001;2
WireConnection;884;0;882;0
WireConnection;186;0;173;0
WireConnection;603;0;574;0
WireConnection;603;1;604;0
WireConnection;770;0;769;0
WireConnection;763;0;755;0
WireConnection;763;1;765;0
WireConnection;919;0;947;0
WireConnection;920;0;946;0
WireConnection;921;0;948;0
WireConnection;922;0;949;0
WireConnection;266;0;263;0
WireConnection;266;1;1132;0
WireConnection;267;0;265;0
WireConnection;267;1;264;0
WireConnection;970;0;968;0
WireConnection;970;1;957;1
WireConnection;967;0;965;0
WireConnection;967;1;963;0
WireConnection;1041;0;561;0
WireConnection;1017;0;1014;0
WireConnection;1017;1;1050;0
WireConnection;1031;0;1028;0
WireConnection;1032;0;1044;0
WireConnection;1032;1;1029;0
WireConnection;969;0;966;0
WireConnection;805;0;804;0
WireConnection;1051;0;1046;1
WireConnection;1051;1;1050;0
WireConnection;513;0;196;0
WireConnection;513;1;514;0
WireConnection;1075;0;1070;0
WireConnection;980;0;979;0
WireConnection;980;1;986;0
WireConnection;988;0;985;0
WireConnection;988;1;986;0
WireConnection;883;0;884;0
WireConnection;588;0;603;0
WireConnection;768;0;755;0
WireConnection;768;1;770;0
WireConnection;775;0;774;0
WireConnection;776;0;763;0
WireConnection;776;1;777;0
WireConnection;900;0;919;0
WireConnection;900;1;920;0
WireConnection;900;2;921;0
WireConnection;900;3;922;0
WireConnection;269;0;266;0
WireConnection;269;1;264;0
WireConnection;271;1;268;0
WireConnection;271;0;267;0
WireConnection;973;0;970;0
WireConnection;973;1;969;0
WireConnection;971;0;967;0
WireConnection;971;1;969;0
WireConnection;1019;0;1017;0
WireConnection;1034;1;1031;0
WireConnection;1034;0;1032;0
WireConnection;806;1;805;0
WireConnection;930;0;927;0
WireConnection;1052;0;1051;0
WireConnection;627;1;196;0
WireConnection;627;0;513;0
WireConnection;1076;0;1078;0
WireConnection;1076;1;1075;0
WireConnection;887;0;883;0
WireConnection;766;0;776;0
WireConnection;771;0;775;0
WireConnection;771;1;768;0
WireConnection;923;0;900;0
WireConnection;270;0;269;0
WireConnection;270;1;271;0
WireConnection;975;0;973;0
WireConnection;975;1;971;0
WireConnection;1045;1;1052;0
WireConnection;1045;0;1019;0
WireConnection;1036;1;1034;0
WireConnection;1036;0;1043;0
WireConnection;981;0;980;0
WireConnection;981;1;988;0
WireConnection;928;0;930;0
WireConnection;807;0;806;0
WireConnection;202;0;201;0
WireConnection;202;1;627;0
WireConnection;1077;0;1078;0
WireConnection;1077;1;1076;0
WireConnection;914;0;887;0
WireConnection;914;1;923;0
WireConnection;772;0;771;0
WireConnection;772;1;766;0
WireConnection;272;0;270;0
WireConnection;976;0;975;0
WireConnection;982;0;981;0
WireConnection;810;0;807;0
WireConnection;810;4;928;0
WireConnection;1022;0;1045;0
WireConnection;1022;1;1036;0
WireConnection;626;1;627;0
WireConnection;626;0;202;0
WireConnection;629;0;594;0
WireConnection;1074;1;1077;0
WireConnection;276;0;272;0
WireConnection;935;0;772;0
WireConnection;926;0;914;0
WireConnection;1003;0;976;0
WireConnection;1003;1;982;0
WireConnection;854;0;810;0
WireConnection;1024;0;1022;0
WireConnection;591;0;629;0
WireConnection;591;1;626;0
WireConnection;1085;0;1074;0
WireConnection;1085;1;1086;0
WireConnection;779;1;780;0
WireConnection;779;0;935;0
WireConnection;924;1;925;0
WireConnection;924;0;926;0
WireConnection;1005;1;1004;0
WireConnection;1005;0;1003;0
WireConnection;1053;1;1054;0
WireConnection;1053;0;1024;0
WireConnection;862;1;861;0
WireConnection;862;0;854;0
WireConnection;592;1;626;0
WireConnection;592;0;591;0
WireConnection;1122;0;1120;0
WireConnection;1122;1;1123;0
WireConnection;1087;0;1085;0
WireConnection;778;0;779;0
WireConnection;889;0;924;0
WireConnection;1006;0;1005;0
WireConnection;1025;0;1053;0
WireConnection;853;0;862;0
WireConnection;277;0;280;0
WireConnection;277;1;592;0
WireConnection;1124;0;1122;0
WireConnection;1124;1;1125;0
WireConnection;1088;1;1087;0
WireConnection;1088;2;1086;0
WireConnection;278;1;592;0
WireConnection;278;0;277;0
WireConnection;1126;0;1123;0
WireConnection;1126;1;1124;0
WireConnection;734;1;732;0
WireConnection;1080;1;1081;0
WireConnection;1080;0;1088;0
WireConnection;699;0;697;0
WireConnection;857;0;278;0
WireConnection;857;1;858;0
WireConnection;857;2;860;0
WireConnection;857;3;893;0
WireConnection;857;4;1007;0
WireConnection;857;5;1026;0
WireConnection;1115;1;1126;0
WireConnection;731;0;734;0
WireConnection;731;1;732;0
WireConnection;1082;0;1080;0
WireConnection;701;0;702;0
WireConnection;701;1;699;1
WireConnection;703;0;699;2
WireConnection;703;1;704;0
WireConnection;693;0;63;0
WireConnection;693;1;857;0
WireConnection;1117;0;1116;0
WireConnection;1117;1;1115;0
WireConnection;166;0;162;0
WireConnection;526;0;522;0
WireConnection;526;1;523;0
WireConnection;721;0;723;0
WireConnection;721;1;731;0
WireConnection;700;0;701;0
WireConnection;700;1;703;0
WireConnection;700;2;699;3
WireConnection;1119;0;693;0
WireConnection;1119;1;1117;0
WireConnection;167;0;166;0
WireConnection;527;0;526;0
WireConnection;527;1;524;0
WireConnection;527;2;525;0
WireConnection;722;0;721;0
WireConnection;722;2;724;0
WireConnection;696;0;126;0
WireConnection;696;1;700;0
WireConnection;696;2;698;0
WireConnection;1083;0;1084;0
WireConnection;1083;1;1119;0
WireConnection;150;1;163;0
WireConnection;150;0;167;0
WireConnection;529;1;530;0
WireConnection;529;0;527;0
WireConnection;705;1;722;0
WireConnection;127;0;1083;0
WireConnection;127;1;696;0
WireConnection;381;0;385;4
WireConnection;688;0;857;0
WireConnection;157;0;150;0
WireConnection;531;0;529;0
WireConnection;708;0;705;1
WireConnection;708;1;705;2
WireConnection;708;2;705;3
WireConnection;386;0;381;0
WireConnection;386;1;127;0
WireConnection;1155;0;63;4
WireConnection;690;0;689;0
WireConnection;716;0;708;0
WireConnection;716;1;717;0
WireConnection;387;1;127;0
WireConnection;387;0;386;0
WireConnection;660;0;690;1
WireConnection;660;1;694;0
WireConnection;660;2;695;0
WireConnection;660;3;1153;4
WireConnection;660;4;1156;0
WireConnection;710;0;711;0
WireConnection;710;1;716;0
WireConnection;128;0;387;0
WireConnection;128;1;126;4
WireConnection;128;2;158;0
WireConnection;128;3;532;0
WireConnection;354;0;353;0
WireConnection;719;0;710;0
WireConnection;719;1;720;0
WireConnection;41;0;128;0
WireConnection;664;0;660;0
WireConnection;356;0;354;0
WireConnection;713;1;714;0
WireConnection;713;0;719;0
WireConnection;677;0;42;0
WireConnection;677;3;692;0
WireConnection;709;0;713;0
WireConnection;357;0;677;0
WireConnection;357;1;358;0
WireConnection;590;0;562;0
WireConnection;200;0;357;0
WireConnection;200;1;712;0
ASEEND*/
//CHKSM=2B9CAB588328A16ACD05C5C6EFB33249D3384F24