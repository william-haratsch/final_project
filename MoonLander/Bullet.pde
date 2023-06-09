class Bullet{
  //lander width: 75
  //lander height: 54.625
  PVector bulletPos;
  float storedPos_X;
  float storedPos_Y;
  float rotation;
  float speed;
  //boolean: if the bullet hit an asteroid
  boolean isHit;
  Bullet(){
    bulletPos = new PVector(player.pos.x + (75/2), player.pos.y + (54.625/2));
    storedPos_X = mouseX;
    storedPos_Y = mouseY;
    rotation = atan2(storedPos_Y - bulletPos.y, storedPos_X - bulletPos.x) / PI * 180;
    //speed is adjustable
    speed = 10;
  }
  void updateBullet(){
    bulletPos.x = bulletPos.x + cos(rotation/180 * PI) * speed;
    bulletPos.y = bulletPos.y + sin(rotation/180 * PI) * speed;
    int radius = 10;
    float h = random(0, 360);
    for (int r = radius; r > 0; --r) {
        fill(h, 90, 90);
        ellipse(bulletPos.x, bulletPos.y, r, r);
         h = (h + 1) % 360;
  }
    //ellipse(bulletPos.x, bulletPos.y, 10, 10);
    if(bulletPos.x > 0 && bulletPos.x < width && bulletPos.y > 0 && bulletPos.y < height){}
    else{
     bulletPos.x = 1300;
     bullets.remove(i); 
    }
    //BULLET TO ASTEROID
    /*
    //circleOne = bullet
    circleOne radius = 10
    circleOne center = bulletPos.x, bulletPos.y
    //circleTwo = asteroid
    circleTwo radius = asterSize/2
    circleTwo center = asteroidOne.pos.x + asterSize/2, asteroidOne.pos.y + asterSize/2
    */
    //bullet radius = 10
  //AsteroidOne
  if (dist(bulletPos.x, bulletPos.y, asteroidOne.pos.x + asteroidOne.asterSize/2, asteroidOne.pos.y + asteroidOne.asterSize/2) < 10 + asteroidOne.asterSize/2) {
    //colliding
    asteroidOne.isDead = true;
    asteroidOne.respawnCounter = 0;
    //isHit = true;
    bullets.remove(i);
  } 
  //AsteroidTwo
  if (dist(bulletPos.x, bulletPos.y, asteroidTwo.pos.x + asteroidTwo.asterSize/2, asteroidTwo.pos.y + asteroidTwo.asterSize/2) < 10 + asteroidTwo.asterSize/2) {
    //colliding
    asteroidTwo.isDead = true;
    asteroidTwo.respawnCounter = 0;
    //isHit = true;
    bullets.remove(i);
  } 
  //AsteroidThree
  if (dist(bulletPos.x, bulletPos.y, asteroidThree.pos.x + asteroidThree.asterSize/2, asteroidThree.pos.y + asteroidThree.asterSize/2) < 10 + asteroidThree.asterSize/2) {
    //colliding
    asteroidThree.isDead = true;
    asteroidThree.respawnCounter = 0;
    //isHit = true;
    bullets.remove(i);
  } 
  }
}
