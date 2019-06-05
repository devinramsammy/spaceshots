class laserBeam{
  PImage laser;
  float x,y;
  boolean dead;
  int mode;
  laserBeam(float x, float y, int mode){
    this.x = x;
    this.y = y;
    laser = loadImage("laser.png");
    dead = false;
    this.mode = mode;
  }
  void display(){
    if (mode == 0){
      if(this.y < 800){
        y += 10;
    }
    else{
      dead = true;
    }
    image(laser, x, y, 50,50);
    }
    if (mode == 1){
      if (this.y < 800){
        y += (10);
        x += random (30) - 15;
      }
      else{
        dead = true;
      }
      image(laser, x, y, 25,25);
    }
    
  }
   boolean getVoid(){
    return dead;
  }
}
