using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Microsoft.MixedReality.Toolkit
{
    public class Guidelines : MonoBehaviour
    {

        /// <summary>
        /// This script raycasts from the camera to a point within a certain max distance, then draws guidelines towards that point. This should help someone with poor periperal vision find the origin point.
        /// </summary>
        /// 

        public GameObject guidelines;


        public void placeGuidelines()
        {
            //Raycasts from the camera to the mesh. If it hits, activates guidelines and places them there.

            Vector3 cameraPos = Camera.main.transform.position;
            Vector3 cameraForward = Camera.main.transform.forward;

            RaycastHit hit;

            if (UnityEngine.Physics.Raycast(cameraPos, cameraForward, out hit)) {
                Debug.Log("Raycast Hit detected. Placing guidelines.");
                guidelines.SetActive(true);
                guidelines.transform.position = hit.point;
                guidelines.transform.rotation = Camera.main.transform.rotation;
                guidelines.transform.Rotate(0f, 90f, 0f);


            }

            else
            {
                Debug.Log("No obstacles detected.");
            }


        }

        public void clearGuidelines()
        {
            guidelines.SetActive(false);
        }
    }

}