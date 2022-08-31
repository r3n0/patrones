int nP = 4;
Particula[] p = new Particula[nP];
float rColor = random(150);
float COntro = random(1);
//boolean sketchFullScreen() {
//  return false;
//}

void setup() {
  size(3000, 3000);
  background(0);
  colorMode(HSB);
  for (int i = 0; i < nP; i++) {
    p[i] = new Particula(rColor);
  }
}

void draw() {

  pushMatrix();
  translate(width/2, height/2);

  for (int i = 0; i < nP; i++) {
    p[i].check(COntro);
    p[i].update();
    p[i].display();
  }
  popMatrix();
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("image####.png");
  } else if (key == 'r') {
    fill(0, 150);
    rect(0, 0, width, height);
    COntro = random(1);
    rColor = random(150);
    for (int i = 0; i < nP; i++) {
      p[i] = new Particula(rColor);
    }
  }
}
