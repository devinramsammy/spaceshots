interface Impact{
  boolean isColliding();
}
interface Displayable {
  void display();
}



abstract class Ships implements Impact, Displayable{
  float x,y;
  int defense;
  int attack;
  int type; // 0 for player, 1 for ship
  Ships(float x, float y){
    this.x = x;
    this.y = y;
  }
  abstract void setAttack();
  abstract void setDefense();
  abstract void setType();
  abstract void isShooting();
  abstract boolean isColliding();
  abstract void display();
}



class playerShip extends Ships{
  PImage player;
  boolean moveRight = false;
  boolean moveLeft = false;
  playerShip(float x, float y){
    super(x,y);
    player = loadImage("player.jpg");
    image(player, x, y, 50, 50);
  }
  void setAttack(){
    attack = 1;
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


  void moveLeft(){
      pushMatrix();
      x-=3;
      translate(x,y);
      popMatrix();
}  
  
  void moveRight()){
      pushMatrix();
      x+=3;
      translate(x,y);
      popMatrix();
}
 
}

ArrayList<Displayable> thingsToDisplay;
boolean moveLeft = false;
boolean moveRight = true;
  void keyPressed(){
    if(key == 'a' || key == 'A'){
      moveLeft = true;
    }
    else{
     if(key == 'd' || key == 'D'){
      moveRight = true;
      }
    }
  }
  void keyReleased(){
    if(key == 'a' || key == 'A'){
      moveLeft = false;
    }
    else{
     if(key == 'd' || key == 'D'){
      moveRight = false;
      }
    }
  }
void setup(){
  size(800,800);
  thingsToDisplay = new ArrayList<Displayable>();
  playerShip ship = new playerShip(382,750);
  thingsToDisplay.add(ship);

}
void draw(){
  background(0);
  if(moveLeft){
    ship.moveLeft();
  }
  if(moveRight){
    ship.moveRight();
  }
}
  