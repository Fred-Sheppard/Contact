//Code to be copied over from Play

class Place {

  Selector selectMine; 
  Selector selectBoat; 
  Board board;
  PreviousModeButton previousModeButton;
  Cell[] cells = new Cell[81];
  PImage minepng;
  //String currentSelection = "none";
  CellType currentSelection = CellType.NONE;


  Place() {
    init();
  }

  void init() {
    board = new Board(w/2, h/2, 1);
    minepng = loadImage("mine.png");
    selectMine = new Selector(w*3/16, h*48/50, cellsize, minepng);
    selectBoat = new Selector(w*1/16, h*48/50, 215, CellType.BOAT);
    previousModeButton = new PreviousModeButton(cellsize/2, cellsize/2, color(255, 0, 0));
    for (int i = 0; i < cells.length; i++) {
      cells[i] = new Cell(0, 0, 1, null);
    }
    board.initCells(cells);
  }

  void checkOverlaps() {
    if (mousedown) {
      previousModeButton.activate(GameMode.MENU);
      
      if (selectMine.overlaps()) setCurrentSelection(CellType.MINE);
      else if (selectBoat.overlaps()) setCurrentSelection(CellType.BOAT);
      for (Cell c : cells) {
        if (c.overlaps()) {
          c.setType(currentSelection);
        }
      }
    }
  }

  void run() {
    background(backgroundcolor);
    checkOverlaps();
    board.display();
    selectMine.display();
    selectBoat.display();
    previousModeButton.display();
    for (Cell c : cells) {
     c.display(); 
    }
  }
  
  void setCurrentSelection(CellType ct) {
    deselectAll();
    currentSelection = ct;
  }
  
  void deselectAll() {
    selectMine.deselect();
    selectBoat.deselect();
  }
}
