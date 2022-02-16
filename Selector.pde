class Selector {

  float x, y;
  boolean isSelected;
  float size;
  color c;
  int boatsize;
  PImage image;
  int value = -1;
  CellType cellType = CellType.NONE;

  //Standard
  Selector(float x, float y, color c, CellType ct) {
    this.x = x;
    this.y = y;
    this.c = c;
    cellType = ct;
    size = cellsize;
    image = null;
  }

  //Mine
  Selector(float x, float y, float size, PImage image) {
    this.x = x;
    this.y = y;
    c = color(#FFB003);
    this.size = size;
    this.image = image;
    image.resize(int(size), 0);
    cellType = CellType.MINE;
  }

  //Boat
  Selector(float x, float y, int boatsize, boolean useless) {
    this.x = x;
    this.y = y;
    this.boatsize = boatsize;
    c = 230;
    size = cellsize;
    image = null;
    cellType = CellType.BOAT;
  }

  //Number
  Selector(float x, float y, color c, int value) {
    this.x = x;
    this.y = y;
    this.c = c;
    size = cellsize;
    image = null;
    this.value = value;
    cellType = CellType.NUMBER;
  }

  boolean overlaps() {
    if (mouseX > x-size/2 && mouseX < x+size/2 && mouseY > y-size/2 && mouseY < y+size/2) {
      this.isSelected = true;
      return true;
    } else {
      return false;
    }
  }

  //void display() {
  //  if (selected) {
  //    stroke(255, 255, 0);
  //  } else {
  //    stroke(0);
  //  }
  //  rectMode(CENTER);
  //  fill(c);
  //  rect(x, y, size, size);
  //  if (image != null) { 
  //    image(image, x, y);
  //  }
  //  stroke(0);

  //  if (value > -1) {
  //    fill(0);
  //    textAlign(CENTER, CENTER);
  //    text(value, x, y);
  //  }
  //}

  void display() {
    color stroke = isSelected ? color(255, 255, 0) : color(0);
    stroke(stroke);
    switch(cellType) {
    case HIT:
      fill(255, 0, 0);
      break;
    case MISS:
      fill(255, 255, 255);
      break;
    case MINE:
      fill(#FFB003);
      break;
    case BOAT:
      fill(215);
      break;
    case NUMBER:
      fill(backgroundcolor);
      break;
    default:
      println("switch overflow");
    }
    rectMode(CENTER);
    rect(x, y, size, size);
    if (image != null) image(image, x, y);
    stroke(0);
    if (cellType.equals(CellType.NUMBER)) {
      fill(0);
      textAlign(CENTER, CENTER);
      text(value, x, y);
    }
  }

  void select() {
    isSelected = true;
  }

  void deselect() {
    isSelected = false;
  }

  void increment(int number) {
    if (number == 1 && value < 9) {
      value += number;
    } else if (number == -1 && value > 0) {
      value += number;
    }
  }
}
