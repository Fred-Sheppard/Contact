/* Contact 6.5
 by Fred Sheppard
 line2
 */

char[] letters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'};
Board b1;
Board b2;
Cell[] cells1 = new Cell[81];
Cell[] cells2 = new Cell[81];
LevelButton[] lvbuttons = new LevelButton[5];
SelMine selmineplace, selmineplay; 
SelBoat selectboat; 
SelHit sh;
SelMiss sms;
SelNum sn;
//RotateButton rb;
ModeButton modebutton;
NumUp numup; 
NumDown numdown;
LoadButton loadbutton;
PlayerMode pmsingle;
PlayerMode pmmulti;
ReturnButton rtrn;
LoadSelect[] slots;
PauseOption savegamebutton;
PauseOption menubutton;
PauseOption closemenubutton;
PauseOption optionsbutton;
SettingOption autosavebutton;
OpenOptions gearbutton;
SettingOption saveexit;
SettingOption bgcoption;
SettingOption deleteall;
SettingOption closemenu;
ToggleNumberGrid togglenumbergrid;

PImage levelsplash;
PImage minepng, bigmine;
PImage title;


int w, h;
float size;
float dd;
String gamemode = "menu"; 
String optionsmenu = "none";
float boardsize; int numvalue;
int minecount, boatcount;
boolean rotated, exitrequest;
boolean displaysaved, displayload;
StringList savedata = new StringList();
PrintWriter output;
String oldmode = "menu";
//boolean pausemenu;
int autosaveinterval = 30; 
int autosavetimer;
int bgc  = 190;
boolean deleteallpopup, displaysettingsaved;
boolean freeplay, numbergrid;
boolean grid;


void setup() {
  //size(400, 850);
  //fullScreen();
  size(displayWidth, displayHeight);
  orientation(PORTRAIT); 
  frameRate(10);
  w = width; 
  h = height;
  dd = displayDensity;
  textAlign(CENTER, CENTER); 
  textSize(30*dd);
  strokeWeight(2);
  imageMode(CENTER);
  boardsize = h*9/24;
  size = boardsize/10;
  for (int i = 0; i < cells1.length; i++) {
    cells1[i] = new Cell(0, 0, 1, null);
  }
  for (int i = 0; i < cells2.length; i++) {
    cells2[i] = new Cell(0, 0, 2, null);
  }
  for (int i = 0; i < lvbuttons.length; i++) {
    lvbuttons[i] = new LevelButton(w/5, h/3 + i*boardsize*4/20, i+1);
  }

  b1 = new Board(w/2, h*27/100, 1);
  b2 = new Board(w/2, h*72/100, 2);
  selmineplace = new SelMine(b1.x -b1.size/2 +boardsize/20, h/5, boardsize*2/9);
  selmineplay = new SelMine(w*5/16, h*48/50, boardsize/9);
  selectboat = new SelBoat(w/3, h/10, 1);
  //rb = new RotateButton(200, 200);
  loadbutton = new LoadButton(b1.x -b1.size/2, h/3);
  modebutton = new ModeButton(b1.x +b1.size/2, h/3);
  sh = new SelHit(w/16, h*48/50);
  sms = new SelMiss(w*3/16, h*48/50);
  sn = new SelNum(w*7/16, h*48/50);
  numup = new NumUp(w*9/16, h*48/50);
  numdown = new NumDown(w*11/16, h*48/50);
  pmsingle = new PlayerMode(w/2, h/3, "singleplayer");
  pmmulti = new PlayerMode(w/2, h/2, "multiplayer");
  levelsplash = loadImage("Level Select.png");
  minepng = loadImage("mine.png");
  bigmine = loadImage("bigmine.png");
  title = loadImage("title1.png");
  rtrn = new ReturnButton();
  savegamebutton = new PauseOption(w/2, h*20/100, "Save Game");
  menubutton = new PauseOption(w/2, h*32/100, "Menu");
  optionsbutton = new PauseOption(w/2, h*44/100, "Options");
  closemenubutton = new PauseOption(w/2, h*56/100, "Close");
  gearbutton = new OpenOptions(int(size/2+2*dd), int(size/2+2*dd));
  autosavebutton = new SettingOption(w/2, h*20/100, "Autosave");
  bgcoption = new SettingOption(w/2, h*32/100, "Background");
  deleteall = new SettingOption(w/2, h*44/100, "Delete Saves");
  closemenu = new SettingOption(w/2, h*56/100, "Close");
  saveexit = new SettingOption(w/2, h*7/8, "Save");
  togglenumbergrid = new ToggleNumberGrid(w*7/8, h*48/50);


  minepng.resize(int(boardsize/10), 0);
  bigmine.resize(int(boardsize/5), 0);
  title.resize(width, height);

  setPreferences();

  background(bgc);
  menu();
  gearbutton.display();
}

void draw() {
}

void displayload() {
  background(bgc);
  loadbutton.display();
  modebutton.display();
  //  if (!pausemenu) {
  //    for (LoadSelect s : slots) {
  //      s.overlap(mouseX, mouseY);
  //    }
  //  }
  if (displayload) {
    for (LoadSelect s : slots) {
      s.display();
    }
  }
}

void coords() { 
  fill(255);
  for (int i = 0; i < 9; i++) {
    if (gamemode == "play") {
      textAlign(CENTER, BOTTOM);
      text(letters[i], cells1[i].x+cells2[i].size/2, cells1[1].y-h/180);
      textAlign(RIGHT, CENTER);
      text(i+1, cells1[0].x-h/90, cells1[i*9].y+cells2[i].size/2); //
    }
    textAlign(CENTER, BOTTOM);
    text(letters[i], cells2[i].x+cells2[i].size/2, cells2[1].y-h/180);
    textAlign(RIGHT, CENTER);
    text(i+1, cells2[0].x-h/90, cells2[i*9].y+cells2[i].size/2); //
  }
  textAlign(CENTER, CENTER);
}


void number() {
  if (numvalue > 9) {
    numvalue = 9;
  } 
  if (numvalue < 0) {
    numvalue = 0;
  }
}

void exitrequest() {
  rectMode(CENTER);
  fill(255);
  rect(w/2, h/2, w, h/3);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(30*dd);
  text("Exiting. Are You Sure?", w/2, h/2);
  textSize(w/20);
  text("Press back again to exit", w/2, h*55/100);
  textSize(w/13);
}

void deleteallpopup() {
  rectMode(CENTER);
  fill(255);
  rect(w/2, h/2, w, h/4);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Delete all saves?", w/2, h*45/100);
  Option option;
  option = new Option(w/4, w*3/4, h*55/100);
  option.display();
  option.overlap();
}

void deselectAll() {
  selmineplace.deselect();
  selectboat.deselect();
  sh.deselect();
  sms.deselect();
  sn.deselect();
  selmineplay.deselect();
}

void clearAll() {
  for (Cell c : cells1) {
    c.type = "none";
    c.number = false;
  }
  for (Cell c : cells2) {
    c.type = "none";
    c.number = false;
  }
  boatcount = 0;
  minecount = 0;
  numbergrid = false;
}

void backPressed() {
  if (displayload) {
    displayload = false;
  } else if (optionsmenu.equals("paused")) {
    optionsmenu = "none";
    gamemode = oldmode;
    displayAll();
  } else if (displaysaved) {
    displaysaved = false;
  } else if (optionsmenu.equals("options")) {
    setPreferences();
    gamemode = oldmode;
    optionsmenu = "paused";
  } else if (gamemode.equals("play") || gamemode.equals("place")) {
    if (!exitrequest) { //First click
      exitrequest = true; //Start Popup
    } else { //If second click
      for (Cell c : cells1) {
        c.type = "none";
        c.number = false;
        c.value = -1;
        c.img = null;
      }
      for (Cell c : cells2) {
        c.type = "none";
        c.number = false;
        c.value = 1;
        c.img = null;
      }
      minecount = 0;
      boatcount = 0;
      gamemode = "menu"; 
      exitrequest = false;
    }
  } else { //If not in play or place mode
    gamemode = "menu";
  }
  displayAll();
} 

void autoSave() {
  if (millis()/1000 >= autosavetimer) {
    saveGame(0, false);
    autosavetimer += autosaveinterval;
  }
}

void setPreferences() {
  try {
    String[] list = loadStrings("preferences.txt");
    for (int i = 0; i < list.length; i++) {
      String[] pieces = splitTokens(list[i], ": ");
      if (i == 0) {
        bgc = int(pieces[1]);
      } else if (i == 1) {
        autosaveinterval =  int(pieces[1]);
      }
    }
  } 
  catch (Exception e) {
    output = createWriter("preferences.txt");
    output.flush();
    output.close();
  }
}

void placeObjects(boolean verify) {
  if (verify) {
    for (Cell c : cells2) {
      if (c.overlaps()) {
        if (selmineplace.selected) {
          if (!c.type.equals("mine") && minecount < 4) {
            if (c.type.equals("boat")) {
              boatcount--;
            }
            c.setType("mine");
            minecount++;
          } else if (c.type.equals("mine")) {
            c.setType("none");
            minecount--;
          }
        } else if (selectboat.selected) {
          if (!c.type.equals("boat") && boatcount < 16) {
            if (c.type.equals("mine")) {
              minecount--;
            }
            c.setType("boat");
            boatcount++;
          } else if (c.type.equals("boat")) {
            c.setType("none");
            boatcount--;
          }
        }
      }
    }
  } else {
    for (Cell c : cells2) {
      if (c.overlaps()) {
        if (selmineplace.selected) {
          if (!c.type.equals("mine")) {
            if (c.type.equals("boat")) {
            }
            c.setType("mine");
          } else if (c.type.equals("mine")) {
            c.setType("none");
          }
        } else if (selectboat.selected) {
          if (!c.type.equals("boat")) {
            if (c.type.equals("mine")) {
            }
            c.setType("boat");
          } else if (c.type.equals("boat")) {
            c.setType("none");
          }
        }
      }
    }
  }
}
