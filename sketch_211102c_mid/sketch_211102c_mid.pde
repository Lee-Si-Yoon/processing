import processing.sound.*;
FFT fft;
AudioIn mic;
Amplitude amp;

int bands = 256; //default is 512
float[] fftVar = new float[bands];

int cols, rows;
int scl = 30;
int w = 1000;
int h = 2000;

float fly = 0;

float[][] terrain;

ArrayList<Ball> balls;

void setup() {
  size(990, 990, P3D);

  mic = new AudioIn(this, 0); // mic's number, 0 is first mic
  amp = new Amplitude(this);
  amp.input(mic);
  //mic.play();

  fft = new FFT(this, bands); // Analog ro Digital Converting(ADC)
  fft.input(mic);

  cols = w / scl;
  rows = h / scl;

  terrain = new float[cols][rows];
  balls = new ArrayList<Ball>();
}

int dia = 110;
float dm;
float b = 0.0;
float inc2 = PI/6.0;

int ballWidth = 48;

void draw() {
  background(0);
  fft.analyze(fftVar);
  int Amp = int(amp.analyze()* 800);
  int mAmp = min(Amp, bands);
  float myAmp = map(mAmp, 0, bands, 0, height/4);

  for (int i = 12; i < fftVar.length / 6; i++) {
    line(i * 2, height, i * 2, height - (fftVar[i] * 1200+10));
    //stroke(fftVar[i]*600+ 60);
    //circle(width/2, height/2, 400 - i*8);
    //circle(width/2, height/2, (400 - i*8)*(1+ fftVar[i]));
  }

  for (int i = 0; i < 25; i ++) {
    fill(250-i*8, 0+i*20);
    strokeWeight(0);
    dm = dia-i*4.6;
    //row1
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(0));
    ellipse(0 - sin(b) * myAmp/10, 0 - i * myAmp/10, dm, dm);
    popMatrix();
    b = b + inc2;
  }

  for (int i = balls.size() - 1; i >= 0; i--) {
    Ball ball = balls.get(i);
    //ball.move();
    ball.display();
    if (ball.finished()) {
      balls.remove(i);
    }
  }

  terrian(myAmp);
}

void mousePressed() {
  balls.add(new Ball(mouseX, mouseY, ballWidth));
}
