/*
 to find the point from 100 width array
 ex) 506 point is (100*5) + 6
 1920*3+300
 */

PImage img;

int total = 500;
Particle[] p;
float mappedImage[];

void setup() {
  size(500, 500);
  background(255);

  img = loadImage("icon.jpg");
  img.resize(500, 500);

  p = new Particle[total];

  for (int i = 0; i < p.length; i ++) {
    p[i] = new Particle(total, total);
  }
}

void draw() {
  background(255);
  loadPixels();

  for (int x = 0; x < img.width; x+=1) {
    float r, g, b;
    for (int y = 0; y < img.height; y+=1) {
      int loc = x + y * img.width;
      r = int(red(img.pixels[loc]));
      g = int(green(img.pixels[loc]));
      b = int(blue(img.pixels[loc]));
      float bright = (r+g+b)/3;
      noStroke();
      p[x].update();
      p[x].show(x,y,r, g, b, bright);
    }
  }
}
