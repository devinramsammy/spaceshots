interface impact{
  boolean isColliding();
}
abstract class Ship implements impact{
  double x,y;
  int defense;
  int attack;
  int type; // 0 for player, 1 for ship
  Ship(double x, double y){
    this.x = x;
    this.y = y;
  }
  abstract void display();
  abstract int type();
  abstract void isShooting();
  abstract boolean isColliding();
}