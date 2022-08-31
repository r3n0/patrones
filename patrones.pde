int nP = 2;
Particula[] p = new Particula[nP];
float rColor = random(180);

//boolean sketchFullScreen() {
//  return false;
//}

void setup() {
  size(5000, 5000);
  background(0);
  colorMode(HSB);
  frameRate(10);
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
  }
  popMatrix();
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("image#####.png");
  } else if (key == 'r') {
    
    fill(0, 150);
    rect(0, 0, width, height);
    rColor = random(180);
    for (int i = 0; i < nP; i++) {
      p[i] = new Particula(rColor);
    }
    filter(BLUR);
  }else if(key == 'i'){
    for (int i = 0; i < nP; i++) {
      p[i].COntro = 1;
    }
  }else if(key == 'o'){
    for (int i = 0; i < nP; i++) {
      p[i].COntro = 0;
    }
  }
}
