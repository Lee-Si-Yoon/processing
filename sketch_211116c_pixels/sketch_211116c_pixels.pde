int w = 500;
int h = 500;
PImage img;
void setup() {
  img = loadImage("EP-190508997.jpg");
  size(1000, 800);
}

void draw() {
  background(255);

  loadPixels();
  //for (int i = 0; i < 10000; i++){
  //  //pixels[i] = color(255,0,0);
  //  if ( i % 2 == 0) pixels[i] = color(255,0,0);
  //  else pixels[i] = color(0,0,255);
  //}
  //for (int _x = 0; _x < w; _x++) {
  //  for (int _y = 0; _y < h; _y++) {
  //    int loc = _x + _y * w;
  //    // how  to get distance
  //    //float d = sqrt((mouseX - _x) * (mouseX - _x) + (mouseY - _y) * (mouseY - _y));
  //    //if (d< 50) pixels[loc] = color(255, 0, 0);
  //  }
  //}
  
  //for (int x = 0; x < img.width; x++) {
  //  for (int y = 0; y < img.height; y++) {
  //    int loc = x + y * img.width;
  //    pixels[loc] = img.pixels[loc];
  //  }
  //}
  
  for (int imgx = 0; imgx < 800; imgx++ ){
    for(int imgy = 0; imgy < 355; imgy++){
      int imgLoc = imgx + imgy * 800;
      int loc = (imgx+100) + (imgy+200) * width;
      pixels[loc] = img.pixels[imgLoc];
    }
  }
  updatePixels();
}
