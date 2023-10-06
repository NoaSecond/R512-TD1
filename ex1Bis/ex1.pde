double dt=0.01;
double t=0;
double R=200;
int viewSize=800;

//Box
int boxWidth = 400;
int boxHeight = boxWidth;

//Balls
int nbBalls = 4;
Ball[] balls = new Ball[nbBalls];

void drawArrow(int cx, int cy, int len, float angle){
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
  line(0,0,len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}

void settings() {
    size(viewSize,viewSize); 
}

void setup() {
  for (int i = 0; i < nbBalls; i++) {
    color randomColor = color(random(255), random(255), random(255));
    PVector randomVelocity = new PVector(random(-5, 5),random(-5, 5));
    int randomSize = (int) random(25, 50);
    balls[i] = new Ball(randomColor, randomVelocity, randomSize);
    println("ID : "+i+balls[i].toString());
  }
}

void draw() {
  //Scene
  background(1);
  translate(viewSize/2,viewSize/2);
        
  //Boite
  rotate((float) t);
  fill(255,255,255);
  translate(-boxWidth, -boxWidth);
  rect((width-boxWidth)/2,(height-boxHeight)/2,boxWidth,boxHeight, 50);
  
  //Arrow
  strokeWeight(2);
  stroke(255,0,0);
  drawArrow((width-boxWidth),height-(boxHeight/2)-50,50,90); //X Y Size Rotation
    
  //Balls
  strokeWeight(0);
  stroke(0,0,0);
  for (Ball ball : balls) {
    ball.display();  
    ball.move();
    ball.checkWallsCollision();
    ball.checkBallsCollision();
  }
  
  //Update rotation state
  t+=dt;
}
