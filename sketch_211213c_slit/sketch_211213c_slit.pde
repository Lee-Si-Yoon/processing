import processing.video.*;

Capture video;

void setup() {
  size(800, 800);
  background(255);
  
  video = new Capture(this, 320, 240);
  video.start();
  smooth();
}

float r = 0;
int y;

void draw() {
  
  //float x1 = r * cos(theta);
  //float y1 = r * sin(theta);
  
  int vW = video.width;
  int vH = video.height;
  
  pushMatrix();
  
  translate((width/2), (height/2));
  
  rotate(r*10);
  
  copy(video, vW/3, vH/2, vW/3, 3, 50, 0, vW/2, 3);
  
  popMatrix();
  
  y = y + 1;
  
  r += 0.001;

  if (y>height) {
    y = 0;
  }
}

void captureEvent(Capture video) {
  video.read();
}
