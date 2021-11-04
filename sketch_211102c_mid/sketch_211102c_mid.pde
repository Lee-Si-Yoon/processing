import processing.sound.*;
FFT fft;
AudioIn mic;
Amplitude amp;

int bands = 256; //default is 512
float[] fftVar = new float[bands];

void setup() {
  size(990, 550);
  stroke(0);
  strokeWeight(0.2);
  
  mic = new AudioIn(this, 0); // mic's number, 0 is first mic
  amp = new Amplitude(this);
  amp.input(mic);
  //mic.play();
  
  fft = new FFT(this, bands); // Analog ro Digital Converting(ADC)
  fft.input(mic);
}

int row = 55;
int rowP = row*2;
int dia = 110;
float dm;
float b = 0.0;
float inc2 = PI/6.0;

int move = 120;
int flop = 80;

void draw() {
  background(225);
  
  fft.analyze(fftVar);
  int Amp = int(amp.analyze()* 800);
  int mAmp = min(Amp, bands);
  float myAmp = map(mAmp, 0, bands, 0, height/4);

  for (int i = 0; i < 25; i ++) {
    fill(250-i*8, 0+i*20);
    dm = dia-i*4.6;

    //row1
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(0));
    ellipse(0 - sin(b) * myAmp/10 , 0 - i * myAmp/10, dm, dm);
    popMatrix();

    b = b + inc2;
  }
}
