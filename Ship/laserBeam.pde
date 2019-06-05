class laserBeam{
  PImage laser;
  float x,y;
  laserBeam(float x, float y){
    this.x = x;
    this.y = y;
    laser = loadImage("laser.png");
  }
  void display(){
    tint(16748174);
    image(laser, boss.getX(), boss.getY(), 25,25);
    noTint();
  }
}
