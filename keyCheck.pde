/*
This keyCheck function checks teh w.s.a and d buttons if they have been pressed. 
when once of them is then 1 is added the the relevant variable wich is then multiplied by the speed i.e 5. 
Both these functions are being called in the KeyPressed and the KeyReleased functions on the main app page.
*/
void keyCheck() {

  if (key == 'a') {
    player.left = 1;
  }

  if (key == 'd') {
    player.right = 1;
  }    
  if (key == 'w') {
    player.up = 1;
  }

  if (key == 's') {
    player.down = 1;
  }

//here the keyCheck checks the spacebar  and when pressed a new repulse orb is added to the arraylist with the player's 
//x and y coordinates. 
  if (key == ' ') {
   PVector temp = new PVector(player.pos.x,player.pos.y);
   repulse.add(new RepulseBox(temp,50,50));
  }
}


/*
  This function keys for when keys are released and when they are the relevant variable is made to be 0 effectivaly stopping the movement
  as that speed is being multiplied by the speed.
*/
void KeyCheckUp() {

  if (key == 'a') {
    player.left = 0;
  }

  if (key == 'd') {
    player.right = 0;
  }    
  if (key == 'w') {
    player.up = 0;
  }

  if (key == 's') {
    player.down = 0;
  }
  
 
}

