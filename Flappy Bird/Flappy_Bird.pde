final int WIDTH = 1200;
final int HEIGHT = 800;
final int BIRD_WIDTH = 20;
final int BIRD_HEIGHT = 20;
final int PIPE_WIDTH = 100;
final int FIRST_PIPE_X_POSITION = (WIDTH/2)+200; 
final int RED = #FF0011;           
final int CYAN = #00FFDB;      
final int LIGHT_GREEN = #D0F5A1;

Bird bird;
Pipe pipe;

void settings() {
  size(WIDTH, HEIGHT);
}

void setup() {
  frameRate(20);
  bird = new Bird((WIDTH/2), (HEIGHT/2));
  pipe = new Pipe();
}

void draw() {
  background (CYAN);
  bird.draw();
  pipe.addPipe();
  pipe.draw();
  if(bird.alive==true) {
    bird.move(pipe);
    pipe.movePipes();
    //pipe.removePipes();
  }
  pipe.checkCollision(bird);
  bird.adjustScore(pipe);
}

void mousePressed() {
  if(bird.alive==true) {
    bird.yPosition-=100;  
  }
  
}
