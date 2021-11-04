void pauseMenu() {
  if (optionsmenu.equals("paused")) {
    background(bgc);
    fill(0);
    textSize(50*dd);
    textAlign(CENTER, CENTER);
    text("Paused", w/2, h/10);
    textSize(30*dd);
    if (gamemode.equals("play")) {
      savegamebutton.display();
    }
    gearbutton.display();
    optionsbutton.display();
    menubutton.display();
    closemenubutton.display();
  }
}

void options() {
  background(bgc);
  fill(0);
  textSize(50*dd);
  text("Options", w/2, h/10);
  textSize(30*dd);
  gearbutton.display();
  autosavebutton.display();
  bgcoption.display();
  deleteall.display();
  closemenu.display();
  saveexit.display();
}

class PauseOption {

  float x, y;
  float size = boardsize;
  String type;

  PauseOption(float x, float y, String type) {
    this.x = x;
    this.y = y;
    this.type = type;
  }

  void display() {
    rectMode(CENTER);
    fill(255);
    rect(x, y, size, size/4);
    textAlign(CENTER, CENTER);
    fill(0);
    text(type, x, y);
  }

  void overlap() {
    if (mouseX > x-size/2 && mouseX < x+size/2 && mouseY > y-size/8 && mouseY < y+size/8) {
      activate();
    }
  }

  //OPTIONS MENU
  void activate() {
    if (type.equals("Save Game")) {
      saveGame(1, true);
      optionsmenu = "none";
    } else if (type.equals("Options")) {
      optionsmenu = "none";
      oldmode = gamemode;
      optionsmenu = "options";
    } else if (type.equals("Menu")) {
      clearAll();
      optionsmenu = "none";
      gamemode = "menu";
    } else if (type.equals("Close")) {
      optionsmenu = "none";
      gamemode = oldmode;
    }
    displayAll();
  }
}

class SettingOption extends Button {

  String type;
  float size = boardsize;

  SettingOption(float x, float y, String type) {
    this.x = x;
    this.y = y;
    this.type = type;
  }

  void display() {
    rectMode(CENTER);
    fill(255);
    rect(x, y, size, size/4);
    textAlign(CENTER, CENTER);
    fill(0);
    if (type.equals("Autosave")) {
      text(type + ": " + autosaveinterval, x, y);
    } else if (type.equals("Background")) {
      text(type + ": " + bgc, x, y);
    } else {
      text(type, x, y);
    }
  }

  void overlap() {
    if (mouseX > x-size/2 && mouseX < x+size/2 && mouseY > y-size/8 && mouseY < y+size/8) {
      activate();
    }
  }


  //SETTINGS MENU
  void activate() {
    if (type.equals("Autosave")) {
      autosaveinterval += 30;
      if (autosaveinterval > 180) {
        autosaveinterval = 30;
      }
    } else if (type.equals("Background")) {
      bgc += 10;
      if (bgc > 230) {
        bgc = 0;
      }
      //displayAll();
    } else if (type.equals("Delete Saves")) {
      deleteallpopup = true; //Start Popup
    } else if (type.equals("Close")) {
      setPreferences();
      optionsmenu = "paused";
    } else if (type.equals("Save")) {
      optionsmenu = "none";
      gamemode = oldmode;
      displaysettingsaved = true;
      output = createWriter("preferences.txt");
      output.println("background: " + bgc);
      output.println("autosave: " + autosaveinterval);
      output.flush();
      output.close();
    }
  }
}
