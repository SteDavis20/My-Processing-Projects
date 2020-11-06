class Button {
  int xPosition;
  int yPosition;
  boolean chosen;
  String associatedLetter;
  ArrayList<Button> buttons;
  
  public Button() {
    buttons = new ArrayList<Button>();
    createButtons();
  }
  
  public Button(int xPos, int yPos, String letter) {
    xPosition = xPos;
    yPosition = yPos;
    chosen = false;  
    associatedLetter = letter;
  }
  
  void createButtons() {
      int xPos = 40;
      int yPos = 40;
      for(int i=0; i<ALPHABET_SIZE; i++) {
        Button button = new Button(xPos, yPos, ALPHABET[i]);
        buttons.add(button);
        if((xPos+BUTTON_WIDTH) < (WIDTH-40)) {
          xPos+=(BUTTON_WIDTH + 20);    
        }
        else {
          xPos = 40;
          yPos += (BUTTON_HEIGHT + 20);
        }
      }
  }
  
  void drawLetters() {
    for(Button b : buttons) {
      if(b.chosen==false) {
        fill(0);
        text(""+b.associatedLetter, (b.xPosition-7), b.yPosition+7);
        textSize(BUTTON_WIDTH/2);
      }
    }
  }
  
  void checkIfPicked(Word word, Man man) {
    man.decreaseLives=true;
    for(Button b : buttons) {
      if(mouseX>=(b.xPosition-(BUTTON_WIDTH/2)) && mouseX<=(b.xPosition+(BUTTON_WIDTH/2)) 
          && mouseY<=(b.yPosition+(BUTTON_HEIGHT/2)) && mouseY>=(b.yPosition-(BUTTON_HEIGHT/2)) && b.chosen==false) {    // this if statement is for a square though ... FIX!
        b.chosen=true;
        for(Letter_In_Answer l : word.answer) {
          if(b.associatedLetter==l.letter) {
              l.display = true;
              man.drawNextLimb = false;
              man.decreaseLives=false;
              break;
          }
          if(l.display==false) {
              word.isCompleted=false;
          }
        }
        if(word.isCompleted==true && man.livesLeft>0) {
            fill(0);
            text("Winner!", (WIDTH/2)-100, (HEIGHT/2)-100);
            textSize(20);
        }
        if(man.decreaseLives==true && man.livesLeft>0) {
          man.livesLeft--;  
          man.limbIndex++;
        }
      }
    }
  
  }
  
  void draw() {
    fill(YELLOW);
    for(Button b : buttons) {
      if(b.chosen==false) {
        ellipse(b.xPosition, b.yPosition, BUTTON_WIDTH, BUTTON_HEIGHT);
      }
    }
  }
  
  
}
