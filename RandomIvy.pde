// Ivy on a wall simulator

ArrayList<RandomWalker> IvySystem;

int NUMBRANCH = 30; //num of branch of ivy
int count; // num of iterations
int MAXCOUNT = 1000; //max iterations

void setup() {
  size(750, 500);
  count = 0;
  IvySystem = new ArrayList<RandomWalker>();
  for (int i = 0; i <= NUMBRANCH; i++) {
    PVector pos = new PVector(random(0, width*0.67), 0);
    RandomWalker r = new RandomWalker(pos);
    IvySystem.add(r);
  }
  background(255);
}

void mousePressed() {
  setup();
}

void draw() {
  stroke(0, 0, 0, 40);
  strokeWeight(random(0, 2));
  while (count < MAXCOUNT) { // all togheter
    if (count < MAXCOUNT) {
      for (RandomWalker w : IvySystem) {
        w.move();
        w.draw();
      }
    }
    count++;
  }
}


class RandomWalker {
  PVector orig;
  PVector next;
  float xoff = random(10000);
  RandomWalker(PVector origin) {
    orig = origin;
  }

  void move() {
    next = orig.copy();
    //PVector r  = PVector.random2D();
    //r.mult(random(0, 5));
    //orig.add(r);
    //orig.add(random(0, 0.3), random(0.0, 0.7));
    //orig.normalize();
    PVector r = orig.copy();
    r.normalize();
    r.rotate(noise(xoff)*TWO_PI*2);
    //r.mult(random(0,1));
    orig.add(r);
    orig.add(random(-0.2, 0.3), random(0.0, 0.5));
    xoff+=0.07;
  }

  void draw() {
    stroke(0, 0, 0, random(0, 40)+20);
    strokeWeight(random(0, 2));
    point(orig.x, orig.y);
    //line(next.x, next.y, orig.x, orig.y);
  }
}
