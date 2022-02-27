class Play {

  Selector selectMine; 
  Selector selectBoat; 
  Selector selectHit;
  Selector selectMiss;
  Selector selectNumber; 
  ChangeNumber numberUp;
  ChangeNumber numberDown;
  GameMode previousType;
  PreviousModeButton previousModeButton;
  //ToggleNumberGrid togglenumbergrid;
  Board board1; 
  Board board2;
  Cell[] cells1 = new Cell[81];
  Cell[] cells2 = new Cell[81];
  int autosavetimer;
  char[] letters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'};
  CellType currentSelection = CellType.NONE;
  boolean numbergrid;
  PImage minepng;
  int currentnumber;

  Play() {
    init();
  }

  void init() {
    board1 = new Board(w/2, h*27/100, 1);
    board2 = new Board(w/2, h*72/100, 2);
    minepng = loadImage("mine.png");
    selectMine = new Selector(w*5/16, h*48/50, cellsize, minepng);
    selectBoat = new Selector(w/3, h/10, 1, false);
    selectHit = new Selector(w/16, h*48/50, color(255, 0, 0), CellType.HIT);
    selectMiss = new Selector(w*3/16, h*48/50, color(255), CellType.MISS);
    selectNumber = new Selector(w*7/16, h*48/50, backgroundcolor, 0);
    numberUp = new ChangeNumber(w*9/16, h*48/50, true);
    numberDown = new ChangeNumber(w*11/16, h*48/50, false);
    previousModeButton = new PreviousModeButton(cellsize/2, cellsize/2, color(255, 0, 0));
    previousType = GameMode.MENU;
    //togglenumbergrid = new ToggleNumberGrid(w*7/8, h*48/50);
    for (int i = 0; i < cells1.length; i++) {
      cells1[i] = new Cell(0, 0, 1, null);
      cells2[i] = new Cell(0, 0, 2, null);
    }
    board1.initCells(cells1);
    board2.initCells(cells2);
  }

  void checkOverlaps() {
    if (mousedown) {
      currentnumber = selectNumber.value;
      selectNumber.increment(numberUp.overlap(currentnumber));
      selectNumber.increment(numberDown.overlap(currentnumber));
      previousModeButton.activate(previousType);


      if (selectHit.overlaps()) setCurrentSelection(selectHit, CellType.HIT);
      else if (selectMiss.overlaps()) setCurrentSelection(selectMiss, CellType.MISS);
      else if (selectMine.overlaps()) setCurrentSelection(selectMine, CellType.MINE);
      else if (selectNumber.overlaps()) setCurrentSelection(selectNumber, CellType.NUMBER);
      for (Cell c : cells1) {
        if (c.overlaps()) {
          c.setType(currentSelection, selectNumber.value);
        }
      }
    }
  }

  void setCurrentSelection(Selector s, CellType ct) {
    deselectAll();
    s.select();
    currentSelection = ct;
  }


  void run() {
    background(backgroundcolor);
    //if (exitrequest) {
    //  if (!rtrn.overlaps()) {
    //    exitrequest = false;
    //  }
    //}
    //if (displaysaved) {
    //  displaysaved = false;
    //} else {

    //  numup.overlap();
    //  numdown.overlap();
    //  togglenumbergrid.overlap();
    //  gearbutton.overlap();
    //  autoSave();
    //}
    checkOverlaps();
    board1.display();
    board2.display();
    //number();
    for (Cell c : cells1) {
      c.display();
    }
    for (Cell c : cells2) {
      c.display();
    }
    selectHit.display();
    selectMiss.display();
    selectMine.display();
    selectNumber.display();
    numberUp.display();
    numberDown.display();
    previousModeButton.display();

    //numup.display();
    //numdown.display();
    // sbt.display();
    coords();
    //togglenumbergrid.display();
    if (numbergrid) {
      grid();
    }
    //if (displaysaved) {
    //  fill(255);
    //  rectMode(CENTER);
    //  rect(w/2, h/2, w, h/6);
    //  fill(0);
    //  textAlign(CENTER, CENTER);
    //  text("GAME SAVED", w/2, h/2);
    //} else if (displaysaveslots) {
    //  displaysaveslots();
    //}
    //  rtrn.display();
    //  gearbutton.display();
    //  if (exitrequest) {
    //    exitrequest();
    //  }
  }

  void coords() { 
    fill(255);
    for (int i = 0; i < 9; i++) {
      textAlign(CENTER, BOTTOM);
      text(letters[i], cells1[i].x+cells2[i].size/2, cells1[1].y-h/180);
      textAlign(RIGHT, CENTER);
      text(i+1, cells1[0].x-h/90, cells1[i*9].y+cells2[i].size/2); //
      textAlign(CENTER, BOTTOM);
      text(letters[i], cells2[i].x+cells2[i].size/2, cells2[1].y-h/180);
      textAlign(RIGHT, CENTER);
      text(i+1, cells2[0].x-h/90, cells2[i*9].y+cells2[i].size/2); //
    }
    textAlign(CENTER, CENTER);
  }

  void deselectAll() {
    selectMine.deselect();
    selectHit.deselect();
    selectMiss.deselect();
    selectNumber.deselect();
  }

  void clearAll() {
    for (Cell c : cells1) {
      c.cellType = CellType.NONE;
      c.number = false;
    }
    for (Cell c : cells2) {
      c.cellType = CellType.NONE;
      c.number = false;
    }
    numbergrid = false;
  }


  //void autoSave() {
  //  if (millis()/1000 >= autosavetimer) {
  //    saveGame(0, false);
  //    autosavetimer += autosaveinterval;
  //  }
  //}

  void grid() {
    if (numbergrid) {
      CellType none = CellType.NONE;
      //Normal Grid
      for (int i = 0; i < cells2.length; i++) {
        for (int y = 9; y > -10; y -= 9) {
          for (int x = i-y-1; x < i-y+2; x++) {
            try {
              if (cells2[x].cellType == none) {
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
                  if (cells2[x].cellType == none) {
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
                  if (cells2[x].cellType == none) {
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
}
