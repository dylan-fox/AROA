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

## Using the App

### Proximity Based Mesh Coloration
The application will automatically scan the environment and create a high-quality spatial mesh. Approaching an object or obstacle will illuminate the relevant part of the mesh in green.

You can use the voice command **toggle observer** to turn the mesh on and off.

### Guideline Placement

With the mesh on, using the voice command **place guidelines** will cause the guidelines to appear where your gaze intersects with the mesh. The command **clear guidelines** will remove them.

These are intended to alert a user to obstacles that are not in the center of their vision. Future versions will experiment with smart placement and rendering.


## Acknowledgements
This project utilizes code from the following:

Using an Augmented Reality Device as a Distance-Based Vision Aid – Promise and Limitations. M. Kinateder, J. Gualtieri, M.J. Dunn, W. Jarosz, X. Yang and E.A. Cooper Optometry & Vision Science, 95(9), 727-737, 2018
