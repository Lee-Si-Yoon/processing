Ball[] a;

void setup(){
  size(500,500);
  
  a = new Ball[10];
  for(int i = 0; i< a.length; i++){
    a[i] = new Ball(30,30);
  }
}

void draw(){
  for(int i =0; i<a.length; i ++){
    a[i].draw();
  }
}
