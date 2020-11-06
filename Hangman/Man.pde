class Man {
  
  int livesLeft;
  boolean drawNextLimb;
  int limbIndex;
  boolean decreaseLives;
  
  public Man() {
    livesLeft = 6;
    drawNextLimb = false;
    limbIndex=0;
    decreaseLives=false;
  }
  
  void checkGuess() {
    
  }
  
  void checkGameOver(Word word) {
    if(livesLeft<=0) {
      fill(0);
      text("Game Over!", (WIDTH/2)-100, (HEIGHT/2)-100);
      textSize(20);
      fill(0);
      text("Answer: ",(WIDTH/2)-100, (HEIGHT/2)-50);
      int incrementer = 15;
      for(Letter_In_Answer l : word.answer) {
         fill(0);
         text(""+l.letter,(WIDTH/2)-30+incrementer, (HEIGHT/2)-50);      // prints out memory address, need to print out actual word/answer
         textSize(20);
         incrementer+=15;
      }
    }
  }
  
  void draw(Limb l) {
    fill(255);
    rect(BOX_X_POSITION, BOX_Y_POSITION, BOX_WIDTH, BOX_HEIGHT);
    line(BOX_X_POSITION+(BOX_WIDTH/2), BOX_Y_POSITION, BOX_X_POSITION+(BOX_WIDTH/2), HEAD_Y_CENTER-(HEAD_WIDTH/2)-20);
    line(BOX_X_POSITION+(BOX_WIDTH/2), HEAD_Y_CENTER-(HEAD_WIDTH/2)-20, HEAD_X_CENTER, HEAD_Y_CENTER-(HEAD_WIDTH/2)-20);
    line(HEAD_X_CENTER, HEAD_Y_CENTER-(HEAD_WIDTH/2)-20, HEAD_X_CENTER, HEAD_Y_CENTER-(HEAD_WIDTH/2));
    switch (limbIndex) {
    case 1: 
      ellipse(HEAD_X_CENTER, HEAD_Y_CENTER, HEAD_WIDTH, HEAD_WIDTH);      // fix later
      break;
    case 2: 
      ellipse(HEAD_X_CENTER, HEAD_Y_CENTER, HEAD_WIDTH, HEAD_WIDTH);      // fix later
      line(HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2), HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2)+BODY_LENGTH);
      break;
    case 3: 
      ellipse(HEAD_X_CENTER, HEAD_Y_CENTER, HEAD_WIDTH, HEAD_WIDTH);      // fix later
      line(HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2), HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2)+BODY_LENGTH);
      line(HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2)+(BODY_LENGTH/2), HEAD_X_CENTER-(BODY_LENGTH/2), HEAD_Y_CENTER+(HEAD_WIDTH/2)+(BODY_LENGTH/4));
      break;
    case 4: 
      ellipse(HEAD_X_CENTER, HEAD_Y_CENTER, HEAD_WIDTH, HEAD_WIDTH);      // fix later
      line(HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2), HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2)+BODY_LENGTH);
      line(HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2)+(BODY_LENGTH/2), HEAD_X_CENTER-(BODY_LENGTH/2), HEAD_Y_CENTER+(HEAD_WIDTH/2)+(BODY_LENGTH/4));
      line(HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2)+(BODY_LENGTH/2), HEAD_X_CENTER+(BODY_LENGTH/2), HEAD_Y_CENTER+(HEAD_WIDTH/2)+(BODY_LENGTH/4));
      break;
    case 5: 
      ellipse(HEAD_X_CENTER, HEAD_Y_CENTER, HEAD_WIDTH, HEAD_WIDTH);      // fix later
      line(HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2), HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2)+BODY_LENGTH);
      line(HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2)+(BODY_LENGTH/2), HEAD_X_CENTER-(BODY_LENGTH/2), HEAD_Y_CENTER+(HEAD_WIDTH/2)+(BODY_LENGTH/4));
      line(HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2)+(BODY_LENGTH/2), HEAD_X_CENTER+(BODY_LENGTH/2), HEAD_Y_CENTER+(HEAD_WIDTH/2)+(BODY_LENGTH/4));
      line(HEAD_X_CENTER, (HEAD_Y_CENTER+(HEAD_WIDTH/2)+BODY_LENGTH), HEAD_X_CENTER-(BODY_LENGTH/2), (HEAD_Y_CENTER+(HEAD_WIDTH/2)+BODY_LENGTH)+(BODY_LENGTH/2));
      break;
    case 6: 
      ellipse(HEAD_X_CENTER, HEAD_Y_CENTER, HEAD_WIDTH, HEAD_WIDTH);      // fix later
      line(HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2), HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2)+BODY_LENGTH);
      line(HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2)+(BODY_LENGTH/2), HEAD_X_CENTER-(BODY_LENGTH/2), HEAD_Y_CENTER+(HEAD_WIDTH/2)+(BODY_LENGTH/4));
      line(HEAD_X_CENTER, HEAD_Y_CENTER+(HEAD_WIDTH/2)+(BODY_LENGTH/2), HEAD_X_CENTER+(BODY_LENGTH/2), HEAD_Y_CENTER+(HEAD_WIDTH/2)+(BODY_LENGTH/4));
      line(HEAD_X_CENTER, (HEAD_Y_CENTER+(HEAD_WIDTH/2)+BODY_LENGTH), HEAD_X_CENTER-(BODY_LENGTH/2), (HEAD_Y_CENTER+(HEAD_WIDTH/2)+BODY_LENGTH)+(BODY_LENGTH/2));
      line(HEAD_X_CENTER, (HEAD_Y_CENTER+(HEAD_WIDTH/2)+BODY_LENGTH), HEAD_X_CENTER+(BODY_LENGTH/2), (HEAD_Y_CENTER+(HEAD_WIDTH/2)+BODY_LENGTH)+(BODY_LENGTH/2));
      break;
      
    default:
    
    }
    
    //if(drawNextLimb==true) {
    //  fill(0);
    //  line(l.limbs[man.limb], l.limbs[man.limb+1], l.limbs[man.limb+2], l.limbs[man.limb+3]);  
    //}
  }
  
  
  
}
