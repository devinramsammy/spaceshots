interface impact{
  boolean isColliding();
}
abstract class Ships implements impact{
  float x,y;
  int defense;
  int attack;
  int type; // 0 for player, 1 for ship
  Ships(float x, float y){
    this.x = x;
    this.y = y;
  }
  abstract void setAttack();
  abstract void setDefense();
  abstract void setType();
  abstract void isShooting();
  abstract boolean isColliding();
  abstract void draw();
}
class playerShip extends Ships{
  PImage player;
  playerShip(float x, float y){
    super(x,y);
    player = loadImage("player.jpg");
  }
  void setAttack(){
    attack = 1;
  }
  void setDefense(){
    defense = 0;
  }
  void setType(){
    type = 0;
  }
  void isShooting(){
  }
  boolean isColliding(){
    return false;
}

  void draw(){
    image(player,x ,y);
    
}
}
void setup(){
  size(800,800);
  playerShip a = new playerShip(0,0);
  a.draw();
}
void draw(){
  background(0);
  
}
  
