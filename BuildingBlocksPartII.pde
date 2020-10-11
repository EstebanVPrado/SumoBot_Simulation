int maxMoves = 12;
int amountOfMoves = 0;
boolean doStartMove = true;

int timer = 0;
int moveIndex = 0;
int moveCounter = 0;

String[] currentMove = new String[maxMoves];
int[] moveDuration = new int[maxMoves];

// Forward/Backward
int[] speedStraight = new int[maxMoves];

// Rotate
int[] rotationSpeed = new int[maxMoves];
String[] rotationDirection = new String[maxMoves];

// Moving Turn
int[] turnSpeedLeft = new int[maxMoves];
int[] turnSpeedRight = new int[maxMoves];

boolean busy = false;

// Forwards and Backwards Movement
void doStraight(int speed, String fOrB, float time) {
  speedStraight[moveIndex] = speed;
  currentMove[moveIndex] = fOrB;
  moveDuration[moveIndex] = seconds(time);

  amountOfMoves++; 
  moveIndex++;
}

// Rotate Motion 
void doRotate(int speed, String lOrR, float time) {
  rotationSpeed[moveIndex] = speed;
  currentMove[moveIndex] = "rotation";
  rotationDirection[moveIndex] = lOrR;
  moveDuration[moveIndex] = seconds(time);

  amountOfMoves++; 
  moveIndex++;
}

// Turn Movement in function of two motor speeds
void doTurn(int leftMotor, int rightMotor, float time) {
  turnSpeedLeft[moveIndex] = leftMotor;
  turnSpeedRight[moveIndex] = rightMotor;
  currentMove[moveIndex] = "turn";
  moveDuration[moveIndex] = seconds(time);

  amountOfMoves++; 
  moveIndex++;
}

void doStop(float time) {
  currentMove[moveIndex] = "stop";
  moveDuration[moveIndex] = seconds(time);

  amountOfMoves++; 
  moveIndex++;
}

void doNow() {
  moveIndex = 0;
  moveCounter = 0;
  amountOfMoves = 0;
  timer = 0;
}

// -------------------- Control Function --------------------

void doSomethingForAWhile() {
  if (moveCounter < amountOfMoves ) {
    moveSelector(currentMove[moveCounter]);
    timer++;
    if (timer >= moveDuration[moveCounter]) {
      moveCounter++;
      timer = 0;
    }
  } else {
    //Move Finished.
    busy = false;
    doNow(); //  Sets all values to zero.
    asUsual(); // Do defaultMove
  }
}

void prioritizeMove() {busy = true;}

void moveSelector(String move) {

  print("move: ", move, "\n");

  switch(move) {
  case "stop":
    // Don't to anything
    break;

  case "f":
    forward(speedStraight[moveCounter]);
    break;

  case "b":
    backward(speedStraight[moveCounter]);
    break;

  case "rotation":
    rotation(rotationSpeed[moveCounter], rotationDirection[moveCounter]);
    break;

  case "turn":
    turn(turnSpeedLeft[moveCounter], turnSpeedRight[moveCounter]);
    break;

  default:
    print("ARGUMENT DOESN'T EXIST");
    break;
  }
}
