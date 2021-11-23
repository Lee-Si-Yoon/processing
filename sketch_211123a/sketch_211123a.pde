/*
 to find the point from 100 width array
 ex) 506 point is (100*5) + 6
 1920*3+300
 */

PImage img;

void setup() {
  size(500, 500);
  background(255);

  img = loadImage("lsy_damn.png");
  //image(img, 0,0);

  /*
  fill(255,0,0);
   circle(100,200,10);
   fill(0);
   circle(250,250,100);*/

  //loadPixels();
  //color c = pixels[99+199*500];
  //print(red(c), green(c), blue(c));

  /*
  int row;
   int col;
   row = 1;
   col = 1;
   
   img.loadPixels();
   color c = img.pixels[row+col*500];
   stroke(c);
   point(row,col);
   */

  /*
  for (int row = 0; row < 500; row+=50) {
   for (int col = 0; col < 500; col+=50) {
   color c = img.pixels[row+col*img.width];
   //stroke(c);
   //strokeWeight(20);
   //point(row,col);
   noStroke();
   fill(c);
   //rectMode(CENTER);
   rect(row, col, 50, 50);
   }
   }
   */
}

/*
void draw(){
 img.loadPixels();
 color c = img.pixels[mouseX+mouseY*500];
 //println(red(c), green(c), blue(c));
 fill(c);
 rect(0,0,50,50);
 }
 */

void draw() {
  background(255);
  image(img, 0, 0);



  for (int col = 0; col < 500; col++) {
    color c = img.pixels[mouseX + col * img.width];
    stroke(c);
    line(mouseX, col, 500, col);
  }

  for (int row = 0; row < 500; row+=50) {
    for (int col = 0; col < 500; col+=50) {
      //color c = img.pixels[row+col*img.width];
      //stroke(c);
      //strokeWeight(20);
      //point(row,col);
      //noStroke();
      //fill(c);
      //rectMode(CENTER);
      //rect(row, col, 50, 50);
    }
  }
}
