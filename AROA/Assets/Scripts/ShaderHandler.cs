using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// This script passes the camera position to the shaders. 
/// </summary>

namespace Microsoft.MixedReality.Toolkit
{
    public class ShaderHandler : MonoBehaviour
    {

        private Vector3 cameraPos; //the position of the camera

        // Start is called before the first frame update
        void Start()
        {
            cameraPos = Camera.main.transform.position;
            
        }

        // Update is called once per frame
        void Update()
        {
            cameraPos = Camera.main.transform.position;
            Shader.SetGlobalVector("_CameraPos", cameraPos);
            
            // Note that the shaders have been modified from the CC Shader kit by commenting out _CameraPos from Properties; otherwise Set Global Vector doesn't work.

        }
    }
}