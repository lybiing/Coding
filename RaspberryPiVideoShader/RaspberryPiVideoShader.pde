import processing.video.*;

String[] shaders = new String[] {
  "0.glsl", "1.glsl", "2.glsl", "3.glsl", 
  "4.glsl", "5.glsl", "6.glsl", "7.glsl", 
  "8.glsl"};

PShader shade;

int idxSource = 0;
int idxShader = 0;
Capture video;

void setup() 
{
  size(640, 480, P2D);
  textSize(22);
  fill(0);


  video = new Capture(this, width, height);

  setupShader();
  video.start();  
}
void captureEvent(Capture video) {  
  video.read();
}


void draw() 
{
  setShaderParameters();


  shader(shade);

  if (idxSource == 0)  image(video, 0, 0, width, height);

  resetShader();
  text(shaders[idxShader], 5, 20);
}

void setupShader() 
{
  shade = loadShader(shaders[idxShader]);


  }


void setShaderParameters() 
{
  // 0
  if (idxShader == 0) {
    shade.set("brightness", 1.0);
    shade.set("contrast", map(mouseX, 0, width, -5, 5));
    shade.set("saturation", map(mouseY, 0, height, -5, 5));
  }

  // 1
  else if (idxShader == 1) {
    shade.set("hue", map(mouseX, 0, width, 0, TWO_PI));
  } 

  // 2
  else if (idxShader == 2) {
    shade.set("pixels", 0.1 * mouseX, 0.1 * mouseY);
  } 

  // 3
  else if (idxShader == 3) {
    shade.set("sigma", map(mouseX, 0, width, 0, 10.0));
    shade.set("blurSize", (int) map(mouseY, 0, height, 0, 30.0));
    shade.set("texOffset", 1.0, 1.0);
  } 

    
  // 4
  else if (idxShader == 4) {
    shade.set("radius", map(mouseX, 0, width, 0, 2));
    shade.set("radTwist", map(mouseY, 0, height, 1.0, 10));
  }

  // 5
  else if (idxShader == 5) {
    shade.set("time", (float) millis()/1000.0);
    shade.set("mouse", (float) mouseX/width, (float) mouseY/height);
    shade.set("turns", map(sin(0.01*frameCount), -1, 1, 2.0, 10.0));
  }

  // 6
  else if (idxShader == 6) {
    shade.set("time", (float) millis()/1000.0);
    shade.set("pixels", mouseX/5, 250.0);
    shade.set("rollRate", map(mouseY, 0, height, 0, 10.0));
    shade.set("rollAmount", 0.25);
  }

  // 7
  else if (idxShader == 7) {
    shade.set("row", map(mouseX, 0, width, 0, 1));
    shade.set("col", map(mouseY, 0, height, 0, 1));
  }

  // 8
  else if (idxShader == 8) {
    shade.set("modr", map(mouseX, 0, width, 0, 0.5));
    shade.set("modg", 0.3);
    shade.set("modb", map(mouseY, 0, height, 0, 0.5));
  }

}
