int x, y, w, h, speedX, speedY;
int paddleXL, paddleYL, paddleW, paddleH, paddleS;
int paddleXR, paddleYR;
boolean upL, downL;
boolean upR, downR;

color colorL = color(0,0,255);
color colorR = color(255, 0, 0);

int scoreL = 0; 
int scoreR = 0;

int winScore = 5;

int time = millis();

void setup() {
  size(900, 600);
  
  x = width/2; 
  y = height/2;
  
  w = 25;
  h = 25;
  
  speedX = 2;
  speedY = (int)(random(-3, 3));
  if (speedY == 1)
      speedY++;
  if (speedY == -1)
    speedY--;
  
  textSize(50);
  textAlign(CENTER, CENTER); 
  rectMode(CENTER); 

  paddleXL = 40;
  paddleYL = height/2;
  paddleXR = width-40;
  paddleYR = height/2;
  paddleW = 20;
  paddleH = 100;
  paddleS = 5;
  
  strokeWeight(0);
  
}

void resetGame(){
    speedX = 2;
    speedY = (int)(random(-3, 3));
    if (speedY == 0)
      speedY = -2;
    x = width/2; 
    y = height/2;
    w = 30;
    h = 30;
}
 
 
void draw() {
  background(255);
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
  instructions();
}
 
void drawPaddles() {
  fill(colorL);
  rect(paddleXL, paddleYL, paddleW, paddleH);
  fill(colorR);
  rect(paddleXR, paddleYR, paddleW, paddleH);
}

 
void movePaddle() {
  if (upL) {
    paddleYL = paddleYL - paddleS;
  }
  if (downL) {
    paddleYL = paddleYL + paddleS;
  }
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
  if (paddleYL - paddleH/2 < 0) {
    paddleYL = paddleYL + paddleS;
  }
  if (paddleYL + paddleH/2 > height) {
    paddleYL = paddleYL - paddleS;
  }
  if (paddleYR - paddleH/2 < 0) {
    paddleYR = paddleYR + paddleS;
  }
  if (paddleYR + paddleH/2 > height) {
    paddleYR = paddleYR - paddleS;
  }
}
 
 
void contactPaddle() {
  if (x - w/2 < paddleXL + paddleW/2 && y - h/2 < paddleYL + paddleH/2 && y + h/2 > paddleYL - paddleH/2 ) {
    if (speedX < 0) {
      speedX = -speedX*1;
    }
  }
  else if (x + w/2 > paddleXR - paddleW/2 && y - h/2 < paddleYR + paddleH/2 && y + h/2 > paddleYR - paddleH/2 ) {
    if (speedX > 0) {
      speedX = -speedX*1;
    }
  }
}
 
void drawCircle() {
  fill(0,255,0);
  ellipse(x, y, w, h);
}


void moveCircle() {  
  x = x + speedX*2;
  y = y + speedY*2;
  if (speedY == 0)
      speedY = -2;
}
  
void bounce() {
 if ( x > width - w/2) {
    
    resetGame();
    speedX = -speedX;
    scoreL = scoreL + 1;
  } else if ( x < 0 + w/2) {
    
    resetGame();
    scoreR = scoreR + 1;
  }
  if ( y > height - h/2) {
    speedY = -speedY;
  } else if ( y < 0 + h/2) {
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
    print(mouseX+"_"+mouseY);
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
    speedX = 1;
    speedY = 1;
  }
}
 
 
void keyPressed() {
if (key == 'w' || key == 'W') {
    upL = true;
  }
  if (key == 's' || key == 'S') {
    downL = true;
  }

}
  
void keyReleased() {
  if (key == 'w' || key == 'W') {
    upL = false;
  }
  if (key == 's' || key == 'S') {
    downL = false;
  }

}
