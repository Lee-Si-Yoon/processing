ArrayList<strike> s = new ArrayList<strike>();

//strike s;

void setup() {
  size(800, 800);
  //s = new strike(new PVector(width/2, height/2), 200, 0, 5);
}

void draw() {
  background(150);
  for (int i = s.size() - 1; i >= 0; i--) {
    s.get(i).update(20);
    s.get(i).show();
    if (s.get(i).dead) s.remove(i);
  };
}

void mouseReleased() {
  s.add(new strike(new PVector(mouseX, mouseY), 200, 0, 5));
}

//https://www.youtube.com/watch?v=bYgEyWckOI0
