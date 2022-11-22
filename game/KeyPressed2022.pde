//custom press to allow smoother player movement and more ranges of motion

void customPress() {
  if(playermove == true){
  
  
  if(keysDown.contains(16)){ //shift
    speed = 6.27;
  } else {
    speed = 3;
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
