//https://www.youtube.com/watch?v=dD9CwuvsBXc
import processing.sound.*;
AudioIn mic;
Amplitude amp;

PImage logo;

int n = 80;

drop[] d;

void setup(){
  mic = new AudioIn(this, 0); // mic's number, 0 is first mic
  amp = new Amplitude(this);
  amp.input(mic);
  mic.play();
  
  size(400, 1000);
  stroke(10);
  
  d = new drop[n];
  
  for(int i = 0; i < d.length; i++){
    d[i] = new drop(random(width), random(-10,20), random(5));
  };
  
}

float y;
float easing = 0.05;

void draw(){
  logo = loadImage("goretex.png");
  background(0);

  for(int i = 0; i < d.length; i++){
    d[i].show();
    d[i].update();
    d[i].collide();
  };
  
  float v = amp.analyze() * 8000;
  float vol = min(v, height);

  float targetY = (height + 200) - (vol+ 150);
  float dy = targetY - y;
  y += dy * easing;
  
  imageMode(CENTER);
  image(logo, width/2, y, 400, 108);
}
