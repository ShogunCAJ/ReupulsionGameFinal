/*

Made by Cormac Joyce - q1 of 2015.

Some methods taken and adapted from the following sketch. 
 http://www.openprocessing.org/sketch/18798
 */
//importing controlP5 library
import controlP5.*; 
//////////////INITIALIZING VARIABLES//////////////////
int timer, counter = 20, seconds;
int menu = 0, arrayLim = 4;
int num = 100; //how many particles we'll have in the system. More particles = slower sketch.

//Starting the array list for the repulsion orbs
ArrayList<RepulseBox> repulse;

//setting up the array for the particles
Particle[] particle = new Particle[num]; //Initialise array of particles of length "num"
//setting up the controlP5 buttons
ControlP5 controlP5;
controlP5.Button play, back, how;
//setting up base object
Base base;
//setting up the arrays for the player walls for the top of the screen the bottom and the base.
PlayerWall[] playerWallTop = new PlayerWall[6];
PlayerWall[] playerWallBottom = new PlayerWall[6];
PlayerWall baseWall;
//setting up player object
Player player;

void setup() {
  //setting size like this so that the window always has the same aspect ratio on every screen.
  size(displayWidth-600, displayHeight-300);
  smooth();  //turn on anti-aliasing
  noStroke();
  rectMode(CENTER);

  //here I am setting the timer in game to 20 seconds as "counter" is set to 20
  timer = millis()/1000  + counter;

  //Here I am creating the ControlP5 object and then drawing the buttons on screen.
  controlP5 = new ControlP5(this);
  play = controlP5.addButton("Play", 0, 40, 150, 140, 19);
  back = controlP5.addButton("Menu", 0, 40, 40, 80, 19);
  how = controlP5.addButton("How", 0, 40, 175, 140, 19);
  //initializing the player object in the centre of the screen. 
  player = new Player(new PVector(width/2, height/2));
  //setting up the arraylist full of RepulseBox objects called "repulse".
  repulse = new ArrayList<RepulseBox>();
  //setting up the position and size of the base.
  base = new Base(new PVector(width-100, height/2), 90, 90);
  //setting up the position and size of the baseWall that the player cannot pass.
  baseWall = new PlayerWall(new PVector(width-100, height/2), 150, 150);

  //Using for loops for both top and bottom player wall arras I set them up and set their size.
  for (int i = 0; i< playerWallTop.length; i++) {
    for (int j = 0; j< playerWallBottom.length; j++) {
      playerWallTop[i] = new PlayerWall(new PVector(300*i, 0), 150, 150);
      playerWallBottom[j] = new PlayerWall(new PVector(300*j+ 150, height), 150, 150);
    }
  }

  //fill particle array with new Particle objects
  for (int i=0; i<particle.length; i++) {
    particle[i] = new Particle(new PVector(random(0, 100), random(0, height)), 5, 100, 100);
  }
}


void draw() {
  background(255);
  //I am using menu states, here is the main menu "menu 0". 
  if (menu == 0 ) {
    //Here I am hiding and showing the relivant ControlP5 buttons
    play.show();
    how.show();
    back.hide();
  }

  if (menu == 1) {
    //this makes the tiem count down in exact seconds using Millis();
    seconds = timer - millis()/1000;
    //Here I am hiding and showing the relivant ControlP5 buttons
    play.hide();
    how.hide();
    back.show();
    //Here I am calling the relevant functions to draw all the game elements. please see the other tabs for details.
    timeCheck();
    drawBoxes();
    runParticles();
    player.display(); 

    //This for loop displays the repulse orbs fromt he array list. 
    for (int i = 0; i<repulse.size (); i++) {
      RepulseBox re = repulse.get(i);
      re.display(arrayLim);
    }
  }

  if (menu == 2 ) {
    //Here I am hiding and showing the relivant ControlP5 buttons
    play.hide();
    how.hide();
    back.show();
    //in the state I am drawing a text which I have written out below.
    fill(0);
    pushMatrix();
    scale(1.5);
    text("The aim of the game is to survive the most amount of time possible while protecting your base. \nPlace your repulsion orbs around to protect your base from the evil mites. \nIf too many Mites get to your base it's game over. \nBe carefull of the pink orbs! they will reverse your movement. \nmake a maze to effectivly stop the later waves.\n\n Made by Cormac Joyce", 100, 100);
    popMatrix();
  }
}
//KeyReleased and keyPresseed are called here and the functions inside them are called with them. please see the keyCheck tab for more detials.
void keyReleased() {
  KeyCheckUp();
}
void keyPressed() {
  keyCheck();
}


//Function for the "Back" button wich will be called when the butoon is clicked
public void Menu(int theValue) {
  //this for loop removes the repulion orbs for replay. 
  for (int i = 0; i<repulse.size (); i++) {
    //RepulseBox re = repulse.get(i);
    repulse.remove(i);
  }
  //I am setting the stae tot he relevant page
  menu = 0;
  //this sets the limit of the drawable repulse orbs back to 4
  arrayLim = 4;
}

//Function for the "Play" button wich will be called when the butoon is clicked
public void Play(int theValue) {
  //I am setting the stae tot he relevant page
  menu = 1;
}

//Function for the "How" button wich will be called when the butoon is clicked
public void How(int theValue) {
  //I am setting the stae tot he relevant page
  menu = 2;
}

