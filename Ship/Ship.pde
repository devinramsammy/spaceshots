ArrayList<Displayable> thingsToDisplay;
ArrayList<Displayable> thingsToDisplayBoss;
ArrayList<Bullet> bulletList;
ArrayList<enemyBullet> enemyBulletList;
ArrayList<enemyShip> enemy;
ArrayList<laserBeam> laser;
ArrayList<laserBeam> laser1;
boolean moveLeft = false;
boolean moveRight = false;
boolean shoot = false;
boolean start = false;
playerShip ship;
enemyShip temp;
Bullet dummy;
enemyBullet eDummy;
laserBeam lDummy;
Bound leftBound;
Bound rightBound;
Boss boss;
int state = 1;
int tempScore;
int time = 0;

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
   else if(key == ' '){
        start = true;
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
   else if(key == ' '){
        start = false;
  }
    }


void setup(){
  size(800,800);
  thingsToDisplay = new ArrayList<Displayable>();
  bulletList = new ArrayList<Bullet>();
  enemyBulletList = new ArrayList<enemyBullet>();
  ship = new playerShip(382,750);
  enemy = new ArrayList();
  thingsToDisplay.add(ship);
  leftBound = new Bound(70.0,80.0);
  rightBound = new Bound(700.0,80.0);
  enemyBoard();
  thingsToDisplayBoss = new ArrayList<Displayable>();
  laser = new ArrayList<laserBeam>();
  laser1 = new ArrayList<laserBeam>();
  boss = new Boss(300,50);
  thingsToDisplayBoss.add(ship);
  thingsToDisplayBoss.add(boss);
  time = 0;
}
void reSetupG(){
  thingsToDisplay = new ArrayList<Displayable>();
  bulletList = new ArrayList<Bullet>();
  enemyBulletList = new ArrayList<enemyBullet>();
  enemy = new ArrayList();
  thingsToDisplay.add(ship);
  leftBound = new Bound(70.0,80.0);
  rightBound = new Bound(700.0,80.0);
  enemyBoard();
}
void reSetupB(){
   thingsToDisplayBoss = new ArrayList<Displayable>();
  laser = new ArrayList<laserBeam>();
  laser1 = new ArrayList<laserBeam>();
  boss = new Boss(300,50);
  thingsToDisplayBoss.add(ship);
  thingsToDisplayBoss.add(boss);
  time = 0;
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
  for(int i = 0; i < laser.size(); i++){
    laserBeam a = laser.get(i);
    if(dist(a.getX(), a.getY(), ship.getX(), ship.getY()) < 35){
      laser.remove(i);
      ship.lives--;
      ship.score-= 10;
    }
}
for(int i = 0; i < laser1.size(); i++){
    laserBeam a = laser1.get(i);
    if(dist(a.getX(), a.getY(), ship.getX(), ship.getY()) < 35){
      laser1.remove(i);
      ship.lives--;
      ship.score-= 10;
    }
}
}
void bossImpact(){
  for(int i = 0; i < bulletList.size(); i++){
    Bullet b = bulletList.get(i);
      if (dist(b.getX(),b.getY(),boss.getX() + 100,boss.getY()) < 100){
        bulletList.remove(i);
        boss.health-= 2.0;
        ship.score += random(8);
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
void bossFire(){
  time+= 100;
  if (time >= 20000){
    boss.shotForm = (int)random(3);
    time = 0;
  }
  if(boss.getState() == 0){
    boss.noHeal();
    if ((int)random(5) > 2){
      laser.add((new laserBeam(boss.getX() + 72,boss.getY()+ 161, 0)));
    for(int i = 0; i < laser.size(); i++){
            lDummy = laser.get(i);
            if(lDummy.getVoid()){
              laser.remove(i);
         }
        }
  }
}
  if(boss.getState() == 1){
    boss.noHeal();
    if ((int)random(5) > 2){
      laser1.add((new laserBeam(boss.getX() + 86,boss.getY() + 161, 1)));
    for(int i = 0; i < laser1.size(); i++){
            lDummy = laser1.get(i);
            if(lDummy.getVoid()){
              laser1.remove(i);
         }
        }
  }
}
 if(boss.getState() == 2){
   boss.heal();
 }
}
void draw_game(){
  background(0);
  textSize(20);
  fill(255);
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
    if (b.getY() >= 720){
      state = 3;
    }
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
  if(ship.lives == 0){
    tempScore = ship.score;
    state = 3;
  }
  if(enemy.size() == 0){
    reSetupB();
    state = 2;
    ship.lives++;
}
}
void draw_start(){
  background(0);
  textSize(30);
  text("Press the Space Bar when ready to begin!", 100, 90);
  textSize(20);
  text("Instructions: Use A and D to move left and right and use W to shoot. You", 40,300);
  text("start with three lives. After each collision with an enemy shot, you lose a life.", 40, 320);
  if (start){
    state = 1;
  }
}
void draw_boss(){
  if(boss.health <= 0.0){
    reSetupG();
    state = 1;
    ship.lives++;
  }
  background(0);
  fill(255);
  textSize(20);
  text("score = "+ship.score,10,30);
  text("lives = "+ship.lives,10,50);
  bossFire();
  boss.move();
  bossImpact();
  playerImpact();
  for (Displayable thing : thingsToDisplayBoss) {
    thing.display();
  }
  for (Bullet a: bulletList){
    a.display();
  }
  for (laserBeam b: laser){
    b.display();
  }
  for (laserBeam c: laser1){
    c.display();
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
  if(ship.lives == 0){
    tempScore = ship.score;
    state = 3;
  }
  
    
}
void draw_gameOver(){
  background(0);
  textSize(40);
  fill(255,0,0);
  text("GAME OVER. SCORE = " + tempScore , 180,400);
  textSize(30);
  text("Press the Space Bar to restart", 200, 440);
  ship.lives = 3;
  ship.score = 0;
  if (start){
    state = 1;
    setup();
  }

}
void draw(){
  if (state == 0){
    draw_start();
  }
  if (state == 1){
    draw_game();
    
  }
  if (state == 2){
    draw_boss();
    
  }
  if (state == 3){
    draw_gameOver();
  }
}
