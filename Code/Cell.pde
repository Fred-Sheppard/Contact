class Cell {

  float x, y;
  int board, value;
  float size = boardsize/10;
  String type = "none";
  boolean number;
  PImage img;
  int neighbours;

  Cell(float x, float y, int board, PImage img) {
    this.x = x;
    this.y = y;
    this.board = board;
    this.img = img;
  }

  void display() {
    if (number == false) {
      value = -1;
    }
    rectMode(CORNER);
    if (type.equals("none")) {
      noFill();
      img = null;
    } else if (type.equals("hit")) {
      fill(#FF0000);
      img = null;
    } else if (type.equals("mine")) {
      fill (#FFB003);
      if (!number) {
        img = minepng;
      } else {
        img = null;
      }
    } else if (type.equals("boat")) {
      fill(215);
      img = null;
    } else if (type.equals("miss")) {
      fill(255);
      img = null;
    } else {
      noFill();
      img = null;
    }
    rect(x, y, size, size);
    if (img != null) {
      minepng.resize(int(boardsize/10), 0);
      image(img, x+size/2, y+size/2);
    }
    if (number) {
      textAlign(CENTER, CENTER);
      fill(0);
      text(value, x +size/2, y+size/2);
    }
  }


  boolean overlaps() {
    if (mouseX > x && mouseX < x+boardsize/10 && mouseY > y && mouseY < y+boardsize/10) {
      return true;
    } else {
      return false;
    }
  }

  void setType(String s) {
    type = s;
  }

  void setNumber() {
    value = numvalue;
    number = true;
  }

  void setValue(String s) {
    value = int(s);
    if (value != -1 ) {
      number = true;
    } else {
      number = false;
    }
  }
}
