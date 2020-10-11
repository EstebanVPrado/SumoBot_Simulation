// By Esteban Vindas Prado
// Created 25.04.2018

int arenaDiameter = 500;
float arenaRad = arenaDiameter/2;
int arenaLine = 50;

// Sumobot Settings:
int botSize = 75;
int rampSize = 10;
float maxSpeed = 5;
int sensorReach = 75;
float sensorAngle = radians(15);

// Summobot state:
float botXPos = 0;
float botYPos = 150;
float frontAngle = radians(-90);
int movingSpeed; 
int turningSpeed = 100;

int startMove = 0;

// Line sensor positions:
float lineSFrontRightxPos;
float lineSFrontRightyPos;
float lS2xPos;
float lS2yPos;
float lS3xPos;
float lS3yPos;
float lS4xPos;
float lS4yPos;

// Opponent Sensors
float opSFontCenter1xPos;
float opSFontCenter1yPos;
float opSFontCenter2xPos;
float opSFontCenter2yPos;
float opSFontCenter3xPos;
float opSFontCenter3yPos;

float opSFontRight1xPos;
float opSFontRight1yPos;
float opSFontRight2xPos;
float opSFontRight2yPos;
float opSFontRight3xPos;
float opSFontRight3yPos;

float opSFontLeft1xPos;
float opSFontLeft1yPos;
float opSFontLeft2xPos;
float opSFontLeft2yPos;
float opSFontLeft3xPos;
float opSFontLeft3yPos;

float opSRight1xPos;
float opSRight1yPos;
float opSRight2xPos;
float opSRight2yPos;
float opSRight3xPos;
float opSRight3yPos;

float opSLeft1xPos;
float opSLeft1yPos;
float opSLeft2xPos;
float opSLeft2yPos;
float opSLeft3xPos;
float opSLeft3yPos;

// Opponent
float opXPos = 0;
float opYPos = -150;
int opSize = botSize;

void setup() {
  size(640, 640);
  frameRate(60);
  rectMode(CENTER);

  startSecuence();
}

void draw() {

  //// -------------------- Draw Stuff --------------------
  //Background:
  background(51);

  translate(width/2, height/2);   //Translate origin of coordinate system to the center of the screen

  // Draw Arena:
  fill(255, 255, 255);
  ellipse(0, 0, arenaDiameter + arenaLine, arenaDiameter + arenaLine);
  fill(51);
  ellipse(0, 0, arenaDiameter, arenaDiameter);
  fill(51);
  ellipse(0, 0, arenaDiameter, arenaDiameter);

  //Draw Sumobot:
  translate(botXPos, botYPos);   //Translate coordinate system to the sumobot to (eventually) rotate it
  rotate(frontAngle); //Rotate Ramp + Body

  fill(194, 24, 7);
  rect(0, 0, botSize, botSize); // Body
  fill(169, 169, 169);
  rect(0 + botSize/2 - rampSize, 0, 2*rampSize, botSize); // Ramp

  rotate(-frontAngle);
  translate(-botXPos, -botYPos); // Translate back to origin

  ellipse(0, 0, 4, 4); //Draw Origin

  // Draw Sensors

  // Line Sensors

  // Calculate position
  lineSFrontRightxPos = botXPos + botSize/2*sqrt(2)*cos(frontAngle + PI/4 ); 
  lineSFrontRightyPos = botYPos + botSize/2*sqrt(2)*sin(frontAngle + PI/4); 
  lS2xPos = botXPos + botSize/2*sqrt(2)*cos(frontAngle - PI/4); 
  lS2yPos = botYPos + botSize/2*sqrt(2)*sin(frontAngle - PI/4);
  lS3xPos = botXPos + botSize/2*sqrt(2)*cos(frontAngle - PI*3/4);
  lS3yPos = botYPos + botSize/2*sqrt(2)*sin(frontAngle - PI*3/4); 
  lS4xPos = botXPos + botSize/2*sqrt(2)*cos(frontAngle + PI*3/4); 
  lS4yPos = botYPos + botSize/2*sqrt(2)*sin(frontAngle + PI*3/4); 

  // Draw Line Sensors
  fill(0, 0, 255);
  ellipse(lineSFrontRightxPos, lineSFrontRightyPos, 5, 5);
  ellipse(lS2xPos, lS2yPos, 5, 5);
  ellipse(lS3xPos, lS3yPos, 5, 5);
  ellipse(lS4xPos, lS4yPos, 5, 5);

  // Opponent Sensors
  // Position
  opSFontCenter1xPos = botXPos + botSize/2*cos(frontAngle);
  opSFontCenter1yPos = botYPos + botSize/2*sin(frontAngle);
  opSFontCenter2xPos = botXPos + (botSize/2 + sensorReach)*cos(frontAngle + sensorAngle/2);
  opSFontCenter2yPos = botYPos + (botSize/2 + sensorReach)*sin(frontAngle + sensorAngle/2);
  opSFontCenter3xPos = botXPos + (botSize/2 + sensorReach)*cos(frontAngle - sensorAngle/2);
  opSFontCenter3yPos = botYPos + (botSize/2 + sensorReach)*sin(frontAngle - sensorAngle/2);
  line(opSFontCenter1xPos, opSFontCenter1yPos, opSFontCenter2xPos, opSFontCenter2yPos);
  line(opSFontCenter1xPos, opSFontCenter1yPos, opSFontCenter3xPos, opSFontCenter3yPos);
  line(opSFontCenter2xPos, opSFontCenter2yPos, opSFontCenter3xPos, opSFontCenter3yPos);

  opSFontRight1xPos = opSFontCenter1xPos;
  opSFontRight1yPos = opSFontCenter1yPos;
  opSFontRight2xPos = botXPos + (botSize/2 + sensorReach)*cos(frontAngle + 1.5*sensorAngle); 
  opSFontRight2yPos = botYPos + (botSize/2 + sensorReach)*sin(frontAngle + 1.5*sensorAngle);
  opSFontRight3xPos = opSFontCenter2xPos;
  opSFontRight3yPos = opSFontCenter2yPos;
  line(opSFontRight1xPos, opSFontCenter1yPos, opSFontRight2xPos, opSFontRight2yPos);
  //line(opSFontRight1xPos, opSFontRight1yPos, opSFontRight3xPos, opSFontRight3yPos);
  line(opSFontRight2xPos, opSFontRight2yPos, opSFontRight3xPos, opSFontRight3yPos);

  opSFontLeft1xPos = opSFontCenter1xPos;
  opSFontLeft1yPos = opSFontCenter1yPos;
  opSFontLeft2xPos = opSFontCenter3xPos;
  opSFontLeft2yPos = opSFontCenter3yPos;
  opSFontLeft3xPos = botXPos + (botSize/2 + sensorReach)*cos(frontAngle - 1.5*sensorAngle); 
  opSFontLeft3yPos = botYPos + (botSize/2 + sensorReach)*sin(frontAngle - 1.5*sensorAngle);
  //line(opSFontLeft1xPos, opSFontCenter1yPos, opSFontRight2xPos, opSFontRight2yPos);
  line(opSFontLeft1xPos, opSFontLeft1yPos, opSFontLeft3xPos, opSFontLeft3yPos);
  line(opSFontLeft2xPos, opSFontLeft2yPos, opSFontLeft3xPos, opSFontLeft3yPos);

  //Right OpponentSensor
  opSRight1xPos = botXPos + botSize/2*cos(frontAngle + PI/2);
  opSRight1yPos = botYPos + botSize/2*sin(frontAngle + PI/2);

  opSRight2xPos = botXPos + (botSize/2 + sensorReach)*cos(frontAngle + sensorAngle/2 + PI/2);
  opSRight2yPos = botYPos + (botSize/2 + sensorReach)*sin(frontAngle + sensorAngle/2 + PI/2);

  opSRight3xPos = botXPos + (botSize/2 + sensorReach)*cos(frontAngle - sensorAngle/2 + PI/2); 
  opSRight3yPos = botYPos + (botSize/2 + sensorReach)*sin(frontAngle - sensorAngle/2 + PI/2);

  line(opSRight1xPos, opSRight1yPos, opSRight2xPos, opSRight2yPos);
  line(opSRight1xPos, opSRight1yPos, opSRight3xPos, opSRight3yPos);
  line(opSRight2xPos, opSRight2yPos, opSRight3xPos, opSRight3yPos);

  //Left OpponentSensor
  opSLeft1xPos = botXPos + botSize/2*cos(frontAngle - PI/2);;
  opSLeft1yPos = botYPos + botSize/2*sin(frontAngle - PI/2);

  opSLeft2xPos = botXPos + (botSize/2 + sensorReach)*cos(frontAngle + sensorAngle/2 - PI/2);
  opSLeft2yPos = botYPos + (botSize/2 + sensorReach)*sin(frontAngle + sensorAngle/2 - PI/2);

  opSLeft3xPos = botXPos + (botSize/2 + sensorReach)*cos(frontAngle - sensorAngle/2 - PI/2); 
  opSLeft3yPos = botYPos + (botSize/2 + sensorReach)*sin(frontAngle - sensorAngle/2 - PI/2);

  line(opSLeft1xPos, opSLeft1yPos, opSLeft2xPos, opSLeft2yPos);
  line(opSLeft1xPos, opSLeft1yPos, opSLeft3xPos, opSLeft3yPos);
  line(opSLeft2xPos, opSLeft2yPos, opSLeft3xPos, opSLeft3yPos);

  //Draw Opponent:
  // Opponent:
  fill(255, 105, 180);
  ellipse(opXPos, opYPos, opSize, opSize);

  // -------------------- Call some Functions --------------------
  pushOp(); // Moves Opponent in case it's being touched
  //moveOpRandomly();
  whatShouldIdoNow();
}
