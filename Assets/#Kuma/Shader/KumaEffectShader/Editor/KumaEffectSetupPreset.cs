using UnityEditor;
using UnityEngine;
using System.IO;

public class KumaEffectSetupPreset : EditorWindow
{
    static string fileName = "KumaEffectSetupPreset t:Script";

    static ParticleSystem importParticle;
    static ParticleSystem.MinMaxCurve startLifetime = KumaEffectShaderGUI.presetStartLifetime;
    static ParticleSystem.MinMaxCurve startSpeed = KumaEffectShaderGUI.presetStartSpeed;
    static ParticleSystem.MinMaxCurve startSize = KumaEffectShaderGUI.presetStartSize;
    static float gravity = KumaEffectShaderGUI.presetGravity.constant;
    static float rateOverTime  = KumaEffectShaderGUI.presetRateOverTime;
    static float radius;
    [Range(0.0f,1.0f)]
    static float radiusThickness = 1.0f;
    static ParticleSystem.MinMaxCurve sizeOverLifetime = KumaEffectShaderGUI.presetSizeOverLifetime;

    UnityEngine.GUIContent[] list =  new[]
    {
        new UnityEngine.GUIContent("Constant"),
        new UnityEngine.GUIContent("Curve"),
        new UnityEngine.GUIContent("Random Between Two Constants"),
        new UnityEngine.GUIContent("Random Between Two Curves")
    };
    UnityEngine.GUIContent[] listNoConst =  new[]
    {
        new UnityEngine.GUIContent("Curve"),
        new UnityEngine.GUIContent("Random Between Two Curves")
    };
    UnityEngine.GUIContent[] listShape = new[]{
        new UnityEngine.GUIContent("Cone"),
        new UnityEngine.GUIContent("Hemisphere"),
        new UnityEngine.GUIContent("Sphere"),
        new UnityEngine.GUIContent("Donut"),
        new UnityEngine.GUIContent("Circle")
    };
    static int selectedStartLifetime;
    static int selectedStartSpeed;
    static int selectedStartSize;
    static int selectedSizeOverLifetime;
    static int selectedShape;
    public static string defaultPrefabPath = "Assets/#Kuma/Shader/KumaEffectShader/Editor/PresetPrefab/Default.prefab";
    static string preset1PrefabPath;
    static string preset2PrefabPath;
    static string preset3PrefabPath;
    //スクロール位置
    private Vector2 _scrollPosition = Vector2.zero;
    
    void OnEnable(){
        // このスクリプト自身のアセットパスを取得
        string[] guids = AssetDatabase.FindAssets(fileName);
        string scriptPath = AssetDatabase.GUIDToAssetPath(guids[0]);
        scriptPath = scriptPath.Replace("KumaEffectSetupPreset.cs","");
        defaultPrefabPath = scriptPath + "PresetPrefab/Default.prefab";
        preset1PrefabPath = scriptPath + "PresetPrefab/Preset1.prefab";
        preset2PrefabPath = scriptPath + "PresetPrefab/Preset2.prefab";
        preset3PrefabPath = scriptPath + "PresetPrefab/Preset3.prefab";
        ShowWindow();
    }

    [MenuItem("#Kuma/KumaEffect Setup Preset")]
    public static void ShowWindow()
    {
        GetWindow<KumaEffectSetupPreset>("KumaEffect Preset");
        //Prefabをロードして初期値を取得
        LoadPrefab();
        //初期値の設定
        switch((int)KumaEffectShaderGUI.presetStartLifetime.mode){
            case 0:
                //Constant
                selectedStartLifetime = 0;
                break;
            case 1:
                //Curve
                selectedStartLifetime = 1;
                break;
            
            case 2:
                //TwoConstants
                selectedStartLifetime = 3;
                break;
                
            case 3:
                //TwoCurves
                selectedStartLifetime = 2;
                break;
        }
        switch((int)KumaEffectShaderGUI.presetStartSpeed.mode){
            case 0:
                //Constant
                selectedStartSpeed = 0;
                break;
            case 1:
                //Curve
                selectedStartSpeed = 1;
                break;
            
            case 2:
                //TwoConstants
                selectedStartSpeed = 3;
                break;
                
            case 3:
                //TwoCurves
                selectedStartSpeed = 2;
                break;
        }
        switch((int)KumaEffectShaderGUI.presetStartSize.mode){
            case 0:
                //Constant
                selectedStartSize = 0;
                break;
            case 1:
                //Curve
                selectedStartSize = 1;
                break;
            
            case 2:
                //TwoConstants
                selectedStartSize = 3;
                break;
                
            case 3:
                //TwoCurves
                selectedStartSize = 2;
                break;
        }
        switch((int)KumaEffectShaderGUI.presetStartLifetime.mode){
            case 0:
                //Constant
                selectedStartLifetime = 0;
                break;
            case 1:
                //Curve
                selectedStartLifetime = 1;
                break;
            
            case 2:
                //TwoConstants
                selectedStartLifetime = 3;
                break;
                
            case 3:
                //TwoCurves
                selectedStartLifetime = 2;
                break;
        }
        switch((int)KumaEffectShaderGUI.presetSizeOverLifetime.mode){
            case 0:
                //Constant
                selectedSizeOverLifetime = 5;
                break;
            case 1:
                //Curve
                selectedSizeOverLifetime = 0;
                break;
            
            case 2:
                //TwoCurves
                selectedSizeOverLifetime = 1;
                break;
                
            case 3:
                //TwoConstants
                selectedSizeOverLifetime = 5;
                break;
        }
    }

    void OnGUI()
    {
        _scrollPosition = EditorGUILayout.BeginScrollView(_scrollPosition);

        importParticle = (ParticleSystem)EditorGUILayout.ObjectField(
            "Particle System",
            importParticle,
            typeof(ParticleSystem),
            true
        );

        EditorGUILayout.Space();

        if (GUILayout.Button("Particleをインポート"))
        {
            ImportParticle(importParticle);
            KumaEffectShaderGUI.presetStartLifetime = importParticle.main.startLifetime;
            KumaEffectShaderGUI.presetStartSpeed = importParticle.main.startSpeed;
            KumaEffectShaderGUI.presetStartSize = importParticle.main.startSize;
            KumaEffectShaderGUI.presetGravity = importParticle.main.gravityModifier;
            KumaEffectShaderGUI.presetRateOverTime = importParticle.emission.rateOverTime.constant;
            KumaEffectShaderGUI.presetSizeOverLifetime = importParticle.sizeOverLifetime.size;
            //Editor上の値を更新する。
            Refresh();
        }
        //ラベルの幅を調整
        EditorGUIUtility.labelWidth = 30;
        //表示制限：時間0〜1、値0〜1
        Rect curveRange = new Rect(0, 0, 1, 1);

        EditorGUILayout.Space(30.0f);
        
        //Start Lifetime
        GUILayout.Label("Start Lifetime", EditorStyles.boldLabel);
        selectedStartLifetime = EditorGUILayout.Popup(selectedStartLifetime, list, GUILayout.Width(210));
        switch(selectedStartLifetime){
            case 0:
                //Constants
                //ラベルの幅を調整
                EditorGUIUtility.labelWidth = 40;
                startLifetime.constant = EditorGUILayout.FloatField("Value", startLifetime.constant, GUILayout.Width(100));
                //ラベルの幅を元に戻す
                EditorGUIUtility.labelWidth = 30;
                break;
            
            case 1:
                //Curve
                //ラベルの幅を調整
                EditorGUIUtility.labelWidth = 60;
                if(startLifetime.curveMultiplier == 0.0f){
                    startLifetime.curveMultiplier = 1.0f;
                }
                startLifetime.curveMultiplier = EditorGUILayout.FloatField("Multiplier", startLifetime.curveMultiplier, GUILayout.Width(120));
                //ラベルの幅を元に戻す
                EditorGUIUtility.labelWidth = 30;

                //nullの場合は初期値を設定
                if(startLifetime.curve == null){
                    startLifetime.curve = new AnimationCurve(new Keyframe(0,1), new Keyframe(1,1));
                }
                startLifetime.curve = EditorGUILayout.CurveField(startLifetime.curve, Color.red, curveRange, GUILayout.Height(40), GUILayout.Width(200));
                break;

            case 2:
                //Random Between Two Constants
                EditorGUILayout.BeginHorizontal();
                startLifetime.constantMin = EditorGUILayout.FloatField("Min", startLifetime.constantMin, GUILayout.Width(75));
                GUILayout.Space(15);
                startLifetime.constantMax = EditorGUILayout.FloatField("Max", startLifetime.constantMax, GUILayout.Width(75));
                EditorGUILayout.EndHorizontal();
                break;

            case 3:
                //Random Between Two Curves
                //ラベルの幅を調整
                EditorGUIUtility.labelWidth = 60;
                if(startLifetime.curveMultiplier == 0.0f){
                    startLifetime.curveMultiplier = 1.0f;
                }
                startLifetime.curveMultiplier = EditorGUILayout.FloatField("Multiplier", startLifetime.curveMultiplier, GUILayout.Width(120));
                //ラベルの幅を元に戻す
                EditorGUIUtility.labelWidth = 30;

                //nullの場合は初期値を設定
                if(startLifetime.curveMin == null){
                    startLifetime.curveMin = new AnimationCurve(new Keyframe(0,0), new Keyframe(1,0));
                }
                if(startLifetime.curveMax == null){
                    startLifetime.curveMax = new AnimationCurve(new Keyframe(0,1), new Keyframe(1,1));
                }
                GUILayout.Label("Max");
                startLifetime.curveMax = EditorGUILayout.CurveField(startLifetime.curveMax, Color.red, curveRange, GUILayout.Height(40), GUILayout.Width(200));
                GUILayout.Label("Min");
                startLifetime.curveMin = EditorGUILayout.CurveField(startLifetime.curveMin, Color.red, curveRange, GUILayout.Height(40), GUILayout.Width(200));
                break;
        }

        EditorGUILayout.Space(10.0f);

        //Start Speed
        GUILayout.Label("Start Speed", EditorStyles.boldLabel);
        selectedStartSpeed = EditorGUILayout.Popup(selectedStartSpeed, list, GUILayout.Width(210));
        switch(selectedStartSpeed){
            case 0:
                //Constants
                //ラベルの幅を調整
                EditorGUIUtility.labelWidth = 40;
                startSpeed.constant = EditorGUILayout.FloatField("Value", startSpeed.constant, GUILayout.Width(100));
                //ラベルの幅を元に戻す
                EditorGUIUtility.labelWidth = 30;
                break;
            
            case 1:
                //Curve
                //ラベルの幅を調整
                EditorGUIUtility.labelWidth = 60;
                if(startSpeed.curveMultiplier == 0.0f){
                    startSpeed.curveMultiplier = 1.0f;
                }
                startSpeed.curveMultiplier = EditorGUILayout.FloatField("Multiplier", startSpeed.curveMultiplier, GUILayout.Width(120));
                //ラベルの幅を元に戻す
                EditorGUIUtility.labelWidth = 30;

                //nullの場合は初期値を設定
                if(startSpeed.curve == null){
                    startSpeed.curve = new AnimationCurve(new Keyframe(0,1), new Keyframe(1,1));
                }
                startSpeed.curve = EditorGUILayout.CurveField(startSpeed.curve, Color.red, curveRange, GUILayout.Height(40), GUILayout.Width(200));
                break;

            case 2:
                //Random Between Two Constants
                EditorGUILayout.BeginHorizontal();    
                startSpeed.constantMin = EditorGUILayout.FloatField("Min", startSpeed.constantMin, GUILayout.Width(75));
                GUILayout.Space(15);
                startSpeed.constantMax = EditorGUILayout.FloatField("Max", startSpeed.constantMax, GUILayout.Width(75));
                EditorGUILayout.EndHorizontal();
                break;

            case 3:
                //Random Between Two Curves
                //ラベルの幅を調整
                EditorGUIUtility.labelWidth = 60;
                if(startSpeed.curveMultiplier == 0.0f){
                    startSpeed.curveMultiplier = 1.0f;
                }
                startSpeed.curveMultiplier = EditorGUILayout.FloatField("Multiplier", startSpeed.curveMultiplier, GUILayout.Width(120));
                //ラベルの幅を元に戻す
                EditorGUIUtility.labelWidth = 30;

                //nullの場合は初期値を設定
                if(startSpeed.curveMin == null){
                    startSpeed.curveMin = new AnimationCurve(new Keyframe(0,0), new Keyframe(1,0));
                }
                if(startSpeed.curveMax == null){
                    startSpeed.curveMax = new AnimationCurve(new Keyframe(0,1), new Keyframe(1,1));
                }
                GUILayout.Label("Max");
                startSpeed.curveMax = EditorGUILayout.CurveField(startSpeed.curveMax, Color.red, curveRange, GUILayout.Height(40), GUILayout.Width(200));
                GUILayout.Label("Min");
                startSpeed.curveMin = EditorGUILayout.CurveField(startSpeed.curveMin, Color.red, curveRange, GUILayout.Height(40), GUILayout.Width(200));
                break;
        }

        EditorGUILayout.Space(10.0f);

        //Start Size
        GUILayout.Label("Start Size", EditorStyles.boldLabel);
        selectedStartSize = EditorGUILayout.Popup(selectedStartSize, list, GUILayout.Width(210));
        switch(selectedStartSize){
            case 0:
                //Constants
                //ラベルの幅を調整
                EditorGUIUtility.labelWidth = 40;
                startSize.constant = EditorGUILayout.FloatField("Value", startSize.constant, GUILayout.Width(100));
                //ラベルの幅を元に戻す
                EditorGUIUtility.labelWidth = 30;
                break;
            
            case 1:
                //Curve
                //ラベルの幅を調整
                EditorGUIUtility.labelWidth = 60;
                if(startSize.curveMultiplier == 0.0f){
                    startSize.curveMultiplier = 1.0f;
                }
                startSize.curveMultiplier = EditorGUILayout.FloatField("Multiplier", startSize.curveMultiplier, GUILayout.Width(120));
                //ラベルの幅を元に戻す
                EditorGUIUtility.labelWidth = 30;

                //nullの場合は初期値を設定
                if(startSize.curve == null){
                    startSize.curve = new AnimationCurve(new Keyframe(0,1), new Keyframe(1,1));
                }
                startSize.curve = EditorGUILayout.CurveField(startSize.curve, Color.red, curveRange, GUILayout.Height(40), GUILayout.Width(200));
                break;

            case 2:
                //Random Between Two Constants
                EditorGUILayout.BeginHorizontal();   
                startSize.constantMin = EditorGUILayout.FloatField("Min", startSize.constantMin, GUILayout.Width(75));
                GUILayout.Space(15);
                startSize.constantMax = EditorGUILayout.FloatField("Max", startSize.constantMax, GUILayout.Width(75));
                EditorGUILayout.EndHorizontal();
                break;

            case 3:
                //Random Between Two Curves
                //ラベルの幅を調整
                EditorGUIUtility.labelWidth = 60;
                if(startSize.curveMultiplier == 0.0f){
                    startSize.curveMultiplier = 1.0f;
                }
                startSize.curveMultiplier = EditorGUILayout.FloatField("Multiplier", startSize.curveMultiplier, GUILayout.Width(120));
                //ラベルの幅を元に戻す
                EditorGUIUtility.labelWidth = 30;

                //nullの場合は初期値を設定
                if(startSize.curveMin == null){
                    startSize.curveMin = new AnimationCurve(new Keyframe(0,0), new Keyframe(1,0));
                }
                if(startSize.curveMax == null){
                    startSize.curveMax = new AnimationCurve(new Keyframe(0,1), new Keyframe(1,1));
                }
                GUILayout.Label("Max");
                startSize.curveMax = EditorGUILayout.CurveField(startSize.curveMax, Color.red, curveRange, GUILayout.Height(40), GUILayout.Width(200));
                GUILayout.Label("Min");
                startSize.curveMin = EditorGUILayout.CurveField(startSize.curveMin, Color.red, curveRange, GUILayout.Height(40), GUILayout.Width(200));
                break;
        }
        
        EditorGUILayout.Space(10.0f);
        
        //ラベルの幅を広げる
        EditorGUIUtility.labelWidth = 40;

        //Gravity
        GUILayout.Label("Gravity", EditorStyles.boldLabel);
        gravity = EditorGUILayout.FloatField("Value", gravity, GUILayout.Width(100));

        EditorGUILayout.Space(10.0f);

        //Rate over Time
        GUILayout.Label("Rate over Time", EditorStyles.boldLabel);
        rateOverTime = EditorGUILayout.FloatField("Value", rateOverTime, GUILayout.Width(100));

        EditorGUILayout.Space(10.0f);

        //Size over Lifetime
        GUILayout.Label("Size over Lifetime", EditorStyles.boldLabel);
        selectedSizeOverLifetime = EditorGUILayout.Popup(selectedSizeOverLifetime, listNoConst, GUILayout.Width(210));
        switch(selectedSizeOverLifetime){
            case 0:
                //Curve
                //ラベルの幅を調整
                EditorGUIUtility.labelWidth = 60;
                if(sizeOverLifetime.curveMultiplier == 0.0f){
                    sizeOverLifetime.curveMultiplier = 1.0f;
                }
                sizeOverLifetime.curveMultiplier = EditorGUILayout.FloatField("Multiplier", sizeOverLifetime.curveMultiplier, GUILayout.Width(120));
                //ラベルの幅を元に戻す
                EditorGUIUtility.labelWidth = 30;

                //nullの場合は初期値を設定
                if(sizeOverLifetime.curve == null){
                    sizeOverLifetime.curve = new AnimationCurve(new Keyframe(0,1), new Keyframe(1,1));
                }
                sizeOverLifetime.curve = EditorGUILayout.CurveField(sizeOverLifetime.curve, Color.red, curveRange, GUILayout.Height(40), GUILayout.Width(200));
                break;

            case 1:
                //Random Between Two Curves
                //ラベルの幅を調整
                EditorGUIUtility.labelWidth = 60;
                if(sizeOverLifetime.curveMultiplier == 0.0f){
                    sizeOverLifetime.curveMultiplier = 1.0f;
                }
                sizeOverLifetime.curveMultiplier = EditorGUILayout.FloatField("Multiplier", sizeOverLifetime.curveMultiplier, GUILayout.Width(120));
                //ラベルの幅を元に戻す
                EditorGUIUtility.labelWidth = 30;

                //nullの場合は初期値を設定
                if(sizeOverLifetime.curveMin == null){
                    sizeOverLifetime.curveMin = new AnimationCurve(new Keyframe(0,0), new Keyframe(1,0));
                }
                if(sizeOverLifetime.curveMax == null){
                    sizeOverLifetime.curveMax = new AnimationCurve(new Keyframe(0,1), new Keyframe(1,1));
                }
                GUILayout.Label("Max");
                sizeOverLifetime.curveMax = EditorGUILayout.CurveField(sizeOverLifetime.curveMax, Color.red, curveRange, GUILayout.Height(40), GUILayout.Width(200));
                GUILayout.Label("Min");
                sizeOverLifetime.curveMin = EditorGUILayout.CurveField(sizeOverLifetime.curveMin, Color.red, curveRange, GUILayout.Height(40), GUILayout.Width(200));
                break;
        }

        EditorGUILayout.Space(10.0f);
        
        //Shape
        GUILayout.Label("Shape", EditorStyles.boldLabel);
        selectedShape = EditorGUILayout.Popup(selectedShape, listShape, GUILayout.Width(210));
        switch(selectedShape){
            case 0:
                //Cone
                EditorGUIUtility.labelWidth = 40;
                radius = EditorGUILayout.FloatField("Radius", radius, GUILayout.Width(100));
                EditorGUIUtility.labelWidth = 105;
                radiusThickness = EditorGUILayout.Slider("Radius Thickness", radiusThickness, 0.0f, 1.0f, GUILayout.Width(280));
                EditorGUIUtility.labelWidth = 40;
                break;

            case 1:
                //Hemisphere
                EditorGUIUtility.labelWidth = 40;
                radius = EditorGUILayout.FloatField("Radius", radius, GUILayout.Width(100));
                EditorGUIUtility.labelWidth = 105;
                radiusThickness = EditorGUILayout.Slider("Radius Thickness", radiusThickness, 0.0f, 1.0f, GUILayout.Width(280));
                EditorGUIUtility.labelWidth = 40;
                break;

            case 2:
                //Sphere
                EditorGUIUtility.labelWidth = 40;
                radius = EditorGUILayout.FloatField("Radius", radius, GUILayout.Width(100));
                EditorGUIUtility.labelWidth = 105;
                radiusThickness = EditorGUILayout.Slider("Radius Thickness", radiusThickness, 0.0f, 1.0f, GUILayout.Width(280));
                EditorGUIUtility.labelWidth = 40;
                break;

            case 3:
                //Donut
                EditorGUIUtility.labelWidth = 40;
                radius = EditorGUILayout.FloatField("Radius", radius, GUILayout.Width(100));
                EditorGUIUtility.labelWidth = 105;
                radiusThickness = EditorGUILayout.Slider("Radius Thickness", radiusThickness, 0.0f, 1.0f, GUILayout.Width(280));
                EditorGUIUtility.labelWidth = 40;
                break;

            case 4:
                //Circle
                EditorGUIUtility.labelWidth = 40;
                radius = EditorGUILayout.FloatField("Radius", radius, GUILayout.Width(100));
                EditorGUIUtility.labelWidth = 105;
                radiusThickness = EditorGUILayout.Slider("Radius Thickness", radiusThickness, 0.0f, 1.0f, GUILayout.Width(280));
                EditorGUIUtility.labelWidth = 40;
                break;
        }

        EditorGUILayout.Space();

        if (GUILayout.Button("更新"))
        {
            Submit("Presetを更新しました。");
        }

        EditorGUILayout.Space(25.0f);
        GUILayout.Label("プリセット", EditorStyles.boldLabel);
        EditorGUILayout.BeginHorizontal();
        EditorGUIUtility.labelWidth = 30;
        using (new EditorGUILayout.VerticalScope("HelpBox")){
            GUILayout.Label("プリセット1");
            if (GUILayout.Button("読み込み"))
            {
                LoadPrefab(preset1PrefabPath);
                ShowWindow();
            }
            EditorGUILayout.Space();
            if (GUILayout.Button("プリセット登録"))
            {
                Submit("プリセットを更新しました。", preset1PrefabPath);
            }
            EditorGUILayout.Space();
        }
        using (new EditorGUILayout.VerticalScope("HelpBox")){
            GUILayout.Label("プリセット2");
            if (GUILayout.Button("読み込み"))
            {
                LoadPrefab(preset2PrefabPath);
                ShowWindow();
            }
            EditorGUILayout.Space();
            if (GUILayout.Button("プリセット登録"))
            {
                Submit("プリセットを更新しました。", preset2PrefabPath);
            }
            EditorGUILayout.Space();
        }
        using (new EditorGUILayout.VerticalScope("HelpBox")){
            GUILayout.Label("プリセット3");
            if (GUILayout.Button("読み込み"))
            {
                LoadPrefab(preset3PrefabPath);
                ShowWindow();
            }
            EditorGUILayout.Space();
            if (GUILayout.Button("プリセット登録"))
            {
                Submit("プリセットを更新しました。", preset3PrefabPath);
            }
            EditorGUILayout.Space();
        }
        EditorGUILayout.EndHorizontal();           
        
        EditorGUILayout.Space(50.0f);

        if (GUILayout.Button("Reset")){
            PresetReset();
        }
        EditorGUILayout.EndScrollView();
    }

    static void Submit(string dialogText){
        Submit(dialogText, defaultPrefabPath);
    }
    static void Submit(string dialogText, string prefabPath){
        //DefaultPrefabのロード
        var prefabRoot = PrefabUtility.LoadPrefabContents(prefabPath);
        ParticleSystem ps = prefabRoot.GetComponent<ParticleSystem>();

        var prefabMain = ps.main;
        var prefabEmission = ps.emission;
        var prefabSizeOverLifetimeParent = ps.sizeOverLifetime;
        var prefabShape = ps.shape;

        var prefabStartLifetime = ps.main.startLifetime;
        var prefabStartSize = ps.main.startSize;
        var prefabStartSpeed = ps.main.startSpeed;
        var prefabGravity = ps.main.gravityModifier;

        var prefabRateOverTime = ps.emission.rateOverTime;
        var prefabSizeOverLifetime = ps.sizeOverLifetime.size;
        
        //Start Lifetime
        switch(selectedStartLifetime){
            case 0:
                //Constants
                prefabStartLifetime.mode = ParticleSystemCurveMode.Constant;
                prefabStartLifetime.constant = startLifetime.constant;
                prefabMain.startLifetime = prefabStartLifetime;
                break;
            
            case 1:
                //Curve
                prefabStartLifetime.mode = ParticleSystemCurveMode.Curve;
                prefabStartLifetime.curveMultiplier = startLifetime.curveMultiplier;
                prefabStartLifetime.curve = startLifetime.curve;
                prefabMain.startLifetime = prefabStartLifetime;
                break;

            case 2:
                //Random Between Two Constants
                prefabStartLifetime.mode = ParticleSystemCurveMode.TwoConstants;
                prefabStartLifetime.constantMin = startLifetime.constantMin;
                prefabStartLifetime.constantMax = startLifetime.constantMax;
                prefabMain.startLifetime = prefabStartLifetime;
                break;

            case 3:
                //Random Between Two Curves
                prefabStartLifetime.mode = ParticleSystemCurveMode.TwoCurves;
                prefabStartLifetime.curveMultiplier = startLifetime.curveMultiplier;
                prefabStartLifetime.curveMin = startLifetime.curveMin;
                prefabStartLifetime.curveMax = startLifetime.curveMax;
                prefabMain.startLifetime = prefabStartLifetime;
                break;
        }

        //StartSpeed
        switch(selectedStartSpeed){
            case 0:
                //Constants
                prefabStartSpeed.mode = ParticleSystemCurveMode.Constant;
                prefabStartSpeed.constant = startSpeed.constant;
                prefabMain.startSpeed = prefabStartSpeed;
                break;
            
            case 1:
                //Curve
                prefabStartSpeed.mode = ParticleSystemCurveMode.Curve;
                prefabStartSpeed.curveMultiplier = startSpeed.curveMultiplier;
                prefabStartSpeed.curve = startSpeed.curve;
                prefabMain.startSpeed = prefabStartSpeed;
                break;

            case 2:
                //Random Between Two Constants
                prefabStartSpeed.mode = ParticleSystemCurveMode.TwoConstants;
                prefabStartSpeed.constantMin = startSpeed.constantMin;
                prefabStartSpeed.constantMax = startSpeed.constantMax;
                prefabMain.startSpeed = prefabStartSpeed;
                break;

            case 3:
                //Random Between Two Curves
                prefabStartSpeed.mode = ParticleSystemCurveMode.TwoCurves;
                prefabStartSpeed.curveMultiplier = startSpeed.curveMultiplier;
                prefabStartSpeed.curveMin = startSpeed.curveMin;
                prefabStartSpeed.curveMax = startSpeed.curveMax;
                prefabMain.startSpeed = prefabStartSpeed;
                break;
        }

        //StartSize
        switch(selectedStartSize){
            case 0:
                //Constants
                prefabStartSize.mode = ParticleSystemCurveMode.Constant;
                prefabStartSize.constant = startSize.constant;
                prefabMain.startSize = prefabStartSize;
                break;
            
            case 1:
                //Curve
                prefabStartSize.mode = ParticleSystemCurveMode.Curve;
                prefabStartSize.curveMultiplier = startSize.curveMultiplier;
                prefabStartSize.curve = startSize.curve;
                prefabMain.startSize = prefabStartSize;
                break;

            case 2:
                //Random Between Two Constants
                prefabStartSize.mode = ParticleSystemCurveMode.TwoConstants;
                prefabStartSize.constantMin = startSize.constantMin;
                prefabStartSize.constantMax = startSize.constantMax;
                prefabMain.startSize = prefabStartSize;
                break;

            case 3:
                //Random Between Two Curves
                prefabStartSize.mode = ParticleSystemCurveMode.TwoCurves;
                prefabStartSize.curveMultiplier = startSize.curveMultiplier;
                prefabStartSize.curveMin = startSize.curveMin;
                prefabStartSize.curveMax = startSize.curveMax;
                prefabMain.startSize = prefabStartSize;
                break;
        }

        //Gravity
        prefabGravity = new ParticleSystem.MinMaxCurve(gravity);
        prefabMain.gravityModifier = prefabGravity;

        //Rate over Time
        prefabRateOverTime = new ParticleSystem.MinMaxCurve(rateOverTime);
        prefabEmission.rateOverTime = prefabRateOverTime;

        //Size over Lifetime
        switch(selectedSizeOverLifetime){
            case 0:
                //Curve
                prefabSizeOverLifetime.mode = ParticleSystemCurveMode.Curve;
                prefabSizeOverLifetime.curveMultiplier = sizeOverLifetime.curveMultiplier;
                prefabSizeOverLifetime.curve = sizeOverLifetime.curve;
                prefabSizeOverLifetimeParent.size = prefabSizeOverLifetime;
                break;

            case 1:
                //Random Between Two Curves
                prefabSizeOverLifetime.mode = ParticleSystemCurveMode.TwoCurves;
                prefabSizeOverLifetime.curveMultiplier = sizeOverLifetime.curveMultiplier;
                prefabSizeOverLifetime.curveMin = sizeOverLifetime.curveMin;
                prefabSizeOverLifetime.curveMax = sizeOverLifetime.curveMax;
                prefabSizeOverLifetimeParent.size = prefabSizeOverLifetime;
                break;
        }

        switch(selectedShape){
            case 0:
                prefabShape.shapeType = ParticleSystemShapeType.Cone;
                prefabShape.radius = radius;
                prefabShape.radiusThickness = radiusThickness;
                break;

            case 1:
                prefabShape.shapeType = ParticleSystemShapeType.Hemisphere;
                prefabShape.radius = radius;
                prefabShape.radiusThickness = radiusThickness;
                break;

            case 2:
                prefabShape.shapeType = ParticleSystemShapeType.Sphere;
                prefabShape.radius = radius;
                prefabShape.radiusThickness = radiusThickness;
                break;

            case 3:
                prefabShape.shapeType = ParticleSystemShapeType.Donut;
                prefabShape.radius = radius;
                prefabShape.radiusThickness = radiusThickness;
                break;

            case 4:
                prefabShape.shapeType = ParticleSystemShapeType.Circle;
                prefabShape.radius = radius;
                prefabShape.radiusThickness = radiusThickness;
                break;
        }

        PrefabUtility.SaveAsPrefabAsset(prefabRoot, prefabPath);
        PrefabUtility.UnloadPrefabContents(prefabRoot);
        EditorUtility.DisplayDialog("完了", dialogText, "閉じる");
    }

    static void Refresh(){
        startLifetime = KumaEffectShaderGUI.presetStartLifetime;
        startSpeed = KumaEffectShaderGUI.presetStartSpeed;
        startSize = KumaEffectShaderGUI.presetStartSize;
        gravity = KumaEffectShaderGUI.presetGravity.constant;
        rateOverTime  = KumaEffectShaderGUI.presetRateOverTime;
        sizeOverLifetime = KumaEffectShaderGUI.presetSizeOverLifetime;
    }

    void PresetReset(){
        selectedStartLifetime = 2;
        selectedStartSpeed = 2;
        selectedStartSize = 2;
        selectedSizeOverLifetime = 0;
        startLifetime = new ParticleSystem.MinMaxCurve(2.0f, 4.0f);
        startSpeed = new ParticleSystem.MinMaxCurve(0.2f, 1.0f);
        startSize = new ParticleSystem.MinMaxCurve(0.04f, 0.08f);
        gravity = 0.0f;
        rateOverTime = 10.0f;

        AnimationCurve curve = new AnimationCurve( new Keyframe(0.0f, 0.0f), new Keyframe(0.3f, 1.0f),  new Keyframe(1.0f, 0.0f));
        for(int i = 0; i < curve.length; i++){
            Keyframe key = curve[i];
            key.inTangent = 0.0f;
            key.outTangent = 0.0f;
            curve.MoveKey(i, key);
        }
        sizeOverLifetime = new ParticleSystem.MinMaxCurve(1.0f, curve);

        Submit("プリセットをリセットしました。");
        ShowWindow();
    }

    void ImportParticle(ParticleSystem importParticle){
        ConvertSelectedMode(importParticle.main.startLifetime, "StartLifetime");
        ConvertSelectedMode(importParticle.main.startSpeed, "StartSpeed");
        ConvertSelectedMode(importParticle.main.startSize, "StartSize");
        ConvertSelectedMode(importParticle.sizeOverLifetime.size, "SizeOverLifetime");

        startLifetime = importParticle.main.startLifetime;
        startSpeed = importParticle.main.startSpeed;
        startSize = importParticle.main.startSize;
        gravity = importParticle.main.gravityModifier.constant;
        rateOverTime = importParticle.emission.rateOverTime.constant;
        sizeOverLifetime = importParticle.sizeOverLifetime.size;
        radius = importParticle.shape.radius;
        radiusThickness = importParticle.shape.radiusThickness;
        switch(importParticle.shape.shapeType){
            case ParticleSystemShapeType.Cone:
                selectedShape = 0;
                break;

            case ParticleSystemShapeType.Hemisphere:
                selectedShape = 1;
                break;

            case ParticleSystemShapeType.Sphere:
                selectedShape = 2;
                break;

            case ParticleSystemShapeType.Donut:
                selectedShape = 3;
                break;

            case ParticleSystemShapeType.Circle:
                selectedShape = 4;
                break;
        }

        Submit("プリセットを更新しました。");
        ShowWindow();
    }
    
    void ConvertSelectedMode(ParticleSystem.MinMaxCurve minMaxCurve, string moduleType){
        if(minMaxCurve.mode == ParticleSystemCurveMode.Constant){
            switch(moduleType){
                case "StartLifetime":
                    selectedStartLifetime = 0;
                    break;
                
                case "StartSpeed":
                    selectedStartSpeed = 0;
                    break;
                
                case "StartSize":
                    selectedStartSize = 0;
                    break;

                case "SizeOverLifetime":
                    selectedSizeOverLifetime = 5;
                    break;
            }
        }else if(minMaxCurve.mode == ParticleSystemCurveMode.Curve){
            switch(moduleType){
                case "StartLifetime":
                    selectedStartLifetime = 1;
                    break;
                
                case "StartSpeed":
                    selectedStartSpeed = 1;
                    break;
                
                case "StartSize":
                    selectedStartSize = 1;
                    break;

                case "SizeOverLifetime":
                    selectedSizeOverLifetime = 0;
                    break;
            }
        }else if(minMaxCurve.mode == ParticleSystemCurveMode.TwoConstants){
            switch(moduleType){
                case "StartLifetime":
                    selectedStartLifetime = 2;
                    break;
                
                case "StartSpeed":
                    selectedStartSpeed = 2;
                    break;
                
                case "StartSize":
                    selectedStartSize = 2;
                    break;

                case "SizeOverLifetime":
                    selectedSizeOverLifetime = 5;
                    break;
            }
        }else if(minMaxCurve.mode == ParticleSystemCurveMode.TwoCurves){
            switch(moduleType){
                case "StartLifetime":
                    selectedStartLifetime = 3;
                    break;
                
                case "StartSpeed":
                    selectedStartSpeed = 3;
                    break;
                
                case "StartSize":
                    selectedStartSize = 3;
                    break;

                case "SizeOverLifetime":
                    selectedSizeOverLifetime = 1;
                    break;
            }
        }
    }

    
    static void LoadPrefab(){
        //Prefabのロード
        var prefabRoot = PrefabUtility.LoadPrefabContents(defaultPrefabPath);

        ParticleSystem ps = prefabRoot.GetComponent<ParticleSystem>();
        
        KumaEffectShaderGUI.presetStartLifetime = ps.main.startLifetime;
        KumaEffectShaderGUI.presetStartSpeed = ps.main.startSpeed;
        KumaEffectShaderGUI.presetStartSize = ps.main.startSize;
        KumaEffectShaderGUI.presetGravity = ps.main.gravityModifier;
        KumaEffectShaderGUI.presetRateOverTime = ps.emission.rateOverTime.constant;
        KumaEffectShaderGUI.presetSizeOverLifetime = ps.sizeOverLifetime.size;
        radius = ps.shape.radius;
        radiusThickness = ps.shape.radiusThickness;

        switch(ps.shape.shapeType){
            case ParticleSystemShapeType.Cone:
                selectedShape = 0;
                break;

            case ParticleSystemShapeType.Hemisphere:
                selectedShape = 1;
                break;

            case ParticleSystemShapeType.Sphere:
                selectedShape = 2;
                break;

            case ParticleSystemShapeType.Donut:
                selectedShape = 3;
                break;
            
            case ParticleSystemShapeType.Circle:
                selectedShape = 4;
                break;
        }
        
        //Editor上の値を更新する。
        Refresh();
    }
    static void LoadPrefab(string prefabPath){
        //Prefabのロード
        var prefabPresetRoot = PrefabUtility.LoadPrefabContents(prefabPath);
        var prefabDefaultRoot = PrefabUtility.LoadPrefabContents(defaultPrefabPath);

        ParticleSystem psPreset = prefabPresetRoot.GetComponent<ParticleSystem>();
        ParticleSystem psDefault = prefabDefaultRoot.GetComponent<ParticleSystem>();

        var prefabMain = psDefault.main;
        var prefabEmission = psDefault.emission;
        var prefabSizeOverLifetimeParent = psDefault.sizeOverLifetime;
        var prefabShape = psDefault.shape;

        var prefabStartLifetime = psDefault.main.startLifetime;
        var prefabStartSize = psDefault.main.startSize;
        var prefabStartSpeed = psDefault.main.startSpeed;
        var prefabGravity = psDefault.main.gravityModifier;

        var prefabRateOverTime = psDefault.emission.rateOverTime;
        var prefabSizeOverLifetime = psDefault.sizeOverLifetime.size;
        
        prefabMain.startLifetime = psPreset.main.startLifetime;
        prefabMain.startSpeed = psPreset.main.startSpeed;
        prefabMain.startSize = psPreset.main.startSize;
        prefabMain.gravityModifier = psPreset.main.gravityModifier;
        prefabEmission.rateOverTime = psPreset.emission.rateOverTime;
        prefabSizeOverLifetimeParent.size = psPreset.sizeOverLifetime.size;
        prefabShape.radius = psPreset.shape.radius;
        prefabShape.radiusThickness = psPreset.shape.radiusThickness;
        prefabShape.shapeType = psPreset.shape.shapeType;
        
        PrefabUtility.SaveAsPrefabAsset(prefabDefaultRoot, defaultPrefabPath);
        PrefabUtility.UnloadPrefabContents(prefabDefaultRoot);
        PrefabUtility.UnloadPrefabContents(prefabPresetRoot);
        //Editor上の値を更新する。
        Refresh();
    }
}