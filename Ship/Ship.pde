interface impact{
  boolean isColliding();
}
abstract class Ships{
  double x,y;
  int defense;
  int attack;
  int type; // 0 for player, 1 for ship
  Ships(double x, double y){
    this.x = x;
    this.y = y;
  }
  abstract void display();
  abstract void setType();
  abstract void isShooting();
  abstract boolean isColliding();
  abstract void setDefense();
  abstract void setAttack();
}
class playerShip extends Ships{
  playerShip(double x, double y){
    super(x,y);
  }

  }
void setup(){
  size(1000,1000);
}
void draw(){
  background(255);
}
  