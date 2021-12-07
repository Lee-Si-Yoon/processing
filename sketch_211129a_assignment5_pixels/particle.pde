class Particle{
  float x,y;
  int imgWidth, imgHeight;
  float vel, size;
  float speed;
  
  Particle(int imgW, int imgH){
    imgWidth = imgW;
    //imgHeight = imgH;
    x = random(imgW);
    y = random(imgH);
    speed = 0;
    vel = random(0.1);
    size = random(1.5) + 10;
  }
  
  void update(){
    y += vel;
    if(y > height){
      y = 0;
      x = random(imgWidth);
    }
  }
  
  void show(float xpos, float ypos, float r, float g, float b, float bright){
    //if(y == ypos && x == xpos){
    //  fill(r,g,b,bright);
    //} else{
    //  noFill();
    //}
    fill(r,g,b,bright);
    //if(x == xpos && y == ypos) 
    ellipse(x,y, size,size);
  }
}
