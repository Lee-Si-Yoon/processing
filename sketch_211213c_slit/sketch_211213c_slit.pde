import processing.video.*;

Capture video;

int camWidth = 320;
int camHeight = 240;

void setup() {
  size(800, 1000);
  background(255);

  video = new Capture(this, camWidth, camHeight);
  video.start();
}

float r = 0;
int y;

void draw() {
  image(video, width - camWidth/2, 0, camWidth/2, camHeight/2);
  
  if (mousePressed) {
    int vW = video.width;
    int vH = video.height;

    pushMatrix();

    translate((width/2), (height/2));

    rotate(r*10);
    
    copy(video, vW/3, vH/2, vW/3, 3, 100- int(y * 0.05), 0, vW/2- int(y * 0.1), 3);
    

    popMatrix();

    y = y + 1;

    r += 0.001;
  }
}

void captureEvent(Capture video) {
  video.read();
}
