class laserBeam{
  PImage laser;
  float x,y;
  boolean dead;
  laserBeam(float x, float y){
    this.x = x;
    this.y = y;
    laser = loadImage("laser.png");
    dead = false;
  }
  void display(){
    if(this.y < 800){
      y += 10;
    }
    else{
      dead = true;
    }
    image(laser, x, y, 105,105);
  }
   boolean getVoid(){
    return dead;
  }
}
