void displayAll() {
  switch(gamemode) {
   case MENU:
   menu.run();
   break;
   case PLACE:
   place.run();
   break;
   case PLAY:
   play.run();
   break;
   default:
  }
  mousedown = false;
}
