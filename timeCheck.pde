/*
This time check function keeps track of the countdown timer and when it reaches 0 it
 will perform tasks to reset the gameplay.
 */
void timeCheck() {
  //if statement for checking the timer count. 
  if (seconds < 0) {
    //when the timer is less that 0 the array limit is increased allowing the player to place more repulse orbs.
    arrayLim += 4;
    //the timer is restarted.
    timer = millis()/1000  + counter;
    //all the particles are reset to the other side of the screen and their velocity limit is increased so that the get faster.
    for (int i=0; i<particle.length; i++) {
        particle[i].loc.x = random(0, 100);
        particle[i].loc.y = random(0, height);
        particle[i].velocityLimit += 0.05;
      }
    }
  }


