
//class ModeButton extends Button {

//  String s;

//  ModeButton(float x, float y) {
//    this.x = x-size*2;
//    this.y = y+size;
//  }

//  void display() {
//    if (!freeplay) {
//      if (minecount == 4 && boatcount == 16) {
//        fill(#00FF00);
//        s = "READY";
//      } else {
//        fill (#FF0000);
//        s = "-----";
//      }
//    } else {
//      fill(#00FF00);
//      s = "READY";
//    }
//    rectMode(CENTER);
//    stroke(0);
//    rect(x, y, size*4, size*2);
//    fill(0);
//    textAlign(CENTER, CENTER);
//    text(s, x, y);
//  }

//  void overlap(float xx, float yy) {
//    if (xx > x-size*2 && xx < x+size*2 && yy > y-size && yy < y+size) {
//      activate();
//    }
//  }

//  void activate() {
//    //if ( (minecount == 4 && boatcount == 16) || freeplay) {
//    //  gamemode = "play";
//    //  oldmode = "menu";
//    //  autosavetimer = millis()/1000;
//    //  selectboat.selected = false;
//    //  selmineplace.selected = false;
//    //} else {
//    //  return;
//    //}
//  }
//}

////class NumUp extends Button {

////  NumUp(float x, float y) {
////    this.x = x; 
////    this.y = y;
////  }

////  void display() {
////    rectMode(CENTER);
////    fill(#53FFF6);
////    rect(x, y, size, size);
////    fill(0);
////    textAlign(CENTER, CENTER);
////    text("+", x, y);
////  }

////  void activate() {
////    numvalue++;
////  }
////}

////class NumDown extends Button {

////  NumDown(float x, float y) {
////    this.x = x; 
////    this.y = y;
////  }

////  void display() {
////    rectMode(CENTER);
////    fill(#45A3F2);
////    rect(x, y, size, size);
////    fill(0);
////    textAlign(CENTER, CENTER);
////    text("-", x, y);
////  }

////  void activate() {
////    numvalue--;
////  }
////}

//class LoadButton extends Button {

//  LoadButton(float x, float y) {
//    this.x = x+size*2;
//    this.y = y+size;
//  }

//  void display() {
//    rectMode(CENTER);
//    fill(#6272F5);
//    stroke(0);
//    rect(x, y, size*4, size*2);
//    textAlign(CENTER, CENTER);
//    fill(0);
//    text("LOAD", x, y);
//  }

//  void overlap(float xx, float yy) {
//    if (xx > x-size*2 && xx < x+size*2 && yy > y-size && yy < y+size) {
//      if (!displayload) {
//        activate();
//      }
//    }
//  }

//  void activate() {
//    colorMode(HSB, 360, 100, 100);
//    loadslots = new LoadSelect[5];
//    float y = h/2 +h/20;
//    for (int i = 0; i < 5; i++) {
//      loadslots[i] = new LoadSelect(y +i*h/10, i, color(i*40, 100, 100));
//    }
//    displayload = true;
//  }
//}

//class PlayerMode extends Button {

//  String type;

//  PlayerMode(float x, float y, String s) {
//    this.x = x; 
//    this.y = y; 
//    type = s;
//  }

//  void display() {
//    rectMode(CENTER);
//    if (type.equals("singleplayer")) {
//      //fill(#FF0000);
//      stroke(255);
//      fill(0);
//      rect(x, y, size*7, size*2);
//      stroke(0);
//      fill(255);
//      textAlign(CENTER, CENTER);
//      text("SinglePlayer", x, y);
//    } else if (type.equals("multiplayer")) {
//      //fill(#00FFF5);
//      fill(255);
//      rect(x, y, size*7, size*2);
//      fill(0);
//      textAlign(CENTER, CENTER);
//      text("MultiPlayer", x, y);
//    }
//  }

//  void overlap(float xx, float yy) {
//    if (xx > x-size*7/2 && xx < x+size*7/2 && yy > y-size && yy < y+size) {
//      activate();
//    }
//  }

//  void activate() {
//    if (type.equals("multiplayer")) {
//      oldmode = "menu";
//      gamemode = "multiplayerselect";
//    } else if (type.equals("singleplayer")) {
//      oldmode = "menu";
//      gamemode = "levelselect";
//    }
//  }
//}

//class LevelButton extends Button {

//  int value;
//  float size = boardsize/5;

//  LevelButton(float x, float y, int value) {
//    this.x = x; 
//    this.y = y;
//    this.value = value;
//  }

//  void display() {
//    rectMode(CENTER);
//    fill(255);
//    rect(x, y, size, size);
//    fill(0);
//    textAlign(CENTER, CENTER);
//    text(value, x, y);
//  }

//  void overlap(float xx, float yy) {
//    if (xx > x-size/2 && xx < x+size/2 && yy > y-size/2 && yy < y+size/2) {
//      activate();
//    }
//  }

//  void activate() {
//  }
//}

//class ReturnButton extends Button {

//  String type;
//  float size = (boardsize/10) *3/2;

//  ReturnButton() {
//    x = size/2;
//    y = size/2;
//  }

//  void display() {
//    //rectMode(CENTER);
//    //fill(#03FF11);
//    //rect(x, y, size, size);
//    //fill(0);
//    //textAlign(CENTER, CENTER);
//    //text("<", x, y);
//  }

//  boolean overlaps() {
//    if (mouseX > x-size/2 && mouseX < x+size/2 && mouseX > y-size/2 && mouseX < y+size/2) {
//      return true;
//    } else {
//      return false;
//    }
//  }

//  void activate() {
//    //if (gamemode.equals("play") || gamemode.equals("place")) {
//    //  if (displayload) {
//    //    displayload = false;
//    //  } else if (!exitrequest) { //First click
//    //    exitrequest = true; //Start Popup
//    //  } else { //If second click
//    //    for (Cell c : cells1) {
//    //      c.type = "none";
//    //      c.number = false;
//    //      c.value = -1;
//    //      c.img = null;
//    //    }
//    //    for (Cell c : cells2) {
//    //      c.type = "none";
//    //      c.number = false;
//    //      c.value = 1;
//    //      c.img = null;
//    //    }
//    //    minecount = 0;
//    //    boatcount = 0;
//    //    gamemode = oldmode; 
//    //    exitrequest = false;
//    //  }
//    //} else { //If not in play or place mode
//    //  gamemode = oldmode;
//    //  display();
//    //}
//  }
//}

//class LoadSelect extends Button {

//  color c;
//  int value;
//  float size = h/10;

//  LoadSelect(float y, int value, color c) {
//    this.y = y;
//    this.c = c;
//    this.value = value;
//  }

//  void display() {
//    fill(c);
//    rect(w/2, y, w, size);
//    fill(0);
//    textAlign(CENTER, CENTER);
//    textSize(w/10);
//    if (value == 0) {
//      text("AutoSave", w/2, y);
//    } else {
//      text("Slot " + value, w/2, y);
//    }
//    textSize(30*dd);
//  }

//  void overlap() {
//    if (mouseY > y-size/2 && mouseY < y+size/2) {
//      activate();
//    }
//  }

//  void activate() {
//    displayload = false;
//    loadGame(value);
//    colorMode(RGB, 255, 255, 255);
//    place();
//  }
//}

//class ToggleNumberGrid extends Button {

//  String s;

//  ToggleNumberGrid(float x, float y) {
//    this.x = x;
//    this.y = y;
//  }

//  void display() {
//    if (numbergrid) {
//      fill(#0EE676); 
//      s = "*";
//    } else {
//      fill(255, 0, 0);
//      s = "-";
//    }
//    rectMode(CENTER);
//    rect(x, y, size*3, size);
//    fill(0);
//    textAlign(CENTER, CENTER);
//  }

//  void overlap() {
//    if (mouseX > x-size*3/2 && mouseX < x+size*3/2 && mouseY > y-size/2 && mouseY < y+size/2) {
//      activate();
//    }
//  }

//  void activate() {
//    numbergrid = !numbergrid;
//  }
//}
