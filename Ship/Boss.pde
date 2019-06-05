class Boss implements Displayable{
  float x,y;
  PImage Boss;
  int shotForm;
  Boss(float x, float y){
    this.x = x;
    this.y = y;
    Boss = loadImage("Boss.png");
    shotForm = 0;
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
    if (this.x < 600){
      pushMatrix();
      this.x -= 1;
      translate(x,y);
      popMatrix();
  }
  else if (this.x > 200){
      pushMatrix();
      this.x -= 1;
      translate(x,y);
      popMatrix();
  }
}
}
