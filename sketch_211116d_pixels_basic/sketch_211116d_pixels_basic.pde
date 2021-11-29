size(500,500);
loadPixels();
for(int x = 0; x < 500; x ++) {
  for(int y = 0 ; y < 500; y ++){
    int loc = x + y * 500;
    if( x > 400 && x < 450 && y > 200 && y < 250) pixels[loc] = color(255,0,0);
  }
}
updatePixels();
