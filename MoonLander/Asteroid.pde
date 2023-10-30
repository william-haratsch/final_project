public class Asteroid{
  int groundExplosionIndex;
  boolean isGroundExploding;
  int groundExplode_x;
  int groundExplode_y;
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
    //int respawnCounter = this.respawnCounter;
    groundExplosionIndex = 0;
    isGroundExploding = false;
    groundExplode_x = 0;
    groundExplode_y = 0;
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
          //NEW METHOD
          //groundExplode_x = (int) pos.x;
          //groundExplode_y = (int) pos.y;
          //System.out.println(groundExplode_x);
          //System.out.println(groundExplode_y);
          setCoordinates();
          isGroundExploding = true;
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
   public void setCoordinates(){
     //Asteroid 1
     if(asteroidOne.pos.array()[1] >= (ground)){
       asteroidOne.groundExplode_x = (int) pos.x;
       asteroidOne.groundExplode_y = (int) pos.y;
     }
     //Asteroid 2
     if(asteroidTwo.pos.array()[1] >= (ground)){
       asteroidTwo.groundExplode_x = (int) pos.x;
       asteroidTwo.groundExplode_y = (int) pos.y;
     }
     //Asteroid 3
     if(asteroidThree.pos.array()[1] >= (ground)){
       asteroidThree.groundExplode_x = (int) pos.x;
       asteroidThree.groundExplode_y = (int) pos.y;
     }
   }
}
