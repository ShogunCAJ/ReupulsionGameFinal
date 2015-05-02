class RepulseBox {
 // Location,colour and size variables
  float x, y, w, h, dis;       
  PVector pos;
  int radius = 25;
  color col = color(255, 150, 50);

//constructor
  RepulseBox(PVector tempPos, float tempW, float tempH) {
    pos = tempPos;
    w = tempW;
    h = tempH;
  }


  void display(int arrayLim) {
//this for loop checks if the arraylist size is larger than the limit of the array list in this case four. 
    for (int x = 0; x<repulse.size (); x++) {
      if (x == arrayLim) {
        //if it is larger than the limit the repulse orb is removed emediatly. this stops the user from placing more than four at a time.
        repulse.remove(arrayLim);
      }
    }
      // Method to display
    pushMatrix();
    stroke(col, 100);
    fill(col);
    strokeWeight(25);
    ellipse(pos.x, pos.y, w, h);
    popMatrix();

  }

}

