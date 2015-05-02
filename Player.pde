//This class if for the user's character
class Player {
//Initialising the variables
  PVector pos;
  float speed = 5.0;
  float left, right, up, down;

//constructor
  Player(PVector _pos ) {
    pos = _pos;
  }

//setting the playings starting location
  void setPlayer() {
    pos = new PVector(width/2, height/2);
  }

//this display function draws the player on screen and keeps track of the players bounds on screen
  void display() {
    bounds();
    pushMatrix();
    fill(38, 211, 255);
    noStroke();
    ellipse(pos.x, pos.y, 25, 25);
    //this controls the x and y position of the player. Please see the keyCheck tab for more details
    //when left,right, up or down is pressed the speed is multiplied by the possiton giving th player smooth movement.
    pos.x += (right - left) * speed;
    pos.y += (down - up) * speed;
    popMatrix();
  }

//the bounds function keeps the pleyer on the screen.
  void bounds() {
    if (pos.y > height ) {
      pos.y  = height-1;
    }
    if (pos.y < 0) {
      pos.y  = 1;
    }
    if (pos.x > width) {
      pos.x  = width-1;
    }
    if (pos.x < 0) {
      pos.x = 1;
    }
  }
}

