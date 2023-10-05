class Ball {
  color c;
  int ballSize;
  PVector location;
  PVector velocity;
  PVector gravity;
  
  Ball(color col, PVector vel, int size) {
    c = col; 
    ballSize = size;
    location = new PVector(width/2,height/2);
    velocity = vel;
    gravity = new PVector(0,0.1);  
  }
  
  String toString() {
    String s = "\nCouleur : #"+hex(c, 6);
    s += "\nTaille : "+ballSize;
    s += "\nVelocité de départ : ("+velocity.x+","+velocity.y+")";
    s += "\n";
    return s;
  }
  
  void display() { 
    fill(c);
    circle(location.x,location.y,ballSize);
  }
  
  void move() {
    //Forces
    location.add(velocity.x,velocity.y);
    velocity.add(gravity.x,gravity.y);
  }
  
  void checkWallsCollision() {
    //Right
    if ((location.x > (width-boxWidth/2)-ballSize/2)) {
      velocity.x = velocity.x * -1;
    }
    //Left
    if (location.x < (boxWidth / 2)+ballSize/2) {
      velocity.x = velocity.x * -1;
    }
    //Top
    if (location.y < (boxHeight / 2)+ballSize/2) {
      velocity.y = velocity.y * -1;
    }
    //Bottom
    if (location.y > (height-boxHeight/2)-ballSize/2) {
      velocity.y = velocity.y * -0.95; 
    }
  }
    
  void checkBallsCollision() {
    
  }
}
