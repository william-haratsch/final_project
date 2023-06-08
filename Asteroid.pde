public class Asteroid{
  public PVector pos = new PVector();
  public PVector speed = new PVector();
  public PVector gravity = new PVector();
  float horizontal;
  
  Asteroid(){
    horizontal = random(2);
    gravity.set(1, 1);
    pos.set(random(1100), 0);
    if(horizontal >= 1){
      speed.set(random(10), 0.2);
    }
    if(horizontal < 1){
      speed.set(-1 * random(10), 0.2);
    }
  }
  public void updateAsteroid(){
    speed.add(gravity);
    pos.add(speed);
  }
}
