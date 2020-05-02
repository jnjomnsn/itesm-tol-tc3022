GameAnalytics win;

int x, y, w, h, speedX, speedY;
int paddleXL, paddleYL, paddleW, paddleH, paddleS;
int paddleXR, paddleYR;
boolean upL, downL;
boolean upR, downR;
boolean rightL, leftL;
boolean rightR, leftR;

color colorL = color(112, 48, 160);
color colorR = color(0, 176, 80);

color darkBlueColor = color(63, 93, 146);
color blueColor = color(68, 114, 196);
color greyColor = color(175, 171, 171);

int scoreL = 0; 
int scoreR = 0;

int winScore = 1;

int time = millis();

int yLimitUp = 60, yLimitDown = 800;
int xLimitLeft = 200, xLimitRight = 1000;
int yPlayAreaLimit = 460;
int yScoreArea = 780;

boolean isLeftTurn = true;

boolean isInPause = false;

boolean initGame = false;

int bounceCount = 0;

boolean hasStartedRound = false;

boolean alreadySavedData = false;

public void settings() {
  size(1200, 800);
}

void setup() {
  
  
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
  paddleXR = 800;
  paddleYR = height - 40;
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
    
    bounceCount = 0;
    
    hasStartedRound = false;
    
    alreadySavedData = false;
}
 
 
void draw() {
  
  if(!initGame){
    gameInitPage();
    return;
  }
  
  playGame();
}

void playGame(){
  // Check if the game's in pause.
  if(isInPause && hasStartedRound){
    textSize(40);
    fill(0);
    text("PAUSE", width/2, height/2 - 140);
    return;
  }
  
  // Drawing and information functions.
  drawBackgroundColors();
  drawPlayArea();
  drawCircle();
  drawPaddles();
  scores();
  
  // Show the start round key instructions after all the information has been rendered.
  if(!hasStartedRound){
    textSize(30);
    fill(0);
    text("Press [G] to start the round", width/2, height/2-140);
    return;
  }
  
  // Movement functions.
  moveCircle();
  bounce();
  movePaddles();
  restrictPaddle();
  contactPaddle();
  
  // Check if game over function.
  gameOver();
}

void drawBackgroundColors(){
  background(255);
  
  rectMode(CORNER);
  noStroke();
  
  fill(blueColor);
  rect(0, 0, 180, 800);
  rect(1020, 0, 180, 800);
  rect(180, 0, 840, 40);
  
  fill(greyColor);
  rect(200, 60, 800, 800);
  
  rectMode(CENTER);
}
 
void drawPlayArea(){
  // Draw the scoring area.
  strokeWeight(2);
  stroke(blueColor);
  line(xLimitLeft, yScoreArea, xLimitRight, yScoreArea);
  
  // Draw limit areas.
  strokeWeight(2);
  stroke(darkBlueColor);
  line(xLimitLeft, yLimitUp, xLimitLeft, yLimitDown);
  line(xLimitRight, yLimitUp, xLimitRight, yLimitDown);
  line(xLimitRight, yLimitUp, xLimitLeft, yLimitUp);
  
  line(xLimitLeft-20, yLimitUp-20, xLimitLeft-20, yLimitDown);
  line(xLimitRight+20, yLimitUp-20, xLimitRight+20, yLimitDown);
  line(xLimitRight+20, yLimitUp-20, xLimitLeft-20, yLimitUp-20);
  
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

 
void movePaddles() {
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
  if (leftR) {
    paddleXR = paddleXR - paddleS;
  }
  if (rightR) {
    paddleXR = paddleXR + paddleS;
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
  if (paddleYR + paddleH/2 < yLimitDown) {
    paddleYR = paddleYR + paddleS;
  }
  if (paddleYR - paddleH/2 > yPlayAreaLimit) {
    paddleYR = paddleYR - paddleS;
  }
  if (paddleXR - paddleW/2 < xLimitLeft) {
    paddleXR = paddleXR + paddleS;
  }
  if (paddleXR + paddleW/2 > xLimitRight) {
    paddleXR = paddleXR - paddleS;
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
  else if(!isLeftTurn && speedY > 0){
    // Check the collision on x-axis on the right paddle.
    if ((x - w/2 > paddleXR - paddleW/2 && x - w/2 < paddleXR + paddleW/2) || 
        (x + w/2 > paddleXR - paddleW/2 && x + w/2 < paddleXR + paddleW/2)) {
          // Check the collision on y-axis on the right paddle.
          if ((y - h/2 > paddleYR - paddleH/2 && y - h/2 < paddleYR + paddleH/2) || 
              (y + h/2 > paddleYR - paddleH/2 && y + h/2 < paddleYR + paddleH/2)){
                // Change the turn.
                isLeftTurn = !isLeftTurn;
                // Reverse the speed of the ball.
                speedY = -speedY*1;
          }
    }
  }
}

void drawCircle() {
  
  if(isLeftTurn){
    fill(colorL);
    stroke(colorL);
  }else{
    fill(colorR);
    stroke(colorR);
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

    speedX = -speedX;
    
    bounceCount++;
    if(bounceCount >= 5){
      if(isLeftTurn){
        scoreR++;
      }else{
        scoreL++;
      }
    }
    //scoreL = scoreL + 1;
  } else if ( x < xLimitLeft + w/2) {
    speedX = -speedX;

    bounceCount++;
    if(bounceCount >= 5){
      if(isLeftTurn){
        scoreR++;
      }else{
        scoreL++;
      }
    }
    
  }
  if ( y > yScoreArea - h/2) {
    // Add the point, reset the game.
    if(isLeftTurn){
      scoreR++;
    }else{
      scoreL++;
    }
    resetGame();
  } else if ( y < yLimitUp + h/2) {
    speedY = -speedY;
    
    bounceCount = 0;
  }
}
 
 
void scores() {
  textSize(70);
  
  fill(colorL);
  text(scoreL+"\nA", 100, 110);
  
  fill(colorR);
  text(scoreR+"\nB", width-100, 110);
}

 
void gameOver() {
  if(scoreL == winScore) {
    gameOverPage("Player A Wins!", colorL);
  }
  if(scoreR == winScore) {
    gameOverPage("Player B Wins!", colorR);
  }
}


void gameInitPage() {
  background(blueColor);
  
  fill(0);
  
  textSize(50);
  
  speedX = 0;
  speedY = 0;
  
  text("Squash", width/2, 100);
  
  textSize(20);
  text("Player A movement: W A S D \n\n Player B movement: UP LEFT DOWN RIGHT \n\n Pause Key: [p] or [P]\n\n Press [g] or [G] to start a round \n\nExit the game: [esc]", width/2, 350);
  
  textSize(50);
  text("Click anywhere to play", width/2, height-200);
  
  if(mousePressed) {
    initGame = true;
    scoreR = 0;
    scoreL = 0;
    resetGame();
  }
}


void gameOverPage(String text, color c) {
  textSize(50);
  
  speedX = 0;
  speedY = 0;
  
  if(scoreL == winScore) {
    fill(colorL);
  }
  if(scoreR == winScore) {
    fill(colorR);
  }
  
  text("Game Over", width/2, height/3 - 100);
  text(text, width/2, height/3);
  text("Click anywhere to play again", width/2, height/3  + 100);
  
  saveData();
  
  hasStartedRound = true;
  isLeftTurn = true;
  
  if(mousePressed) {
    scoreR = 0;
    scoreL = 0;
    paddleXL = 400;
    paddleYL = height - 40;
    paddleXR = 800;
    paddleYR = height - 40;
    
    resetGame();
  }
}


void saveData(){
  // Only save 
  if(!alreadySavedData){
    alreadySavedData = true;
    
    // Load the data.
    Table table = loadTable("scores.csv", "header");

    // Traverse the only one row.
    for (TableRow row : table.rows()) {
  
      // Get the score of both players.
      int a_score = row.getInt("a_wins");
      int b_score = row.getInt("b_wins");
      
      int totalGames = a_score + b_score;
      
      // Add the corresponding score to the winner.
      if(scoreL == winScore) {
        a_score++;
        row.setInt("a_wins", a_score);
      }
      if(scoreR == winScore) {
        b_score++;
        row.setInt("b_wins", b_score);
      }
  
      println("A score: "+a_score);
      println("B score: "+b_score);
      
      // Save the data into the csv.
      saveTable(table, "scores.csv");
      
      // Open the new graph window.
      win = new GameAnalytics();
      win.setValues(a_score, b_score, totalGames);
      
      // Do it only one time, avoid loops.
      break;
    }
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
  
  // Right movement.
  if (key == CODED) 
  {
    if (keyCode == UP) {
      upR = true;
    }
    if (keyCode == DOWN) {
      downR = true;
    }
    if (keyCode ==LEFT) {
      leftR = true;
    }
    if (keyCode == RIGHT) {
      rightR = true;
    }
  }
  
  // Pause action.
  if (key == 'p' || key == 'P') {
    isInPause =  !isInPause;
  }
  
  // Pause action.
  if (key == 'g' || key == 'G') {
    hasStartedRound =  true;
  }
  
  // Leave game.
  if (keyCode == 27) {
    exit();
  }
}
  
void keyReleased() {
  // Left movement.
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
  
  // Right movement.
  if (key == CODED) 
  {
    if (keyCode == UP) {
      upR = false;
    }
    if (keyCode == DOWN) {
      downR = false;
    }
    if (keyCode ==LEFT) {
      leftR = false;
    }
    if (keyCode == RIGHT) {
      rightR = false;
    }
  }
}


class GameAnalytics extends PApplet {
  
  int aWins, bWins, totalGames;
  
  GameAnalytics() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }
  
  public void setValues(int aWins, int bWins, int totalGames){
    this.aWins = aWins;
    this.bWins = bWins;
    this.totalGames = totalGames + 1;
  }

  void settings() {
    size(1000, 700);
  }

  void setup() {
    println("Opening new window...");
    background(150);
    noLoop();
  }

  void draw() {
    background(219);
    pieChart(450);
  }
  
  void pieChart(float diameter) {
    float lastAngle = 0;
    int i = 0;
    
    int winArray[] = {aWins, bWins};
    int colors[] = {color(112, 48, 160), color(0, 176, 80)};
    
    fill(0);
    textSize(40);
    noStroke();
    text("Winned Games Chart", 35, 60);
    
    for(i = 0; i < 2; i++){
      
      float mappedValue = map(winArray[i], 0, totalGames, 0, 360);
      
      fill(colors[i]);
      
      arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(mappedValue));
      
      lastAngle += radians(mappedValue);
      
      // Draw information.
      rect(800, 300+(50*i), 25, 25);
      fill(0);
      textSize(25);
      
      String wins = "";
      if(i==0){
        wins = "A Wins : ";
      }else{
        wins = "B Wins : ";
      }
      text(wins + winArray[i], 830, 320+(50*i));
    }
    
    textSize(20);
    textAlign(CENTER);
    text("Click anywhere on the screen to close", width/2, 650);
  }
  
  void mousePressed() {
    println("Closing analytics window...");
    this.getSurface().setVisible(false);
  }
}
