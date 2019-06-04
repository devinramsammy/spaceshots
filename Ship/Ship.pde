ArrayList<Displayable> thingsToDisplay;
ArrayList<Bullet> bulletList;
ArrayList<enemyBullet> enemyBulletList;
ArrayList<enemyShip> enemy;
ArrayList<enemyShip> enemyO;
boolean moveLeft = false;
boolean moveRight = false;
boolean shoot = false;
playerShip ship;
enemyShip temp;
Bullet dummy;
enemyBullet eDummy;
Bound leftBound;
Bound rightBound;

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
  bulletList = new ArrayList<Bullet>();
  enemyBulletList = new ArrayList<enemyBullet>();
  ship = new playerShip(382,750);
  enemy = new ArrayList();
  enemyO = new ArrayList();
  thingsToDisplay.add(ship);
  tint(0);
  leftBound = new Bound(70.0,80.0);
  rightBound = new Bound(700.0,80.0);
  tint(255,255);
  enemyBoard();
}
void enemyBoard() {
  for (int i = 0; i < 30; i++) {
    int x = 70 + i % 10 * 70; 
    int y = 80 + i/10 * 70;
    temp = new enemyShip(float(x), float(y), 1);
    enemy.add(temp);
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
        ship.score += random(5);
    }
    }
  }
}
void playerImpact(){
  for(int i = 0; i < enemyBulletList.size(); i++){
    enemyBullet b = enemyBulletList.get(i);
    if(dist(b.getX(), b.getY(), ship.getX(), ship.getY()) < 35){
      enemyBulletList.remove(i);
      ship.lives--;
      ship.score-= 10;
    }
  }
}
void enemyShoot(enemyShip a){
  if ((int)random(1000) == 1){
    enemyBulletList.add((new enemyBullet(a.getX() + 23,a.getY()+ 9,1)));
  
  for(int i = 0; i < enemyBulletList.size(); i++){
            eDummy = enemyBulletList.get(i);
            if(eDummy.getVoid()){
              enemyBulletList.remove(i);
         }
        }
  }
}

  
    
    
void draw(){
  background(0);
  textSize(20);
  text("score = "+ship.score,10,30);
  text("lives = "+ship.lives,10,50);
  enemyImpact();
  playerImpact();
  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Bullet a: bulletList){
    a.display();
  }
  if(enemyBulletList.size() >= 1){
    for (enemyBullet e: enemyBulletList){
      e.display();
    }
  }
  for (enemyShip b: enemy){
    b.display();
    enemyShoot(b);
    b.move();
  }
  leftBound.display();
  leftBound.move();
  rightBound.display();
  rightBound.move();

  
  
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
}
