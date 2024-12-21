using System;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;

public enum Blending
{
    Additive,
    AlphaBlend,
}

public class KumaEffectShaderGUI : ShaderGUI
{
    //Main
    protected MaterialProperty _MainTex;
    protected MaterialProperty _MainColor;
    protected MaterialProperty _MainOffset;
    protected MaterialProperty _isCustomDataOffset;
    protected MaterialProperty _isCustomIntensity;
    protected MaterialProperty _useSecondMask;
    protected MaterialProperty _SecondMask;
    protected MaterialProperty _SecondOffset;
    protected MaterialProperty _SecondColor;
    protected MaterialProperty _SecondColorThreshold;
    protected MaterialProperty _Hue;
    protected MaterialProperty _Saturation;
    protected MaterialProperty _useMatCap;
    protected MaterialProperty _MatCapTex;
    protected MaterialProperty _matcapIntensity;

    //Noise1
    protected MaterialProperty _Noise1;
    protected MaterialProperty _Noise1Power;
    protected MaterialProperty _Noise1XPanning;
    protected MaterialProperty _Noise1YPanning;
    protected MaterialProperty _Noise1Panning;
    protected MaterialProperty _Noise1Tiling;
    protected MaterialProperty _isNoise1Polar;
    protected MaterialProperty _Noise1ShearX;
    protected MaterialProperty _Noise1ShearY;
    protected MaterialProperty _useNoise1;

    //Noise2
    protected MaterialProperty _Noise2;
    protected MaterialProperty _Noise2XPanning;
    protected MaterialProperty _Noise2YPanning;
    protected MaterialProperty _Noise2Panning;
    protected MaterialProperty _Noise2Power;
    protected MaterialProperty _Noise2Tiling;
    protected MaterialProperty _isNoise2Polar;
    protected MaterialProperty _Noise2ShearX;
    protected MaterialProperty _Noise2ShearY;
    protected MaterialProperty _isSubtract;
    protected MaterialProperty _useNoise2;

    //Distort 1
    protected MaterialProperty _isUVDistortion;
    protected MaterialProperty _GenerateNoise1Strength;
    protected MaterialProperty _UVDistortPanning;
    protected MaterialProperty _UVDistortIntensity;
    protected MaterialProperty _UVDistortionMap;
    protected MaterialProperty _useGenerateNoise1;
    protected MaterialProperty _UVDistortTiling;

    //Distort 2
    protected MaterialProperty _isUVDistortion2;
    protected MaterialProperty _UVDistortion2Map;
    protected MaterialProperty _UVDistortion2Panning;
    protected MaterialProperty _GenerateNoise2Strength;
    protected MaterialProperty _Distortion2Intensity;
    protected MaterialProperty _useGenerateNoise2;
    protected MaterialProperty _UVDistort2Tiling;

    //Distort Dissolve
    protected MaterialProperty _isUVDistortionD;
    protected MaterialProperty _UVDistortionDMap;
    protected MaterialProperty _UVDistortionDPanning;
    protected MaterialProperty _GenerateNoiseDStrength;
    protected MaterialProperty _DistortionDIntensity;
    protected MaterialProperty _useGenerateNoiseD;
    protected MaterialProperty _UVDistortDTiling;

    //Fresnel
    protected MaterialProperty _useFresnel;
    protected MaterialProperty _FresnelWidth;
    protected MaterialProperty _FresnelIntensity;
    protected MaterialProperty _isFresnelInverse;

    //RandomMul
    protected MaterialProperty _RandomMul;
    protected MaterialProperty _RandomMulY;

    //Soft Particle
    protected MaterialProperty _SoftParticle;
    protected MaterialProperty _isSoftParticle;

    //Camera Fade
    protected MaterialProperty _isCameraFade;
    protected MaterialProperty _FadeStart;
    protected MaterialProperty _FadeEnd;

    //Dissolve
    protected MaterialProperty _isLifetimeDissolve;
    protected MaterialProperty _StartDissolve;
    protected MaterialProperty _Threshold;
    protected MaterialProperty _EdgeWidth;
    protected MaterialProperty _EdgeColor;
    protected MaterialProperty _DissolveMap;
    protected MaterialProperty _DissolveTiling;
    protected MaterialProperty _DissolvePanning;
    protected MaterialProperty _isDissolvePolar;
    protected MaterialProperty _DissolveShearX;
    protected MaterialProperty _DissolveShearY;
    protected MaterialProperty _isCustomDataDissolve;
    protected MaterialProperty _useDissolve;

    //Alpha Fade
    protected MaterialProperty _useAlphaFade;
    protected MaterialProperty _useGeneNoise4AF;
    protected MaterialProperty _isCustomDataAlphaFade;
    protected MaterialProperty _isLifetimeAlphaFade;
    protected MaterialProperty _AFNoiseStrength;
    protected MaterialProperty _AFNoisePower;
    protected MaterialProperty _AlphaFadeThreshold;
    protected MaterialProperty _StartAlphaFade;
    protected MaterialProperty _AlphaFadeMap;



    protected MaterialProperty _isTrailEdgeDissolve;
    protected MaterialProperty _isBothDissolve;
    protected MaterialProperty _TrailEdgeDissolveLength;
    protected MaterialProperty _TrailEdgeDissolveThreshold;
    protected MaterialProperty _TrailEdgeDissolveNoisePower;
    protected MaterialProperty _TrailEdgeDissolveMap;
    protected MaterialProperty _TrailEdgeDissolveScroll;
    protected MaterialProperty _TrailEdgeDissolveTilling;

    //Chromatic Caustics
    protected MaterialProperty _useCACaustics;
    protected MaterialProperty _CausticsNoiseTiling;
    protected MaterialProperty _CausticsNoisePanning;
    protected MaterialProperty _CausticsNoiseScale;
    protected MaterialProperty _CausticsNoiseIntensity;
    protected MaterialProperty _VoronoiScale;
    protected MaterialProperty _ChromaticAberration;
    protected MaterialProperty _VoronoiAngleSpeed;
    protected MaterialProperty _VoronoiPower;
    protected MaterialProperty _VoronoiPanning;
    protected MaterialProperty _VoronoiIntensity;

    //Vertex Offset
    protected MaterialProperty _useVertexOffset;
    protected MaterialProperty _VertexNoiseTex;
    protected MaterialProperty _VertexIntensity;
    protected MaterialProperty _VertexBorder;
    protected MaterialProperty _VertexNoiseTiling;
    protected MaterialProperty _VertexNoisePanning;

    //Dust
    protected MaterialProperty _useDust;
    protected MaterialProperty _Size;
    protected MaterialProperty _CenterSize;
    protected MaterialProperty _CenterStrength;
    protected MaterialProperty _OutsideSize;
    protected MaterialProperty _OutsideStrength;
    //Circle
    protected MaterialProperty _useCircle;
    protected MaterialProperty _CircleWidth;
    //Glitter
    protected MaterialProperty _useGlitter;
    //Gradient Mask
    protected MaterialProperty _useGradientMask;
    protected MaterialProperty _GradientMaskTilling;
    protected MaterialProperty _GradientMaskPanning;
    protected MaterialProperty _GradientNoiseMap;
    protected MaterialProperty _MaskNoisePower;
    protected MaterialProperty _HorizontalLength;
    protected MaterialProperty _HorizontalBorder;
    protected MaterialProperty _VerticalLength;
    protected MaterialProperty _VerticalBorder;



    protected MaterialProperty _EmissionIntensity;

    protected MaterialProperty _isFirst;

    MaterialProperty _Cull;
    //MaterialProperty _Blending;
    MaterialProperty _SrcBlend;
    MaterialProperty _DstBlend;
    MaterialProperty _ZWrite;
    MaterialProperty _ZTest;
    MaterialProperty _Comp;
    MaterialProperty _Pass;
    MaterialProperty _Ref;

    List<ParticleSystemRenderer> m_RenderersUsingThisMaterial = new List<ParticleSystemRenderer>();
    bool m_FirstTimeApply = true;
    GUIContent applyStreamsText = new GUIContent("Fix Vertex Streams", "Apply the vertex stream layout to all Particle Systems using this material");

    //liltoon���l�J���Ă���Foldout�����ʂ�
    public static bool _mainFoldout = true;
    public static bool _noise1Foldout = true;
    public static bool _noise2Foldout = true;
    public static bool _distortFoldout = true;
    public static bool _dissolveFoldout = true;
    public static bool _fresnelFoldout = true;
    public static bool _ChromaticCausticsFoldout = true;
    public static bool _shaderShapeFoldout = true;
    public static bool _vertexOffsetFoldout = true;
    public static bool _softParticleFoldout = true;
    public static bool _otherFoldout = true;
    

    GUIStyle foldoutStyle;
    GUIStyle boxStyle;
    GUIStyle buttonStyle;

    const string BlendingPropertyName = "_Blending";
    const string SrcBlendPropertyName = "_SrcBlend";
    const string DstBlendPropertyName = "_DstBlend";

    private List<Vector4> customValue = new List<Vector4>();
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] props){


         _MainTex = FindProperty("_Mask", props);
         _MainColor = FindProperty("_MainColor", props);
         _MainOffset = FindProperty("_MainOffset", props);
         _isCustomDataOffset = FindProperty("_isCustomDataOffset", props);
         _isCustomIntensity = FindProperty("_isCustomIntensity", props);
         _useSecondMask = FindProperty("_useSecondMask", props);
         _SecondMask = FindProperty("_SecondMask", props);
         _SecondOffset = FindProperty("_SecondOffset", props);
         _SecondColor = FindProperty("_SecondColor", props);
         _SecondColorThreshold = FindProperty("_SecondColorThreshold", props);
         _Hue = FindProperty("_Hue", props);
         _Saturation = FindProperty("_Saturation", props);
         _useMatCap = FindProperty("_useMatCap", props);
         _MatCapTex = FindProperty("_MatCapTex", props);
         _matcapIntensity = FindProperty("_matcapIntensity", props);

         _useNoise1 = FindProperty("_useNoise1", props);
         _Noise1 = FindProperty("_Noise1", props);
         _Noise1Power = FindProperty("_Noise1Power", props);
         _Noise1Panning = FindProperty("_Noise1Panning", props);
         _Noise1Tiling = FindProperty("_Noise1Tiling", props);
         _isNoise1Polar = FindProperty("_isNoise1Polar", props);
         _Noise1ShearX = FindProperty("_Noise1ShearX", props);
         _Noise1ShearY = FindProperty("_Noise1ShearY", props);

         _useNoise2 = FindProperty("_useNoise2", props);
         _Noise2 = FindProperty("_Noise2", props);
         _Noise2Power = FindProperty("_Noise2Power", props);
         _Noise2Panning = FindProperty("_Noise2Panning", props);
         _Noise2Tiling = FindProperty("_Noise2Tiling", props);
         _isNoise2Polar = FindProperty("_isNoise2Polar", props);
         _Noise2ShearX = FindProperty("_Noise2ShearX", props);
         _Noise2ShearY = FindProperty("_Noise2ShearY", props);
         _isSubtract = FindProperty("_isSubtract", props);
         
        
         //UV Distort 1
         _isUVDistortion = FindProperty("_isUVDistortion1", props);
         _UVDistortPanning = FindProperty("_UVDistortion1Panning", props);
         _UVDistortIntensity = FindProperty("_Distortion1Intensity", props);
         _UVDistortionMap = FindProperty("_UVDistortionMap", props);
         _GenerateNoise1Strength = FindProperty("_GenerateNoise1Strength", props);
         _useGenerateNoise1 = FindProperty("_useGenerateNoise1", props);
         _UVDistortTiling = FindProperty("_UVDistortion1Tiling", props);

         //UV Distort 2
         _isUVDistortion2 = FindProperty("_isUVDistortion2", props);
         _UVDistortion2Map = FindProperty("_UVDistortion2Map", props);
         _UVDistortion2Panning = FindProperty("_UVDistortion2Panning", props);
         _GenerateNoise2Strength = FindProperty("_GenerateNoise2Strength", props);
         _Distortion2Intensity = FindProperty("_Distortion2Intensity", props);
         _useGenerateNoise2 = FindProperty("_useGenerateNoise2", props);
         _UVDistort2Tiling = FindProperty("_UVDistortion2Tiling", props);

         //UV Distort Dissolve
         _isUVDistortionD = FindProperty("_isUVDistortionD", props);
         _UVDistortionDMap = FindProperty("_UVDistortionDMap", props);
         _UVDistortionDPanning = FindProperty("_UVDistortionDPanning", props);
         _GenerateNoiseDStrength = FindProperty("_GenerateNoiseDStrength", props);
         _DistortionDIntensity = FindProperty("_DistortionDIntensity", props);
         _useGenerateNoiseD = FindProperty("_useGenerateNoiseD", props);
         _UVDistortDTiling = FindProperty("_UVDistortionDTiling", props);

         //Dissolve
         _useDissolve = FindProperty("_useDissolve", props);
         _isLifetimeDissolve = FindProperty("_isLifetimeDissolve", props);
         _StartDissolve = FindProperty("_StartDissolve", props);
         _Threshold = FindProperty("_Threshold", props);
         _EdgeWidth = FindProperty("_EdgeWidth",props);
         _EdgeColor = FindProperty("_EdgeColor", props);
         _DissolveMap = FindProperty("_DissolveMap", props);
         _DissolveTiling = FindProperty("_DissolveTiling", props);
         _DissolvePanning = FindProperty("_DissolvePanning", props);
         _isDissolvePolar = FindProperty("_isDissolvePolar", props);
         _DissolveShearX = FindProperty("_DissolveShearX", props);
         _DissolveShearY = FindProperty("_DissolveShearY", props);
         _isCustomDataDissolve = FindProperty("_isCustomDataDissolve", props);

         _isTrailEdgeDissolve = FindProperty("_isTrailEdgeDissolve", props);
         _isBothDissolve = FindProperty("_isBothDissolve", props);
         _TrailEdgeDissolveLength = FindProperty("_TrailEdgeDissolveLength", props);
         _TrailEdgeDissolveThreshold = FindProperty("_TrailEdgeDissolveThreshold", props);
         _TrailEdgeDissolveNoisePower = FindProperty("_TrailEdgeDissolveNoisePower", props);
         _TrailEdgeDissolveMap = FindProperty("_TrailEdgeDissolveMap", props);
         _TrailEdgeDissolveScroll = FindProperty("_TrailEdgeDissolveScroll", props);
         _TrailEdgeDissolveTilling = FindProperty("_TrailEdgeDissolveTilling", props);

         //Alpha Fade
         _useAlphaFade = FindProperty("_useAlphaFade", props);
         _useGeneNoise4AF = FindProperty("_useGeneNoise4AF", props);
         _isCustomDataAlphaFade = FindProperty("_isCustomDataAlphaFade", props);
         _isLifetimeAlphaFade = FindProperty("_isLifetimeAlphaFade", props);
         _AFNoiseStrength = FindProperty("_AFNoiseStrength", props);
         _AFNoisePower = FindProperty("_AFNoisePower", props);
         _AlphaFadeThreshold = FindProperty("_AlphaFadeThreshold", props);
         _StartAlphaFade = FindProperty("_StartAlphaFade", props);
         _AlphaFadeMap = FindProperty("_AlphaFadeMap", props);

         //Fresnel
         _useFresnel = FindProperty("_useFresnel", props);
         _FresnelWidth = FindProperty("_FresnelWidth", props);
         _FresnelIntensity = FindProperty("_FresnelIntensity", props);
         _isFresnelInverse = FindProperty("_isFresnelInverse", props);

         //Chromatic Caustics
         _useCACaustics = FindProperty("_useCACaustics", props);
         _CausticsNoiseTiling = FindProperty("_CausticsNoiseTiling", props);
         _CausticsNoisePanning = FindProperty("_CausticsNoisePanning", props);
         _CausticsNoiseScale = FindProperty("_CausticsNoiseScale", props);
         _CausticsNoiseIntensity = FindProperty("_CausticsNoiseIntensity", props);
         _VoronoiScale = FindProperty("_VoronoiScale", props);
         _ChromaticAberration = FindProperty("_ChromaticAberration", props);
         _VoronoiAngleSpeed = FindProperty("_VoronoiAngleSpeed", props);
         _VoronoiPower = FindProperty("_VoronoiPower", props);
         _VoronoiPanning = FindProperty("_VoronoiPanning", props);
         _VoronoiIntensity = FindProperty("_VoronoiIntensity", props);

         //Shader Shapes
         _useDust = FindProperty("_useDust", props);
         _Size = FindProperty("_Size", props);
         _CenterSize = FindProperty("_CenterSize", props);
         _CenterStrength = FindProperty("_CenterStrength", props);
         _OutsideSize = FindProperty("_OutsideSize", props);
         _OutsideStrength = FindProperty("_OutsideStrength", props);
         _useCircle = FindProperty("_useCircle", props);
         _CircleWidth = FindProperty("_CircleWidth", props);
         _useGlitter = FindProperty("_useGlitter", props);

         _useGradientMask = FindProperty("_useGradientMask", props);
         _GradientMaskTilling = FindProperty("_GradientMaskTilling", props);
         _GradientMaskPanning = FindProperty("_GradientMaskPanning", props);
         _GradientNoiseMap = FindProperty("_GradientNoiseMap", props);
         _MaskNoisePower = FindProperty("_MaskNoisePower", props);
         _HorizontalLength = FindProperty("_HorizontalLength", props);
         _HorizontalBorder = FindProperty("_HorizontalBorder", props);
         _VerticalLength = FindProperty("_VerticalLength", props);
         _VerticalBorder = FindProperty("_VerticalBorder", props);

         //Vertex Offset
         _useVertexOffset = FindProperty("_useVertexOffset", props);
         _VertexIntensity = FindProperty("_VertexIntensity", props);
         _VertexNoiseTex = FindProperty("_VertexNoiseTex", props);
         _VertexBorder = FindProperty("_VertexBorder", props);
         _VertexNoiseTiling= FindProperty("_VertexNoiseTiling", props);
         _VertexNoisePanning = FindProperty("_VertexNoisePanning", props);
         
         //Soft Particle
         _SoftParticle = FindProperty("_SoftParticle", props);
         _isSoftParticle = FindProperty("_isSoftParticle", props);

         //Fade
         _isCameraFade = FindProperty("_isCameraFade", props);
         _FadeStart = FindProperty("_FadeStart", props);
         _FadeEnd = FindProperty("_FadeEnd", props);

         //RandomMul
         _RandomMul = FindProperty("_RandomMul", props);
         _RandomMulY = FindProperty("_RandomMulY", props);

         _EmissionIntensity = FindProperty("_EmissionIntensity", props);


         _isFirst = FindProperty("_isFirst", props);

         _Cull = FindProperty("_Cull", props);
         //_Blending = FindProperty("_Blending", props);
         _SrcBlend = FindProperty("_SrcBlend", props);
         _DstBlend = FindProperty("_DstBlend", props);
         _ZWrite = FindProperty("_ZWrite", props);
         _ZTest = FindProperty("_ZTest", props);
         _Comp = FindProperty("_Comp", props);
         _Pass = FindProperty("_Pass", props);
         _Ref = FindProperty("_Ref", props);

        #region SetGUIStyle
        if (foldoutStyle == null)
            foldoutStyle = new GUIStyle(EditorStyles.foldout)
            {
                fontStyle = FontStyle.Bold,
                margin = new RectOffset(8, 0, 0, 0),
            };

        if (boxStyle == null)
            boxStyle = new GUIStyle("Box")
            {
                padding = new RectOffset(0, -5, 0, -5),
                margin = new RectOffset(0, 0, 0, 0)
            };

        if (buttonStyle == null)
        {
            // Create a custom button style similar to Foldout and Box styles
            buttonStyle = new GUIStyle(EditorStyles.miniButton)
            {
                padding = new RectOffset(-10, 0, 2, 2),
                margin = new RectOffset(0, 0, 0, 0),
                border = new RectOffset(0, 0, 0, 0),
                fixedHeight = 18,
                alignment = TextAnchor.MiddleLeft,
                contentOffset = new Vector2(10, 0), // Adjust to position the icon
                normal = { background = CreateColorTexture(new Color(0, 0, 0, 0)) }, // Set custom background color

            };
        }

        Texture2D CreateColorTexture(Color color)
        {
            Texture2D texture = new Texture2D(1, 1);
            texture.SetPixel(0, 0, color);
            texture.Apply();
            return texture;
        }
        #endregion
        
        Material mat = (Material)materialEditor.target;
        if (m_FirstTimeApply){
			CacheRenderersUsingThisMaterial(mat);
			m_FirstTimeApply = false;
        }

        if (_isFirst.floatValue > 0.5f)
        {
            _isFirst.floatValue = 0f;

            //初期値の変更
            _ZWrite.floatValue = 0.0f;
            _DstBlend.floatValue = 1.0f;
        }

        //**************************************************
        //****** Main Tex **********************************
        //**************************************************
        SetFoldout(ref _mainFoldout, "Main");
        if (_mainFoldout){
            using (new EditorGUILayout.VerticalScope("HelpBox")){
                //Maintex
                GUILayout.Label("Main Texture", EditorStyles.boldLabel);
                materialEditor.TexturePropertySingleLine(new GUIContent("Main Texture"), _MainTex, _MainColor);
                                if(_isCustomDataOffset.floatValue == 0.0){
                    EditorGUI.BeginChangeCheck();

                    Vector4 _MainOffsetVec = EditorGUILayout.Vector2Field("Offset", _MainOffset.vectorValue);
                
                    if(EditorGUI.EndChangeCheck()){
                        _MainOffset.vectorValue = _MainOffsetVec;
                    }
                }
                EditorGUILayout.Space();
                materialEditor.ShaderProperty(_isCustomIntensity,Styles.customIntensity);
                GUILayout.Label("(CustomData2.z)", EditorStyles.label);
                EditorGUILayout.Space();
                materialEditor.ShaderProperty(_isCustomDataOffset,Styles.customOffset);
                GUILayout.Label("(CustomData2.xy)", EditorStyles.label);
                EditorGUILayout.Space();

                EditorGUILayout.Space();
                EditorGUILayout.Space();
                GUILayout.Label("Second Color", EditorStyles.boldLabel);
                materialEditor.ShaderProperty(_SecondColor, "Second Color");
                materialEditor.RangeProperty(_SecondColorThreshold, "Threshold");
                materialEditor.RangeProperty(_Hue, "Hue");
                materialEditor.RangeProperty(_Saturation, "Saturation");
                

                EditorGUILayout.Space();
                EditorGUILayout.Space();
                GUILayout.Label("Second Mask", EditorStyles.boldLabel);
                materialEditor.ShaderProperty(_useSecondMask,Styles.secondMask);
                if(_useSecondMask.floatValue == 1.0){
                    materialEditor.TexturePropertySingleLine(new GUIContent("Second Mask"), _SecondMask);
                    Vector4 _SecondOffsetVec = EditorGUILayout.Vector2Field("Offset", _SecondOffset.vectorValue);
                    if(EditorGUI.EndChangeCheck()){
                        _SecondOffset.vectorValue = _SecondOffsetVec;
                    }
                }
                EditorGUILayout.Space();
                EditorGUILayout.Space();
                GUILayout.Label("MatCap", EditorStyles.boldLabel);
                materialEditor.ShaderProperty(_useMatCap,Styles.MatCap);
                if(_useMatCap.floatValue == 1.0){
                    materialEditor.TexturePropertySingleLine(new GUIContent("MatCap"), _MatCapTex);
                    materialEditor.RangeProperty(_matcapIntensity, "Intensity");
                }                
            }
        }
        //**************************************************
        //****** Noise 1 ***********************************
        //**************************************************
        EditorGUILayout.Space();
        EditorGUILayout.Space();

        SetFoldout(ref _noise1Foldout, "Noise 1");
        if(_noise1Foldout)
        {
            //EditorGUILayout.LabelField("Noise 1");
            using (new EditorGUILayout.VerticalScope("HelpBox")){
                //Noise1
                GUILayout.Label("Noise 1", EditorStyles.boldLabel);
                materialEditor.ShaderProperty(_useNoise1,Styles.Noise1);
                if(_useNoise1.floatValue == 1.0){
                    materialEditor.TexturePropertySingleLine(new GUIContent("Noise Tex 1"), _Noise1);

                    EditorGUI.BeginChangeCheck();

                    Vector4 _NoiseVec2Tiling = EditorGUILayout.Vector2Field("Noise 1 Tiling", _Noise1Tiling.vectorValue);
                    Vector4 _NoiseVec2 = EditorGUILayout.Vector2Field("Noise 1 Panning", _Noise1Panning.vectorValue);
                
                    if(EditorGUI.EndChangeCheck()){
                        _Noise1Tiling.vectorValue = _NoiseVec2Tiling;
                        _Noise1Panning.vectorValue = _NoiseVec2;
                    }
                    materialEditor.RangeProperty(_Noise1Power, "Noise Power");
                    materialEditor.ShaderProperty(_isNoise1Polar,Styles.polarUV);
                    if(_isNoise1Polar.floatValue == 1.0){
                        materialEditor.RangeProperty(_Noise1ShearX, "Shear X");
                        materialEditor.RangeProperty(_Noise1ShearY, "Shear Y");
                    }
                }
            }
        }
        //**************************************************
        //****** Noise 2 ***********************************
        //**************************************************
        EditorGUILayout.Space();
        EditorGUILayout.Space();
        SetFoldout(ref _noise2Foldout, "Noise 2");
        if(_noise2Foldout){

            //EditorGUILayout.LabelField("Noise 2");
            using (new EditorGUILayout.VerticalScope("HelpBox")){
                //Noise2
                GUILayout.Label("Noise 2", EditorStyles.boldLabel);
                materialEditor.ShaderProperty(_useNoise2,Styles.Noise2);
                if(_useNoise2.floatValue == 1.0){
                    materialEditor.TexturePropertySingleLine(new GUIContent("Noise Tex 2"), _Noise2);

                    EditorGUI.BeginChangeCheck();

                    Vector4 _NoiseVec2Tiling = EditorGUILayout.Vector2Field("Noise 2 Tiling", _Noise2Tiling.vectorValue);
                    Vector4 _NoiseVec2 = EditorGUILayout.Vector2Field("Noise 2 Panning", _Noise2Panning.vectorValue);
                
                    if(EditorGUI.EndChangeCheck()){
                        _Noise2Tiling.vectorValue = _NoiseVec2Tiling;
                        _Noise2Panning.vectorValue = _NoiseVec2;
                    }
                    materialEditor.RangeProperty(_Noise2Power, "Noise Power");
                    materialEditor.ShaderProperty(_isNoise2Polar,Styles.polarUV);
                    if(_isNoise2Polar.floatValue == 1.0){
                        materialEditor.RangeProperty(_Noise2ShearX, "Shear X");
                        materialEditor.RangeProperty(_Noise2ShearY, "Shear Y");
                    }
                    materialEditor.ShaderProperty(_isSubtract,Styles.subtract);
                }
            }
        }
        //**************************************************
        //****** UV Distortion *****************************
        //**************************************************
        EditorGUILayout.Space();
        EditorGUILayout.Space();
        SetFoldout(ref _distortFoldout, "UV Distortion");
        if(_distortFoldout){

            //EditorGUILayout.LabelField("UV Distortion");
            using (new EditorGUILayout.VerticalScope("HelpBox")){
                //UV Distortion
                GUILayout.Label("UV Distort 1", EditorStyles.boldLabel);
                materialEditor.ShaderProperty(_isUVDistortion,Styles.distort);
                if(_isUVDistortion.floatValue == 1.0){
                    materialEditor.ShaderProperty(_useGenerateNoise1,Styles.useGenNoise1);
                    if(_useGenerateNoise1.floatValue == 1.0){
                        EditorGUI.BeginChangeCheck();

                        Vector4 _DistortTileVec2 = EditorGUILayout.Vector2Field("UV Distort 1 Tiling", _UVDistortTiling.vectorValue);
                        Vector4 _DistortVec2 = EditorGUILayout.Vector2Field("UV Distort 1 Panning", _UVDistortPanning.vectorValue);
                
                        if(EditorGUI.EndChangeCheck()){
                            _UVDistortTiling.vectorValue =  _DistortTileVec2;
                            _UVDistortPanning.vectorValue = _DistortVec2;
                        }
                        materialEditor.FloatProperty(_GenerateNoise1Strength, "Noise Strength");
                    }else {
                        EditorGUI.BeginChangeCheck();

                        Vector4 _DistortTileVec2 = EditorGUILayout.Vector2Field("UV Distort 1 Tiling", _UVDistortTiling.vectorValue);
                        Vector4 _DistortVec2 = EditorGUILayout.Vector2Field("UV Distort 1 Panning", _UVDistortPanning.vectorValue);
                
                        if(EditorGUI.EndChangeCheck()){
                            _UVDistortTiling.vectorValue =  _DistortTileVec2;
                            _UVDistortPanning.vectorValue = _DistortVec2;
                        }

                        materialEditor.TexturePropertySingleLine(new GUIContent("UV Distortion 1 Map"), _UVDistortionMap);
                    }
                    materialEditor.RangeProperty(_UVDistortIntensity, "Distort Intensity");
                }

                EditorGUILayout.Space();
                EditorGUILayout.Space();

                //UV Distortion 2
                GUILayout.Label("UV Distort 2", EditorStyles.boldLabel);
                materialEditor.ShaderProperty(_isUVDistortion2,Styles.distort2);
                if(_isUVDistortion2.floatValue == 1.0){
                    materialEditor.ShaderProperty(_useGenerateNoise2,Styles.useGenNoise1);
                    if(_useGenerateNoise2.floatValue == 1.0){
                        EditorGUI.BeginChangeCheck();

                        Vector4 _DistortTileVec2 = EditorGUILayout.Vector2Field("UV Distort 2 Tiling", _UVDistort2Tiling.vectorValue);
                        Vector4 _DistortVec2 = EditorGUILayout.Vector2Field("UV Distort 2 Panning", _UVDistortion2Panning.vectorValue);
                
                        if(EditorGUI.EndChangeCheck()){
                            _UVDistort2Tiling.vectorValue =  _DistortTileVec2;
                            _UVDistortion2Panning.vectorValue = _DistortVec2;
                        }
                        materialEditor.FloatProperty(_GenerateNoise2Strength, "Noise Strength");
                    }else {
                        EditorGUI.BeginChangeCheck();

                        Vector4 _DistortTileVec2 = EditorGUILayout.Vector2Field("UV Distort 2 Tiling", _UVDistort2Tiling.vectorValue);
                        Vector4 _DistortVec2 = EditorGUILayout.Vector2Field("UV Distort 2 Panning", _UVDistortion2Panning.vectorValue);
                
                        if(EditorGUI.EndChangeCheck()){
                            _UVDistort2Tiling.vectorValue =  _DistortTileVec2;
                            _UVDistortion2Panning.vectorValue = _DistortVec2;
                        }

                        materialEditor.TexturePropertySingleLine(new GUIContent("UV Distortion 2 Map"), _UVDistortion2Map);
                    }
                    materialEditor.RangeProperty(_Distortion2Intensity, "Distort Intensity");
                }

                EditorGUILayout.Space();
                EditorGUILayout.Space();

                //Dissolve Distort
                GUILayout.Label("Dissolve Distort", EditorStyles.boldLabel);
                materialEditor.ShaderProperty(_isUVDistortionD,Styles.distortD);
                if(_isUVDistortionD.floatValue == 1.0){
                    materialEditor.ShaderProperty(_useGenerateNoiseD,Styles.useGenNoise1);
                    if(_useGenerateNoiseD.floatValue == 1.0){
                        EditorGUI.BeginChangeCheck();

                        Vector4 _DistortTileVec2 = EditorGUILayout.Vector2Field("Dissolve Distort Tiling", _UVDistortDTiling.vectorValue);
                        Vector4 _DistortVec2 = EditorGUILayout.Vector2Field("Dissolve Distort Panning", _UVDistortionDPanning.vectorValue);
                
                        if(EditorGUI.EndChangeCheck()){
                            _UVDistortDTiling.vectorValue = _DistortTileVec2;
                            _UVDistortionDPanning.vectorValue = _DistortVec2;
                        }
                        materialEditor.FloatProperty(_GenerateNoiseDStrength, "Noise Strength");
                    }else {
                        EditorGUI.BeginChangeCheck();

                        Vector4 _DistortTileVec2 = EditorGUILayout.Vector2Field("Dissolve Distort Tiling", _UVDistortDTiling.vectorValue);
                        Vector4 _DistortVec2 = EditorGUILayout.Vector2Field("Dissolve Distort Panning", _UVDistortionDPanning.vectorValue);
                
                        if(EditorGUI.EndChangeCheck()){
                            _UVDistortDTiling.vectorValue = _DistortTileVec2;
                            _UVDistortionDPanning.vectorValue = _DistortVec2;
                        }

                        materialEditor.TexturePropertySingleLine(new GUIContent("Dissolve Distortion Map"), _UVDistortionDMap);
                    }
                    materialEditor.RangeProperty(_DistortionDIntensity, "Distort Intensity");
                }

            }
        }
        //**************************************************
        //****** Dissolve **********************************
        //**************************************************
        EditorGUILayout.Space();
        EditorGUILayout.Space();
        SetFoldout(ref _dissolveFoldout, "Dissolve");
        if(_dissolveFoldout){

            //EditorGUILayout.LabelField("Dissolve");
            using (new EditorGUILayout.VerticalScope("HelpBox")){
                //Dissolve
                GUILayout.Label("Dissolve", EditorStyles.boldLabel);
                materialEditor.ShaderProperty(_useDissolve,Styles.useDissolve);
                if(_useDissolve.floatValue == 1.0){
                    materialEditor.TexturePropertySingleLine(new GUIContent("Dissolve Map"), _DissolveMap);

                    EditorGUI.BeginChangeCheck();
                    Vector4 _TilingVec2 = EditorGUILayout.Vector2Field("Tiling", _DissolveTiling.vectorValue);
                    Vector4 _PanningVec2 = EditorGUILayout.Vector2Field("Panning", _DissolvePanning.vectorValue);
                    

                    materialEditor.RangeProperty(_EdgeWidth, "Edge Width");
                    materialEditor.ShaderProperty(_EdgeColor, "Edge Color");
                    materialEditor.ShaderProperty(_isCustomDataDissolve,Styles.customDissolve);
                    GUILayout.Label("(CustomData2.w)", EditorStyles.label);
                    if(EditorGUI.EndChangeCheck()){
                        _DissolveTiling.vectorValue = _TilingVec2;
                        _DissolvePanning.vectorValue = _PanningVec2;
                    }
                    

                    if(_isCustomDataDissolve.floatValue == 0.0){
                        materialEditor.ShaderProperty(_isLifetimeDissolve,Styles.dissolve);
                        if(_isLifetimeDissolve.floatValue == 1.0){
                            materialEditor.RangeProperty(_StartDissolve, "Start Dissolve");
                        }else {
                            materialEditor.RangeProperty(_Threshold, "Threshold");
                        }
                    }
                    materialEditor.ShaderProperty(_isDissolvePolar,Styles.polarUV);
                    if(_isDissolvePolar.floatValue == 1.0){
                        materialEditor.RangeProperty(_DissolveShearX, "Shear X");
                        materialEditor.RangeProperty(_DissolveShearY, "Shear Y");
                    }
                }

                EditorGUILayout.Space();
                EditorGUILayout.Space();

                //Alpha Fade
                GUILayout.Label("Alpha Fade（Dissolveとの併用非推奨）", EditorStyles.boldLabel);
                materialEditor.ShaderProperty(_useAlphaFade,Styles.AlphaFade);
                if(_useAlphaFade.floatValue == 1.0){

                    materialEditor.ShaderProperty(_useGeneNoise4AF,Styles.useGenNoise1);
                    if(_useGeneNoise4AF.floatValue == 1.0){
                        materialEditor.FloatProperty(_AFNoiseStrength, "Strength");
                        materialEditor.RangeProperty(_AFNoisePower, "Power");
                    }else {
                        materialEditor.TexturePropertySingleLine(new GUIContent("AlphaFade Map"), _AlphaFadeMap);
                    }
                    EditorGUI.BeginChangeCheck();
                    Vector4 _TilingVec2 = EditorGUILayout.Vector2Field("Tiling", _DissolveTiling.vectorValue);
                    Vector4 _PanningVec2 = EditorGUILayout.Vector2Field("Panning", _DissolvePanning.vectorValue);
                    if(EditorGUI.EndChangeCheck()){
                        _DissolveTiling.vectorValue = _TilingVec2;
                        _DissolvePanning.vectorValue = _PanningVec2;
                    }

                    materialEditor.ShaderProperty(_isCustomDataAlphaFade,Styles.customDissolve);
                    GUILayout.Label("(CustomData2.w)", EditorStyles.label);
                    if(_isCustomDataAlphaFade.floatValue == 0.0){
                        materialEditor.ShaderProperty(_isLifetimeAlphaFade,Styles.dissolve);
                        if(_isLifetimeAlphaFade.floatValue == 1.0){
                            materialEditor.RangeProperty(_StartAlphaFade, "Start AlphaFade");
                        }else {
                            materialEditor.RangeProperty(_AlphaFadeThreshold, "Threshold");
                        }
                    }
                }


                EditorGUILayout.Space();
                EditorGUILayout.Space();

                //TrailEdge Dissolve
                GUILayout.Label("TrailEdge Dissolve", EditorStyles.boldLabel);
                materialEditor.ShaderProperty(_isTrailEdgeDissolve,Styles.trailEdgeDissolve);
                if(_isTrailEdgeDissolve.floatValue == 1.0){
                    materialEditor.TexturePropertySingleLine(new GUIContent("TrailEdge Dissolve Map"), _TrailEdgeDissolveMap);
                    Vector4 _TrailTilingVec2 = EditorGUILayout.Vector2Field("Tiling", _TrailEdgeDissolveTilling.vectorValue);
                    Vector4 _TrailPanningVec2 = EditorGUILayout.Vector2Field("Panning", _TrailEdgeDissolveScroll.vectorValue);

                    materialEditor.RangeProperty(_TrailEdgeDissolveNoisePower,"Power");
                    materialEditor.RangeProperty(_TrailEdgeDissolveLength,"Length");
                    materialEditor.RangeProperty(_TrailEdgeDissolveThreshold,"Threshold");
                    materialEditor.ShaderProperty(_isBothDissolve,Styles.bothDissolve);

                    if(EditorGUI.EndChangeCheck()){
                        _TrailEdgeDissolveTilling.vectorValue = _TrailTilingVec2;
                        _TrailEdgeDissolveScroll.vectorValue = _TrailPanningVec2;
                    }
                }
                
            }
        }
        //**************************************************
        //****** Fresnel ***********************************
        //**************************************************
        EditorGUILayout.Space();
        EditorGUILayout.Space();
        SetFoldout(ref _fresnelFoldout, "Fresnel");
        if(_fresnelFoldout){
            using (new EditorGUILayout.VerticalScope("HelpBox")){
                GUILayout.Label("Fresnel", EditorStyles.boldLabel);
                //Fresnel
                materialEditor.ShaderProperty(_useFresnel,Styles.fresnel);
                if(_useFresnel.floatValue == 1.0){
                    materialEditor.FloatProperty(_FresnelWidth, "Width");
                    materialEditor.FloatProperty(_FresnelIntensity, "Intensity");
                    materialEditor.ShaderProperty(_isFresnelInverse,Styles.inverse);
                    
                }
            }
        }

        //**************************************************
        //****** Chromatic Caustics ************************
        //**************************************************
        EditorGUILayout.Space();
        EditorGUILayout.Space();
        SetFoldout(ref _ChromaticCausticsFoldout, "Chromatic Caustics");
        if(_ChromaticCausticsFoldout){
            using (new EditorGUILayout.VerticalScope("HelpBox")){
                GUILayout.Label("Chromatic Caustics (高負荷！！)", EditorStyles.boldLabel);
                //Chromatic Caustics
                materialEditor.ShaderProperty(_useCACaustics,Styles.CACaustics);
                if(_useCACaustics.floatValue == 1.0){

                    EditorGUI.BeginChangeCheck();
                    materialEditor.RangeProperty(_VoronoiIntensity, "Intensity");
                    materialEditor.FloatProperty(_VoronoiScale, "Voronoi Scale");
                    Vector4 _VoronoiPanningVec2 = EditorGUILayout.Vector2Field("Voronoi Panning", _VoronoiPanning.vectorValue);
                    materialEditor.FloatProperty(_VoronoiAngleSpeed, "Voronoi Angle Speed");
                    materialEditor.RangeProperty(_VoronoiPower, "Voronoi Power");
                    materialEditor.RangeProperty(_ChromaticAberration, "Chromatic Aberration");

                    EditorGUILayout.Space();

                    Vector4 _NoiseTilingVec2 = EditorGUILayout.Vector2Field("Noise Tiling", _CausticsNoiseTiling.vectorValue);
                    Vector4 _NoisePanningVec2 = EditorGUILayout.Vector2Field("Noise Panning", _CausticsNoisePanning.vectorValue);
                    materialEditor.FloatProperty(_CausticsNoiseScale, "Noise Scale");
                    materialEditor.RangeProperty(_CausticsNoiseIntensity, "Noise Strength");

                    if(EditorGUI.EndChangeCheck()){
                        _VoronoiPanning.vectorValue = _VoronoiPanningVec2;
                        _CausticsNoiseTiling.vectorValue = _NoiseTilingVec2;
                        _CausticsNoisePanning.vectorValue = _NoisePanningVec2;
                    }
                }
                EditorGUILayout.Space();
            }
        }
        //**************************************************
        //****** Shader Shapes ***************************
        //**************************************************
        EditorGUILayout.Space();
        EditorGUILayout.Space();
        SetFoldout(ref _shaderShapeFoldout, "Shader Shapes");
        if(_shaderShapeFoldout){
            using (new EditorGUILayout.VerticalScope("HelpBox")){
                GUILayout.Label("Shader Shapes", EditorStyles.boldLabel);
                //Dust
                if(_useCircle.floatValue == 0.0 && _useGlitter.floatValue  == 0.0 && _useGradientMask.floatValue == 0.0){
                    materialEditor.ShaderProperty(_useDust,Styles.Dust);
                
                    if(_useDust.floatValue == 1.0){
                        
                        materialEditor.RangeProperty(_Size, "Size");
                        materialEditor.RangeProperty(_CenterSize, "Center Size");
                        materialEditor.RangeProperty(_CenterStrength, "Center Intensity");
                        materialEditor.RangeProperty(_OutsideSize, "Outside Size");
                        materialEditor.RangeProperty(_OutsideStrength, "Outside Intensity");
                    }
                    EditorGUILayout.Space();
                }

                //Circle
                if(_useDust.floatValue == 0.0 && _useGlitter.floatValue  == 0.0 && _useGradientMask.floatValue == 0.0 ){
                    materialEditor.ShaderProperty(_useCircle,Styles.Circle);
                    if(_useCircle.floatValue == 1.0){
                        
                        materialEditor.RangeProperty(_CircleWidth, "Circle Width");
                    }
                    EditorGUILayout.Space();
                }

                //Glitter
                if(_useDust.floatValue == 0.0 && _useCircle.floatValue  == 0.0 && _useGradientMask.floatValue == 0.0 ){
                    materialEditor.ShaderProperty(_useGlitter,Styles.Glitter);
                    EditorGUILayout.Space();
                }

                //Gradient Mask
                if(_useDust.floatValue == 0.0 && _useCircle.floatValue  == 0.0 && _useGlitter.floatValue  == 0.0 ){
                    materialEditor.ShaderProperty(_useGradientMask, Styles.Gradient);
                    if(_useGradientMask.floatValue == 1.0){
                        
                        EditorGUI.BeginChangeCheck();
                        materialEditor.TexturePropertySingleLine(new GUIContent("Noise Map"), _GradientNoiseMap);
                        Vector4 _TrailTilingVec2 = EditorGUILayout.Vector2Field("Tiling", _GradientMaskTilling.vectorValue);
                        Vector4 _TrailPanningVec2 = EditorGUILayout.Vector2Field("Panning", _GradientMaskPanning.vectorValue);
                        materialEditor.RangeProperty(_MaskNoisePower, "Power");

                        EditorGUILayout.Space();
                        materialEditor.RangeProperty(_HorizontalLength, "Horizontal Length");
                        //materialEditor.RangeProperty(_HorizontalBorder, "Horizontal Border");

                        materialEditor.RangeProperty(_VerticalLength, "Vertical Length");
                        //materialEditor.RangeProperty(_VerticalBorder, "Vertical Border");

                        if(EditorGUI.EndChangeCheck()){
                            _GradientMaskTilling.vectorValue = _TrailTilingVec2;
                            _GradientMaskPanning.vectorValue = _TrailPanningVec2;
                        }
                        EditorGUILayout.Space();
                         
                    }
                }
            }
        }


        //**************************************************
        //****** Vertex Offset *****************************
        //**************************************************
        EditorGUILayout.Space();
        EditorGUILayout.Space();
        SetFoldout(ref _vertexOffsetFoldout, "Vertex Offset");
        if(_vertexOffsetFoldout){
            using (new EditorGUILayout.VerticalScope("HelpBox")){
                GUILayout.Label("Vertex Offset", EditorStyles.boldLabel);
                //Vertex Offset
                materialEditor.ShaderProperty(_useVertexOffset,Styles.VertexOffset);
                if(_useVertexOffset.floatValue == 1.0){
                    materialEditor.TexturePropertySingleLine(new GUIContent("Noise Tex"), _VertexNoiseTex);
                    
                    Vector4 _NoiseTilingVec2 = EditorGUILayout.Vector2Field("Noise Tiling", _VertexNoiseTiling.vectorValue);
                    Vector4 _NoisePanningVec2 = EditorGUILayout.Vector2Field("Noise Panning", _VertexNoisePanning.vectorValue);

                    materialEditor.FloatProperty(_VertexIntensity, "Intensity");
                    materialEditor.RangeProperty(_VertexBorder, "Boarder");
                    if(EditorGUI.EndChangeCheck()){
                        _VertexNoiseTiling.vectorValue = _NoiseTilingVec2;
                        _VertexNoisePanning.vectorValue = _NoisePanningVec2;
                    }
                }
                EditorGUILayout.Space();
            }
        }

        //**************************************************
        //****** Fade **************************************
        //**************************************************
        EditorGUILayout.Space();
        EditorGUILayout.Space();
        SetFoldout(ref _softParticleFoldout, "Fade");
        if(_softParticleFoldout){
            using (new EditorGUILayout.VerticalScope("HelpBox")){
                GUILayout.Label("Soft Particle", EditorStyles.boldLabel);
                //Soft Particle
                materialEditor.ShaderProperty(_isSoftParticle,Styles.softParticle);
                if(_isSoftParticle.floatValue == 1.0){
                    materialEditor.RangeProperty(_SoftParticle, "Intensity");
                }
                    EditorGUILayout.Space();
                    EditorGUILayout.Space();
                    GUILayout.Label("Camera Fade", EditorStyles.boldLabel);
                    materialEditor.ShaderProperty(_isCameraFade,Styles.cameraFade);
                if(_isCameraFade.floatValue == 1.0){
                    materialEditor.RangeProperty(_FadeStart, "Fade Start");
                    materialEditor.RangeProperty(_FadeEnd, "Fade End");
                }
                EditorGUILayout.Space();
            }
        }

        //**************************************************
        //****** Rendering Settings ************************
        //**************************************************
        EditorGUILayout.Space();
        EditorGUILayout.Space();
        SetFoldout(ref _otherFoldout, "Other");
        if(_otherFoldout){
            using (new EditorGUILayout.VerticalScope("HelpBox"))
            {
                GUILayout.Label("Rendering Settings", EditorStyles.boldLabel);
                materialEditor.ShaderProperty(_Cull, "Cull Mode");
                materialEditor.ShaderProperty(_ZWrite, "ZWrite");
                materialEditor.ShaderProperty(_ZTest, "ZTest");

                //materialEditor.ShaderProperty(_Blending, "Blend Mode");
                materialEditor.ShaderProperty(_SrcBlend, "Source Blend");
                materialEditor.ShaderProperty(_DstBlend, "Destination Blend");
                EditorGUILayout.Space();
                EditorGUILayout.Space();

                //Stencil
                GUILayout.Label("Stencil", EditorStyles.boldLabel);
                materialEditor.FloatProperty(_Ref, "Reference");
                materialEditor.ShaderProperty(_Pass, "Pass");
                materialEditor.ShaderProperty(_Comp, "Compare");
                EditorGUILayout.Space();
            }

            EditorGUILayout.Space();
            EditorGUILayout.Space();

            using (new EditorGUILayout.VerticalScope("HelpBox")){
                //for Animation
                GUILayout.Label("for Animation", EditorStyles.boldLabel);
                materialEditor.RangeProperty(_EmissionIntensity, "Emission Intensity");
            }

            //スペースを開ける
            EditorGUILayout.Space();
            EditorGUILayout.Space();
            using (new EditorGUILayout.VerticalScope("HelpBox")){
                //CustomVertexStreams
                GUILayout.Label("CustomVertexStreams", EditorStyles.boldLabel);
                materialEditor.RangeProperty(_RandomMul,"Random Scroll Ratio X");
                materialEditor.RangeProperty(_RandomMulY,"Random Scroll Ratio Y");
            }
        }

        EditorGUILayout.Space();
        EditorGUILayout.Space();

        List<ParticleSystemVertexStream> streams = new List<ParticleSystemVertexStream>();
        streams.Add(ParticleSystemVertexStream.Position);
        streams.Add(ParticleSystemVertexStream.Normal);
        streams.Add(ParticleSystemVertexStream.Color);
        streams.Add(ParticleSystemVertexStream.UV);
        streams.Add(ParticleSystemVertexStream.StableRandomXY);
        streams.Add(ParticleSystemVertexStream.Custom1XYZW);
        streams.Add(ParticleSystemVertexStream.AgePercent);
        streams.Add(ParticleSystemVertexStream.Custom2XYZW);
            
        string warnings = "";
		List<ParticleSystemVertexStream> rendererStreams = new List<ParticleSystemVertexStream>();
		foreach (ParticleSystemRenderer renderer in m_RenderersUsingThisMaterial)
        {
			if (renderer != null)
            {
			    renderer.GetActiveVertexStreams(rendererStreams);
                renderer.GetActiveTrailVertexStreams(rendererStreams);
			    bool streamsValid = rendererStreams.SequenceEqual(streams);
			    if (!streamsValid) warnings += "  " + renderer.name + "\n";
			}
		}
        EditorGUI.BeginChangeCheck();
        // Vertex Stream Handler
		if (warnings != "")
        {
			EditorGUILayout.HelpBox("Incorrect or missing vertex streams detected:\n" + warnings, MessageType.Warning, true);
			if (GUILayout.Button(applyStreamsText, EditorStyles.miniButton))
            {
				foreach (ParticleSystemRenderer renderer in m_RenderersUsingThisMaterial)
                {
					if (renderer != null)
                    {
						if (renderer != null)
                        {
							renderer.SetActiveVertexStreams(streams);
                            renderer.SetActiveTrailVertexStreams(streams);

                            //CustomDataの設定
                            var particle = renderer.GetComponent<ParticleSystem>();
                            var customData = particle.customData;
                            customData.enabled = true;

                            
                            particle.GetCustomParticleData(customValue, ParticleSystemCustomData.Custom2);

                            //CustomData1の設定
                            customData.SetMode(ParticleSystemCustomData.Custom1, UnityEngine.ParticleSystemCustomDataMode.Color);
                            //CustomData2の設定
                            customData.SetMode(ParticleSystemCustomData.Custom2, UnityEngine.ParticleSystemCustomDataMode.Vector);

                            for(int i = 0; i < customValue.Count; i++){
                                if(customValue[i].z == 0.0f){
                                customData.SetVector(ParticleSystemCustomData.Custom2, 2, 1f);
                                } else {
                                customData.SetVector(ParticleSystemCustomData.Custom2, 2, customValue[i].z);
                                }
                            }
                            
                            
                            
                            
                        }
					}
				}

                
			}
			EditorGUILayout.Space();
		}

        EditorGUILayout.Space();
        EditorGUILayout.Space();
        void SetFoldout(ref bool foldoutSettings, string title)
        {
            using (new EditorGUILayout.VerticalScope(boxStyle))
            {
                foldoutSettings = EditorGUILayout.Foldout(foldoutSettings, title, true, foldoutStyle);
            }

        }

        void SetFoldoutWithButton(ref bool foldoutSettings, string title, MaterialEditor materialEditor, MaterialProperty materialProperty)
        {
            using (new EditorGUILayout.VerticalScope(boxStyle))
            {
                using (new EditorGUILayout.HorizontalScope())
                {
                    // Foldout
                    foldoutSettings = EditorGUILayout.Foldout(foldoutSettings, title, true, foldoutStyle);
                    EditorGUILayout.LabelField("", GUILayout.Width(55));
                    materialEditor.ShaderProperty(materialProperty, GUIContent.none);
                }
            }
        }
    
        materialEditor.RenderQueueField();
        void CacheRenderersUsingThisMaterial(Material material){
		    m_RenderersUsingThisMaterial.Clear();

		    ParticleSystemRenderer[] renderers = UnityEngine.Object.FindObjectsOfType(typeof(ParticleSystemRenderer)) as ParticleSystemRenderer[];
		    foreach (ParticleSystemRenderer renderer in renderers)
		    {
			    if (renderer.sharedMaterial == material)
				    m_RenderersUsingThisMaterial.Add(renderer);
		    }
	    }
        
    }

    protected static class Styles{
        public static readonly GUIContent secondMask = new GUIContent("Use Second Mask");
        public static readonly GUIContent customColor = new GUIContent("Use CustomData Color");
        public static readonly GUIContent customOffset = new GUIContent("Use CustomData Offset");
        public static readonly GUIContent customIntensity = new GUIContent("Use CustomData Intensity");
        public static readonly GUIContent MatCap = new GUIContent("Use MatCap");
        public static readonly GUIContent polarUV = new GUIContent("Use PolarUV");
        public static readonly GUIContent Noise1 = new GUIContent("Use Noise1");
        public static readonly GUIContent Noise2 = new GUIContent("Use Noise2");
        public static readonly GUIContent useDissolve = new GUIContent("Use Dissolve");
        public static readonly GUIContent AlphaFade = new GUIContent("Use AlphaFade");

        public static readonly GUIContent distort = new GUIContent("Enable UVDistort 1");
        public static readonly GUIContent distort2 = new GUIContent("Enable UVDistort 2");
        public static readonly GUIContent useGenNoise1 = new GUIContent("Use Generate Noise");
        public static readonly GUIContent distortD = new GUIContent("Enable DissolveUVDistort");

        public static readonly GUIContent fresnel = new GUIContent("Use Fresnel");
        public static readonly GUIContent inverse = new GUIContent("Inverse");

        public static readonly GUIContent CACaustics = new GUIContent("Use Chromatic Caustics");

        public static readonly GUIContent Dust = new GUIContent("Use Dust Shape");
        public static readonly GUIContent Circle = new GUIContent("Use Circle Shape");
        public static readonly GUIContent Glitter = new GUIContent("Use Glitter Shape");
        public static readonly GUIContent Gradient = new GUIContent("Use Gradient Shape");

        public static readonly GUIContent VertexOffset = new GUIContent("Use Vertex Offset");

        public static readonly GUIContent softParticle = new GUIContent("Enable Soft Particle");
        public static readonly GUIContent cameraFade = new GUIContent("Enable Camera Fade");

        public static readonly GUIContent customDissolve = new GUIContent("Use CustomData");
        public static readonly GUIContent dissolve = new GUIContent("Enable Lifetime Dissolve");
        public static readonly GUIContent trailEdgeDissolve = new GUIContent("Use Trail Edge Dissolve");
        public static readonly GUIContent bothDissolve = new GUIContent("is Both Side Dissolve");

        public static readonly GUIContent subtract = new GUIContent("is Noise Subtract");
        public static readonly GUIContent blink = new GUIContent("is Blinking Emission");

        public static readonly GUIContent instancing = new GUIContent("Enable GPU Instancing");

        public static GUIContent streamApplyToAllSystemsText = EditorGUIUtility.TrTextContent("Apply to Systems", "Apply the vertex stream layout to all Particle Systems using this material");
    }
}
