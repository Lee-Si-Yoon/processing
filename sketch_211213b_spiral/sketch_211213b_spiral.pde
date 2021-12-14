float r = 0;
float theta = 0;
float r2 = 10;
float theta2 = 0;

void setup() {
  size(480, 270);
  background(255);
}

void draw() {
  // Polar to Cartesian conversion
  float x = r * cos(theta);
  float y = r * sin(theta);
  float x2 = r2 * cos(theta2);
  float y2 = r2 * sin(theta2);
  
  float DIST = dist(x,y, x2,y2);

  // Draw an ellipse at x,y
  noStroke();
  fill(0);
  // Adjust for center of window
  ellipse(x+width/2, y+height/2, 3, 3); 
  ellipse(x2+width/2, y2+height/2, 3, 3); 

  println(DIST);
  // Increment the angle
  theta += 0.01;
  theta2 += 0.01;
  // Increment the radius
  r += 0.05;
  r2 += 0.05;
}
