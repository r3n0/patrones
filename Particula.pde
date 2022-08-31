class Particula {
  PVector pos;
  PVector vel;
  float escala;
  float tono;
  int intervalo;
  float angulo;
  int segnemtoDeCirculo;
  int triFor = 5;

  Particula(float _rColor) {
    escala = int(random(1, 8)) * 20;
    angulo = (TWO_PI / (int(random(1, 3)) * triFor));

    segnemtoDeCirculo = int(random(1, 3)) * triFor;
    pos = PVector.random2D();
    pos.mult(random(height/2 - 50));
    vel = new PVector(1, 0);
    vel.rotate(angulo * int(random(1, 8)));
    tono = random(_rColor, _rColor + 70);
    setIntervalo();
  }

  void check(float _COntro) {
    float condicion = random(1);

    if (frameCount % intervalo == 0) {

      float magnitud = pos.mag();
      if (magnitud > height/2 ) {
        vel.mult(-1);
      } else {
        strokeWeight(escala);
        stroke(tono, 255, 255, 50);
        dibujar();

        if (_COntro <= 0.5) {
          setIntervalo();
          vel.rotate(angulo);
        } else {
          if (condicion < 0.5) {
            vel.rotate(angulo);
          } else {
            vel.rotate(-angulo);
          }
        }
      }
    }
  }

  void update() {
    pos.add(vel);
  }

  void display() {
    noFill();
    strokeWeight(escala/3);
    stroke(tono, 255, 255, 5);
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
    intervalo = int(random(1, 5)) * 2 * int(escala );
  }
}
