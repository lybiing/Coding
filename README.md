# Coding

* Blog Link : https://artech.one/CodingONE 

This project is Coding One's Final Project. I chose to do Shader related experiments. After a series of attempts, my project is to use the Raspberry Pi 4B and camera to perform real-time image rendering through Processing.

## Goal ##

After finished Coding One, I have learned WebGL, Three.js, image and music processing. I want to explore how to apply and complete a project as a professional programer, so I want to use other tools instead of MIMIC and shaderToy. Although 
these two platforms are easy to use。

## Processing ##
First I tried to build a GLSL development environment with Xcode.But since Apple launched Metal, Xcode always recommends the Metal shader language as much as possible. I studied the Metal language a day, and finally I gave up Xcode.

Later I discovered Book of Shader, which is a great learning material. The running chapter introduces how to run the shader, and it introduces the very useful tool glslViewer.

But soon there was a problem. When I fork a larger project, glslViewer or glslCanvas will not work.

Eventually,  I switched to another operating system: Linux

But there is still a problem on the Raspberry Pi, glslviewer cannot work.

I see that processing can run the shader through the .glsl file.

YouTube Link: https://youtu.be/kFFSI_f5hp4

The advantage of the Raspberry Pi is its small size, so if I use the Raspberry Pi's camera to render with a shader, it will be similar to a filter. Render the real content.

Future:
Because time is limited, it is currently a basic filter. I want to add image recognition later. The outline and background of the characters can be displayed with different effects.
