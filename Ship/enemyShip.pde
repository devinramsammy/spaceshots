class enemyShip extends Ships{
  PImage enemy1;
  float velocity;
  enemyShip(float x, float y, int damage){
    super(x,y);
    this.attack = damage;
    velocity = 1.2;
    enemy1 = loadImage("enemy.png");
  }
  void setAttack(){
    attack++;
  }
  void setDefense(){
    defense++;
  }
  void isShooting(){
  }
  boolean isColliding(){
    return false;
  }
  void display(){
    image(enemy1, x,y,35,35);
  }
void move() {
  pushMatrix();
  this.x += velocity;
  if(leftBound.getX() <= 35 || rightBound.getX() >= 765){
    velocity *= -1.0;
    this.y += 30;
  }
  translate(x,y);
  popMatrix();
  }
  
}
