Bacteria colony [];
 void setup()   
 { 
   size (300, 300);
   colony = new Bacteria[500];
   for (int i = 0; i < colony.length; i++){
     colony[i] = new Bacteria();
   }
 }   
 void draw()   
 {    
   int jarHeight = 85;
   int jarWidth = 55;
   int x = 6;
   int y = x + 2;
   
   background(0);
   // jar base
   fill(51, 51, 255, 50);
   strokeWeight(5);
   stroke(255);
   ellipse(148, 205, 55, 20);
   noStroke();
   rect(120, 120, jarWidth, jarHeight);
   rect(120 - x/2, 120, jarWidth + x, jarHeight);
   rect(120 - y/2, 120, jarWidth + y, jarHeight);
   rect(120 - x/2, 120, jarWidth - 2, jarHeight + 2);
   strokeWeight(5);
   stroke(255);
   fill(51, 51, 255, 75);
   noStroke();
   ellipse(148, 118, 62, 20);
   ellipse(148, 205, 55, 20);
   //top jar
   strokeWeight(5);
   stroke(255);
   ellipse(147, 115, 50, 20);
   strokeWeight(0.5);
   for (int i = 0; i < colony.length; i++){
     colony[i].show();
     colony[i].move();
     colony[i].finalMove();
   } 
 }  
 class Bacteria   
 {     
   int myX;
   int myY;
   int mySize;
   int myRing;
   int myColor;
   int finalX;
   int finalY;
   boolean zapped;
   Bacteria()
   {
     myX = 150;
     myY = 100;
     mySize = 10;
     myColor = color(255, 255, 0, 90);
     myRing = color(239, 253, 95, 50);
     zapped = false;
     finalX = (int)(Math.random()*50)+125;
     finalY = (int)(Math.random()*75)+125;
   }
   void move(){
     myX = myX + (int)(Math.random()*5)-2;
     myY = myY + (int)(Math.random()*5)-2;
     }
   void finalMove(){
    if (finalY < 200 && finalY > 125){
       if (finalX < 175 && finalX > 125){
         finalX = finalX + (int)(Math.random()*5)-2;
         finalY = finalY + (int)(Math.random()*5)-2;
       }
       else{
           finalX = (int)(Math.random()*50)+125;
           finalY = (int)(Math.random()*75)+125;
         }
       }
     }
   void show(){
    if(dist(mouseX, mouseY, myX, myY) < mySize / 2){
      zapped = true;
    }
    if (zapped == true){
      fill(myColor);
      stroke(myColor);
      ellipse(finalX, finalY, mySize/2, mySize/2);
      fill(myRing);
      stroke(myRing);
      ellipse(finalX, finalY, mySize, mySize);
    }
    if (zapped == false){
    fill(myColor);
    stroke(myColor);
    ellipse(myX, myY, mySize/2, mySize/2);
    fill(myRing);
    stroke(myRing);
    ellipse(myX, myY, mySize, mySize);
    }
   } 
 }    
