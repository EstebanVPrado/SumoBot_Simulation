// -------------------- Start Move --------------------

void startSecuence() {

  startMove = 4; // Select Strat Move
  //Infinite loop until button pressed
  //delay(1*1000); // Delay

  //Insert StartMove here:
  switch(startMove) {
  case 1:
    sideAttack();
    break;
  case 2:
    aroundTheRing();
    break;
  case 3:
    defensiveBackwardsEvasion();
    break;
  case 4:
    teaseAndExit();
    break;
  default:
    sideAttack();
    break;
  }
}

// -------------------- Default Move --------------------

void asUsual() {
  //Insert DefaultMove here:
  randomSearch();
}

// -------------------- What should I do now? --------------------

void whatShouldIdoNow() {

  doSomethingForAWhile();  // Just ignore this

  //Insert SituationalMoves here:
  //--------------------
  if (!busy) {
    dontFall();
    seekAndDetroy();
  }
  //--------------------
}
