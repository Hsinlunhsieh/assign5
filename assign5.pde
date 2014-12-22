// Declare ball object as a global variable
 Ball ball;
 Bar bar;
 Brick [] brickArray;
 
 
int status;
int point=0;
final int GAME_START   = 0;
final int GAME_PLAYING = 1;
final int GAME_PAUSE   = 2;
final int GAME_WIN     = 3;
final int GAME_LOSE    = 4;

void setup() {
     status = GAME_START;  
     size(640,480);
     bar = new Bar(100);
     ball = new Ball();
     brickArray = new Brick[50];  
     reset();
 }


 void draw() {
 background(0);
   switch(status) {
        case GAME_START:
        /*---------Print Text-------------*/
            textSize(60);
            textAlign(CENTER,CENTER);
            fill(95, 194, 226);
            text("Arkanoid", 320, 240); 
            textSize(20);
            textAlign(CENTER,CENTER);
            fill(95, 194, 226);
            text("Press ENTER to Start",320, 280);       
        /*--------------------------------*/
        break;
        
        case GAME_PLAYING:
            drawBar();
            drawLife();
            drawBrick();
            drawBall();
            checkBrickDead();
            checkWin();
            break;
        
       case GAME_PAUSE:
            textSize(40);
            textAlign(CENTER,CENTER);
            fill(95, 194, 226);
            text("PAUSE", 320, 240); 
            textSize(20);
            textAlign(CENTER,CENTER);
            fill(95, 194, 226);
            text("Press ENTER to Resume",320, 280); 
            break;
    
      case GAME_WIN:
        textSize(40);
        
        fill(95, 194, 226);
        text("YOU WIN", 320, 280);
        break;
    
      case GAME_LOSE:
        textSize(40);
        
        fill(95, 194, 226);
        text("YOU LOSE", 320, 280); 
        break;
      }
    }


void keyPressed() {
  statusCtrl();
}

void mousePressed() { 
 if (mouseButton == RIGHT && ball.die == true) { 
     ball.die = false;
     ball.xSpeed = random(-5,5); 
     ball.ySpeed = 8; 
 }
}


//---------------------------------------------------------//

void brickMaker(int brickNum,int columns) {   
  for(int i =0; i< brickNum; i++){
      int row =int( i / columns);
      int col =int( i % columns);
      int bX = 120 + col*40;
      int bY = 40 + row*40;
      brickArray[i]=new Brick(bX,bY);            
  }
}

void drawBall() { 
   if (ball.die == false) {   
        ball.move();
      }  
    ball.display();     
   
   if (ball.y> height-10) { 
       ball.life--;
       ball.die = true;
       ball.display();
       ball.x=bar.x;
       ball.y=460;
       }
   }

  
  

void drawBar() { 
      bar.display();        
   if (bar.x> width-50) { 
       bar.x=  width-50;           
     } 
    if (bar.x< 50) { 
       bar.x=50;
   } 
}

void mouseMoved() {
     bar.move();
     if (ball.die == true) { 
       ball.x = bar.x;
}
}


void drawBrick() {
  for (int i=0; i<brickArray.length-1; i++) {
    Brick brick = brickArray[i];
    if (brick!=null && !brick.die) { 
      brick.display(); 
    }
  }
}


void drawLife() {
  textSize(20);
  fill(230, 74, 96);
  text("LIFE:",36, 455);  
  /*---------Draw Ball Life---------*/
  for(int i=0;i<ball.life;i++){
    ellipse(78+ i*25,459,15,15);    
    }
  } 
  
  
  
void checkBrickDead() {
    for (int j=0; j<brickArray.length-1; j++) {
      Brick brick = brickArray[j];
      if (!ball.die && brick != null && !brick.die // Check Array isn't empty and b!=ullet / alien still exist
      /*------------Hit detect-------------*/ 
        && ball.isHit(ball.x, ball.y, ball.size/2, brick.bX, brick.bY, brick.bSize, brick.bSize) == true) {
        /*-------do something------*/
        ball.xSpeed *= -1; 
        ball.ySpeed *= -1;
        removeBrick(brick);
        point+=10;
      }
    }
  }


void removeBrick(Brick obj) {
  obj.die = true;
  obj.bX = 1000;
  obj.bY = 1000;
}

void removeBall(Ball obj) {
  obj.die = true;
  obj.x = 1000;
  obj.y = 1000;
}




 void checkWin() {   
   if (point>=400){
   status = GAME_WIN; 
    } 
  
   if (ball.life == 0){
      status = GAME_LOSE;
    }
  }




void reset() {
  for (int i=0; i<brickArray.length-1; i++) {
    brickArray[i] = null;
  }
  point = 0;
  ball.life =3;
  brickMaker(40,10);
  ball.die = true;
  bar.x = mouseX; 
  bar.y = height-10; 
  ball.x = bar.x; 
  ball.y = 460; 

}

void statusCtrl() {
  if (key == ENTER) {
    switch(status) {
    case GAME_START:
      status = GAME_PLAYING;
      break;

    case GAME_PLAYING:
      status = GAME_PAUSE;
      break;
    
    case GAME_PAUSE:
      status = GAME_PLAYING;
      break;
   
    case GAME_WIN:
      status = GAME_PLAYING;
      reset();
      break;   
      
    case GAME_LOSE:
      status = GAME_PLAYING;
      reset();
      break;   
      
    }
  }
}


