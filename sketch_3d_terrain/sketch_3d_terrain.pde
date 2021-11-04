// https://www.youtube.com/watch?v=IKB1hWWedMk

int cols, rows;
int scl = 30;
int w = 1000;
int h = 2000;

float fly = 0;

float[][] terrain;

void setup() {
  size(990, 550, P3D);

  cols = w / scl;
  rows = h / scl;
  noFill();
  stroke(255);

  terrain = new float[cols][rows];
}

void draw() {
  fly -= 0.1;
  float yoff = fly;
  for (int y = 0; y < rows; y ++) {
    float xoff = 0;
    for (int x = 0; x < cols; x ++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
  background(0);

  pushMatrix();

  translate(width/2, height/2+100);
  rotateX(PI/3);
  translate(-w/2, -h/2);

  for (int y = 0; y < rows-1; y ++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x ++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x* scl, y * scl, scl, scl);
    }
    endShape();
  }
  popMatrix();
}
