void terrian(float mAmp) {
  if (mAmp > 10) fly -= 0.1;
  float yoff = fly;
  for (int y = 0; y < rows; y ++) {
    float xoff = 0;
    for (int x = 0; x < cols; x ++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  pushMatrix();
  translate(width/2, height/2+500);
  rotateX(PI/2);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y ++) {
    noFill();
    stroke(255, 20);
    strokeWeight(1);
    beginShape();
    for (int x = 0; x < cols; x ++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
  popMatrix();
}
