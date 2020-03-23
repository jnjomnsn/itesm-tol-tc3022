color baseColor, currentColor, rectColor, circleColor, pointColor, lineColor, highlight;
color green = color(0,255,0);
color red = color(255,0,0);
color blue = color(0,0,255);
color black = color(0,0,0);

int currentFill = 1;
int currentShape = 5;

int rectX, rectY;      // Position of square button
int circleX, circleY;  // Position of circle button
int lineX, lineY;      // Position of line button
int pointX, pointY;    // Position of point button

int redX, redY;      // Position of red button
int greenX, greenY;  // Position of green button
int blueX, blueY;    // Position of blue button
int blackX, blackY;  // Position of black button

int fullX, fullY;    // Position of full fill button
int blankX, blankY;  // Position of blank fill button

int initPosX, initPosY;  // Initial position for creating a shape
int endPosX, endPosY;    // Final position for creating a shape

boolean rectOver = false;
boolean circleOver = false;
boolean pointOver = false;
boolean lineOver = false;
boolean redOver = false;
boolean greenOver = false;
boolean blueOver = false;
boolean blackOver = false;
boolean fullOver = false;
boolean blankOver = false;

void setup() {
  size(1200,700);
  baseColor = color(102);
  currentColor = baseColor;
  rectColor = baseColor;
  circleColor = baseColor;
  pointColor = baseColor;
  lineColor = baseColor;
  highlight = color(204);
  baseColor = color(102);
  currentColor = baseColor;
  ellipseMode(CENTER);
  initPosX = initPosY = 0;
  endPosX = endPosY = 0;
}

void draw() {
  updateMouse(mouseX, mouseY);
  
  fill(black);
  text("Select a shape:",50,40);
  
  if (rectOver) {
    fill(highlight);
  } else {
    fill(rectColor);
  }
  stroke(255);
  rect(50, 65, 50, 50);
  
  if (circleOver) {
    fill(highlight);
  } else {
    fill(circleColor);
  }
  stroke(255);
  ellipse(150, 90, 50, 50);
  
  if (lineOver) {
    fill(highlight);
  } else {
    fill(lineColor);
  }
  stroke(0);
  line(200, 70, 230, 110);
  
  if (pointOver) {
    fill(highlight);
  } else {
    fill(pointColor);
  }
  stroke(255);
  ellipse(270, 90, 10, 10);
  
  fill(black);
  text("Select a color:",500,40);

  if (redOver) {
    fill(highlight);
  } else {
    fill(red);
  }
  stroke(255);
  rect(500, 65, 20, 20);
  
  if (greenOver) {
    fill(highlight);
  } else {
    fill(green);
  }
  stroke(255);
  rect(540, 65, 20, 20);
  
  if (blueOver) {
    fill(highlight);
  } else {
    fill(blue);
  }
  stroke(255);
  rect(580, 65, 20, 20);
  
  if (blackOver) {
    fill(highlight);
  } else {
    fill(black);
  }
  stroke(255);
  rect(620, 65, 20, 20);
  
  fill(black);
  text("Select a full fill or blank fill:",800,40);
  
  if (fullOver) {
    stroke(255);
    fill(baseColor);
  } else {
    stroke(255);
    fill(black);
  }
  stroke(0);
  rect(800, 65, 20, 20);
  
  if (blankOver) {
    stroke(255);
    fill(200);
  } else {
    stroke(0);
    fill(255);
  }
  stroke(0);
  rect(840, 65, 20, 20);
}

void mouseDragged() {
  endPosX = mouseX;
  endPosY = mouseY;
}

void mouseReleased() {
  if(currentShape == 2) {
    drawLine(initPosX, initPosY, endPosX, endPosY);
    initPosX = endPosX;
    initPosY = endPosY;
    currentShape = 5;
  }
}

void mousePressed() {
  initPosX = mouseX;
  initPosY = mouseY;
  
  if(currentShape == 0) {
    drawEllipse(initPosX, initPosY);
    currentShape = 5;
  } else if(currentShape == 1) {
    drawRectangle(initPosX, initPosY);
    currentShape = 5;
  } else if(currentShape == 2) {
    //drawLine();
    currentShape = 5;
  } else if(currentShape == 3) {
    drawPoint(initPosX, initPosY);
    currentShape = 5;
  }
  
  if (circleOver) {
    currentShape = 0;
  }
  if (rectOver) {
    currentShape = 1;
  }
  if (lineOver) {
    currentShape = 2;
  }
  if (pointOver) {
    currentShape = 3;
  }
  
  if (redOver) {
    currentColor = red;
  }
  if (greenOver) {
    currentColor = green;
  }
  if (blueOver) {
    currentColor = blue;
  }
  if (blackOver) {
    currentColor = black;
  }
  
  if (fullOver) {
    currentFill = 1;
  }
  if (blankOver) {
    currentFill = 0;
  }
}

void updateMouse(int x, int y) {
  if ( overCircle(150, 90, 50) ) {
    fullOver = blankOver = false;
    redOver = greenOver = blueOver = blackOver = false;
    circleOver = true;
    rectOver = false;
    pointOver = false;
    lineOver = false;
  } else if ( overRect(50, 65, 50, 50) ) {
    fullOver = blankOver = false;
    redOver = greenOver = blueOver = blackOver = false;
    rectOver = true;
    circleOver = false;
    pointOver = false;
    lineOver = false;
  } else if ( overPoint(270, 90, 10) ) {
    fullOver = blankOver = false;
    redOver = greenOver = blueOver = blackOver = false;
    rectOver = false;
    circleOver = false;
    pointOver = true;
    lineOver = false;
  } else if ( overLine(200, 70, 50, 50) ) {
    fullOver = blankOver = false;
    redOver = greenOver = blueOver = blackOver = false;
    rectOver = false;
    circleOver = false;
    pointOver = false;
    lineOver = true;
  } else if ( overColor(500, 65, 20, 20) ) {
    fullOver = blankOver = false;
    rectOver = circleOver = pointOver = lineOver = false;
    redOver = true;
    greenOver = false;
    blueOver = false;
    blackOver = false;
  } else if ( overColor(540, 65, 20, 20) ) {
    fullOver = blankOver = false;
    rectOver = circleOver = pointOver = lineOver = false;
    redOver = false;
    greenOver = true;
    blueOver = false;
    blackOver = false;
  } else if ( overColor(580, 65, 20, 20) ) {
    fullOver = blankOver = false;
    rectOver = circleOver = pointOver = lineOver = false;
    redOver = false;
    greenOver = false;
    blueOver = true;
    blackOver = false;
  } else if ( overColor(620, 65, 20, 20) ) {
    fullOver = blankOver = false;
    rectOver = circleOver = pointOver = lineOver = false;
    redOver = false;
    greenOver = false;
    blueOver = false;
    blackOver = true;
  } else if ( overFill(800, 65, 20, 20) ) {
    redOver = greenOver = blueOver = blackOver = false;
    rectOver = circleOver = pointOver = lineOver = false;
    fullOver = true;
    blankOver = false;
  } else if ( overFill(840, 65, 20, 20) ) {
    redOver = greenOver = blueOver = blackOver = false;
    rectOver = circleOver = pointOver = lineOver = false;
    fullOver = false;
    blankOver = true;
  } else {
    fullOver = blankOver = false;
    circleOver = rectOver = false;
    redOver = greenOver = blueOver = blackOver = false; 
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overLine(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

boolean overPoint(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

boolean overColor(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overFill(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}



void drawPoint(int a, int b) {
  if(currentFill == 1) {
    stroke(currentColor);
    fill(currentColor);
  } else {
    strokeWeight(2);
    stroke(currentColor);
    fill(244);
  }
  ellipse(a,b,8,8);
}

void drawLine(int a, int b, int c, int d) {
  stroke(currentColor);
  strokeWeight(2);
  line(a,b,c,d);
}

void drawRectangle(int a, int b) {
  if(currentFill == 1) {
    stroke(currentColor);
    fill(currentColor);
  } else {
    strokeWeight(2);
    stroke(currentColor);
    fill(244);
  }
  rect(a,b,200,200);
}

void drawEllipse(int a, int b) {
  if(currentFill == 1) {
    stroke(currentColor);
    fill(currentColor);
  } else {
    strokeWeight(2);
    stroke(currentColor);
    fill(244);
  }
  ellipse(a,b,150,150);
}
