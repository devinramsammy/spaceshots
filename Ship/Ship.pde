interface impact{
  boolean isColliding();
}
abstract class Ship{
  double x,y;
  int defense;
  int attack;
  int type; // 0 for player, 1 for ship
  Ship(double x, double y){
    this.x = x;
    this.y = y;
  }
  abstract void display();
  abstract void setType();
  abstract void isShooting();
  abstract boolean isColliding();
  abstract void display();
  abstract void setDefense();
  abstract void setAttack();
}
class playerShip extends Ship{
  playerShip(double x, double y){
    super(x,y);
  }
  void setType{
    type = 0;
  }
}
void setup(){
  size(1000,1000);
  background(255);
}
  