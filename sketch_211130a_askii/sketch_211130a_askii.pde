// ASKI art

PImage img;
String[] ascii = { "M", "W", "R", "8", "D", "C", "?", ":", "."};
int step;
float scale = 1;

String ascString = ".`-_':,;^=+/\"|)\\<>)iv%xclrs{*}I?!][1taeo7zjLunT#JCwfy325Fp6mqSghVd4EgXPGZbYkOA&8U$@KHDBWNMR0Q"
;

void setup() {
  size(1000, 1200);
  background(255);

  //step = ceil(255/ascii.length);
  step = floor(255/ascString.length());

  img = loadImage("download.jpg");
  //img.resize(130,200);
  //image(img,0,0);
  scale = width/img.width;

  img.loadPixels();

  textSize(3);
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      color rgb = img.pixels[x+y*img.width];
      float grey = red(rgb)*0.21 + green(rgb)*0.72 + blue(rgb)*0.07;
      grey = 256-grey;
      fill(0);
      String txt;
      //if(floor(grey/85) ==0) {
      //  txt = ascii[0];
      //} else if(floor(grey/85) ==1){
      //  txt = ascii[1];
      //} else {
      //  txt = ascii[2];
      //}
      //txt = ascii[min(ascii.length- 1, floor(grey/step))];
      int idx = min(ascString.length()-1, floor(grey/step));
      txt = ascString.substring(idx,idx+1);
      textSize((idx+1)*0.5);
      text(txt, x*6, y*6);
    }
  }
}

void draw() {
}
