class playerShip extends Ships{
  PImage player;
  int lastShot;
  playerShip(float x, float y){
    super(x,y);
    player = loadImage("player.jpg");
    lastShot = 0;
  }
  
  void setAttack(){
    attack = 1;
  }
  int getDamage(){
    return attack;
  }
  void setDefense(){
    defense = 0;
  }
  void setType(){
    type = 0;
  }
  void isShooting(){
  }
  boolean isColliding(){
    return false;
}
  void display(){
    image(player, x, y, 50, 50);
  }


  void moveLeft(){
      pushMatrix();
      x-=3;
      translate(x,y);
      popMatrix();
}  
  
  void moveRight(){
      pushMatrix();
      x+=3;
      translate(x,y);
      popMatrix();
}
}
