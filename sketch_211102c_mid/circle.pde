
void circle(float bands, float del) {

  for (int i = 0; i < bands; i ++) {
    strokeWeight(1);
    stroke(255);
    float deg = map(bands, 0, 255, 0, PIE*2);
    pushMatrix();
    translate(width/2, height/2 - 20);
    rotate(i*deg);
    line(5, 5, 5 + (fftVar[i] * del), 5 + (fftVar[i] * del));
    popMatrix();
  }
}
