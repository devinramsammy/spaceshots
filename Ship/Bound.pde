class Bound{
  PImage bound;
  float x,y;
  float velocity = 1.0;
  Bound(float x, float y){
    this.x = x;
    this.y = y;
    bound = loadImage("enemy.png");
  }
  void move() {
  pushMatrix();
  this.x += velocity;
  if(leftBound.getX() <= 35 || rightBound.getX() >= 765){
    velocity *= -1.0;
    this.y += 30;
  }
  translate(x,y);
  popMatrix();
  }
  void display(){
    image(bound, x,y,35,35);
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
}
