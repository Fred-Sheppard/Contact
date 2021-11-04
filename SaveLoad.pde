void saveGame(int slot, boolean display) {
  output = createWriter("save-" + slot + ".txt");
  for (int i = 0; i <81; i++) {
    if (!cells1[i].type.equals("none") || cells1[i].number) {
      output.println(i + ": " + cells1[i].type + ": " + cells1[i].value);
    }
    if (!cells2[i].type.equals("none")) {
      output.println(i+81 + ": " + cells2[i].type + ": " +-1);
    }
  }
  output.flush();
  output.close();
  if (display) {
    displaysaved = true;
  }
}

void loadGame(int slot) {
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

  try {

    String[] list = loadStrings("save-" + slot + ".txt");
    String[] piece = splitTokens(list[0], ": ");
    if (int(piece[2]) == -2) {
      boatcount = 0;
      minecount = 0;
    } else {

      for (int i = 0; i < list.length; i++) {
        String[] pieces = splitTokens(list[i], ": ");
        int index = int(pieces[0]);
        if (index < 81) {
          pieces[2] = pieces[2].trim();
          cells1[index].setType(pieces[1]);
          cells1[index].setValue(pieces[2]);
        } else {
          cells2[index-81].setType(pieces[1]);
        }
      }
      if (!freeplay) {
        boatcount = 16;
        minecount = 4;
      }
    }
  } 
  catch (Exception e) {
    output = createWriter("save-" + slot + ".txt");
  }
}
