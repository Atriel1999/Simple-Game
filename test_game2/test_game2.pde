int starCount = 200;
float[][] star = new float[starCount][2];

float[][] AsteroidXY = new float[5][2];
float[] AsteroidSize = new float[5];
int k=0;

int emergeGauge = 0;
int emergeRate = 10;

int Point =0;
int Life =3;

boolean start = false;
boolean gamestart = false;


void setup(){
  size(800,800);
  frameRate(60);
  for(int i=0; i<starCount; i++){
    star[i][0]=random(width);
    star[i][1]=random(height);
  }
  
  for(int i=0; i<5; i++){
     AsteroidSize[i]=0; 
  }
}
 
 
 
 
void draw(){
  //background
  background(0);
  for(int j=0; j<starCount; j++){
    drawStar();
  }
  
  //draw Point
  fill(255,0,0);
  textSize(20);
  text("Point "+ Point,7,20);
  
  //draw Life
  text("Life "+ Life,730,20);
  
  //Game Start!!
  if(start == false){
    textSize(50);
    text("Game Start",270,400);
    textSize(30);
    text("Press Mouse to Start",260,500);
     if(mouseButton==LEFT){
       start = true;
       gamestart = true;
     }
  }
    
    
  //draw Asteroid
  if(gamestart == true)
    emergeGauge++;
  if(emergeGauge >= emergeRate){
      Asteroid();
      emergeGauge=0;
      
      if(emergeRate>5)
        emergeRate=emergeRate-1;
  }
  
  for(int i=0; i<5; i++){
    fill(0,255,255);
    ellipse(AsteroidXY[i][0],AsteroidXY[i][1],AsteroidSize[i], AsteroidSize[i]);
   
    if(AsteroidSize[i]!=0)
      AsteroidSize[i] = AsteroidSize[i]+10;
    
    if(AsteroidSize[i] >= 100){
      AsteroidSize[i]=0;
      Boom(AsteroidXY[i][0],AsteroidXY[i][1]);
      Life--;
    }
  }
  
  for(int i=0; i<5; i++){
    if(mouseButton==LEFT&&dist(mouseX,mouseY,AsteroidXY[i][0],
      AsteroidXY[i][1])<=AsteroidSize[i]+20){
         AsteroidSize[i]=0;
         Point +=100;
    }
  
  }
  
  if(Life == 0){
    gamestart =false;
    textSize(50);
    text("Game Over",290,400);
    textSize(30);
    text("Press Mouse to Restart",260,500);
    if(mouseButton==LEFT){
     gamestart =true;
     Life = 3;
     Point = 0;
    }
    
    for(int i=0; i<5;i++){
     AsteroidSize[i] =0;
    }
    
  }
}

void Asteroid(){
  AsteroidXY[k][0]=random(width);
  AsteroidXY[k][1]=random(height);
  AsteroidSize[k] = 10;
  if(k==4)
    k=0;
  else if(k<4)
    k++;
}

void drawStar(){
    fill(255,255,0);
    for(int i=0;i<starCount;i++)
      ellipse(star[i][0],star[i][1],5,5);
}

void Boom(float x, float y){
  textSize(25);
  fill(255,100,100);
  text("Boom!",x-35,y+8);
}
