import processing.video.*;

Capture video;
int signal = 0;

int camWidth = 160;
int camHeight = 120;

PImage logo;
PImage back;

ArrayList frames = new ArrayList();

void setup() {
  size(800, 1100);
  // GREEN
  //background(80,130,90);
  // WHITE
  background(255);

  logo = loadImage("uzu.png");
  logo.resize(650, 120);
  
  //back = loadImage("back.png");
  //back.resize(800,1100);
  
  //tint(255,126);
  //image(back, 0, 0);

  video = new Capture(this, camWidth, camHeight);
  video.start();
  
}

void captureEvent(Capture video) {
  video.read();
  //PImage img = createImage(video.width, video.height, RGB);
  //video.loadPixels();
  //arrayCopy(video.pixels, img.pixels);
  //frames.add(img);
  //if (frames.size() > video.height/4) {
  //  frames.remove(0);
  //}
}

void peekScreen() {
  //int currentImage = 0;
  ////float threshold = 120;

  //loadPixels();

  //for (int y = 0; y < video.height; y+=4) {

  //  if (currentImage < frames.size()) {
  //    PImage img = (PImage)frames.get(currentImage);
  //    if (img != null) {
  //      img.loadPixels();

  //      for (int x = 0; x < video.width; x++) {
  //        for (int e = 0; e < 4; e++) {

  //          int imgLoc = x + (y + e) * video.width;
  //          // GREY
  //          color c = img.pixels[imgLoc];
  //          float grey = floor(red(c)*0.27+green(c)*0.71+blue(c)*0.02);
  //          img.pixels[imgLoc] = color(grey);

  //          // BW
  //          //if (brightness(img.pixels[imgLoc]) > threshold) {
  //          //  img.pixels[imgLoc] = color(255);
  //          //} else {
  //          //  img.pixels[imgLoc] = color(0);
  //          //}
  //          // GREEN
  //          //float r = red(img.pixels[imgLoc]);
  //          //float g = green(img.pixels[imgLoc]);
  //          //float b = blue(img.pixels[imgLoc]);
  //          //img.pixels[imgLoc] = color(r/1.5, g/1.2, b/1.5);

  //          pixels[(width - video.width + x) + (y + e) * width] = img.pixels[imgLoc];
  //        }
  //      }
  //      currentImage++;
  //    }
  //  } else {
  //    break;
  //  }
  //}

  //updatePixels();

  // Indicator
  noFill();
  rectMode(CENTER);
  stroke(255, 0, 0);
  //HEAD
  rect(width-(video.width/2), video.height/2, 61, 81);
  //lARM
  rect(width-(video.width/3) + 31, video.height/2, 44, 43);
  //textSize(50);
  fill(255, 0, 0);
  text("middle", width-(video.width/2) - 30, video.height/2 - 42);
  text("lArm", width-(video.width/3) + 10, video.height/2 - 25);
}

float r = 0;
int y;

void draw() {
  loadPixels();
  video.loadPixels();
  for (int w = 0; w < video.width; w++) {
    float R, G, B;
    for (int h = 0; h < video.height; h++) {
      int loc = (width - video.width + w) + h * width;
      int loca = w + h * video.width;
      R = int(red(video.pixels[loca]));
      G = int(green(video.pixels[loca]));
      B = int(blue(video.pixels[loca]));

      pixels[loc] = color(R/1.3, G, B/1.2);
    }
  }
  updatePixels();


  peekScreen();

  //HEAD
  pushMatrix();
  translate((width/2), (height/2));
  rotate(r*12);
  copy(width - (video.width/3)*2, video.height/2 - 40, video.width/3, 79,
    0 + int(y * 0.2), 0, video.width/2 - int(y * 0.01), 80);
  popMatrix();

  //lARM
  pushMatrix();
  translate((width/2) + 300, (height/2) + 300);
  rotate(r*8);
  copy(width - (video.width/3 - 10), video.height/2 - 21, video.width/3, 41,
    0 + int(y * 0.07), 0, video.width/3 - int(y * 0.01), 42);
  popMatrix();

  //rARM
  pushMatrix();
  translate((width/2) - 300, (height/2) - 400);
  rotate(r*10);
  copy(width - (video.width), video.height/2 - 10, video.width/3 -5, 19,
    0 + int(y * 0.07), 0, video.width/6 - int(y * 0.01), 20);
  popMatrix();



  if (r < -1.286) {
    r = 0;
    y=0;
  } else {
    y = y + 1;

    r -= 0.001;
  }

  // Logo
  tint(0);
  image(logo, width/2 - (logo.width/2), height - logo.height * 1.6);
}
