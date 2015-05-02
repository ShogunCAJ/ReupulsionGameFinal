
//This function is in charge of drawing all of the repulse orbs, bases,playerWalls and the timer rectangles.
void drawBoxes() {
//using for loops to draw theplayerWalls ont he top and the bottom of the screen
  for (int i = 0; i<playerWallTop.length; i++) {
    playerWallTop[i].display();
  }
  for (int j = 0; j<playerWallBottom.length; j++) {
    playerWallBottom[j].display();
  }
  
  //displaying the baseWAll
  baseWall.display();

//displaying the black box behind the timer and the timer.
  pushMatrix();
  noStroke();
  fill(0);
  rect(width-70, 60, 50, 50);
  popMatrix();

  pushMatrix();
  scale(1.5);
  noStroke();
  fill(255);
  text(seconds, width-500, 50);
  popMatrix();

//displaying the base.
  base.display();
}

