final int BRICKCOLOUR = #7CFAEA;
final int BRICKWIDTH = 30;
final int BRICKHEIGHT = 30;
final int START_BRICK_POSITION = 5;

class Brick {
 color brickColour = 255; 
 int xPosition;
 int yPosition;
 int xDirection;
 int yDirection;
 int incrementer = 0;
 int count = 0;          // to move bricks down a value = to brickheight when they hit the left or right hand side of the wall
 boolean isBroken = false;
 boolean lineCreated = false;
 Brick[] lineOfBricks; 
 
 public Brick() {
   lineOfBricks = new Brick[15];
   if(lineCreated == false) {
     fillLineWithBricks();
   }
 }
 
 public Brick(int xPos, int yPos) {
   xPosition = xPos;
   yPosition = yPos;
   xDirection = 1;  
   yDirection = 0;
 }
  
 public void fillLineWithBricks() {
   for(int i=0; i<lineOfBricks.length; i++) {
     lineOfBricks[i] = new Brick(START_BRICK_POSITION+incrementer, START_BRICK_POSITION);    
     incrementer+=BRICKWIDTH;
   }
   lineCreated = true;
 }
  
 public void moveBricks() {
   for(int i=0; i<lineOfBricks.length; i++) {
     lineOfBricks[i].xPosition+=lineOfBricks[i].xDirection;
     lineOfBricks[i].yPosition+=lineOfBricks[i].yDirection;
   }
 }
 
 public void checkBoundaries() {
   for(int i=0; i<lineOfBricks.length; i++) {
     // hits RHS
     if(lineOfBricks[i].xPosition+BRICKWIDTH>=WIDTH) {
       if(lineOfBricks[i].count<BRICKHEIGHT) {
         lineOfBricks[i].xDirection=0;
         lineOfBricks[i].yDirection=1;
         lineOfBricks[i].count++;
       }
       else {
         lineOfBricks[i].xDirection=-1;
         lineOfBricks[i].yDirection=0;
         lineOfBricks[i].count=0;
       }
     }
     // hits LHS
     else if(lineOfBricks[i].xPosition<=0) {
       if(lineOfBricks[i].count<BRICKHEIGHT) {
         lineOfBricks[i].xDirection=0;
         lineOfBricks[i].yDirection=1;
         lineOfBricks[i].count++;
       }
       else {
         lineOfBricks[i].xDirection=1;
         lineOfBricks[i].yDirection=0;
         lineOfBricks[i].count=0;
       }
     }
   }
   ball.checkBrickCollision(lineOfBricks);
 }
 
 void draw() {
   for(int i=0; i<lineOfBricks.length; i++) {
     fill(BRICKCOLOUR);            // cyan
     if(lineOfBricks[i].isBroken==false) {
       rect(lineOfBricks[i].xPosition, lineOfBricks[i].yPosition, BRICKWIDTH, BRICKHEIGHT);
     }
   }
 }
}
