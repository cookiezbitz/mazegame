//custom press to allow smoother player movement and more ranges of motion

void customPress() {
  if(playermove == true){
  
    if(hp >60){
      overburn = false;
    }
    if(hp>0){
    shiftallow=true;
  }else{
    shiftallow = false;
    speed = 3;
    overburn = true;
    
        if(hp<100){
    hp+=.5;
    healthbarlength+=1;
    
    }

}

  if(shiftallow==true){
  if(keysDown.contains(16)){ //shift
  if(overburn == false){
    speed = 6.27;
    hp--;
    healthbarlength-=2;
  }
    
  }  if(!keysDown.contains(16)) {
    speed = 3;
    if(hp<100){
    hp+=.5;
    healthbarlength+=1;
    }
  }
  }
  for (Integer k : keysDown) {
    if (k == 87) { //w
      thingyposy -= speed;
    }
    if (k == 68) { //d
      thingyposx += speed;
    }
    if (k == int('S')) {
      thingyposy += speed;
    }
    if (k == int('A')) {
      thingyposx -= speed;
    }
    
  }
  
  if(thingyposy<0){
   thingyposy = 0; 
  }
  if(thingyposx<0){
   thingyposx = 0; 
  }
  if(thingyposx>1200){
   thingyposx = 1200; 
  }
  if(thingyposy>800){
   thingyposy = 800; 
  }
  
  
  }

}

void keyPressed(KeyEvent e) {
  //println(e.getKeyCode());
  keysDown.add(e.getKeyCode());
}

void keyReleased(KeyEvent e) {
  keysDown.remove(e.getKeyCode());
}

boolean keyDown(int kcode) {
  return keysDown.contains(kcode);
}
