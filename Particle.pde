//This Particle class was influenced and repurposed from 
//http://www.openprocessing.org/sketch/18798

class Particle {

  PVector loc, vel, acc; //location, velocity and acceleration
  int sz;  //size of particle
  float gravity;  //gravity variable
  float mass;  //mass variable
  float velocityLimit = 0.7;  //the maximum velocity a particle can travel at
  float d;  //distance variable between particle and the target co-ordinates

  //CONSTRUCTOR
  Particle(PVector _loc, int _sz, float _gravity, float _mass) {
    loc = _loc.get();  //when calling loc, return current location of the selected particle
    vel = new PVector(0, 0);  //set vel and acc vectors to 0 as default
    acc = new PVector(0, 0);
    sz = _sz;
    gravity = _gravity;
    mass = _mass;
  }


  //method to render the particle and control how it looks.
  void display() {
    pushMatrix();
    ellipseMode(CENTER);
    fill(100, d, 100);
    noStroke();
    ellipse(loc.x, loc.y, sz, sz);
    popMatrix();
  }

  //math for attraction and repulsion forces
  //tx and ty are the co-ordinates attraction/repulsion will be applied to
  void forces(float tx, float ty) {

//creating new vector for attractive/repulsive x and y values
    PVector targetLoc = new PVector(tx, ty);  
    //calculate the direction between a particle and targetLoc
    PVector dir = PVector.sub(loc, targetLoc);  
     //calculate how far away the particle is from targetLoc
    d = dir.mag();
   //convert the measurement to a unit vector 
    dir.normalize();  

    //calculate the strength of the force by factoring in a gravitational constant and the mass of a particle
    //multiply by distance^2
    float force = (gravity*mass) / (d*d);

    dir.mult(-1);

    //apply directional vector
    applyForce(dir);
  }

  //method to apply a force vector to the particle
  void applyForce(PVector force) {
    force.div(mass);
    acc.add(force);
  }

  //method to update the location of the particle, and keep its velocity within a set limit
  void update() {
    vel.add(acc);
    vel.limit(velocityLimit);
    loc.add(vel);
    acc.mult(0);
  }

  //method to bounce particles of window edges
  void bounds() {
    if (loc.y > height || loc.y < 0) {
      vel.y *= -1;
    }
    if (loc.x > width || loc.x < 0) {
      vel.x *= -1;
    }
  }


  //main method that combines all previous methods, and takes two arguments
  //tx and ty are inherited from forces(), and set the attractive/repulsive co-ords
  void run(float tx, float ty) {
    forces(tx, ty);
    display();
    bounds();
    update();
    separate();
  }

  void separate() {
    for (int i=0; i<particle.length; i++) {
      for (int j=0; j<particle.length; j++) {
        float dis = dist(particle[i].loc.x, particle[i].loc.y, particle[j].loc.x, particle[j].loc.y);
        if (dis>1 && dis<3) {
          particle[i].vel   = new PVector(random(-1, 2), random(-1, 2));
        }
      }
    }
  }
}




