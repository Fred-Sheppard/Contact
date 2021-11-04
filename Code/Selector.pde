class Selector {

  float x, y;
  boolean selected;
  float size = boardsize/10;
  color c;

  void overlap() {
    if (mouseX > x-size/2 && mouseX < x+size/2 && mouseY > y-size/2 && mouseY < y+size/2) {
      deselectAll();
      this.selected = true;
    }
  }

  boolean overlaps(float xx, float yy) {
    if (xx > x-size/2 && xx < x+size/2 && yy > y-size/2 && yy < y+size/2) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    if (selected) {
      stroke(255, 255, 0);
    } else {
      stroke(0);
    }
    rectMode(CENTER);
    fill(c);
    rect(x, y, size, size);
    stroke(0);
  }

  void deselect() {
    selected = false;
  }
}

class SelBoat extends Selector {

  int l;

  SelBoat(float x, float y, int l) {
    this.x = x; 
    this.y = y;
    this.l = l;
  }

  void display() {
    rectMode(CENTER);
    if (selected) {
      stroke(255, 255, 0);
    } else {
      stroke(0);
    }
    fill(215);
    if (rotated) {
      translate(x, y);
      rotate(PI/2);
      rect(0, 0, 36*l, 36);
      rotate(0);
      translate(x*-1, y*-1);
    } else { 
      rotate(0);
      rect(x, y, size*l, size);
    }
    stroke(0);
  }
}

class SelMine extends Selector {

  SelMine(float x, float y, float size) {
    this.x = x; 
    this.y = y;
    c = color(#FFB003);
    this.size = size;
  }

  void display() {
    if (selected) {
      stroke(255, 255, 0);
    } else {
      stroke(0);
    }
    rectMode(CENTER);
    fill(c);
    rect(x, y, size, size);
    if (size >= boardsize*2/9) {
      image(bigmine, x, y);
    } else {
      image(minepng, x, y);
    }
  }
}

class SelHit extends Selector {

  SelHit(float x, float y) {
    this.x = x; 
    this.y = y;
    c = color(255, 0, 0);
  }
}

class SelMiss extends Selector {

  SelMiss(float x, float y) {
    this.x = x; 
    this.y = y;
    c = color(255);
  }
}

class SelNum extends Selector {

  SelNum(float x, float y) {
    this.x = x; 
    this.y = y;
  }

  void display() {
    if (selected) {
      stroke(255, 255, 0);
    } else {
      stroke(0);
    }
    rectMode(CENTER);
    noFill();
    rect(x, y, size, size);
    fill(0);
    textAlign(CENTER, CENTER);
    text(numvalue, x, y);
    stroke(0);
  }
}
