  public class Lander{
  public int score;
  public int deaths;
  public boolean isDead;
  public boolean isConsecutive;
  public PVector acc = new PVector();
  public PVector pos = new PVector();
  public PVector speed = new PVector();
  public PVector gravity = new PVector();
  Lander(){
    isDead = false;
    acc.set(0, 0);
    pos.set(550, 50);
    speed.set(0, -1);
    //1.18354 (balanced realism)
    //2.15189394 (realism)
    //0.02 (game)
    gravity.set(0, 0.1);
    score = 0;
    deaths = 0;
    isConsecutive = false;
  }
  public void updateLander(){
   //translate(pos.array()[0], pos.array()[1]);
  //rocketAngle += rocketAngleSpeed;
  //rocketAngleSpeed /= 1.02;
  player.speed.add(player.acc);
  player.speed.add(player.gravity);
  player.pos.add(player.speed);
  if(player.pos.array()[0] > 600 && player.pos.array()[0] < 750 && player.pos.array()[1] < 530 && player.pos.array()[1] > 450 && player.speed.array()[1] < 5 && player.speed.array()[1] >= 0){
    if(player.isConsecutive == false){
      player.isConsecutive = true;
      player.score += 1;
    }
    else{
      player.score += 1;
    }
    reset();
  }
  //  ellipse(250, 405, 140 , 20);
  if(player.pos.array()[0] > 130 && player.pos.array()[0] < 370 && player.pos.array()[1] < 385 && player.pos.array()[1] > 345 && player.speed.array()[1] < 5 && player.speed.array()[1] >= 0){
    if(player.isConsecutive == false){
      player.isConsecutive = true;
      player.score += 1;
    }
    else{
      player.score += 1;
    }
    reset();
  }
  //size(1100, 713)
  //lander hits the ground.
  if(player.pos.array()[1] >= (ground - 40)){
    //STOPPED HERE. CODE NOT FINISHED.
    //gameState = 2;
    isDead = true;
    exploding = true;
    explode_x = (int) player.pos.x;
    explode_y = (int) player.pos.y;
    //exploder();
    reset();
    player.isConsecutive = false;
    player.score = 0;
    player.deaths += 1;
      }
   if (mousePressed == true) {
     //regulation of shooting speed
     if (canShoot == true){
       bullets.add(new Bullet());
       canShoot = false;
       canShootCounter = 0;
     }
   }
   if(canShoot == false){
      canShootCounter++;
      //shoot counter is adjustable
      if(canShootCounter == 5){
         canShoot = true; 
       }
    }
    //WRAP AROUND
    if(player.pos.x < 0){
       player.pos.set(1100, player.pos.y); 
    }
    if(player.pos.x > 1100)
      player.pos.set(0, player.pos.y);
  }
}
