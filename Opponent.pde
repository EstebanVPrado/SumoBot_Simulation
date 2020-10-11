// -------------------- Opponent --------------------
float distaceBetweenBots;
void pushOp() {
  distaceBetweenBots = sqrt( pow(botXPos - opXPos, 2) + pow(botYPos - opYPos, 2) );
  if (distaceBetweenBots <= (botSize + opSize)/2) {
    opXPos += maxSpeed*cos(frontAngle);
    opYPos += maxSpeed*sin(frontAngle);
  }
}

float randomAngle = 0;
float distaceFromCenter;
void moveOpRandomly() {
  distaceFromCenter= sqrt( pow(opXPos, 2) + pow(opYPos, 2) );
  if (distaceFromCenter >= arenaRad - opSize/2) randomAngle += radians(random(0, 10));
  opXPos += maxSpeed/2*cos(randomAngle);
  opYPos += maxSpeed/2*sin(randomAngle);
}

void mousePressed() {
  opXPos = mouseX - width/2;
  opYPos = mouseY - height/2;
}

void mouseDragged() {
  opXPos = mouseX - width/2;
  opYPos = mouseY - height/2;
}
