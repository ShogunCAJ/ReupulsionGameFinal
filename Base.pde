
//I have used inheritance here to extend the class RepulseBox so that I do not need to rewrite the same class again. I can just modify this one.
class Base extends RepulseBox {
//Setting the variables
  int score = 10000;
  color col = color(255, 195, 0);
  
  //settting up the constructor and using "super" to inherite the variabels from RepulseBox
  Base(PVector pos_, float w_, float h_) {
    super(pos_, w_, h_);
  }

  void display() {
    //using Push and pop matrices to set the apperence of the base object.
    pushMatrix();
    //I am calling the detectBreach function from below so that the program can monitor the breaches. 
    detectBreach();
    stroke(col, 100);
    fill(col);
    noStroke();
    rect(pos.x, pos.y, w, h, 10);
    popMatrix();
 //using Push and pop matrices to set the apperence of the base object.
    pushMatrix();
    fill(0);
    rect(width-70, 135, 50, 50);
    popMatrix();

    pushMatrix();
    scale(1.5);
    fill(255);
    //here I am drawing the the score in the black box to inform the player of their score.
    text(score + "\nPoints", width-500, 90);
    popMatrix();
  }

//this function runs through the particle class and calculates the distance between the paticles and the base.
//if any of the particles are with a certain distance 1 point will be subtracted from the score.
  void detectBreach() {
    for (int i=0; i<particle.length; i++) {
      float dis = dist(particle[i].loc.x, particle[i].loc.y, pos.x, pos.y);
      if (dis < 55) {
        score = score - 1;
      }
    }
  }
}

