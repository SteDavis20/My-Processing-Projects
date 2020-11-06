final color paddleColour = #F97CFA;
final int PADDLEWIDTH = 50;
final int PADDLEHEIGHT = 10;

class Paddle {
  int xPosition = (WIDTH/2) - PADDLEWIDTH;
  int yPosition = HEIGHT - 30;
  boolean gameOver = false;
  
  public void checkCollision(Ball ball) {
    if(ball.xPosition+(BALLWIDTH/2)>=xPosition && (ball.xPosition-(BALLWIDTH/2)<=xPosition+PADDLEWIDTH) && (ball.yPosition+(BALLHEIGHT/2)>=yPosition)
        && (ball.yPosition+(BALLHEIGHT/2)>=yPosition+2)) {
      ball.yDirection*=-1;  
    }
  }
  
  void draw() {
    fill(paddleColour);      // pink
    rect(xPosition, yPosition, PADDLEWIDTH, PADDLEHEIGHT);  
  } 
}
