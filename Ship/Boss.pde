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
  void fire(){
    if (shotForm == 0){
      
}
