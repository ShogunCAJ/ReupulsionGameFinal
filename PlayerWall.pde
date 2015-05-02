//I have used inheritance here to extend the class RepulseBox so that I do not need to rewrite the same class again. I can just modify this one.
class PlayerWall extends RepulseBox {

  //variables and constructor
  color col = color(255,109,158);
  PlayerWall(PVector pos_, float w_, float h_) {
    super(pos_, w_, h_);
  }

  void display() {
//this display function draws the player on screen and keeps track of the players bounds on screen
    pushMatrix();
    pWallBreach();
    noStroke();
    stroke(col, 100);
    ellipseMode(CENTER);
    fill(col);
    ellipse(pos.x, pos.y, w, h);
    popMatrix();

    pushMatrix();
    scale(1.5);
    fill(255);
    popMatrix();
  }

//this function tracks the distance between the player and the player walls and if it is under a certain amount 
//it will reverse the players controls until they hit a playerWall again. this adds difficulty to the game.
  void pWallBreach() {
      float dis = dist(player.pos.x, player.pos.y, pos.x, pos.y);
      if (dis < 90) {
        player.speed *= -1;
      }
  }
}

