class Particula {
  PVector pos;
  PVector vel;
  float escala;
  float tono;
  int intervalo;
  float angulo;
  int segnemtoDeCirculo;

  Particula(float _rColor) {
    escala = int(random(1, 4)) * 5;
    angulo = TWO_PI / 3;

    segnemtoDeCirculo = int(random(1, 3)) *3;
    //pos = new PVector(0,0);
    pos = PVector.random2D();
    pos.mult(random(height/2 - 50));
    vel = new PVector(1, 0);
    vel.rotate(angulo * int(random(1, 8)));
    tono = random(_rColor, _rColor + 70);
    setIntervalo();
  }

  void check() {
    float condicion = random(1);
    float condicion2 = random(1);

    float magnitud = pos.mag();

    if (magnitud > height/2 - 50) {
      vel.mult(-1);
    }

    if (frameCount % intervalo == 0) {
      if (condicion < 0.5) {
        if (condicion2 < 0.5) {
          vel.rotate(angulo);
        } else {
          vel.rotate(angulo/2);
        }
      } else {
        if (condicion2 < 0.5) {
          vel.rotate(-angulo);
        } else {
          vel.rotate(-angulo/2);
        }
      }
      
      noFill();
      strokeWeight(escala/2);
      stroke(tono, 255, 255, 30);
      dibujar();
      setIntervalo();
    }
  }

  void update() {
    pos.add(vel);
  }

  void display() {
    noFill();
    strokeWeight(escala/6);
    stroke(tono, 255, 255, 10);
    dibujar();
  }

  void dibujar() {
    for (int i = 0; i < segnemtoDeCirculo; i++) {
      point(pos.x, pos.y);
      point(-pos.x, pos.y);
      rotate((TWO_PI / segnemtoDeCirculo));
    }
  }

  void setIntervalo() {
    intervalo = int(random(2, 4)) * int(escala);
  }
}

