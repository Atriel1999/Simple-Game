//11813020 ball game

int Mouse = 0;
boolean start = false;
int Frame =60;

//Circle
int VectorX = 1;
int VectorY = 1;
//float XSpeed = 5;
//float YSpeed = 8;
float x,y;
float accel =0.01;

//Point
float Point = 0;
PFont myFont;
float Pointboost =0.05;

void setup(){
  size(700,1000);
  stroke(0);
  frameRate(Frame);

}

void draw(){
 //background refill
 stroke(0);
 strokeWeight(3);
 rect(0,0,200,1000);
 fill(120,180,255);
 rect(200,0,500,1000);
 
 //Point draw
 fill(50,100,155);
 myFont = loadFont("CalistoMT-Italic-48.vlw");
 textFont(myFont,35);
 text("Point ",63,100);
 text(int(Point),86,150);
 
 
 myFont = loadFont("Dialog.plain-48.vlw");
 
 textFont(myFont,20);
 //draw Writting
 text("Made by 11813020",20, 400);
 text("Howon Finals Exam",15, 460);

 textFont(myFont,32);
 
 
 
 //Message
 if(start == false){
   fill(125,0,250);
   textSize(40);
   text("Press Mouse to Start",250,200);
 }
 
 //Mouse Controller
 strokeWeight(5);
 Mouse = mouseX;
 if(Mouse<=231)
   Mouse = 231;
 else if(Mouse>=670)
   Mouse = 670;
 line(Mouse-30,950,Mouse+30,950);
  
 //(Circle)Moving ball
 fill(255,192,203);
 stroke(0);
 strokeWeight(1);
 if(start == false){
   ellipse(Mouse,940,20,20);
   x=Mouse;
   y=940;
 } else if(start == true){
   ellipse(x,y,20,20);
   x=x+VectorX*7;
   y=y+VectorY*7;
 }
 
 
 
 //if Circle crash to Wall
   if(start ==true){
   if(x<=220){
     VectorX = 1;
     //XSpeed = XSpeed*(1+accel);
     //YSpeed = YSpeed*(1+accel);
     Frame++;
   } else if(x>=680){
     VectorX = -1;
     //XSpeed = XSpeed*(1+accel);
     //YSpeed = YSpeed*(1+accel);
     Frame++;
   } else if(y<=20){
     VectorY = 1;
     //XSpeed = XSpeed*(1+accel);
     //YSpeed = YSpeed*(1+accel);
     Frame++;
   } else if(y>=930&&y<=980&&x<=mouseX+24&&x>=mouseX-24) {
       VectorY = -1; 
       Point = Point+(100*Pointboost);
       Pointboost = Pointboost + 0.05;
       Frame++;
    }
 }
 frameRate(Frame);
 
 //start
 if(mouseButton==LEFT&&start ==false){
   start = true;
   VectorX = (int)random(0,2);
   if(VectorX ==0)
     VectorX = -1;
   VectorY = -1;
 }
 
 //Game Over
 
 if(y>=990&&start == true){
   fill(125,0,250);
   textSize(50);
   text("Game Over",320,200);
   textSize(30);
   text("Press Mouse to Restart",290,250);
   if(mouseButton==LEFT&&start ==true){
     Point = 0;
     Frame = 60;
     start = false;
     text("Press Mouse to Start",250,200);
     delay(300);
   }
 }
}
