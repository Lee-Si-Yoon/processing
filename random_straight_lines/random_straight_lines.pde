int xrand = 300;
int yrand = 300;
int py = 0;
int px = 0;
int x;
int y;
float n1;
float n = noise(n1)*100;
 
void setup() {
    size(500, 500);
    smooth();
    frameRate(600);
}
 
void draw() {
    x = xrand;
    y = yrand;
    rect(px, py, x, y);
    xrand = (int) random(0, width);
    yrand = (int) random(0, height);
    px = x;
    py = y;
    stroke(px,py);
    fill(n*py/2,n*py/2,n*py/2,n);
}
 
void mousePressed() {
    println(xrand, yrand, px, py, x, y);
}
