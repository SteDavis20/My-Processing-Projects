class Bird {
  
  int xPosition;
  int yPosition;
  int score;
  boolean alive;
  
  public Bird(int xPos, int yPos) {
    xPosition = xPos;
    yPosition = yPos;
    score=0;
    alive=true;
  }
  
  public void adjustScore(Pipe pipe) {
    for(Pipe p : pipe.pipes) {  
      if((xPosition+BIRD_WIDTH)>=(p.xPosition+PIPE_WIDTH) && p.gonePast==false) {
        score++;
        p.gonePast=true;
      }
    }
    if(score>=2) {
      score/=2;    
    }
  }
  
  public void move(Pipe p) {
    yPosition+=6;
   // xPosition+=p.xPositionAdjuster;
  }
  
  void draw() {  
    fill(RED); 
    rect(xPosition, yPosition, BIRD_WIDTH, BIRD_HEIGHT);
  }
  
}
