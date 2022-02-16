class Button {

  float x, y;
  float size = cellsize;
  color c;

  void overlap() {
    if (mouseX > x-size/2 && mouseX < x+size/2 && mouseY > y-size/2 && mouseY < y+size/2) {
      println("2");
      activate();
    }
  }

  boolean isOverlappingMouse() {
    if (mouseX > x-size/2 && mouseX < x+size/2 && mouseY > y-size/2 && mouseY < y+size/2) {
      return true;
    } else {
      return false;
    }
  }

  void activate() {
  }
}

class ChangeNumber {

  float x, y;
  float size = boardsize/10;
  boolean up;
  color c;

  ChangeNumber(float x, float y, boolean up) {
    this.x = x; 
    this.y = y;
    this.up = up;
    if (up) {
      c = color(#53FFF6);
    } else {
      c = color(#45A3F2);
    }
  }

  void display() {
    char sign;
    if (up) { 
      sign = '+';
      fill(#53FFF6);
    } else {
      sign = '-';
      fill(#45A3F2);
    }
    rectMode(CENTER);
    rect(x, y, size, size);
    fill(0);
    textAlign(CENTER, CENTER);
    text(sign, x, y);
  }

  int overlap(int number) {
    if (mouseX > x-size/2 && mouseX < x+size/2 && mouseY > y-size/2 && mouseY < y+size/2) {
      return activate(number);
    } else {
      return 0;
    }
  }

  int activate(int number) {
    if (up) {
      number = 1;
    } else if (!up) {
      number = -1;
    }
    //println(number);
    return number;
  }
}

class PreviousModeButton extends Button {

  PreviousModeButton(float x, float y, color c) {
    this.x = x; 
    this.y = y;
    this.c = c;
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    stroke(0);
    rect(x, y, size, size);
  }

  void activate(GameMode g) {
    if (isOverlappingMouse()) {
      menu = null;
      place = null; 
      play = null;
      menu = new Menu();
      gamemode = g;
    }
  }

  boolean isOverlappingMouse() {
    if (mouseX > x-size/2 && mouseX < x+size/2 && mouseY > y-size/2 && mouseY < y+size/2) {
      return true;
    } else {
      return false;
    }
  }
}
