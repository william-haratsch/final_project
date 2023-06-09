public class Asteroid{
  int explosionIndex;
  boolean exploding;
  int explode_x;
  public PVector pos;
  public PVector speed;
  float horizontal;
  float asterSize;
  int time = millis();
  PImage[] asteroids = {img_asteroid1, img_asteroid2, img_asteroid3};
  //boolean: if the asteroid was hit by a bullet
  boolean isDead;
  int respawnCounter;
  
  Asteroid(){
    int respawnCounter = this.respawnCounter;
    isDead = false;
    pos = new PVector();
    speed = new PVector();
    horizontal = random(2);
    asterSize = random(20, 30);
    pos.set(random(1100), 0);
    if(horizontal >= 1){
      speed.set(random(1, 10), random(5, 15));
    }
    if(horizontal < 1){
      speed.set(-1 * random(1, 10), random(5, 15));
    }
  }
  //every three seconds
  public void updateAsteroid(){
    if(isDead == false){
      pos.add(speed);
      if(pos.array()[1] >= (ground)){
          //explode(pos.x, pos.y);
          horizontal = random(2);
          pos.set(random(1100), 0);
          if(horizontal >= 1){
            speed.set(random(1, 10), random(5, 15));
            }
          if(horizontal < 1){
            speed.set(-1 * random(1, 10), random(5, 15));
            }
          asterSize = random(20, 30);
        }
     }
   if(isDead == true){
      respawnCounter++;
      if(respawnCounter == 5){
        pos = new PVector();
        speed = new PVector();
        horizontal = random(2);
        asterSize = random(20, 30);
        pos.set(random(1100), 0);
        if(horizontal >= 1){
          speed.set(random(1, 10), random(5, 15));
        }
        if(horizontal < 1){
          speed.set(-1 * random(1, 10), random(5, 15));
          }
          isDead = false;
        }
     }
   }
}
