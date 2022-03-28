boolean isJava = false;
//int displayDensity = 1;

Menu menu;
Play play;
Place place;

float boardsize;
//int autosaveinterval = 30;
int backgroundcolor = 190; //190
int w, h;
float dd;
float cellsize;
boolean mousedown;
enum GameMode {
  NONE, MENU, PLACE, PLAY
};
enum CellType {
  NONE, HIT, MINE, BOAT, MISS, NUMBER
};
GameMode gamemode;
//String gamemode = "menu";

void settings() {
  if (isJava) {
    size(360, 733);
  } else {
    size(displayWidth, displayHeight);
  }
}

void setup() {
  dd = displayDensity;
  strokeWeight(2 -int(isJava));
  orientation(PORTRAIT);
  frameRate(10);
  w = width;
  h = height;
  boardsize = height*9/24;
  cellsize = boardsize/10;
  textAlign(CENTER, CENTER);
  textSize(30*dd);
  imageMode(CENTER);
  boardsize = h*9/24;
  cellsize = boardsize/10;
  menu = new Menu();
  gamemode = GameMode.MENU;
}

void draw() {
  displayAll();
}

void mousePressed() {
  mousedown = true;
  displayAll();
}

void keyPressed() {
  println("debug");
}
