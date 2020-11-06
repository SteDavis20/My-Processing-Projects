final color BALLCOLOUR = #FF1A48;
final int BALLWIDTH = 10;
final int BALLHEIGHT = 10;
final int START_BALL_X_POSITION = (WIDTH/2) - BALLWIDTH;
final int START_BALL_Y_POSITION = HEIGHT - 200;
final int START_BALL_X_DIRECTION = 1;
final int START_BALL_Y_DIRECTION = 1;

class Ball {
   int xPosition = START_BALL_X_POSITION;
   float yPosition = START_BALL_Y_POSITION;
   int xDirection;
   float yDirection;
   int score;
   boolean pauseGame = false;
   
   public Ball() {
     xDirection = 1;
     yDirection = -1;
     score = 0;
   }
  
   public void moveBall() {
     xPosition+=xDirection;
     yPosition+=yDirection;
   }
  
   public void checkBoundaries(Paddle p) {
     // hits RHS
     if(xPosition+(BALLWIDTH/2)>=WIDTH) {
       xDirection*=-1;
     }
     // hits LHS
     else if(xPosition-(BALLWIDTH/2)<=0) {
       xDirection*=-1;
     }
     // hits bottom
     else if(yPosition-(BALLHEIGHT/2)>=HEIGHT) {
       fill(#F54545);        // red
       text("Game Over!", (WIDTH/2)-50, (HEIGHT/2));
       textSize(15);
       p.gameOver=true;
     }
     // hits top
     else if(yPosition-(BALLHEIGHT/2)<=0) {
       pauseGame=true;
       xPosition = START_BALL_X_POSITION;
       yPosition = START_BALL_Y_POSITION;
       xDirection = START_BALL_X_DIRECTION;
       yDirection = START_BALL_Y_DIRECTION;
     }
   }
  
  public void checkBrickCollision(Brick[] bricks) {
    for(int i=0; i<bricks.length; i++) {
      if((xPosition+(BALLWIDTH/2)>=bricks[i].xPosition) && (xPosition-(BALLWIDTH/2)<=bricks[i].xPosition+BRICKWIDTH) && 
          (yPosition-(BALLHEIGHT/2)<=bricks[i].yPosition+BRICKHEIGHT) && (yPosition+(BALLHEIGHT/2)>=bricks[i].yPosition) 
            && bricks[i].isBroken==false){
          bricks[i].isBroken=true;
          yDirection*=-1;
          score++;
      }
    }
  }
   
 void draw() {
   fill(BALLCOLOUR);        // red
   ellipse(xPosition, yPosition, BALLWIDTH, BALLHEIGHT);
 } 
}
