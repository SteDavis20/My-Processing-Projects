final int WIDTH = 600;
final int HEIGHT = 500;

Brick brick;
Paddle paddle;
Ball ball;

void settings() {
  size(WIDTH, HEIGHT);
}

void setup() {
  background(0);
  frameRate(300);
  paddle = new Paddle();
  ball = new Ball();
  brick = new Brick();
}

void draw() {
  background(0);
  paddle.draw();
  ball.draw();
  brick.draw();
  if(ball.pauseGame==false && paddle.gameOver==false) {
    ball.moveBall();
    ball.checkBoundaries(paddle);
    paddle.checkCollision(ball);
    brick.moveBricks();
    brick.checkBoundaries();
    fill(255);
    text("Score: "+ball.score, 20, HEIGHT - 20);
    textSize(15);
  }
  else if(ball.pauseGame==true) {
    fill(255);
    text("Click to continue!", (WIDTH/2)-60, (HEIGHT/2)-10);
    textSize(15);  
  }
  if(paddle.gameOver==true) {
    fill(#F54545);          // red
    text("Game Over! ", (WIDTH/2)-30, (HEIGHT/2));  
    textSize(15);
    text("Score: "+ball.score, (WIDTH/2)-30, (HEIGHT/2)+30);  
    textSize(15);
  }
}

void keyPressed() {
  if(ball.pauseGame==false && paddle.gameOver==false) {
    if(key==CODED) { 
      if(keyCode==LEFT) {
        paddle.xPosition = paddle.xPosition - 15;
      }
      else if(keyCode==RIGHT) {
        paddle.xPosition = paddle.xPosition + 15;
      }
    }
  }
}

void mousePressed() {
  ball.pauseGame=false;  
}
