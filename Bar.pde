class Bar{

 float x;
 float y;
 float length;
 float thickness;
  
 void move(){
  x = mouseX;
  
 }
 void display(){
  fill(255);
  rectMode(CENTER);
  rect(x,y,length,thickness);
  
 }
  
 Bar(float length){
   x= width/2;
   y= height-10;
   this.length = length;
   thickness = 10;
 }  
  
   
 }
