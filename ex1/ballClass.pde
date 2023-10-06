class Ball {
  color c;
  int masse;
  double rayon, gravity;
  double omega = 0.25;
  PVector location;
  PVector velocity;
  PVector location0;
  PVector velocity0;
  
  Ball(color col, int size, int masse, PVector randomLocation, PVector randomVelocity) {
    c = col; 
    rayon = size/2;
    location = randomLocation;
    velocity = randomVelocity;
    location0 = new PVector(0, 0);
    velocity0 = new PVector(0, 0);
    gravity = 1500; 
  }
  
  String toString() {
    String s = "\nCouleur : #"+hex(c, 6);
    s += "\nTaille : "+rayon*2;
    s += "\n";
    return s;
  }
  
  void display() { 
    fill(c);
    circle(location.x,location.y, (float) (rayon * 2));
  }
  
  void move() {
    t += dt;
    theta += dt * omega;
    velocity.y += dt * gravity;
    PVector locationN = new PVector(location.x, location.y);
    location.add(PVector.mult(velocity, (float) dt));
  
    for (int i = 0; i < 4; i++) {
      PVector n = new PVector((float) Math.cos(theta + Math.PI / 2 * i), (float) Math.sin(theta + Math.PI / 2 * i));
      double d = location.x * n.x + location.y * n.y;
      double p = (d - (R - rayon)) < 0 ? 0 : (d - (R - rayon));
      PVector m = PVector.mult(n, (float) p);
      location.sub(m);
    }
    PVector e = PVector.sub(location, locationN);
    velocity = PVector.div(e, (float) dt);
  }
}
