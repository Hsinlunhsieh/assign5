class Ball{

 // properties
 float x;
 float y;
 float xSpeed;
 float ySpeed;
 float size;
 int life =3;
 boolean die = false;

 // methods
 void display(){
   fill(255);
   ellipse(x,y,size,size);
 }
 // constructor
 Ball(){
 x = bar.x;
 y = 460;
 xSpeed = random(-5,5);
 ySpeed = 8;
 size =10; 
 }
 
 //constructor II
/* Ball(float size, float speed){
 a=random(255);
 b=random(255);
 c=random(255);
 x = random(width);
 y = random(height);
 xSpeed = speed;
 ySpeed = size;
 this.size = size; 
 }*/
 void move(){
 x += xSpeed;
 y -= ySpeed; 
 
 if (x<size/2 || x>width-size/2){
   xSpeed *=-1;
    
 }
 if (y<size/2 || y>height-size/2){
   ySpeed *=-1;

 }


    float bottom = y+size/2;
    float bl = bar.y - 10/2;
    float bLeft = bar.x-bar.length/2;
    float bRight = bar.x+bar.length/2;
    if (bottom >= bl && x>bLeft && x<bRight){
        ySpeed *= -1;
        y = bl;
    }
 }
 
 
 
   boolean isHit(
        float circleX,
        float circleY,
        float radius,
        float rectangleX,
        float rectangleY,
        float rectangleWidth,
        float rectangleHeight)
  {
      float circleDistanceX = abs(circleX - rectangleX);
      float circleDistanceY = abs(circleY - rectangleY);
   
      if (circleDistanceX > (rectangleWidth/2 + radius)) { return false; }
      if (circleDistanceY > (rectangleHeight/2 + radius)) { return false; }
   
      if (circleDistanceX <= (rectangleWidth/2)) { return true; }
      if (circleDistanceY <= (rectangleHeight/2)) { return true; }
   
      float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
                           pow(circleDistanceY - rectangleHeight/2, 2);
   
      return (cornerDistance_sq <= pow(radius,2));
  }
 }
 
 
