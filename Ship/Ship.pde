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
void enemyMove(){
  for (int i = 0; i < enemy.size(); i++) {
    enemyShip a = (enemyShip) enemy.get(i);
    a.move();
}
}

void setup(){
  size(800,800);
  thingsToDisplay = new ArrayList<Displayable>();
  bulletList = new ArrayList<Bullet>();
  ship = new playerShip(382,750);
  enemy = new ArrayList();
  enemyBoard();
  thingsToDisplay.add(ship);
}
void enemyBoard() {
  for (int i = 0; i < 40; i++) {
    int x = 70 + i % 10 * 70; 
    int y = 80 + i/10 * 70;

    enemy.add(new enemyShip(float(x), float(y), 1));
  }
}
void enemyImpact(){
  for(int i = 0; i < bulletList.size(); i++){
    Bullet b = bulletList.get(i);
    for(int a = 0; a < enemy.size(); a++){
      enemyShip c = enemy.get(a);
      if (dist(b.getX(),b.getY(),c.getX(),c.getY()) < 23){
        bulletList.remove(i);
        enemy.remove(a);
    }
    }
  }
}
    
    
void draw(){
  background(0);
  enemyImpact();
  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Bullet a: bulletList){
    a.display();
  }
  for (enemyShip b: enemy){
    b.display();
   // b.move();
  }
  enemyMove();
  
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
    if (millis() - ship.lastShot>300){
        bulletList.add(new Bullet(ship.getX() + 23,ship.getY()+ 9,1));// to do - flaw(always 4 bullets alive)
        for(int i = 0; i < bulletList.size(); i++){
            dummy = bulletList.get(i);
            if(dummy.getVoid()){
              bulletList.remove(i);
         }
        }
        ship.lastShot = millis();
    }
  }
  text(bulletList.size() + "", 500, 500);
}
