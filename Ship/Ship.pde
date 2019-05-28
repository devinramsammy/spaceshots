ArrayList<Displayable> thingsToDisplay;
ArrayList<Bullet> bulletList;
ArrayList<enemyShip> enemy;
boolean moveLeft = false;
boolean moveRight = false;
boolean shoot = false;
playerShip ship; 
Bullet dummy;

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
  enemy = new ArrayList();
  enemyBoard();
  displayEnemy();
  thingsToDisplay.add(ship);
  

}
void enemyBoard() {
  int counter = 0;
  for (int i = 0; i < 40; i++) {
    int x = 70 + i % 10 * 70; 
    int y = 80 + i/10 * 70;

    enemy.add(new enemyShip(float(x), float(y), 1));
  }
}
void displayEnemy(){
  for(int i = 0; i < enemy.size(); i++){
    thingsToDisplay.add(enemy.get(i));
}
}
void draw(){
  background(0);
  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  if(ship.getX() <= -25.0){
    ship.setX(800.0);
    ship.reDraw();
  }
  if(moveLeft){
    ship.moveLeft();
  }
  if(ship.getX() >= 800.0){
    ship.setX(-25.0);
    ship.reDraw();
  }
  if(moveRight){
    ship.moveRight();
  }

  if(shoot){
    if (millis() - ship.lastShot>400){
        thingsToDisplay.add(new Bullet(ship.getX() + 23,ship.getY()+ 9,1));
        for(int i = 41; i < thingsToDisplay.size(); i++){
            dummy = (Bullet) thingsToDisplay.get(i);
            if(dummy.getVoid()){
             
              thingsToDisplay.remove(i);
          }
        }
        ship.lastShot = millis();
        
  
    }
  }
  text(thingsToDisplay.size() + "", 500, 500);
}
