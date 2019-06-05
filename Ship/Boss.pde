class Boss implements Displayable{
  float x,y;
  PImage Boss;
  int shotForm;
  boolean heal;
  int lastShot;
  float health;
  Boss(float x, float y){
    this.x = x;
    this.y = y;
    Boss = loadImage("Boss.png");
    shotForm = 0;
    heal = false;
    health = 100;
  }
  void display(){
    noFill();
    rect(160,10,500,25);
    noStroke();
    if (health < 25){
      fill(255, 0, 0);
    }  
    else if (health < 50){
      fill(255, 200, 0);
    }
    else{
      fill(0, 255, 0);
     }
    rect(160,10, health/100.0 * 500, 25);
    
    
    if(heal){
      tint(0,255,0);
      image(Boss,x,y,200,200);
      noTint();
    }
    if(heal == false){
     
    image(Boss,x,y,200,200);
  }
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
    if (this.shotForm == 0){
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
void heal(){
  heal = true;
  health+= 0.05;
}
void noHeal(){
  heal = false;
}
}
