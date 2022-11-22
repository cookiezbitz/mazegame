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
float killlaserposy;


void setup() {

  size(1200, 800);

  noStroke();
  stage = 2;

}
void draw() {

  background(255);
  fill(0);

//spawns the circle
  circle(thingyposx, thingyposy, 20);
    customPress(); // calls the custompress function
  

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
    
    //blue square for start
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
    
    rect(killlaserposx,killlaserposy,100,10);
    //function for kill lasers goes here
    
    for(int i=1100;i<300;i--){
      killlaserposx = i;
      if(i<320){
       i = 1100; 
      }
      
    }
    
    
    
    //other future stages here
    
  } else if (stage == 4) {
    //asked for money
    //this is a goodbye option
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


}
