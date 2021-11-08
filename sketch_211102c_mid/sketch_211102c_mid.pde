import processing.sound.*;
FFT fft;
AudioIn mic;
Amplitude amp;

int bands = 256; //default is 512
float[] fftVar = new float[bands];

int del = 3000;

float[][] terrain;

//ArrayList<Ball> balls;

void setup() {
  size(790, 990, P3D);

  mic = new AudioIn(this, 0); // mic's number, 0 is first mic
  amp = new Amplitude(this);
  amp.input(mic);
  //mic.play();

  fft = new FFT(this, bands); // Analog ro Digital Converting(ADC)
  fft.input(mic);

  cols = w / scl;
  rows = h / scl;

  terrain = new float[cols][rows];
  //balls = new ArrayList<Ball>();
}

int dia = 150;
float dm;
float b = 0.0;
float inc2 = PI/6.0;

int ballWidth = 48;

void draw() {
  background(0);
  fft.analyze(fftVar);
  int Amp = int(amp.analyze()* 1000);
  int mAmp = min(Amp, bands);
  float myAmp = map(mAmp, 50, bands, 0, height/30);

  // fft's 0~20 range get failed
  //String[] fftV = str(fftVar);
  //String[] fft20 = subset(fftV, 0, 20);
  //float[] ff20 = float(fft20);

  //float eas = float(str(subset(fftV, 0, 20)).substring(0,1));

  for (int i = 0; i < 25; i ++) {
    //println(myAmp);
    fill(255 - i*6, 0+i*6);
    noStroke();
    //strokeWeight(.8);
    dm = dia-i*5.6;
    { // 6
      pushMatrix();
      translate(width/2 - 170, 700);
      rotate(radians(-147));
      ellipse(0 - sin(b) * myAmp/4, 0 - (i * myAmp* 0.6), dm * 0.5, dm * 0.6 );
      popMatrix();
    }
    { // 7
      pushMatrix();
      translate(width/2 - 280, 670);
      rotate(radians(-127));
      ellipse(0 - sin(b) * myAmp/3, 0 - (i * myAmp* 1.1), dm * 0.5, dm * 0.9 );
      popMatrix();
    }
    { // 8
      pushMatrix();
      translate(width/2 - 300, 570);
      rotate(radians(-107));
      ellipse(0 - sin(b) * myAmp/2, 0 - (i * myAmp* 1.22), dm * 0.3, dm * 0.9 );
      popMatrix();
    }
    { // 9
      pushMatrix();
      translate(width/2 - 200, 470);
      rotate(radians(-90));
      ellipse(0 - sin(b) * myAmp/3, 0 - (i * myAmp* 0.6), dm * 0.5, dm * 0.7 );
      popMatrix();
    }
    { // 10
      pushMatrix();
      translate(width/2 - 220, 255);
      rotate(radians(-45));
      ellipse(0 - sin(b) * myAmp/2, 0 - (i * myAmp* 1.15), dm * 2.1, dm * 2.4 );
      popMatrix();
    }
    { // 12
      pushMatrix();
      translate(width/2 + 20, 145);
      rotate(radians(3));
      ellipse(0 - sin(b) * myAmp/2, 0 - (i * myAmp* 1.2), dm, dm * 1.3);
      popMatrix();
    }
    { // 1
      pushMatrix();
      translate(width/2 +250, 120);
      rotate(radians(35));
      ellipse(0 - sin(b) * myAmp/2, 0 - (i * myAmp*1.5), dm*2, dm*1.8 );
      popMatrix();
    }
    { // 2
      pushMatrix();
      translate(width - 220, 370);
      rotate(radians(60));
      ellipse(0 - sin(b) * myAmp/2, 0 - (i * myAmp*0.65), dm* 0.6, dm*0.8 );
      popMatrix();
    }
    { // 3
      pushMatrix();
      translate(width - 150, 500);
      rotate(radians(95));
      ellipse(0 - sin(b) * myAmp/3, 0 - (i * myAmp * 0.8), dm* 1.5, dm * 1.8 );
      popMatrix();
    }
    { // 4
      pushMatrix();
      translate(width - 180, 700);
      rotate(radians(133));
      ellipse(0 - sin(b) * myAmp/2, 0 - (i * myAmp * 0.9), dm* 1, dm * 1.2 );
      popMatrix();
    }
    { // 5
      pushMatrix();
      translate(width - 180, 850);
      rotate(radians(145));
      ellipse(0 - sin(b) * myAmp/4, 0 - (i * myAmp * 0.6), dm* 0.4, dm * 0.6 );
      popMatrix();
    }
    b = b + inc2;
  }

  //for (int i = balls.size() - 1; i >= 0; i--) {
  //  Ball ball = balls.get(i);
  //  //ball.move();
  //  ball.display();
  //  if (ball.finished()) {
  //    balls.remove(i);
  //  }
  //}
  circle(bands, del);
  terrian(mAmp);
}

//void mousePressed() {
//  balls.add(new Ball(mouseX, mouseY, ballWidth));
//}
