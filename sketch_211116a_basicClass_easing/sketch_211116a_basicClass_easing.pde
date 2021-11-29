//float[] cx;
//float[] cy;
int total = 20;

//Ball ball1;
Ball[] ball;

void setup() {
  size(500, 500);
  //cx = new float[total];
  //cy = new float[total];

  //ball1 = new Ball();
  ball = new Ball[total];
  for (int i = 0; i < total; i ++) {
   ball[i] = new Ball(5*i); 
  }
}

void draw() {
  background(150);
  noFill();
  for (int i = 0; i < total; i ++) {
    ball[i].update();
    ball[i].show();
  }

  //for(int i = 0; i < total; i++){
  //  cx[i] += (mouseX-cx[i])/(1+2*i);
  //  cy[i] += (mouseY-cy[i])/(1+2*i);
  //  ellipse(cx[i],cy[i],10*i,10*i);
  //}

  // basic easing
  //cx += (mouseX - cx)/30;
  //cy += (mouseY - cy)/30;
  //ellipse(cx,cy,50,50);
}

class Ball {
  float cx;
  float cy;
  float radius;
  
  Ball(float r){
    radius = r;
  }

  void update() {
    cx += (mouseX - cx)/30;
    cy += (mouseY - cy)/30;
  }
  void show() {
    circle(cx, cy, radius);
  }
}
