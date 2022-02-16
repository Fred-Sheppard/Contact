class Board {

  float x, y;
  int id;
  //float size = boardsize +h/90;
  float size = boardsize +h/90;

  Board(float x, float y, int id) {
    this.x = x;
    this.y = y;
    //this.id = id;
  }

  void display() {
    fill(150);
    rectMode(CENTER);
    rect(x, y, size, size);
  }

  void initCells(Cell[] cells) {
    int i = 0;
    for (int yy = 0; yy < 9; yy++) { 
      for (int xx = 0; xx < 9; xx++) {
        cells[i].x = x-size/2 +xx*size*33/304 +h/166; 
        cells[i].y = y-size/2 +yy*size*33/304 +h/166; 
        i++;
      }
    }
  }
} 
