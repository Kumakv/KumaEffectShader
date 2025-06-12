using UnityEngine;
using UnityEditor;
using System.Collections.Generic;

public class KumaEffectVertexStreamEditor : EditorWindow
{
    private GameObject targetObject;
    private string targetShaderName = "Kuma/KumaEffect"; // シェーダー名を指定
    private bool enableCustomVertexStream = false;

    List<ParticleSystemVertexStream> streams = new List<ParticleSystemVertexStream>();
    [MenuItem("#Kuma/KumaEffect Vertex Stream Editor")]
    public static void ShowWindow()
    {
        GetWindow<KumaEffectVertexStreamEditor>("Particle System Vertex Stream Editor");
    }

    private void OnGUI()
    {
        GUILayout.Label("Particle System Vertex Stream Editor", EditorStyles.boldLabel);

        targetObject = (GameObject)EditorGUILayout.ObjectField("Target Object", targetObject, typeof(GameObject), true);
        targetShaderName = EditorGUILayout.TextField("Shader Name", targetShaderName);
        enableCustomVertexStream = EditorGUILayout.Toggle("Enable Custom Vertex Streams", enableCustomVertexStream);

        if (GUILayout.Button("Apply Custom Vertex Streams"))
        {
            ApplyCustomVertexStreams(targetObject, targetShaderName);
        }
    }

    private void ApplyCustomVertexStreams(GameObject target, string shaderName)
    {
        if (target == null)
        {
            Debug.LogError("Target Object is not specified.");
            return;
        }

        //--------CVS構成----------------------------------------------
        streams.Clear();
        streams.Add(ParticleSystemVertexStream.Position);
        streams.Add(ParticleSystemVertexStream.Normal);
        streams.Add(ParticleSystemVertexStream.Color);
        streams.Add(ParticleSystemVertexStream.UV);
        streams.Add(ParticleSystemVertexStream.StableRandomXY);
        streams.Add(ParticleSystemVertexStream.Custom1XYZW);
        streams.Add(ParticleSystemVertexStream.Custom2XYZW);
        streams.Add(ParticleSystemVertexStream.Center);
        streams.Add(ParticleSystemVertexStream.AgePercent);
        //-------------------------------------------------------------

        // 対象のオブジェクトに含まれるすべてのパーティクルシステムを取得
        ParticleSystem[] particleSystems = target.GetComponentsInChildren<ParticleSystem>(true);

        foreach (var particleSystem in particleSystems)
        {
            // パーティクルシステムのレンダラーを取得
            ParticleSystemRenderer renderer = particleSystem.GetComponent<ParticleSystemRenderer>();

            if (renderer == null)
            {
                continue;
            }
            // レンダラーのシェーダーをチェック
            if (renderer.sharedMaterial != null && renderer.sharedMaterial.shader != null && renderer.sharedMaterial.shader.name == shaderName)
            {
                EnableCustomVertexStreams(renderer, false);
            }
            //トレイル側チェック
            if (renderer.sharedMaterials.Length > 1 &&renderer.sharedMaterials[1] != null && renderer.sharedMaterials[1].shader != null && renderer.sharedMaterials[1].shader.name == shaderName)
            {
                EnableCustomVertexStreams(renderer, true);
            }
        }
    }

    private void EnableCustomVertexStreams(ParticleSystemRenderer renderer, bool isTrail)
    {
        //CVS反映
        if (!isTrail)
            renderer.SetActiveVertexStreams(streams);
        else
            renderer.SetActiveTrailVertexStreams(streams);
        
        //Custom反映
        var particle = renderer.GetComponent<ParticleSystem>();
        var customData = particle.customData;
        customData.enabled = true;
        customData.SetMode(ParticleSystemCustomData.Custom1, ParticleSystemCustomDataMode.Vector);
        customData.SetMode(ParticleSystemCustomData.Custom2, ParticleSystemCustomDataMode.Vector);
        string trailLog = isTrail ? ".trail" : ""; 

        Debug.Log($"Edit Custom Vertex Streams for {renderer.name}"+trailLog);
    }
}