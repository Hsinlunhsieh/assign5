class Brick{

  int bSize = 40;
  int bX;
  int bY;
  boolean die = false;

  Brick(int x, int y) {
    bX = x;
    bY = y;
  }

  void display() {
    fill(28, 213, 128);
    rectMode(CENTER);
    rect(bX, bY, bSize, bSize);
  }  
}

