class enemyShip extends Ships{
  PImage enemy;
  float velocity;
  enemyShip(float x, float y, int damage){
    super(x,y);
    this.attack = damage;
    velocity = 3.0;
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
  void move(){
    pushMatrix();
    x+= velocity;
    if(this.x >= 765 || this.x <= 35){
      velocity *= -1.0;
      y += 50;
    }
    
    translate(x,y);
    popMatrix();
}
} 
