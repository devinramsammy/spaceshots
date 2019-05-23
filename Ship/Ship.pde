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
  float getX(){
    return x;
  }
  float getY(){
    return y;
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
class Bullet implements Impact, Displayable{
  PImage bullet;
  float x,y;
  int damage;
  Bullet(float x, float y, int damage){
    this.x = x;
    this.y = y;
    this.damage = damage;
    bullet = loadImage("bullet.png");  
}
  void display(){
    image(bullet, x,y,25,25);
  }
  boolean isColliding(){
    return false;
  }
  void moveUp(){
    pushMatrix();
    y += 3;
    translate(x,y);
    popMatrix();
  }
}
  
  

ArrayList<Displayable> thingsToDisplay;
boolean moveLeft = false;
boolean moveRight = false;
boolean shoot = false;
playerShip ship; 
  void keyPressed(){
    if(key == 'a' || key == 'A'){
      moveLeft = true;
    }
    else if(key == 'd' || key == 'D'){
      moveRight = true;
      }
    else if(key == ' '){
        shoot = true;
  }
  }
  
  void keyReleased(){
    if(key == 'a' || key == 'A'){
      moveLeft = false;
    }
    else if(key == 'd' || key == 'D'){
      moveRight = false;
      }
    else if(key == ' '){
      shoot = true;
  }
    }
void setup(){
  size(800,800);
  thingsToDisplay = new ArrayList<Displayable>();
  ship = new playerShip(382,750);
  thingsToDisplay.add(ship);

}
void draw(){
  background(0);
  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  if(moveLeft){
    ship.moveLeft();
  }
  if(moveRight){
    ship.moveRight();
  }
  if(shoot){
    Bullet temp = new Bullet(ship.getX(),ship.getY(), ship.getDamage());
    thingsToDisplay.add(temp);
    temp.moveUp();
  }
}
  
