class Menu {

  MenuButton standard;
  MenuButton freeplay;

  Menu() {
    init();
  }

  void init() {
    standard = new MenuButton(w/2, h/4, w*9/10, h/5, 0);
    freeplay = new MenuButton(w/2, h/2, w*9/10, h/5, 1);
  }

  void checkOverlap() {
    if (mousedown) {
      standard.overlap();
      freeplay.overlap();
    }
  }

  void run() {
    background(#4556E5);
    checkOverlap();
    standard.display();
    freeplay.display();
  }

  class MenuButton extends Button {

    float x, y, sizex, sizey;
    int type;
    color c;

    MenuButton(float x, float y, float sizex, float sizey, int type) {
      this.x=x;
      this.y=y;
      this.sizex=sizex;
      this.sizey=sizey;
      this.type=type;
      switch(type) {
      case 0: 
        c = #1a4d4d;
        break;
      case 1:
        c = #51C9CE;
        break;
      }
    }

    void display() {
      rectMode(CENTER);
      textAlign(CENTER, CENTER);
      fill(c);
      rect(x, y, sizex, sizey);
      fill(255);
      float fsize = sizex/5;
      switch(type) {
      case 0: 
        textSize(fsize);
        text("Play", x, y-sizey/10);
        textSize(fsize/5);
        text("Fixed number of boats and mines", x, y+sizey/4);
        break;
      case 1:
        textSize(fsize);
        text("Place", x, y-sizey/10);
        textSize(fsize/5);
        text("No restricions", x, y+sizey/4);
        break;
      }
      textSize(30*dd);
    }

    void overlap() {
      if (mouseX > x-sizex/2 && mouseX < x+sizex/2 && mouseY > y-sizey/2 && mouseY < y+sizey/2) {
        activate();
      }
    }

    void activate() {
      switch(type) {
      case 0:
        play = new Play();
        gamemode = GameMode.PLAY;
        menu = null;
        break;
      case 1:
        place = new Place();
        gamemode = GameMode.PLACE;
        menu = null;
        break;
      }
      displayAll();
    }
  }
}
