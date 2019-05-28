class enemyShip extends Ships{
  PImage enemy;
  enemyShip(float x, float y, int damage){
    super(x,y);
    this.attack = damage;
    enemy = loadImage("enemy.png");
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
    image(enemy, x,y,35,35);
  }
}
    
