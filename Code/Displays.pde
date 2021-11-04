void displayAll() {
  colorMode(RGB, 255, 255, 255);
  background(bgc);
  if (optionsmenu.equals("options")) {
    options();
    if (deleteallpopup) {
      deleteallpopup();
    }
  } else if (optionsmenu.equals("paused")) {
    pauseMenu();
  } else if (optionsmenu.equals("none")) {
    if (gamemode.equals("menu")) {
      menu();
      gearbutton.display();
    } else if (gamemode.equals("place")) {
      place();
      rtrn.display();
      gearbutton.display();
      if (exitrequest) {
        exitrequest();
      }
    } else if (gamemode.equals("play")) {
      play();
      rtrn.display();
      gearbutton.display();
      if (exitrequest) {
        exitrequest();
      }
    } else if (gamemode.equals("levelselect")) {
      rtrn.display();
      gearbutton.display();
      levelSelect();
    } else if (gamemode.equals("multiplayerselect")) {
      multiplayerSelect();
    }
  } 

  if (displaysettingsaved) {
    fill(255);
    rectMode(CENTER);
    rect(w/2, h/2, w, h/6);
    fill(0);
    textAlign(CENTER, CENTER);
    text("Settings Saved", w/2, h/2);
  }
}

void menu() {
  background(255);
  fill(0);
  beginShape();
  vertex(w, 0);
  vertex(w, h);
  vertex(0, h);
  endShape(CLOSE);
  pmsingle.display();
  pmmulti.display();
  //rectMode(CORNER);
  //fill(#8E05FF);
  //rect(0, 0, w, h/2);
  //fill(#285DEA);
  //rect(0, h/2, w, h);
  //rectMode(CENTER);
  //fill(255);
  //textSize(50*dd);
  //text("SinglePlayer", width/2, height/4);
  //text("MultiPlayer", width/2, height*3/4);
  //textSize(30*dd);
  //gearbutton.display();
}

void place() {
  background(bgc);
  if (!displayload) {
    b2.display();
    for (Cell c : cells2) {
      c.display();
    }
    selmineplace.display();
    modebutton.display();
    selectboat.display();
    loadbutton.display();
    coords();
    togglenumbergrid.display(); //
    if (numbergrid) { //
      grid();//
    }//
  } else {
    displayload();
  }
}

void play() {
  background(bgc);
  b1.display();
  b2.display();
  number();
  for (Cell c : cells1) {
    c.display();
  }
  for (Cell c : cells2) {
    c.display();
  }
  sh.display();
  sms.display();
  selmineplay.display();
  sn.display();
  numup.display();
  numdown.display();
  // sbt.display();
  coords();
  togglenumbergrid.display();
  if (numbergrid) {
    grid();
  }

  if (displaysaved) {
    fill(255);
    rectMode(CENTER);
    rect(w/2, h/2, w, h/6);
    fill(0);
    textAlign(CENTER, CENTER);
    text("GAME SAVED", w/2, h/2);
  }
}

void levelSelect() {
  image(levelsplash, w/2, h/10);
  for (LevelButton l : lvbuttons) {
    l.display();
  }
}

void multiplayerSelect() {
  rectMode(CORNER);
  fill(#1a4d4d);
  rect(0, 0, w, h/2);
  fill(#51C9CE);
  rect(0, h/2, w, h);
  rectMode(CENTER);
  fill(255);
  textSize(50*dd);
  text("Standard", width/2, height/4);
  text("Freeplay", width/2, height*3/4);
  textSize(20*dd);
  text("Fixed number of boats and mines", w/2, h*30/100);
  text("No restricions", w/2, h*80/100);
  textSize(30*dd);
  gearbutton.display();
}

void grid() {
  if (numbergrid) {
    //Normal Grid
    for (int i = 0; i < cells2.length; i++) {
      for (int y = 9; y > -10; y -= 9) {
        for (int x = i-y-1; x < i-y+2; x++) {
          try {
            if (!cells2[x].type.equals("none")) {
              cells2[i].neighbours++;
            }
          }
          catch (Exception e) {
          }
        }
      }
      //Left Edge
      for (int leftedge = 0; leftedge < 73; leftedge += 9) {
        int rightedge = leftedge +8;
        if (i == leftedge) {
          cells2[i].neighbours = 0;
          for (int y = 9; y > -10; y -= 9) {
            for (int x = i-y; x < i-y+2; x++) {
              try {
                if (!cells2[x].type.equals("none")) {
                  cells2[i].neighbours++;
                }
              } 
              catch (Exception e) {
              }
            }
          }
          //Right Edge
        } else if (i == rightedge) {
          cells2[i].neighbours = 0;
          for (int y = 9; y > -10; y -= 9) {
            for (int x = i-y-1; x < i-y+1; x++) {
              try {
                if (!cells2[x].type.equals("none")) {
                  cells2[i].neighbours++;
                }
              } 
              catch (Exception e) {
              }
            }
          }
        }
      }
      cells2[i].number = true;
      cells2[i].value = cells2[i].neighbours;
      cells2[i].neighbours = 0;
    }
  } else {
    for (Cell c : cells2) {
      c.number = false;
      c.value = -1;
    }
  }
}
