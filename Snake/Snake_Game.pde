final int WIDTH = 800;
final int HEIGHT = 500;

Snake snake;
Food food;

void settings() {
  size(WIDTH,HEIGHT);
}

void setup() {
  background(0);
  snake = new Snake();
  food = new Food();
  frameRate(10);
}

void draw() {
  background(0);
  snake.draw();
  if(food.beenEaten==false) {
    food.draw();
  }
  if (snake.isMoving==true && snake.isDead==false && food.beenEaten==false){
    snake.moveSnake();
    snake.checkBoundaries();
    snake.checkSnakeCollision();
    food.checkFoodCollision(snake);
  }
  if(snake.isDead==true) {
      fill(#E85052);            // red 
      text("Game Over!", (WIDTH/2)-50, (HEIGHT/2)-25);
      text("Score: "+food.score, (WIDTH/2)-50, (HEIGHT/2)+25);
      textSize(15);
  }
}

void keyPressed() {
  if(keyCode==UP || keyCode==DOWN ||keyCode==RIGHT) { 
    snake.isMoving=true;
  }
  if(key==CODED){
    if(keyCode==UP && (snake.getYDirection()!=1)) {
      snake.setXDirection(0);
      snake.setYDirection(-1);
    }
    else if(keyCode==DOWN && (snake.getYDirection()!=-1)) {
      snake.setXDirection(0);
      snake.setYDirection(1);
    }
    else if(keyCode==LEFT && (snake.getXDirection()!=1)) {
      snake.setXDirection(-1);
      snake.setYDirection(0);
    }
    else if(keyCode==RIGHT && (snake.getXDirection()!=-1)) {
      snake.setXDirection(1);
      snake.setYDirection(0);
    }
  }
}
