int x, y, w, h, speedX, speedY;
int paddleXL, paddleYL, paddleW, paddleH, paddleS;
int paddleXR, paddleYR;
boolean upL, downL;
boolean upR, downR;
boolean rightL, leftL;

color colorL = color(112, 48, 160);
color colorR = color(0, 176, 80);

color darkBlueColor = color(63, 93, 146);
color blueColor = color(68, 114, 196);

int scoreL = 0; 
int scoreR = 0;

int winScore = 5;

int time = millis();

int yLimitUp = 60, yLimitDown = 800;
int xLimitLeft = 200, xLimitRight = 1000;
int yPlayAreaLimit = 460;

boolean isLeftTurn = true;

boolean isInPause = false;

void setup() {
  size(1200, 800);
  
  x = width/2; 
  y = 460;
  
  w = 25;
  h = 25;
  
  speedX = (int)(random(-2, 2));
  if(speedX == 0){
    speedX++;
  }
  speedY = -2;

  
  textSize(50);
  textAlign(CENTER, CENTER); 
  rectMode(CENTER); 

  paddleXL = 400;
  paddleYL = height - 40;
  paddleXR = width-40;
  paddleYR = height/2;
  paddleW = w*2;
  paddleH = 15;
  paddleS = 5;
  
  strokeWeight(0);
  
}

void resetGame(){
    x = width/2; 
    y = 460;
    
    speedX = (int)(random(-2, 2));
    if(speedX == 0){
      speedX++;
    }
    speedY = -2;
}
 
 
void draw() {
  
  playGame();
}

void playGame(){
  
  if(isInPause){
    text("PAUSE", width/2, height/2);
    return;
  }
  
  background(255);
  drawPlayArea();
  drawCircle();
  moveCircle();
  bounce();
  drawPaddles();
  movePaddle();
  moveAIPaddle();
  restrictPaddle();
  contactPaddle();
  scores();
  gameOver();
  //instructions();
}
 
void drawPlayArea(){
  // Draw limit areas.
  strokeWeight(2);
  stroke(darkBlueColor);
  line(xLimitLeft, yLimitUp, xLimitLeft, yLimitDown);
  line(xLimitRight, yLimitUp, xLimitRight, yLimitDown);
  line(xLimitRight, yLimitUp, xLimitLeft, yLimitUp);
  
  // Draw play area.
  stroke(255,0,0);
  strokeWeight(4);
  line(xLimitRight, yPlayAreaLimit, xLimitLeft, yPlayAreaLimit);
  line(width/2, yPlayAreaLimit, width/2, height);
  
  // Draw play area squares.
  line(xLimitLeft, 580, xLimitLeft+150, 580);
  line(xLimitLeft+150, 580, xLimitLeft+150, yPlayAreaLimit);
  line(xLimitRight, 580, xLimitRight-150, 580);
  line(xLimitRight-150, 580, xLimitRight-150, yPlayAreaLimit);
  
  strokeWeight(0);
}

void drawPaddles() {
  
  rectMode(CENTER);
  
  fill(colorL);
  rect(paddleXL, paddleYL, paddleW, paddleH);
  fill(colorR);
  rect(paddleXR, paddleYR, paddleW, paddleH);
}

 
void movePaddle() {
  // Left paddle.
  if (upL) {
    paddleYL = paddleYL - paddleS;
  }
  if (downL) {
    paddleYL = paddleYL + paddleS;
  }
  if (leftL) {
    paddleXL = paddleXL - paddleS;
  }
  if (rightL) {
    paddleXL = paddleXL + paddleS;
  }
  
  // Right paddle.
  if (upR) {
    paddleYR = paddleYR - paddleS;
  }
  if (downR) {
    paddleYR = paddleYR + paddleS;
  }
}

boolean moveUp;
int randTime;
void moveAIPaddle(){
    if(speedX <= 0){
      return;
    }
    
    if (millis() > time + 1000)
    {
      moveUp  = !moveUp;
      upR = moveUp;
      downR = !moveUp;
      
      randTime = (int)random(1500, 1800);
      
      time = millis();
    }
}
 

void restrictPaddle() {
  // Left paddle.
  if (paddleYL + paddleH/2 < yLimitDown) {
    paddleYL = paddleYL + paddleS;
  }
  if (paddleYL - paddleH/2 > yPlayAreaLimit) {
    paddleYL = paddleYL - paddleS;
  }
  if (paddleXL - paddleW/2 < xLimitLeft) {
    paddleXL = paddleXL + paddleS;
  }
  if (paddleXL + paddleW/2 > xLimitRight) {
    paddleXL = paddleXL - paddleS;
  }
  
  // Right paddle.
  if (paddleYR - paddleH/2 < 0) {
    paddleYR = paddleYR + paddleS;
  }
  if (paddleYR + paddleH/2 > height) {
    paddleYR = paddleYR - paddleS;
  }
}
 
 
void contactPaddle() {
  if(isLeftTurn && speedY > 0){
    // Check the collision on x-axis on the left paddle.
    if ((x - w/2 > paddleXL - paddleW/2 && x - w/2 < paddleXL + paddleW/2) || 
        (x + w/2 > paddleXL - paddleW/2 && x + w/2 < paddleXL + paddleW/2)) {
          // Check the collision on y-axis on the left paddle.
          if ((y - h/2 > paddleYL - paddleH/2 && y - h/2 < paddleYL + paddleH/2) || 
              (y + h/2 > paddleYL - paddleH/2 && y + h/2 < paddleYL + paddleH/2)){
                // Change the turn.
                isLeftTurn = !isLeftTurn;
                // Reverse the speed of the ball.
                speedY = -speedY*1;
          }
    }
  }
  /*
  if (isCollidingCircleRectangle(x, y, w, paddleXL, paddleYL, paddleW, paddleH)){
    println("Collided!");
    if (speedY < 0) {
      speedY = -speedY*1;
    }
  }
  else if (x + w/2 > paddleXR - paddleW/2 && y - h/2 < paddleYR + paddleH/2 && y + h/2 > paddleYR - paddleH/2 ) {
    if (speedX > 0) {
      speedY = -speedY*1;
    }
  }
  */
}

void drawCircle() {
  
  if(isLeftTurn){
    fill(colorL);
  }else{
    fill(colorR);
  }
  
  ellipse(x, y, w, h);
}


void moveCircle() {  
  x = x + speedX*2;
  y = y + speedY*2;
  if (speedY == 0)
      speedY = -2;
}
  
void bounce() {
 if ( x > xLimitRight - w/2) {
    
    //resetGame();
    speedX = -speedX;
    //scoreL = scoreL + 1;
  } else if ( x < xLimitLeft + w/2) {
    speedX = -speedX;
    //resetGame();
    //scoreR = scoreR + 1;
  }
  if ( y > yLimitDown - h/2) {
    // Add the point, reset the game.
    if(isLeftTurn){
      scoreR++;
    }else{
      scoreL++;
    }
    isLeftTurn = !isLeftTurn;
    resetGame();
  } else if ( y < yLimitUp + h/2) {
    speedY = -speedY;
  }
}
 
 
void scores() {
  fill(0);
  text(scoreL, 100, 50);
  text(scoreR, width-50, 50);
}

void instructions(){
  textSize(15);
  text("Mueve el panel izquierdo con\nlas teclas W & S.\nGana anotando 5 puntos", 450, 45);
  textSize(50);
}
void mousePressed(){
    println(mouseX+"_"+mouseY);
}
 
 
void gameOver() {
  if(scoreL == winScore) {
    gameOverPage("Ganaste!", colorL);
  }
  if(scoreR == winScore) {
    gameOverPage("La IA ganó!", colorR);
  }
}
 
 
void gameOverPage(String text, color c) {
  speedX = 0;
  speedY = 0;
  fill(255);
  text("Juego Terminado", width/2, height/3 - 40);
  text("Presiona para jugar otra vez", width/2, height/3 + 40);
  fill(c);
  text(text, width/2, height/3);
  if(mousePressed) {
    scoreR = 0;
    scoreL = 0;
    resetGame();
  }
}
 
 
void keyPressed() {
  
  // Left movement.
  if (key == 'w' || key == 'W') {
    upL = true;
  }
  if (key == 's' || key == 'S') {
    downL = true;
  }
  if (key == 'a' || key == 'A') {
    leftL = true;
  }
  if (key == 'd' || key == 'D') {
    rightL = true;
  }
  
  // Pause
  if (key == 'p' || key == 'P') {
    isInPause =  !isInPause;
  }
}
  
void keyReleased() {
  if (key == 'w' || key == 'W') {
    upL = false;
  }
  if (key == 's' || key == 'S') {
    downL = false;
  }
  if (key == 'a' || key == 'A') {
    leftL = false;
  }
  if (key == 'd' || key == 'D') {
    rightL = false;
  }

}
