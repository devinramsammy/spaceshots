abstract class Ships implements Impact, Displayable{
  float x,y;
  int defense;
  int attack;
  Ships(float x, float y){
    this.x = x;
    this.y = y;
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  void setX(float x){
    this.x = x;
  }
  void setY(float y){
    this.y = y;
  }
  abstract void setAttack();
  abstract void setDefense();
  abstract void isShooting();
  abstract boolean isColliding();
  abstract void display();
}
