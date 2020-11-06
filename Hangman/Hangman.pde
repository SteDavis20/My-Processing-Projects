final int WIDTH = 1100;
final int HEIGHT = 900;
final int BUTTON_WIDTH = 50;
final int BUTTON_HEIGHT = 50;
final int CYAN = #03FCF6;
final int YELLOW = #E8FA2B;
final int ALPHABET_SIZE = 26;
final String[] ALPHABET = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
final int GAP_BETWEEN_LETTERS = 50;
final int LETTER_SIZE = 30;
final int HEAD_WIDTH = 20;
final int HEAD_X_CENTER = (WIDTH/2);
final int HEAD_Y_CENTER = (HEIGHT/2);
final int BODY_LENGTH = 60;
final int BOX_WIDTH = 100;
final int BOX_HEIGHT = 30;
final int BOX_X_POSITION = HEAD_X_CENTER-(HEAD_WIDTH/2)-BOX_WIDTH-50;
final int BOX_Y_POSITION = (HEAD_Y_CENTER+(HEAD_WIDTH/2)+BODY_LENGTH)+(BODY_LENGTH/2);

Button button;
Word word;
Man man;
Limb limb;

void settings() {
  size(WIDTH, HEIGHT);
}

void setup() {
  frameRate(60);
  button = new Button();
  word = new Word();
  man = new Man();
  limb = new Limb();      
}

void draw() {
  background(CYAN);
  button.draw();
  button.drawLetters();
  word.draw();
  man.draw(limb);
  man.checkGameOver(word);
}

void mousePressed() {
  if(man.livesLeft>0) {
    button.checkIfPicked(word, man); 
  }
}
