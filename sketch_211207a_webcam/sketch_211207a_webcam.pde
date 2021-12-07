import processing.video.*;
Capture video;

int vWidth = 160;
int vHeight = 120;
int col, row;

void setup() {
  size(500, 500);

  col = floor(width/vWidth);
  row = floor(height/vHeight);

  video = new Capture(this, 320, 240);
  video.start();
}

void draw() {
  background(255);
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      tint(i*40, j*40, 255);
      image(video, i * vWidth, j*vHeight, vWidth, vHeight);
    }
  }
}

void captureEvent(Capture video) {
  video.read();
}
