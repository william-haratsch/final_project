void keyPressed(){
  if(keyCode == LEFT){
    keys[0] = true;
  }
  if(keyCode == RIGHT){
    keys[1] = true;
  }
  if(keyCode == UP){
    keys[2] = true;
    //acc.set(0, -.05);
  }
  if(keyCode == ENTER){
    keys[3] = true;
  }
}

void keyReleased(){
  if(keyCode == LEFT){
    keys[0] = false;
  }
  if(keyCode == RIGHT){
    keys[1] = false;
  }
  if(keyCode == UP){
    keys[2] = false;
    //acc.set(0, 0);
  }
  if(keyCode == ENTER){
    keys[3] = false;
  }
}

void checkKeys(){  
  //angleModifier = 0.8;
  if (keys[2])
  {
     player.acc.set(player.acc.array()[0],-0.25);
     //acc.rotate(rocketAngle - PI/2);
     //angleModifier = 1.7;
  }
  
  else{
    player.acc.set(player.acc.array()[0], 0); 
  } 
  
  
  if (keys[0])
    // rocketAngleSpeed -= 0.002 * angleModifier;
    //-0.050
    player.acc.set(-0.10, player.acc.array()[1]);
  if (keys[1])
     //rocketAngleSpeed += 0.002 * angleModifier;
     player.acc.set(0.10, player.acc.array()[1]);
  if (keys[3])
     reset();
}
