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
  enemyShip x = new enemyShip(25,25,1);
  thingsToDisplay.add(ship);
  thingsToDisplay.add(x);
  

}
void enemyBoard() {
  for (int i = 0; i < 1; i++) {
    float x = 15;
    float y = 20;
    enemy.add(new enemyShip(x, y, 1));
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
        dummy = new Bullet(ship.getX() + 23,ship.getY()+ 9,1);
        thingsToDisplay.add(dummy);
        ship.lastShot = millis();

  }
  }

}
