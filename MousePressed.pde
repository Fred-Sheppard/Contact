void mousePressed() {
  //void touchStarted() {
  if (displaysettingsaved) {
    displaysettingsaved = false;
  } else {
    if (optionsmenu.equals("options")) {
      if (!deleteallpopup) {
        gearbutton.overlap();
        autosavebutton.overlap();
        bgcoption.overlap();
        deleteall.overlap();
        closemenu.overlap();
        saveexit.overlap();
      }
    } else if (optionsmenu.equals("paused")) {
      gearbutton.overlap();
      optionsbutton.overlap(); 
      savegamebutton.overlap();
      menubutton.overlap();
      closemenubutton.overlap();
    } else if (optionsmenu.equals("none")) {
      if (gamemode.equals("menu")) {
        pmsingle.overlap(mouseX, mouseY);
        pmmulti.overlap(mouseX, mouseY);
        gearbutton.overlap();
        //if (mouseY < h/2) {
        //  gamemode = "levelselect";
        //} else {
        //  gamemode = "multiplayerselect";
        //}
      } else if (gamemode.equals("place")) {
        gearbutton.overlap();
        if (!displayload) {
          modebutton.overlap(mouseX, mouseY);
          selmineplace.overlap();
          selectboat.overlap();
          togglenumbergrid.overlap();
          if (freeplay) {
            placeObjects(false);
          } else {
            placeObjects(true);
          }
        } else {
          for (LoadSelect s : slots) {
            s.overlap();
          }
          displayload = false;
        }
        loadbutton.overlap(mouseX, mouseY);
      } else if (gamemode.equals("play")) {
        if (exitrequest) {
          if (!rtrn.overlaps()) {
            exitrequest = false;
          }
        }
        if (displaysaved) {
          displaysaved = false;
        } else {
          sh.overlap();
          sms.overlap();
          selmineplay.overlap();
          sn.overlap();

          numup.overlap();
          numdown.overlap();
          togglenumbergrid.overlap();
          gearbutton.overlap();
          autoSave();

          for (Cell c : cells1) {
            if (c.overlaps()) {

              if (sh.selected) {
                if (!c.type.equals("hit")) {
                  c.setType("hit");
                } else if (c.type.equals("hit")) {
                  c.setType("none");
                }
              } else if (sms.selected) {
                if (!c.type.equals("miss")) {
                  c.setType("miss");
                } else if (c.type.equals("miss")) {
                  c.setType("none");
                }
              } else if (selmineplay.selected) {
                if (!c.type.equals("mine")) {
                  c.setType("mine");
                } else if (c.type.equals("mine")) {
                  c.setType("none");
                }
              } else if (sn.selected) {
                if (!c.number) {
                  c.setNumber();
                } else if (c.number) {
                  c.number = false;
                }
              }
            }
          }
          for (Cell c : cells2) {
            if (c.overlaps()) {
              if (sh.selected) {
                if (c.type.equals("boat")) {
                  c.setType("hit");
                } else if (c.type.equals("hit")) {
                  c.setType("boat");
                }
              }
            }
          }
        }
      } else if (gamemode.equals("levelselect")) {
        gearbutton.overlap();
        for (LevelButton l : lvbuttons) {
          l.overlap(mouseX, mouseY);
        }
      } else if (gamemode.equals("multiplayerselect") ) {
        gearbutton.overlap();
        if (optionsmenu.equals("none")) {
          if (mouseY > h/2) {
            freeplay = true;
            oldmode = gamemode;
            gamemode = "place";
          } else {
            freeplay = false;
            oldmode = gamemode;
            gamemode = "place";
          }
        }
      }
      if (displaysettingsaved) {
        displaysettingsaved = false;
      }
    } 
    if (numbergrid) {
      //bgc = 0;
    } else {
      //bgc = 190;
    }
  }
  grid();
  displayAll();
}
