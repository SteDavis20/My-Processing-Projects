class Pipe {
  
  int xPosition;
  int yPosition;
  int heightt;      // mispelled deliberately because "height" is a keyword
  int xPositionAdjuster = -5;
  int gap = 100;    // space for the bird to jump through
  boolean gonePast;
  
  ArrayList<Pipe> pipes;
  
  public Pipe() {
    pipes = new ArrayList<Pipe>(0);  
  }
  
  public Pipe(int xPos, int yPos, int heighttt) {
    xPosition = xPos;
    yPosition = yPos;
    heightt = heighttt;        // again, mispelled deliberately due to "height" being a keyword
    gonePast=false;
  }
  
  void addPipe() {
    if(pipes.size()==0) {
      int height1 = (int) random(HEIGHT - 50 - gap);  
      int height2 = (int) random(HEIGHT - height1 - gap);
      Pipe p1 = new Pipe(FIRST_PIPE_X_POSITION, 0, height1);
      Pipe p2 = new Pipe(FIRST_PIPE_X_POSITION, HEIGHT-height2, height2);
      pipes.add(p1);
      pipes.add(p2);
    }
    
    else {
      int height3 = (int) random(HEIGHT - 50 - gap);  
      int height4 = (int) random(HEIGHT - height3 - gap);
      Pipe lastPipe = pipes.get(pipes.size()-1);
      Pipe p3 = new Pipe(lastPipe.xPosition + 300, 0, height3);
      Pipe p4 = new Pipe(lastPipe.xPosition + 300, HEIGHT-height4, height4);
      pipes.add(p3);
      pipes.add(p4);
    }
  }
  
  void checkCollision(Bird b) {
    for(Pipe p : pipes) {
        if((b.xPosition+BIRD_WIDTH>=p.xPosition) && (b.xPosition<=p.xPosition+PIPE_WIDTH) && 
            (b.yPosition+BIRD_HEIGHT>=p.yPosition) && (b.yPosition<=p.yPosition+p.heightt)) {
         // b.alive=false;
          fill(255);
          text("Game Over!", (WIDTH/2), (HEIGHT/2));
          textSize(30);
          fill(255);
          text("Score: "+b.score, (WIDTH/2), (HEIGHT/2)+50);
          textSize(30);
        }
    }
  }
  
  void movePipes() {
    for(Pipe p : pipes) {
      p.xPosition+=p.xPositionAdjuster;
    }
  }
  
  //void removePipes() {
  //  for(Pipe p : pipes) {
  //    if(p.xPosition+PIPE_WIDTH<=0) {
  //      pipes.remove(p);    
  //    }
  //  }
  //}            CAUSES A CONCURRENT MODIFICATION EXCEPTION???
  
  void draw() {
     fill(LIGHT_GREEN);
     for(Pipe p : pipes) {
       rect(p.xPosition, p.yPosition, PIPE_WIDTH, p.heightt);  
     }
  }
  
  
}
