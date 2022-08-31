int nP = 10;
Particula[] p = new Particula[nP];
float rColor = random(205);


void setup() {
  size(1000, 1000);
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
    p[i].check();
    p[i].update();
    p[i].display();
  }
  popMatrix();
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("image####.png");
  } else if (key == 'r') {
    fill(0, 50);
    rect(0, 0, width, height);
  }
}
