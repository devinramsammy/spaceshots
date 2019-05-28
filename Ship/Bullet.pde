class Bullet implements Impact, Displayable{
  PImage bullet;
  float x,y;
  int damage;
  boolean dead;
  Bullet(float x, float y, int damage){
    this.x = x;
    this.y = y;
    this.damage = damage;
    dead = false;
    bullet = loadImage("bullet.png"); 
    
}
  void display(){
    if(this.y > -10){
      y -= 10;
    }
    else{
      dead = true;
    }
    image(bullet, x,y,10,10);
    text(this.getY() +"", 600,600);
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
  boolean getVoid(){
    return dead;
  }

  }
