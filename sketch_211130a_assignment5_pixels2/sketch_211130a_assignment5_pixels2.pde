/*
 to find the point from 100 width array
 ex) 506 point is (100*5) + 6
 1920*3+300
 */

PImage img;

int total = 500;

void setup() {
  size(500, 500);
  background(255);

  img = loadImage("1.jpg");
  img.resize(500, 500);
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
      rectMode(CENTER);
      pushMatrix();
      translate(x, y);
      if (bright < 50) {
        fill(bright);
        for (int z = 0; z < 10; z++) {
          fill(bright, 100-z*10);
          rect(0, 0, z*1, z*3);
        }
      }
      popMatrix();
    }
  }
  for (int x = 0; x < img.width; x+=10) {
    float r, g, b;
    for (int y = 0; y < img.height; y+=1) {
      int loc = x + y * img.width;
      r = int(red(img.pixels[loc]));
      g = int(green(img.pixels[loc]));
      b = int(blue(img.pixels[loc]));
      float bright = (r+g+b)/3;
      noStroke();
      rectMode(CENTER);
      pushMatrix();
      translate(x, y);
      if (50< bright && bright < 100) {
        for (int z = 0; z < 10; z++) {
          fill(bright, 100-z*10);
          rect(0, 0, z*2, z*2);
        }
      }
      popMatrix();
    }
  }
  for (int x = 0; x < img.width; x+=12) {
    float r, g, b;
    for (int y = 0; y < img.height; y+=2) {
      int loc = x + y * img.width;
      r = int(red(img.pixels[loc]));
      g = int(green(img.pixels[loc]));
      b = int(blue(img.pixels[loc]));
      float bright = (r+g+b)/3;
      noStroke();
      rectMode(CENTER);
      pushMatrix();
      translate(x, y);
      if (100< bright && bright < 150) {
        for (int z = 0; z < 5; z++) {
          fill(bright, 150-z*5);
          rect(0, 0, z, z);
        }
      }
      popMatrix();
    }
  }
  for (int x = 0; x < img.width; x+=8) {
    float r, g, b;
    for (int y = 0; y < img.height; y+=1) {
      int loc = x + y * img.width;
      r = int(red(img.pixels[loc]));
      g = int(green(img.pixels[loc]));
      b = int(blue(img.pixels[loc]));
      float bright = (r+g+b)/3;
      noStroke();
      rectMode(CENTER);
      pushMatrix();
      translate(x, y);
      if (150< bright && bright < 200) {
        for (int z = 0; z < 3; z++) {
          fill(bright, 200-z*20);
          rect(0, 0, z, z);
        }
      }
      popMatrix();
    }
  }
  for (int x = 0; x < img.width; x+=3) {
    float r, g, b;
    for (int y = 0; y < img.height; y+=1) {
      int loc = x + y * img.width;
      r = int(red(img.pixels[loc]));
      g = int(green(img.pixels[loc]));
      b = int(blue(img.pixels[loc]));
      float bright = (r+g+b)/3;
      noStroke();
      rectMode(CENTER);
      pushMatrix();
      translate(x, y);
      if (200< bright && bright < 250) {
        for (int z = 0; z < 3; z++) {
          fill(bright, 250-z*30);
          rect(0, 0, z, z);
        }
      }
      popMatrix();
    }
  }
  for (int x = 0; x < img.width; x+=2) {
    float r, g, b;
    for (int y = 0; y < img.height; y+=2) {
      int loc = x + y * img.width;
      r = int(red(img.pixels[loc]));
      g = int(green(img.pixels[loc]));
      b = int(blue(img.pixels[loc]));
      float bright = (r+g+b)/3;
      noStroke();
      rectMode(CENTER);
      pushMatrix();
      translate(x, y);
      if (250< bright && bright < 256) {
        for (int z = 0; z < 2; z++) {
          fill(bright, 250-z*30);
          ellipse(0, 0, z, z);
        }
      }
      popMatrix();
    }
  }
}
