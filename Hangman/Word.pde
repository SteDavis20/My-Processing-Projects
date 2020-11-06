class Word {
  
  int size;  
  boolean isCompleted;
  ArrayList<Letter_In_Answer> answer;
  
  public Word() {
    size = (int) random(5, 10);
    answer = new ArrayList<Letter_In_Answer>(size);
    createWord();
    isCompleted=false;
  }
  
  void createWord() {
    int xPos = (WIDTH/2)-300;
    int yPos = HEIGHT - 100;
    for(int i=0; i<size; i++) {
      int index = (int) random(ALPHABET_SIZE);
      String letter = ALPHABET[index];
      Letter_In_Answer l = new Letter_In_Answer(letter, xPos, yPos);
      answer.add(l);
      xPos+=(LETTER_SIZE + GAP_BETWEEN_LETTERS);
    }
  }
  
  void draw() {
    for(Letter_In_Answer l : answer) {
      fill(0);
      line((l.xPosition-2), (l.yPosition+2), (l.xPosition+LETTER_SIZE+2), (l.yPosition+2));
      if(l.display==true) {
        fill(0);
        text(""+l.letter,l.xPosition, l.yPosition);
        textSize(LETTER_SIZE);
      }
    }
}
  
}
