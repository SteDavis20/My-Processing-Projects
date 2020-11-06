class Food {
    
  final int FOODWIDTH = 10;
  final int FOODHEIGHT = 10;
  int xPosition;
  int yPosition;
  int score;
  boolean beenEaten=false;
  
  public Food() {  
    score=0;
    createFood();
  }
  
  void createFood() {
      xPosition = (int) random((WIDTH)-FOODWIDTH);
      yPosition = (int) random((HEIGHT-FOODHEIGHT));
      beenEaten=false;
  }
  
  void checkFoodCollision(Snake snake) {
    int snakeXCoordinate = snake.getSnakeHeadXCoordinate();
    int snakeYCoordinate = snake.getSnakeHeadYCoordinate();
    // snake moves from left to right
    if((snakeXCoordinate+snake.SNAKE_WIDTH>=xPosition) && (snakeXCoordinate<=xPosition+FOODWIDTH) && (snakeYCoordinate+snake.SNAKE_HEIGHT
          >=yPosition) && (snakeYCoordinate<=yPosition+FOODHEIGHT)) {
      beenEaten=true;
    }
    // snake moves from right to left
    else if((snakeXCoordinate+snake.SNAKE_WIDTH)>=(xPosition) && (snakeXCoordinate<=xPosition+FOODWIDTH) && (snakeYCoordinate+snake.SNAKE_HEIGHT
          >=yPosition) && (snakeYCoordinate<=yPosition-FOODHEIGHT)) {
      beenEaten=true;
    }
    if(beenEaten==true) {
      score++;
      createFood();              // this will give the food a new random x and y coordinate
      snake.elongate=true;
    }
  }
  
 void draw() {
   fill(#FAFF6A);              // yellow
   rect(xPosition, yPosition, FOODWIDTH, FOODHEIGHT);
 }
}
