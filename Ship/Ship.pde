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
  playerShip(float x, float y){
    super(x,y);
    player = loadImage("player.jpg");
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
  void display(){
    image(player, x, y, 50, 50);
    if ((keyPressed == true) && ((key == 'a') || (key == 'A'))){
      pushMatrix();
      translate(3,0);
      popMatrix();
}  
    if ((keyPressed == true) && ((key == 'd') || (key == 'D'))){
      pushMatrix();
      translate(-3,0);
      popMatrix();
}
}
}

ArrayList<Displayable> thingsToDisplay;


void setup(){
  size(800,800);
  thingsToDisplay = new ArrayList<Displayable>();
  playerShip ship = new playerShip(382,750);
  thingsToDisplay.add(ship);

}
void draw(){
  background(0);
  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
}
  
