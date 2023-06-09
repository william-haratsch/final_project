Lander player;
Asteroid asteroidOne;
Asteroid asteroidTwo;
Asteroid asteroidThree;
boolean[] keys;
//Bullet arraylist
ArrayList<Bullet> bullets;
//bullet variables
boolean canShoot = true;
float canShootCounter;
int i;

//dimensions of screen
int w = 1100;
int h = 713;
//miscellaneous
int ground = h - 40;
int time;
int gameState;
//lander dimensions
float lander_width = 75;
float lander_height = 54.625;
//images
PImage img_lander;
PImage img_lunarSurface;
//images - asteroids
PImage img_asteroid1;
PImage img_asteroid2;
PImage img_asteroid3;
//EXPLOSIONS
PImage[] explosion = new PImage[60];
int explosionIndex;
boolean exploding;
int explode_x;
int explode_y;
//asteroids booleans
boolean isAsteroid1;
boolean isAsteroid2;
boolean isAsteroid3;

//0.027 m/s^2, per frame^2
void setup(){
  explosionIndex = 0;
  exploding = false;
  size(1100, 713);
  bullets = new ArrayList<Bullet>();
  player = new Lander();
  asteroidOne = new Asteroid();
  asteroidTwo = new Asteroid();
  asteroidThree = new Asteroid();
  loadResources();
  createArrays();
  for(int i = 0; i < keys.length; i++){
    keys[i] = false;
}
  gameState = 1;
  //size(img_lunarSurface.height, img_lunarSurface.width);
  //600 x 437 px
  frameRate(60);
  //image(img_lunarSurface, 0, 0, w, h);
  //image(img_lander, pos.array()[0], pos.array()[1], 75, 54.625);
  //image(img_lander, pos.array()[0], pos.array()[1], 75, 54.625);

}

void draw(){
  //image(img_lunarSurface, 0, 0, w, h);
  checkKeys();
  drawEnvironment();
  //updateEnvironment();
  drawScore();
  player.updateLander();
  asteroidUpdater();
  collider();
  for(i = bullets.size() - 1; i >= 0; i--){
    Bullet bullet = bullets.get(i);
    bullet.updateBullet();
  }
  /*
  if (explosionIndex < explosion.length){
            image(explosion[explosionIndex], 20, 20);
            explosionIndex++;
  }
  */
  //user info
  /*
  if (explosionIndex < explosion.length){
            image(explosion[explosionIndex], 50, 50);
            explosionIndex++;
  }
  */
  System.out.println(exploding);
  if(exploding){
    exploderLander();
  }
  //System.out.println(player.pos.array()[0] + "\t" + player.pos.array()[1]);
}

void drawEnvironment(){
  image(img_lunarSurface, 0, 0, w, h);
  //
 
  float height = abs(player.pos.y-h+40);
  noStroke();
  fill(0,127-(height/8));
  //+36.5 offset
  ellipse(player.pos.x + 36.5,ground,5+30*(height/50),1+7*(height/50));
  //
  noFill();
  int passedMillis = millis() - time; // calculates passed milliseconds
  if(passedMillis >= 600){
      time = millis();
      stroke(255,255,0);  // if more than 215 milliseconds passed set stroke color to yellow
  }
  //stroke(random(255),random(255),random(255));
  ellipse(744, 490, 195 , 39);
  ellipse(250, 405, 140 , 20);
  //lander width: 75
  //lander height: 54.625
    image(img_lander, player.pos.array()[0], player.pos.array()[1], 75, 54.625);
    //image(img_lander, 0, 0, 75, 54.625);
  drawAsteroids();
  if(isAsteroid1 == true && asteroidOne.isDead == false)
     image(img_asteroid1, asteroidOne.pos.array()[0], asteroidOne.pos.array()[1], asteroidOne.asterSize, asteroidOne.asterSize);
  if(isAsteroid2 == true && asteroidTwo.isDead == false)
    image(img_asteroid2, asteroidTwo.pos.array()[0], asteroidTwo.pos.array()[1], asteroidTwo.asterSize, asteroidTwo.asterSize);
  if(isAsteroid3 == true && asteroidThree.isDead == false)
    image(img_asteroid3, asteroidThree.pos.array()[0], asteroidThree.pos.array()[1], asteroidThree.asterSize, asteroidThree.asterSize);
  //image(img_explosion1, 50, 50, 75, 79);
  //explode();
}

void reset(){
  //rocketAngle = PI/2;
  //rocketAngleSpeed = 0;
  //exploding = false;
  player.pos.set(550, 50);
  player.speed.set(0, -1);
  player.acc.set(0, 0);
  for(int i = 0; i < keys.length; i++){
    keys[i] = false;
}
}

void createArrays(){
  keys = new boolean[4];
  int count = 0;
  for(int j = 1; j < 9; j++){
    for(int k = 1; k < 9; k++){
        if(count < 60){
       explosion[count] = loadImage("Explosions/row-" + j + "-column-" + k + ".png");
       count++;
        }
      }
      }
}


void drawScore(){
  if(gameState == 1){
    fill(255, 255, 255);
    textSize(20);
    text("Score: " + player.score, 10, 20);
    text("Deaths: " + player.deaths, 10, 40);
  }
  if(gameState == 2){
    fill(255, 255, 255);
    textSize(20);
    text("Score: " + player.score, 10, 20);
    text("Deaths: " + player.deaths, 10, 40);
  }
}

void drawAsteroids(){
  int asterTime = (int)(millis()/1000);
  if((asterTime % 9) == 0 && isAsteroid2 != true){
      //image(img_asteroid1, asteroidOne.pos.array()[0], asteroidOne.pos.array()[1], 20, 20);
      isAsteroid1 = true;
  }
  if(((asterTime - 3)% 9) == 0 && isAsteroid3 != true){
      //image(img_asteroid2, asteroidTwo.pos.array()[0], asteroidTwo.pos.array()[1], 20, 20);  
      isAsteroid2 = true;
  }
  if(((asterTime - 6)% 9) == 0){
      //image(img_asteroid3, asteroidThree.pos.array()[0], asteroidThree.pos.array()[1], 20, 20);
      isAsteroid3 = true;
  }
}

void asteroidUpdater(){
  if(isAsteroid1 == true)
     asteroidOne.updateAsteroid();
  if(isAsteroid2 == true)
     asteroidTwo.updateAsteroid();
  if(isAsteroid3 == true)
     asteroidThree.updateAsteroid();
}
//720, 430

void collider(){
  //lander width: 75
  //lander height: 54.625
  //asteroidOne && top left point on lander
  if(player.pos.x < asteroidOne.pos.x + asteroidOne.asterSize &&
     player.pos.x + lander_width > asteroidOne.pos.x &&
     player.pos.y < asteroidOne.pos.y + asteroidOne.asterSize &&
     lander_height + player.pos.y > asteroidOne.pos.y){
       reset(); 
       player.isConsecutive = false;
       player.score = 0;
       player.deaths += 1;
     }
  //asteroidTwo
  if(player.pos.x < asteroidTwo.pos.x + asteroidTwo.asterSize &&
     player.pos.x + lander_width > asteroidTwo.pos.x &&
     player.pos.y < asteroidTwo.pos.y + asteroidTwo.asterSize &&
     lander_height + player.pos.y > asteroidTwo.pos.y){
       reset(); 
       player.isConsecutive = false;
       player.score = 0;
       player.deaths += 1;
     }
     //asteroidThree
   if(player.pos.x < asteroidThree.pos.x + asteroidThree.asterSize &&
     player.pos.x + lander_width > asteroidThree.pos.x &&
     player.pos.y < asteroidThree.pos.y + asteroidThree.asterSize &&
     lander_height + player.pos.y > asteroidThree.pos.y){
       reset(); 
       player.isConsecutive = false;
       player.score = 0;
       player.deaths += 1;
     }
   //BULLETS TO ASTEROID
}
 public void exploderLander(){
  if(explosionIndex < explosion.length){
    System.out.println("yea");
    System.out.println(explosionIndex);
    System.out.println(explode_x);
    System.out.println(explode_y);
            image(explosion[explosionIndex], explode_x - 220, 400);
            explosionIndex++;
  }
  if(explosionIndex == explosion.length){
     explosionIndex = 0;
     exploding = false;
  }
 }
