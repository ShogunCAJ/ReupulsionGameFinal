
//This is the function for running the particles on screen.
void runParticles() {
  //This variable stores a random number between 1 and 2 every tiem this function is run.
  float ran = random(1,3);
  //run all the particles in the array every frame using the for loop
  for (int i=0; i<particle.length; i++) {
    //run() method takes two arguments - x and y values to apply forces to. In this case is is the base so that they will be attracted to it.
    particle[i].run(base.pos.x, base.pos.y); 
   
   //This for loop runs through all of the repulse orbs and calculates the distance between them and al lthe particles an screen.
   //Using the random number from above is selects a random PVector to replace the particles velocity with. 
    //So when the particles get too close to a repulse orb they will either move up or down to avoid it.
      for (int x = 0; x<repulse.size (); x++) {
        RepulseBox re = repulse.get(x);
        float dis = dist(particle[i].loc.x, particle[i].loc.y, re.pos.x, re.pos.y);
        if (dis<50) {
          if(ran < 2){
            particle[i].loc.x -= 2;
          particle[i].vel = new PVector(-1,1);
          }else if(ran > 2){
            particle[i].loc.x -= 2;
          particle[i].vel = new PVector(-1, -1);
          }
        }
      }
    }
  }


