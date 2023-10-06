double dt = 0.01;
double t = 0;
int viewSize = 800;
double theta = 0;

// Box
double R = 200;

// Ball
int nbBalls = 4;
Ball[] balls = new Ball[nbBalls];

void settings() {
  size(viewSize, viewSize);
}

void setup() {  
  //Balls generation
  for (int i = 0; i < nbBalls; i++) {
    color randomColor = color(random(255), random(255), random(255));
    int randomSize = (int) random(25, 50);
    int randomWeight = (int) random(1, 10);
    PVector randomLocation = new PVector(random(-50, 50),random(-50, 50));
    PVector randomVelocity = new PVector(random(-5, 5),random(-5, 5));
    balls[i] = new Ball(randomColor, randomSize, randomWeight, randomLocation, randomVelocity);
    println("ID : "+i+balls[i].toString());
  }
}

void draw() {
  // Scene
  background(1);
  translate(viewSize / 2, viewSize / 2);

  // Box
  rotate((float) theta);
  fill(255, 255, 255);
  rect(-(float) R, -(float) R, 2 * (float) R, 2 * (float) R);
  rotate(-(float) theta);  

  // Ball
  for (Ball ball : balls) {
    ball.display();  
    ball.move();
  }
}
