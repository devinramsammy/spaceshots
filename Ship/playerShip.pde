class playerShip extends Ships{
  PImage player;
  int lastShot;
  int score;
  int lives;
  playerShip(float x, float y){
    super(x,y);
    player = loadImage("player.jpg");
    lastShot = 0;
    score = 0;
    lives = 3;
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
  void reDraw(){
    image(player, x, y, 50, 50);
}
}
