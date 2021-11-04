class OpenOptions extends Button {

  PImage img = loadImage("settings.png");

  OpenOptions(float x, float y) {
    this.x = x;
    this.y = y;
    img.resize(int(size), int(size));
  }

  void display() {
    imageMode(CENTER);
    image(img, x, y);
  }


  void activate() {
    if (gamemode.equals("menu")) {
      oldmode = gamemode;
      gamemode = "none";
      optionsmenu = "options";
    } else if (optionsmenu.equals("options")) {
      setPreferences();
      optionsmenu = "paused";
      displayAll();
    } else if (optionsmenu.equals("paused")) {
      optionsmenu = "none";
      gamemode = oldmode;
    } else {
      oldmode = gamemode;
      optionsmenu = "paused";
    }
  }
}


class Option extends Button {

  float x1, x2;

  Option(float x1, float x2, float y) {
    this.x1 = x1;
    this.x2 = x2;
    this.y = y;
    size *= 4;
  }

  void display() {
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(x1, y, size, size/2);
    fill(0, 255, 0);
    rect(x2, y, size, size/2);
    fill(0);
    text("YES", x2, y);
    text("NO", x1, y);
    textSize(30*dd);
  }

  void overlap() {
    if (mouseX > x2-size/2 && mouseX < x2+size/2 && mouseY > y-size/4 && mouseY < y+size/4) {
      activate(true);
    } else if (mouseX > x1-size/2 && mouseX < x1+size/2 && mouseY > y-size/4 && mouseY < y+size/4) {
      activate(false);
    }
  }

  void activate(boolean v) {
    if (v) {
      for (int i = 0; i < 5; i++) {
        output = createWriter("save-" + i + ".txt");
        output.flush();
        output.close();
      }
    }
    deleteallpopup = false;
    displayAll();
  }
}
