class Limb {
  
  int xPos;
  int yPos;
  
  Integer[] limbs;
  
  public Limb() {
   // xPos = x;
   // yPos = y;
    limbs = new Integer[20];
    populateLimbs();
  }
  
  void populateLimbs() {                               //     O
    int bodyTopX = (WIDTH/2);                          //    \|/
    int bodyTopY = (HEIGHT/2);                         //     |
    limbs[0] = bodyTopX;
    limbs[1] = bodyTopY;
    
    int bodyBottomX = bodyTopX;
    int bodyBottomY = (HEIGHT/2) + 50;
    limbs[2] = bodyBottomX;
    limbs[3] = bodyBottomY;
    
    int upLeftArmBottomX = bodyTopX;                     //    / \
    int upLeftArmBottomY = bodyTopY - 25;
    limbs[4] = upLeftArmBottomX;
    limbs[5] = upLeftArmBottomY;
    
    int upLeftArmTopX = upLeftArmBottomX - 30; 
    int upLeftArmTopY = upLeftArmBottomY - 30;
    limbs[6] = upLeftArmTopX;
    limbs[7] = upLeftArmTopY;
    
    int upRightArmBottomX = upLeftArmBottomX;
    int upRightArmBottomY = upLeftArmBottomY;
    limbs[8] = upRightArmBottomX;
    limbs[9] = upRightArmBottomY;    
    
    
    int upRightArmTopX = upRightArmBottomX + 30;
    int upRightArmTopY = upRightArmBottomY - 30;
    limbs[10] = upRightArmTopX;
    limbs[11] = upRightArmTopY;
    
    int downLeftArmTopX = bodyBottomX;
    int downLeftArmTopY = bodyBottomY;
    limbs[12] = downLeftArmTopX;
    limbs[13] = downLeftArmTopY;
    
    
    int downLeftArmBottomX = upLeftArmTopX;
    int downLeftArmBottomY = bodyBottomY+30;
    limbs[14] = downLeftArmBottomX;
    limbs[15] = downLeftArmBottomY;
    
    int downRightArmTopX = downLeftArmTopX;
    int downRightArmTopY = downLeftArmTopY;    
    limbs[16] = downRightArmTopX;
    limbs[17] = downRightArmTopY;
    
    int downRightArmBottomX = upRightArmTopX;
    int downRightArmBottomY = downRightArmTopY+30;
    limbs[18] = downRightArmBottomX;
    limbs[19] = downRightArmBottomY;
  }
  
  
  
  
  void draw() {
    
  }
  
  
  
  
  
}
