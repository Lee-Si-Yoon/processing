import processing.video.*;
Capture video;

int vWidth = 30;
int vHeight = 40;

float offsetX, offsetY;

void setup() {
  size(1000, 1000);
  offsetX = width/vWidth;
  offsetY = height/vHeight;
  video = new Capture(this, vWidth, vHeight);
  video.start();
  ellipseMode(CORNER);
}

void draw() {
  background(0);
  //loadPixels();

  video.loadPixels();

  for (int i =0; i<vWidth; i++) {
    for (int j =0; j<vHeight; j++) {
      color c = video.pixels[(vWidth-i-1)+j*vWidth];
      float grey = floor(red(c)*0.27+green(c)*0.71+blue(c)*0.02);
      
      //fill(grey);
      //textSize(10);
      //text("0",i*offsetX, j*offsetY, 5,5);
      
      //stroke(255);
      //strokeWeight(grey/255*2);
      //line(i*offsetX, j*offsetY, i*offsetX+random(offsetX), j*offsetX+random(offsetX));
      
      fill(grey);
      noStroke();
      ellipse(i*offsetX, j*offsetY, 5, 5);
    }
  }
}

void captureEvent(Capture video) {
  video.read();
}
