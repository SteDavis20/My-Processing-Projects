class Snake {
  
  final int ORIGINAL_SIZE = 10;
  final int START_X_POSITION = (WIDTH/2);
  final int START_Y_POSITION = (HEIGHT/2);
  final int SNAKE_WIDTH = 10;
  final int SNAKE_HEIGHT = 10;
  final int SNAKE_COLOUR = #91FC99;
  
  int xDirection = 0;
  int yDirection = 0;
  boolean elongate;
  boolean isMoving;        // without this the snake becomes 1 point if we don't press UP, DOWN, LEFT or RIGHT
  boolean isDead;
    
  ArrayList<Integer> xPoints;
  ArrayList<Integer> yPoints;
  
  public Snake() {
    xDirection = 0;
    yDirection = 0;
    elongate = false;
    xPoints = new ArrayList<Integer>();
    yPoints = new ArrayList<Integer>();
    xPoints.add(START_X_POSITION);
    yPoints.add(START_Y_POSITION);
    for(int i=1; i<ORIGINAL_SIZE; i++) {
      xPoints.add(xPoints.get(i-1)-SNAKE_WIDTH);
      yPoints.add(START_Y_POSITION);
    }
    isDead = false;
  }
  
  void moveSnake() {
    int newHeadXCoordinate = (xPoints.get(0) + getXDirection()*SNAKE_WIDTH);
    int newHeadYCoordinate = (yPoints.get(0) + getYDirection()*SNAKE_HEIGHT);
    int tailXCoordinate = (xPoints.get(xPoints.size()-1));
    int tailYCoordinate = (xPoints.get(xPoints.size()-1));
    
    // Every points becomes the point that was in front of it - Hence, for loop is backwards
    for(int i=xPoints.size()-1; i>=1; i--) {   // i>=1 because we cannot access index 0-1, i.e. index -1 doesn't exist.
      xPoints.set(i, xPoints.get(i-1));
      yPoints.set(i, yPoints.get(i-1));
    }  
    xPoints.set(0, newHeadXCoordinate);
    yPoints.set(0, newHeadYCoordinate);    // Have to set LAST because otherwise the point after the head is lost because xPoints.get(i-1) when i=1 will equal the head...
    if(elongate==true) {
      xPoints.add(tailXCoordinate);
      yPoints.add(tailYCoordinate);
      elongate=false;
    }
  }

  void checkBoundaries() {
    if((xPoints.get(0))<=0 || (xPoints.get(0)+SNAKE_WIDTH)>=WIDTH || yPoints.get(0)<=0 || (yPoints.get(0)+SNAKE_HEIGHT)>=HEIGHT) {
      isDead=true;
    }
  }
  
  void checkSnakeCollision() {
    for(int i=1; i<=xPoints.size()-1; i++) {
      if((xPoints.get(0)+1<= (xPoints.get(i)+SNAKE_WIDTH)) && (xPoints.get(0)+SNAKE_WIDTH-1 >= xPoints.get(i)) && (yPoints.get(0)+1<=(yPoints.get(i)+SNAKE_HEIGHT)) 
          && ((yPoints.get(0) + SNAKE_HEIGHT-1)>=yPoints.get(i))) {      // -1 is included because otherwise the adjacent body parts "eat" each other.
        isDead=true;  
        break;      // no need to check the rest of the snake's body, once snake eats itself at a single point, it is dead.
      }
    }
  }
  
  public int getSnakeHeadXCoordinate() {
    return xPoints.get(0);
  }
  
  public int getSnakeHeadYCoordinate() {
    return yPoints.get(0);
  }
  
  public int getXDirection() {
    return xDirection;  
  }
  
  public int getYDirection() {
    return yDirection;  
  }
  
  public void setXDirection(int direction) {
    xDirection = direction;  
  }
  
  public void setYDirection(int direction) {
    yDirection = direction;
  }
  
  void draw() {
    fill(SNAKE_COLOUR);        // green
    for(int i=0; i<xPoints.size(); i++) {
      rect(xPoints.get(i), yPoints.get(i), SNAKE_WIDTH, SNAKE_HEIGHT);
    }
  } 
}
