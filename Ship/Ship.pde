ArrayList<Displayable> thingsToDisplay;
boolean moveLeft = false;
boolean moveRight = false;
boolean shoot = false;
playerShip ship; 
Bullet temp;
  void keyPressed(){
    if(key == 'a' || key == 'A'){
      moveLeft = true;
    }
    else if(key == 'd' || key == 'D'){
      moveRight = true;
      }
    else if(key == 'w'){
        shoot = true;
  }
  }
  
  void keyReleased(){
    if(key == 'a' || key == 'A'){
      moveLeft = false;
    }
    else if(key == 'd' || key == 'D'){
      moveRight = false;
      }
    else if(key == 'w'){
      shoot = false;
  }
    }
void setup(){
  size(800,800);
  thingsToDisplay = new ArrayList<Displayable>();
  ship = new playerShip(382,750);
  
  thingsToDisplay.add(ship);
  

}
void draw(){
  background(0);
  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  if(moveLeft){
    ship.moveLeft();
  }
  if(moveRight){
    ship.moveRight();
  }
  if(shoot){
    if (millis() - ship.lastShot>200){
      temp = new Bullet(ship.getX() + 10,ship.getY()+ 10,1);
      thingsToDisplay.add(temp);
      ship.lastShot = millis();  
  }
  }

}
