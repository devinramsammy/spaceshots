interface impact{
  boolean isColliding();
}
abstract class Ships implements impact{
  double x,y;
  int defense;
  int attack;
  int type; // 0 for player, 1 for ship
  Ships(double x, double y){
    this.x = x;
    this.y = y;
  }
  abstract void setAttack();
  abstract void setDefense();
  abstract void setType();
  abstract void isShooting();
  abstract boolean isColliding();
  abstract void display();
}
class playerShip extends Ships{
  playerShip(double x, double y){
    super(x,y);
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
}
void setup(){
  size(1000,1000);
}
void draw(){
  background(255);
}
  