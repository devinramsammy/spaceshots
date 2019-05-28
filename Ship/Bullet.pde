class Bullet implements Impact, Displayable{
  PImage bullet;
  float x,y;
  int damage;
  Bullet(float x, float y, int damage){
    this.x = x;
    this.y = y;
    this.damage = damage;
    bullet = loadImage("bullet.png"); 
    
}
  void display(){
    y -= 10;
    image(bullet, x,y,10,10);
  }
  boolean isColliding(){
    return false;
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }

  }
