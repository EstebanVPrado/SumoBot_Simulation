// -------------------- Sumobot Movement --------------------

// Move forwards
void forward(float s) {
  float speed = (s/100)*maxSpeed;
  botXPos += speed*cos(frontAngle);
  botYPos += speed*sin(frontAngle);
}

// Move Backwards
void backward(float s) {
  float speed = s/100*maxSpeed;
  botXPos -= speed*cos(frontAngle);
  botYPos -= speed*sin(frontAngle);
}

// Static Turn
void rotation(float s, String d) {
  if (d == "r") frontAngle += (s/100)*maxSpeed/(botSize/2);
  else if (d == "l") frontAngle -= (s/100)*maxSpeed/(botSize/2);
}

// Moving Turn
void turn(float turnSpeedLeft, float turnSpeedRight) {

  float s = (turnSpeedRight + turnSpeedLeft)/2;

  //print("Speed: ", s, "\n");

  float alpha = turnSpeedRight/100*radians(90); //Right
  float beta = turnSpeedLeft/100*radians(90); //Left

  //print("Alpha: ", alpha, "\n");
  //print("Beta: ", beta, "\n");

  float t = 100*(cos(alpha) - cos(beta));

  //print("Turn t ", t, "\n");

  String d;

  if (t > 0)  d = "r";
  else if (t < 0) d = "l";
  else d = "";

  forward(s);
  rotation(abs(t), d);
}

// -------------------- Sensors --------------------

// Line Sensors:
boolean lineSFrontRight() {
  if (sqrt(pow(lineSFrontRightxPos, 2) + pow(lineSFrontRightyPos, 2)) >= arenaRad) return true;
  else return false;
}

boolean lineSFrontLeft() {
  if (sqrt(pow(lS2xPos, 2) + pow(lS2yPos, 2)) >= arenaRad) return true;
  else return false;
}

boolean lineSBackLeft() {
  if (sqrt(pow(lS3xPos, 2) + pow(lS3yPos, 2)) >= arenaRad) return true;
  else return false;
}

boolean lineSBackRight() {
  if (sqrt(pow(lS4xPos, 2) + pow(lS4yPos, 2)) >= arenaRad) return true;
  else return false;
}

// Opponent Sensors:
// Opponent Sensor Front Center
float getDistOpSFrontCenter() {
  if (isThePointInsideTheTriangle(opXPos, opYPos, opSFontCenter1xPos, opSFontCenter1yPos, opSFontCenter2xPos, opSFontCenter2yPos, opSFontCenter3xPos, opSFontCenter3yPos)) return distanceBetween(opXPos, opYPos, opSFontCenter1xPos, opSFontCenter1yPos);
  else return 0;
}
boolean opSFrontCenter() {
  return isThePointInsideTheTriangle(opXPos, opYPos, opSFontCenter1xPos, opSFontCenter1yPos, opSFontCenter2xPos, opSFontCenter2yPos, opSFontCenter3xPos, opSFontCenter3yPos);
}

// Opponent Sensor Front Right
float getDistOpSFrontRight() {
  if (isThePointInsideTheTriangle(opXPos, opYPos, opSFontRight1xPos, opSFontRight1yPos, opSFontRight2xPos, opSFontRight2yPos, opSFontRight3xPos, opSFontRight3yPos)) return distanceBetween(opXPos, opYPos, opSFontRight1xPos, opSFontRight1yPos);
  else return 0;
}
boolean opSFrontRight() {
  return isThePointInsideTheTriangle(opXPos, opYPos, opSFontRight1xPos, opSFontRight1yPos, opSFontRight2xPos, opSFontRight2yPos, opSFontRight3xPos, opSFontRight3yPos);
}

// Opponent Sensor Front Left
float getDistOpSFrontLeft() {
  if (isThePointInsideTheTriangle(opXPos, opYPos, opSFontLeft1xPos, opSFontLeft1yPos, opSFontLeft2xPos, opSFontLeft2yPos, opSFontLeft3xPos, opSFontLeft3yPos)) return distanceBetween(opXPos, opYPos, opSFontLeft1xPos, opSFontLeft1yPos);
  else return 0;
}
boolean opSFrontLeft() {
  return isThePointInsideTheTriangle(opXPos, opYPos, opSFontLeft1xPos, opSFontLeft1yPos, opSFontLeft2xPos, opSFontLeft2yPos, opSFontLeft3xPos, opSFontLeft3yPos);
}

// Opponent Sensor Right
float getDistOpSRight() {
  if (isThePointInsideTheTriangle(opXPos, opYPos, opSRight1xPos, opSRight1yPos, opSRight2xPos, opSRight2yPos, opSRight3xPos, opSRight3yPos)) return distanceBetween(opXPos, opYPos, opSRight1xPos, opSRight1yPos);
  else return 0;
}
boolean opSRight() {
  return isThePointInsideTheTriangle(opXPos, opYPos, opSRight1xPos, opSRight1yPos, opSRight2xPos, opSRight2yPos, opSRight3xPos, opSRight3yPos);
}

// Opponent Sensor Left
float getDistOpSLeft() {
  if (isThePointInsideTheTriangle(opXPos, opYPos, opSLeft1xPos, opSLeft1yPos, opSFontCenter2xPos, opSLeft2yPos, opSLeft3xPos, opSLeft3yPos)) return distanceBetween(opXPos, opYPos, opSLeft1xPos, opSLeft1yPos);
  else return 0;
}
boolean opSLeft() {
  return isThePointInsideTheTriangle(opXPos, opYPos, opSLeft1xPos, opSLeft1yPos, opSLeft2xPos, opSLeft2yPos, opSLeft3xPos, opSLeft3yPos);
}

// Impact Detection:
boolean impacted() {
  distaceBetweenBots = sqrt( pow(botXPos - opXPos, 2) + pow(botYPos - opYPos, 2) );
  if (distaceBetweenBots <= (botSize + opSize)/2) return true;
  else return false;
}
