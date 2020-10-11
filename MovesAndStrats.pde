/*
 // -------------------- Instructions --------------------
 // Functions:
 doStraight(int speed, String fOrB, int time); // fOrB is "f" or "b"
 doRotate(int speed, String lOrR, int time ); // "lOrR" is "l" or "r"
 doTurn(int leftMotor, int rightMotor, int time);
 doStop(int time); // Don't move for a while
 
 doNow() // Very very important. You have to call this function at the beginning of every move that you want to be excecuted inmediately
 prioritize
 
 // Geters:
 Opponent Sensors:
 getDistOpSFrontCenter()
 getDistOpSFrontRight()
 getDistOpSFrontLeft()
 getDistOpSRight()
 getDistOpSLeft()
 
 opSFrontCenter()
 opSFrontRight()
 opSFrontLeft()
 opSLeft()
 opSRight()
 
 Line Sensors:
 lineSFrontRight()
 lineSFrontLeft()
 lineSBackRight()
 lineSBackLeft()
 
 // Some other functions I wrote
 String randomDirection() // returns "Right" or "Left" randomly
 int randomTime(a, b) // returns a random float between a and b
 
 When you are done writing the function, you can go to the "SumoBot" tab and put it there. 
 
 Bellow, you can find some example functions
 */

// -------------------- Situations --------------------

// Avoids falling off the arena
void dontFall() {
  if (lineSFrontRight() && lineSFrontLeft()) {
    doNow();
    doStraight(100, "b", 0.3);
    doRotate(80, randomDirection(), 0.35 );
  } else if (lineSFrontRight()) {
    doNow();
    doStraight(100, "b", 0.3);
    doRotate(80, "l", 0.35);
  } else if (lineSFrontLeft()) {
    doNow();
    doStraight(100, "b", 0.3);
    doRotate(80, "r", 0.35);
  }
}

// If it finds the opponent it attacks
void seekAndDetroy() {
  // In front:
  if (opSFrontCenter() && !(lineSFrontRight() || lineSFrontLeft())) {
    doNow();
    doStraight(100, "f", 0.05);
    // To the Front Right
  } else if (opSFrontRight()) {
    doNow();
    doRotate(50, "r", 0.05);
    // To the Front Left
  } else if (opSFrontLeft()) {
    doNow();
    doRotate(50, "l", 0.05);
  }
  // To the Right
  else if (opSRight()) {
    doNow();
    doRotate(50, "r", 0.6);
  }
  // To the Left
  else if (opSLeft()) {
    doNow();
    doRotate(50, "l", 0.6);
  }
}

// -------------------- Start Moves --------------------
// StartMoves don't need a doNow() at the beginning because the are excecuted right away... 

// Side attack
void sideAttack() {
  doRotate(50, "l", 1 );
  doStraight(100, "f", 4);
  doRotate(50, "r", 2);
}

void aroundTheRing() {
  doRotate(100, "r", 1.5);
  doTurn(83, 100, randomTime(10, 20));
}

void defensiveBackwardsEvasion() {
  doRotate(100, "l", 0.9);
  doStraight(100, "b", 1);
  doStop(5);
}

float rightTurn = 1;

void sweepAttack() {
  doRotate(100, "r", rightTurn);
  doStraight(100, "f", 1);
  doRotate(100, "l", rightTurn);
  doStraight(50, "f", 1.5);
  doRotate(100, "l", rightTurn);
  doStraight(100, "f", 5);
  doRotate(100, "r", rightTurn);
  doStraight(100, "f", 0.8);
  doRotate(100, "r", rightTurn);
  doStraight(100, "f", 7.5);
  doRotate(100, "l", rightTurn*2);
}

void teaseAndExit() {
  doStraight(100, "f", 1);
  doRotate(100, "l", 1);
  doStraight(100, "b", 2);
  doRotate(100, "r", 0.9);
  doStraight(100, "f", 6);
  doRotate(100, "l", 2);
}

// -------------------- Defaults --------------------
// Defaults don't need a doNow cause 

void randomSearch() {
  doStraight(100, "f", 1);
  doRotate(100, randomDirection(), randomTime(0.2, 0.3));
}
