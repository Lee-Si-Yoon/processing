import processing.video.*;
Capture video;

int vWidth = 200;
int vHeight = 150;

Particle[] particles = new Particle[320*240];

void setup() {
  size(1000, 1000);
  video = new Capture(this, vWidth, vHeight);
  video.start();
}

void draw() {
  background(255);
  loadPixels();
  video.loadPixels();
  for (int i =0; i<vWidth; i++) {
    for (int j =0; j<vHeight; j++) {
      color c = video.pixels[i+j*vWidth];
      fill(c);
      noStroke();
      //rect(i*5, j*5, 5, 5);
      particles[i+j*vWidth].c = c;
      particles[i+j*vWidth].px = i;
      particles[i+j*vWidth].py = j;
      particles[i+j*vWidth].draw();
    }
  }
}

void captureEvent(Capture video) {
  video.read();
}

class Particle{
  int c;
  float ox,oy;
  float px,py;
  float tx,ty;
  Particle(float _ox, float _oy){
    ox = _ox;
    oy = _oy;
    px = ox;
    py = oy;
    tx = random(width);
    ty = random(height);
  }
  
  void draw(){
    fill(c);
    if(mousePressed){
      px += (tx - px) /10;
      py += (ty - py) /10;
      rect(px,py,1,1);
    } else{
      px += (ox - px) /10;
      py += (oy - py) /10;
      rect(px,py,1,1);
    }
  }
}
