  public class Lander{
  public int score;
  public int deaths;
  public boolean isConsecutive;
  public PVector acc = new PVector();
  public PVector pos = new PVector();
  public PVector speed = new PVector();
  public PVector gravity = new PVector();
  Lander(){
    acc.set(0, 0);
    pos.set(550, 50);
    speed.set(0, -1);
    //1.18354 (balanced realism)
    //2.15189394 (realism)
    //0.02 (game)
    gravity.set(0, 0.2);
    score = 0;
    deaths = 0;
    isConsecutive = false;
  }
  public void updateLander(){
   //translate(pos.array()[0], pos.array()[1]);
   /*
  if(pos.array()[0] >= 1100 || pos.array()[0] <= 0 || pos.array()[1] >= 713 || pos.array()[1] <= 0){
    reset();
  }
  */
  //rocketAngle += rocketAngleSpeed;
  //rocketAngleSpeed /= 1.02;
  player.speed.add(player.acc);
  player.speed.add(player.gravity);
  player.pos.add(player.speed);
  if(player.pos.array()[0] > 550 && player.pos.array()[0] < 930 && player.pos.array()[1] < 530 && player.pos.array()[1] > 450 && player.speed.array()[1] < 5){
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
  if(player.pos.array()[0] > 130 && player.pos.array()[0] < 370 && player.pos.array()[1] < 385 && player.pos.array()[1] > 345 && player.speed.array()[1] < 5){
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
  if(player.pos.array()[1] >= (ground - 40)){
    //STOPPED HERE. CODE NOT FINISHED.
    gameState = 2;
    //reset();
    player.isConsecutive = false;
    player.score = 0;
    player.deaths += 1;
  }
  
}
}
