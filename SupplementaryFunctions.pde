float triangleArea(float x1, float y1, float x2, float y2, float x3, float y3 ) {
  return abs(( x1*(y2 - y3) + x2*(y3 - y1) + x3*(y1 - y2) ) /2 );
}

// Returns true if point (px,py) is insede the triangle formed by points p1, p2 and p3, returns false otherwise
boolean isThePointInsideTheTriangle(float px, float py, float p1x, float p1y, float p2x, float p2y, float p3x, float p3y) {
  float t = triangleArea(p1x, p1y, p2x, p2y, p3x, p3y);
  float t1 = triangleArea(px, py, p2x, p2y, p3x, p3y);
  float t2 = triangleArea(p1x, p1y, p2x, p2y, px, py);
  float t3 = triangleArea(p1x, p1y, px, py, p3x, p3y);

  if (round(t) == round(t1 + t2 + t3)) {
    return true;
  } else return false;
} 

float distanceBetween(float p1x, float p1y, float p2x, float p2y) {
  return sqrt( pow(p1x - p2x, 2) + pow(p1y - p2y, 2) );
}

int seconds(float s) {
  return int(s*frameRate);
}

String randomDirection() {
  if (int(random(1, 10)) % 2 == 0) return "r";
  else return "l";
}

float randomTime(float a, float b) {
  return random(a, b);
}

void keyPressed() {
  switch(key) {
  }
}
