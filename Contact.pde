boolean isJava = true; //<>//

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

void setup() {
  //Java
  size(360, 733);
  //noSmooth();
  dd = 0.875;
  strokeWeight(1);

  //Android
  //size(displayWidth, displayHeight);
  ////dd = displayDensity;
  //strokeWeight(2);

  orientation(PORTRAIT);
  frameRate(10);
  w = width; 
  h = height;
  boardsize = height*9/24;
  cellsize = boardsize/10;
  textAlign(CENTER, CENTER); 
  textSize(30*dd);
  strokeWeight(2);
  imageMode(CENTER);
  boardsize = h*9/24;
  cellsize = boardsize/10;
  menu = new Menu();

  gamemode = GameMode.MENU;
}

void draw() {
  displayAll();
  //fill(255,0,0);
  //rectMode(CENTER);
  //rect(15, 15, 30, 30);
}

void mousePressed() {
  //if (mouseX < 30 && mouseY < 30) {
  //  menu = new Menu();
  // gamemode = GameMode.MENU;
  // //gamemode = "menu";
  // place = null;
  // play = null;
  //}
  mousedown = true;
  displayAll();
}

void keyPressed() {
  println("debug");
}
