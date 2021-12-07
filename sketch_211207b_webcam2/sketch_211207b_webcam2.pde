import processing.video.*;
Capture video;

int vWidth = 200;
int vHeight = 150;

void setup() {
  size(1000, 1000);
  video = new Capture(this, vWidth, vHeight);
  video.start();
}

void draw() {
  background(255);
  loadPixels();

  //video.pixels[1000] = color(255,0,0);

  video.loadPixels();
  for (int i =0; i<vWidth; i++) {
    for (int j =0; j<vHeight; j++) {
      color c = video.pixels[i+j*vWidth];
      float r = red(c);
      float g = green(c);
      float b = blue(c);

      float bri;
      float d = sqrt((mouseX - i)*(mouseX -i) + (mouseY - j)*(mouseY - j));
      if (d<100) {
        bri = 2.5;
      } else {
        bri = 0.5;
      }

      r*= bri;
      g *= bri;
      b *= bri;
      r= constrain(r, 0, 255);
      g= constrain(g, 0, 255);
      b= constrain(b, 0, 255);

      //pixels[i*3+j*3*width] = color(r, g, b);
      
      fill(c);
      noStroke();
      rect(i*5, j*5, 5, 5);

      //if (red(c)>200) {
      //  video.pixels[i+j*vWidth] = color(0);
      //}
    }
  }
  //updatePixels();
  //because video changes every frame, we dont need these



  //image(video, 0, 0, vWidth, vHeight);
}

void captureEvent(Capture video) {
  video.read();
}
