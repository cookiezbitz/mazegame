//maze game
//maze game
import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();
int lastspawned = 0; //seconds between the last spawn time of the object
int currenttime = 0; // variable for the timer
float thingyposx; //x position of the ball
float thingyposy; // y pos of the ball
float speed = 1.5; // the speed of the ball ( not including shift )
int stage = 0; // the stage of the game
boolean spawned = false; // bool for if the ball is spanwed
int deaths; //number of deaths
int stars; // number of stars the player collected
int startemp; // temporary variable for star, before confirming it is collected
boolean playermove = true; // allows or disallows  player movement

float killlaserposx; // the x and y variables of the laser found in stage 3
float killlaserposx2; // the x and y variables of the laser found in stage 3
float killlaserposx3; // the x and y variables of the laser found in stage 3
float killlaserposy;

boolean shiftallow;

float evilcircleposx;
float evilcircleposy;

boolean square1touch = true;
boolean square2touch = true;
boolean square3touch = true;
boolean square4touch = true;

boolean touchedwall;
color wallcolor = #432B2B;

float hp = 100;
color c1 = color(0, 255, 0);
color c2 = color(255, 0, 0);
color barcolor;
float healthbarlength = 200;
float amt;
boolean overburn = true;


void setup() {

  size(1200, 800);

  noStroke();
  stage = 4;
  killlaserposx2 = 540;
  killlaserposx3 = 890;
  evilcircleposx = 400;
  evilcircleposy = 400;

}
void draw() {

  background(255);
  fill(0);
  

  textSize(20);
  text(hp, 380, 270);
  fill(255);

  rect(295, 300, 210, 30);
  barcolor = lerpColor(c2, c1, amt);
  amt = map(hp, 0, 100, 0, 1);
  fill(barcolor);
  rect(300, 305, healthbarlength, 20);
  


  

//timer code
 currenttime = millis();
 if(currenttime - lastspawned >= 500){
   playermove = true;
   lastspawned += 500;
 }
//timer code



  if (stage == 0) {
    //starting scene
    //has start button
    fill(#2efe2e);
    rect(500, 350, 200, 100);
    //start button
    
    fill(0);
    stroke(0);
    textSize(25);
    text("start", 550, 400);
    
    //if the ball touches the start button, it moves on to the next stage
    if (circleRect(thingyposx, thingyposy, 20, 500, 350, 200, 100) == true) {
      stage = 1;
      println("worked"); 

    }
  } else if (stage == 1) {
  //if the player is not spawned, it spawns the player at a designated location.
    if (!spawned) {
      thingyposx = 50;
      thingyposy = 400;
      playermove =false;
      spawned = true;

    }

    //fills the border with red rectangles
    fill(#FF0000);
    rect(0, 0, 1200, 300);

    rect(0, 500, 1200, 300);
    //prints the location of the ball
    println(thingyposx, " ", thingyposy);

    //kills the player
    if (circleRect(thingyposx, thingyposy, 20, 0, 0, 1200, 300) == true || circleRect(thingyposx, thingyposy, 20, 0, 500, 1200, 300) == true) {
      spawned = false;
      deaths++;
    }
    
    //rectangle and function to move the player to next stage
    fill(#2efe2e);
    rect(1100, 350, 100, 100);
    if (circleRect(thingyposx, thingyposy, 20, 1100, 350, 100, 100) == true) {
      stage = 2;
      println("worked");
    }
    
   
    
  } 
  
  
  else if (stage == 2) {
//spawns player stage 2
    if (!spawned) {
      thingyposx = 50;
      thingyposy = 50;
      playermove = false;
      spawned = true;
    }
    
    
    //makes the kill rects
    fill(#FF0000);
    rect(100, 0, 500, 400);

    rect(0, 500, 300, 300);
    rect(400, 500, 800, 300);
    rect(400, 500, 800, 300);
    rect(750, 100, 800, 400);
    
    
    //green square for end
    fill(#2efe2e);
    rect(1100, 0, 100, 100);
    
    //blue square for star
    fill(#110AFA);
        rect(300, 720, 100, 100);
   // println(mouseX, " ", mouseY);
    
    
    //function to kill the player when the player touches the kill rect
        if (circleRect(thingyposx, thingyposy, 20, 100,0,500,400) == true || circleRect(thingyposx, thingyposy, 20, 0,500,300,300)
        || circleRect(thingyposx, thingyposy, 20, 400,500,800,300)|| circleRect(thingyposx, thingyposy, 20, 400,500,800,300) 
        || circleRect(thingyposx, thingyposy, 20, 750,100,800,400)== true) {
      spawned = false;
      deaths++;
      startemp = 0;
    }
    //function to add a star to the player when the player touches the blue square
                if (circleRect(thingyposx, thingyposy, 20, 300, 720, 100, 100) == true) {

       startemp = 1;
      println("star added");
    }
    
    //moves the player to the next stage, cashes out the star.
        if (circleRect(thingyposx, thingyposy, 20, 1100, 0, 100, 100) == true) {
      stage = 3;
      stars = stars+startemp;
      startemp = 0;
      spawned = false;
      println(stars);
    }

    
    
  } else if (stage == 3) {
    
    //spawns the player if not spawned
    if (!spawned) {
      thingyposx = 50;
      thingyposy = 400;
      playermove = false;
      spawned = true;
    }
    //this will be a color detection level , the ball will not be able to enter the dark blue sector
    
    //makes the dark blue squares
    fill(#432B2B);
    rect(150,0,1200,300);
    rect(150,500,1200,300);
    
    //makes the white sector to allow player movement
    fill(255);
    rect(400,300,-100,-100);
    rect(400,500,-100,100);
    rect(700,300,-100,-100);
    rect(700,500,-100,100);
    rect(1000,300,-100,-100);
    rect(1000,500,-100,100);
    
    //green next level
        fill(#2efe2e);
    rect(1100, 350, 100, 100);
    
    //kill lasers
    fill(#FF0303);
    killlaserposy = 300;
    rect(killlaserposx,killlaserposy,10,200);
    rect(killlaserposx2,killlaserposy,10,200);
    rect(killlaserposx3,killlaserposy,10,200);
    //function for kill lasers goes here
    
    killlaserposx--;
    
    if(killlaserposx<320){
      killlaserposx = 1100;
    }
        killlaserposx2--;
    
    if(killlaserposx2<320){
      killlaserposx2 = 1100;
    }
    
        killlaserposx3--;
    
    if(killlaserposx3<320){
      killlaserposx3 = 1100;
    }
    
    if(wallcolor == get(int(thingyposx),int(thingyposy))){
            spawned = false;
      deaths++;
      startemp = 0;
    }
    
    

            if (circleRect(thingyposx, thingyposy, 5, killlaserposx,killlaserposy,10,200) == true || circleRect(thingyposx, thingyposy, 5, killlaserposx2,killlaserposy,10,200)
        || circleRect(thingyposx, thingyposy, 5, killlaserposx3,killlaserposy,10,200)) {
      spawned = false;
      deaths++;
      startemp = 0;
    }
    
            if (circleRect(thingyposx, thingyposy, 20, 1100, 350, 100, 100) == true) {
      stage = 4;
      stars = stars+startemp;
      startemp = 0;
      spawned = false;
      println(stars);
    }
    
    
    //other future stages here
    
  } else if (stage == 4) {

      //spawns the player if not spawned
    if (!spawned) {
      thingyposx = 600;
      thingyposy = 400;
      playermove = false;
      spawned = true;

      
    }
    

            fill(#110AFA);
    if(square1touch==true){
    rect(0, 0, 100, 100);
    }
    if(square2touch==true){
        rect(1100, 700, 100, 100);
    }
    if(square3touch==true){
    rect(1100, 0, 100, 100);
    }
    if(square4touch==true){
          rect(0, 700, 100, 100);  
    }
          
         fill(#432B2B);
    triangle(180,150, 180,450, 450,150);
    triangle(1000,650, 1000,350, 650,650);
        triangle(1000,100, 1000,300, 500,150);
    triangle(100,690, 100,500, 615,690);
    rect(380,0,240,120);
    println(mouseX,mouseY);
    
    
    float evilcirclespeed = 3;
    //makes a bot
    fill(#B20B0B);
    circle(evilcircleposx,evilcircleposy, 40);
   if(evilcircleposx>thingyposx){
    evilcircleposx = evilcircleposx - evilcirclespeed;
   } else{
    evilcircleposx = evilcircleposx + evilcirclespeed;
   }
    if(evilcircleposy>thingyposy){
     evilcircleposy = evilcircleposy - evilcirclespeed; 
    }else{
     evilcircleposy = evilcircleposy + evilcirclespeed; 
    }
    
    
    if(square1touch == true){
     if( circleRect(thingyposx, thingyposy, 20, 0, 0, 100, 100) == true){
      square1touch = false;
      startemp++;
            println("star added");
      fill(255);
      rect(0,0,100,100);
     }
      
    }
        if(square2touch == true){
     if( circleRect(thingyposx, thingyposy, 20,1100, 700, 100, 100) == true){
      square2touch = false;
      startemp++;
            println("star added");
      fill(255);
      rect(1100, 700, 100, 100);
     }
      
    }
            if(square3touch == true){
     if( circleRect(thingyposx, thingyposy, 20,1100, 0, 100, 100) == true){
      square3touch = false;
      startemp++;
            println("star added");
      fill(255);
      rect(1100, 0, 100, 100);
     }
      
    }
    
                if(square4touch == true){
     if( circleRect(thingyposx, thingyposy, 20,0, 700, 100, 100) == true){
      square4touch = false;
      startemp++;
            println("star added");
      fill(255);
      rect(0, 700, 100, 100);
     }
      
    }
        if(wallcolor == get(int(thingyposx),int(thingyposy))){
            spawned = false;
      deaths++;
      startemp = 0;
            square1touch=true;
      square2touch=true;
      square3touch=true;
      square4touch=true;
    }
    
    
    if(startemp == 4){
      fill(#2efe2e);
      rect(550,350,100,100);
                  if (circleRect(thingyposx, thingyposy, 20,550,350,100,100) == true) {
      stage = 5;
      stars = stars+startemp;
      startemp = 0;
      spawned = false;
      println(stars);
    }
    }
    
  } else if (stage == 5) {
    //Frigreetingly goodbye
  } else if (stage == 6) {
    //Not Frigreetingly goodbye
  } else if (stage == 7) {
    //Neutral goodbye
  }
  
  
  
  
  //stats menu
    noStroke();
  fill(#34D32D);
  rect(400,0,200,100);
  fill(0);
  textSize(25);
  text("Stars: " + (stars+ startemp), 410,30);
    text("Deaths: " + (deaths), 410,60);
  text("Stage:" + (stage), 410, 90);

//spawns the circle
  circle(thingyposx, thingyposy, 20);
    customPress(); // calls the custompress function

}
