class enemyShip extends Ships{
  PImage enemy1;
  float velocity;
  enemyShip(float x, float y, int damage){
    super(x,y);
    this.attack = damage;
    velocity = 2.0;
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
  this.x += velocity;;
  if(enemy.get(0).getX() < 35 || enemy.get(9).getX() > 765){
    velocity *= -1.0;
    this.y += 30;
  }
  }
}
