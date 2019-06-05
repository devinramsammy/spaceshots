class Boss implements Displayable{
  float x,y;
  PImage Boss;
  int shotForm;
  boolean moveLeft;
  boolean moveRight;
  int lastShot;
  Boss(float x, float y){
    this.x = x;
    this.y = y;
    Boss = loadImage("Boss.png");
    shotForm = 0;
    moveLeft = false;
    moveRight = false;
  }
  void display(){
    image(Boss,x,y,200,200);
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  int getState(){
    return shotForm;
  }
  void move(){
    if (ship.getX()  > this.x + 60){
      pushMatrix();
      x += 1;
      translate(x,y);
      popMatrix();
}
else if (ship.getX()  < this.x + 60){
  pushMatrix();
  x-= 1;
  translate(x,y);
  popMatrix();
}
  }
}
