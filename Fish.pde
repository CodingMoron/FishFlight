class Fish {
  int size;
  int colorR;
  int colorG;
  int colorB;
  int posX;
  int posY;
  float speedX = 0.;
  float speedY = 0.;
  float speedMin = 5.;
  float speedMax = 10.;
  float attentionRange = 0.;
  int flightDistance = 0;
  int updateCount = 0;
  boolean flighting = false;
  
  
  Fish() {
    size = int(random(66, 99));
    //colorValue = int(random(10, 240));
    colorR = int(random(255));
    colorG = int(random(255));
    colorB = int(random(255));
    posX = int(random(displayWidth));
    posY = int(random(displayHeight));
    attentionRange = 40;
  }
  
  
  void update() {
    float distance = getPointDistance(mouseX, mouseY, posX, posY);
    if (!flighting && distance <= attentionRange) {
      //colorValue = int(map(distance, 0, attentionRange, 0, 255));
      flighting = true;
      flightDistance = int(random(10, 30));
      
      setDirectionX();
      setDirectionY();
    }
    
    if (flighting) {
      posX += speedX;
      posY += speedY;
      updateCount += 1;
      
      if (posX >= displayWidth || posX <= 0) {
        setDirectionX();
      }
      
      if (posY >= displayHeight || posY <= 0 ) {
        setDirectionY(); 
      }
    }
    
    if (updateCount >= flightDistance){
      flighting = false;
      updateCount = 0;
    }
  }
  
  void display() {
    fill(colorR,colorG,colorB);
    ellipse(posX, posY, size, size);
  }
  
  void setDirectionX() {
    speedX = random(speedMin, speedMax);
    int direction = round(random(0, 1.1)) * 2 - 1;
    speedX *= direction;
  }
  
  void setDirectionY() {
    speedY = random(speedMin, speedMax);
    int direction = round(random(0, 1.1)) * 2 - 1;
    speedY *= direction; 
  }
  
  float getPointDistance(int x1, int y1, int x2, int y2){
    int difX = x1 - x2;
    int difY = y1 - y2;
  return sqrt(difX*difX + difY*difY);
}
  
}