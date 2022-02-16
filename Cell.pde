class Cell {

  float x, y;
  int board, value;
  float size = boardsize/10;
  //String type = "none";
  CellType cellType;
  boolean number;
  PImage img;
  int neighbours;
  PImage minepng = loadImage("mine.png");
  ;

  Cell(float x, float y, int board, PImage img) {
    this.x = x;
    this.y = y;
    this.board = board;
    this.img = img;
    cellType = CellType.NONE;
  }

  void display() {
    if (number == false) {
      value = -1;
    }
    rectMode(CORNER);

    switch(cellType) {
    case HIT:
      fill(#FF0000);
      img = null;
      break;
    case MINE:
      fill (#FFB003);
      if (!number) {
        img = minepng;
      } else {
        img = null;
      }
      break;
    case BOAT:
      fill(215);
      img = null;
      break;
    case MISS:
      fill(255);
      img = null;
      break;
    default:
      noFill();
      img = null;
      break;
    }
    rect(x, y, size, size);
    if (img != null) {
      image(img, x+size/2, y+size/2);
    }
    if (number) {
      textAlign(CENTER, CENTER);
      fill(0);
      text(value, x +size/2, y+size/2);
    }
  }


  boolean overlaps() {
    if (mouseX > x && mouseX < x+size && mouseY > y && mouseY < y+size) {
      return true;
    } else {
      return false;
    }
  }

  void setNumber(int numbervalue) {
    value = numbervalue;
  }

  void setValue(String s) {
    value = int(s);
    if (value != -1 ) {
      number = true;
    } else {
      number = false;
    }
  }

  void setType(CellType ct) {
    if (!cellType.equals(ct)) {
      cellType = ct;
    } else {
      cellType = CellType.NONE;
    }
  }

  void setType(CellType ct, int newvalue) {
    if (ct.equals(CellType.NUMBER)) {
      number = !number;
      setNumber(newvalue);
    } else {
      if (!cellType.equals(ct)) {
        cellType = ct;
      } else {
        cellType = CellType.NONE;
      }
    }
  }
}
