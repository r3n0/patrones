class Particula {
  PVector pos;
  PVector vel;
  float escala;
  float tono;
  int intervalo;
  float angulo;
  int segnemtoDeCirculo;
  int triFor = 3;
  float COntro;

  Particula(float _rColor) {
    escala = int(random(1, 4)) * 30;
    angulo = (TWO_PI / (int(random(1, 3)) * triFor));

    segnemtoDeCirculo  = int(random(1, 3)) * triFor;

    setIntervalo();
    pos = PVector.random2D();
    pos.mult(random(height/2 - 100));
    vel = new PVector(1, 0);    
    vel.rotate(angulo * int(random(1, 8)));
    vel.mult(intervalo);
    tono = random(_rColor, _rColor + 70);
  }

  void check() {
    float condicion = random(1);
    float magnitud = pos.mag();
    if (magnitud > height/2 - 100) {
      vel.mult(-1);
    } else {
      strokeWeight(escala * 2/3);
      stroke(tono, 255, 255, 20);
      dibujar();
      if (COntro <= 0.5) {
        setIntervalo();
        vel.rotate(angulo);
      } else {
        if (condicion < 0.2) {
          vel.rotate(angulo);
        } else {
          vel.rotate(-angulo);
        }
      }
    }
  }

  void update() {
    PVector pPos = pos.copy();

    vel.normalize();
    vel.mult(intervalo);
    pos.add(vel);

    noFill();
    strokeWeight(escala/5);
    stroke(tono, 255, 255, 20);
    for (int i = 0; i < segnemtoDeCirculo; i++) {
      line(pPos.x, pPos.y, pos.x, pos.y);
      line(-pPos.x, pPos.y, -pos.x, pos.y);
      rotate((TWO_PI / segnemtoDeCirculo));
    }
  }


  void dibujar() {
    for (int i = 0; i < segnemtoDeCirculo; i++) {
      point(pos.x, pos.y);
      point(-pos.x, pos.y);
      rotate((TWO_PI / segnemtoDeCirculo));
    }
  }

  void setIntervalo() {
    intervalo = int(random(1, 5)) * int(escala );
  }
}
