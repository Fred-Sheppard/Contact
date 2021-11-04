class Board {

  float x, y;
  int id;
  float size = boardsize +h/90;

  Board(float x, float y, int id) {
    this.x = x;
    this.y = y;
    this.id = id;

    if (id == 1) {
      int i = 0;
      for (int yy = 0; yy < 9; yy++) { 
        for (int xx = 0; xx < 9; xx++) {
          cells1[i].x = x-size/2 +xx*size*33/304 +h/166; 
          cells1[i].y = y-size/2 +yy*size*33/304 +h/166; 
          i++;
        }
      }
    } else if (id == 2) {
      int i = 0;
      for (int yy = 0; yy < 9; yy++) {
        for (int xx = 0; xx < 9; xx++) {
          cells2[i].x = x-size/2 +xx*size*33/304 +h/166; 
          cells2[i].y = y-size/2 +yy*size*33/304 +h/166; 
          i++;
        }
      }
    }
  }

  void display() {
    fill(150);
    rectMode(CENTER);
    rect(x, y, size, size);
  }
} 
