class drop{
  
  float x , y , z;
  float easing = 0.3;
  float sy;
  
  drop(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void update(){
    float spd = map(z, 0, 5, 12, 2);
    y = y + spd;
    if(y > height - 20){
        y = -10;
        x = random(width);
    }
  }
  
  void collide(){
    float spd = map(z, 0, 5, 12, 2);
    float v = height - amp.analyze() * 8000;
    float vol = max(v, height/4);
    
    if(y > vol - 20){
      float targetY = (vol - 50);
      float dy = targetY - sy;
      y -= dy * easing;
      //y = vol - 20;
      stroke(255, 1 - spd/5);
    }
  }
  
  void show(){
    float t = map(z, 0 , 5 , 8 , 1);
    strokeWeight(t);
    //line(x , y , x , y + t * 2);
    ellipse(x, y + t * 2, t/2, t);
  }
}
