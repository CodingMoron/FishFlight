Fish[] units = new Fish[100];
int renderedUnits = 100;


void setup(){
  
  //frameRate(30);
  size(displayWidth, displayHeight);
  for (int i = 0; i < renderedUnits; i++) {
    units[i] = new Fish(); 
  }
}


void draw(){
  background(255);
  stroke(4);
  strokeWeight(1); 
  for (int i = 0; i < renderedUnits; i++) {
    units[i].update();
    units[i].display(); 
  }  
}