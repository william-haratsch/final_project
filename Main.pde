Lander player;
Asteroid asteroidOne;
boolean[] keys;
//float rocketAngle;
//float rocketAngleSpeed;
//float angleModifier;

int w = 1100;
int h = 713;
int ground = h - 40;
int time = millis();
int gameState;
PImage img_lander;
PImage img_lunarSurface;
PImage img_asteroid1;
PImage img_asteroid2;
PImage img_asteroid3;

//0.027 m/s^2, per frame^2
void setup(){
  size(1100, 713);
  player = new Lander();
  asteroidOne = new Asteroid();
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
  asteroidOne.updateAsteroid();
  /*
  if(player.pos.array()[0] >= 1100 || player.pos.array()[0] <= 0 || player.pos.array()[1] >= 713 || player.pos.array()[1] <= 0){
    reset();
  }
  */
  System.out.println(player.pos.array()[0] + "\t" + player.pos.array()[1]);
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
  image(img_lander, player.pos.array()[0], player.pos.array()[1], 75, 54.625);
  image(img_asteroid1, asteroidOne.pos.array()[0], asteroidOne.pos.array()[1], 50, 50);
  
}

void reset(){
  //rocketAngle = PI/2;
  //rocketAngleSpeed = 0;
  player.pos.set(550, 50);
  player.speed.set(0, -1);
  player.acc.set(0, 0);
  for(int i = 0; i < keys.length; i++){
    keys[i] = false;
}
}

void createArrays(){
  keys = new boolean[4];
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
//720, 430
