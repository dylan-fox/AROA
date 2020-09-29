# AROA - Augmented Reality Obstacle Avoidance
An augmented reality application to assist visually impaired people with obstacle avoidance.


## Requirements
This project uses MRTK v2.4.0 and Unity 2019.4.6f1 in conjunction with the HoloLens 2 spatial mapping capabilities.

You can find information on the Mixed Reality Toolkit here: 

https://microsoft.github.io/MixedRealityToolkit-Unity/README.html


## Deploying the App

1. Clone the repository.
2. Open Unity and the Spatial Awareness scene.
3. Build and deploy to a HoloLens 2 device.

Note that the Mesh Coloration settings ("first band" distance and "band width" distance) can be adjusted on the Green Luminance material to allow coloration at further distances.

I suggest the following Unity, Build and Deploy settings:

### Unity

Under Edit > Project Settings, go to XR Plug-In Management. Make sure "Initialize XR on Startup" and "Windows Mixed Reality" are checked. 

Under Windows Mixed Reality, make sure Build Settings > Use Primary Window and Holographic Remoting are checked. Make sure Runtime Settings is set to Depth Buffer 16 Bit and Shared Depth Buffer is unchecked.

Under Player Settings, you should see a message saying "Built-in XR is deprecated and will be retired in a future version of Unity. Use the new Unity XR Plugin System instead. You can find settings for Unity XR Plugin System in Project Settings under XR Plugin Management."

### Build

![AROA Build Settings](https://i.imgur.com/ck4EQUG.png)

Make sure that Scenes/Spatial Awareness is checked under "Scenes in Build" above.

- Platform: Universal Windows Platform
- Target Device: Any Device
- Architecture: x64
- Build Type: D3D Project
- Target SDK Version: Latest Installed
- Minimum Platform Version: 10.0.10240.0
- Visual Studio Version: Latest installed
- Build and Run on: Local Machine
- Build Configuration: Release
- All checkboxes (Copy References, Copy PDB files, etc.): unchecked
- Compression Method: Default

### Deploy

Open the AROA.sln in Visual Studio (I used VS 2019).

Connect the HoloLens 2 to your computer via USB cable.

Use the following settings:

- Configuration: Debug
- Platform: ARM64
- Target: Device

When ready, use Debug > Start Without Debugging (ctrl+F5). It should spend a while building and deploying, then eventually automatically start the app on the device.

If you run into problems, here are some troubleshooting tips:

- Make sure both Windows and the HoloLens 2 have the latest updates. Restart both and try again.
- Delete the AROA app on the HoloLens, then go to Build > Clean Solution in VS and run that. Then try again.

Note that the new XR Plugin System seems to have made the Deploy process much more fragile compared to older versions. You may have to use trial and error to get a successful deployment.

## Using the App

### Proximity Based Mesh Coloration

![AROA Mesh Coloration](https://i.imgur.com/m8h6sdt.jpg)

[See video demo](https://www.youtube.com/watch?v=Bpgm-aTn6iA&feature=youtu.be)

The application will automatically scan the environment and create a high-quality spatial mesh. Approaching an object or obstacle will illuminate the relevant part of the mesh in green.

You can use the voice command **toggle observer** to turn the mesh on and off.

### Guideline Placement

![AROA Guidelines 1](https://i.imgur.com/xrCA4uC.jpg)  ![AROA Guidelines 2](https://i.imgur.com/2AiP5EM.jpg)

[See video demo](https://www.youtube.com/watch?v=dX2FmFEM2NY&feature=youtu.be)

With the mesh on, using the voice command **place guidelines** will cause the guidelines to appear where your gaze intersects with the mesh. The command **clear guidelines** will remove them.

These are intended to alert a user to obstacles that are not in the center of their vision. Future versions will experiment with smart placement and rendering.

## Known Errors
Rendering errors sometimes cause objects such as the mesh or the text on the description placard to render only on the left eye of the HoloLens. This can mean objects such as the guidelines or description placard can be visible in one eye but occluded in the other, and can cause difficulties in capturing photos and videos using the HoloLens built in camera. The cause is currently unknown.


## Acknowledgements
This project utilizes code from the following:

Using an Augmented Reality Device as a Distance-Based Vision Aid – Promise and Limitations. M. Kinateder, J. Gualtieri, M.J. Dunn, W. Jarosz, X. Yang and E.A. Cooper Optometry & Vision Science, 95(9), 727-737, 2018
