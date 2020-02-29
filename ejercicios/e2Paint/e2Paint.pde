// Boolean variable for fill option.
boolean filled = true;

// Enumerator for figure options.
enum FIGURE{
  point, 
  line,
  rectangle,
  ellipse
};
FIGURE currentFigure = FIGURE.point;

// Enumerator for color options.
enum COLOUR{
  blue,
  orange,
  green,
  yellow,
  black,
  white
}
COLOUR currentColour = COLOUR.blue;

// Class to save the figure objects drawn in the canvas.
class Drawing{
  
  FIGURE figure;
  COLOUR colour;
  boolean filled = false;
  PVector p1, p2;
  boolean finishedFigure = false;
  
  // Display method that paints the current figure in the canvas.
  void display(){
    // If the figure is not finished, draw a previsualization figure.
    if(!finishedFigure){
      displayPrevisualization();
      return;
    }
    
    // Switch fill and color options.
    stroke(getColor(colour));
    if(filled){
      fill(getColor(colour));
    }else{
      noFill();
    }
    
    // Print the  figure in the canvas, depending on it's form.
    switch(figure){
      case point:  
        circle(p1.x, p1.y, p1.dist(p2));
        break;
      case line:
        line(p1.x, p1.y, p2.x, p2.y);
        break;
      case rectangle:
        rect(p1.x, p1.y, p2.x-p1.x, p2.y-p1.y);
        break;
      case ellipse:
        ellipse(p1.x, p1.y, p2.x-p1.x, p2.y-p1.y);
        break;
       default:
    }
  }
  
  // This  method will draw a previsualization figure based on the first point clicked and the mouse position.
  void displayPrevisualization(){
    
    // Differentiate the pre-figure with no fill and grey color.
    noFill();
    strokeWeight(1);
    stroke(192);
    
    // Draw the pre-figure.
    switch(figure){
      case point:  
        circle(p1.x, p1.y, p1.dist(new PVector(mouseX, mouseY)));
        break;
      case line:
        line(p1.x, p1.y, mouseX, mouseY);
        break;
      case rectangle:
        rect(p1.x, p1.y, mouseX-p1.x, mouseY-p1.y);
        break;
      case ellipse:
        ellipse(p1.x, p1.y, mouseX-p1.x, mouseY-p1.y);
        break;
       default:
    }
    
  }
}

// List that will contain all the user-drawn figures.
ArrayList<Drawing> drawings = new ArrayList<Drawing>();

// Initialization method.
void setup(){
  // Canvas will be a square 900x900.
  size(900, 900);
}

// Update method.
void draw(){
  // Black canvas for better visualization of the figures.
  background(0);
  
  // Display options on the screen.
  drawFilledOptions(filled);
  drawFigureOptions(currentFigure);
  drawColorOptions(currentColour);
  drawDeleteOption();
  
  // Key listener for changing the figures on key pressed.
  keyPressedOptions();
  
  // Display the drawings.
  printDrawings();
}

// This method will display the fill options in the canvas.
void drawFilledOptions(boolean filled){
  stroke(255);
  textSize(32);
  fill(255);
  text("Filled?", 10, 30); 
  
  fill(0, 102, 153);
  fill(255);
  triangle(30, 100, 60, 50, 90, 100);

  noFill();
  triangle(110, 100, 140, 50, 170, 100);
  
  stroke(255, 0, 0);
  if(filled){
    circle(60, 80, 80);
  }else{
    circle(140, 80, 80);
  }
}

// This method will display the figure options in the canvas.
void drawFigureOptions(FIGURE figure){
  stroke(255);
  textSize(32);
  fill(255);
  text("Figure : ", 10, 200); 
  
  
  textSize(24);
  text("Point", 20, 250);
  circle(125, 240, 20);
  
  fill(255);
  text("Line", 20, 300);
  noFill();
  line(110, 280, 170, 300);
  
  fill(255);
  text("Rect", 20, 350);
  noFill();
  rect(110, 320, 70, 30);
  
  fill(255);
  text("Elipse", 20, 400);
  noFill();
  ellipse(145, 390, 70, 30);
  
  noFill();
  stroke(255,0,0);
  switch(figure){
    case point:  
      rect(10, 210, 200, 50);
      break;
    case line:
      rect(10, 260, 200, 50);
      break;
    case rectangle:
      rect(10, 310, 200, 50);
      break;
    case ellipse:
      rect(10, 360, 200, 50);
      break;
     default:
  }
  stroke(0);
}

// This method will display the color options in the canvas.
void drawColorOptions(COLOUR colour){
  stroke(255);
  textSize(32);
  fill(255);
  text("Colour : ", 10, 480);
  
  noFill();
  fill(getColor(COLOUR.blue));
  rect(20, 500, 30, 30);
  fill(getColor(COLOUR.orange));
  rect(60, 500, 30, 30);
  fill(getColor(COLOUR.green));
  rect(20, 550, 30, 30);
  fill(getColor(COLOUR.yellow));
  rect(60, 550, 30, 30);
  fill(getColor(COLOUR.black));
  rect(20, 600, 30, 30);
  fill(getColor(COLOUR.white));
  rect(60, 600, 30, 30);
  
  stroke(255,0,0);
  noFill();
  switch(colour){
    case blue:
      circle(35, 515, 50);
      break;
    case orange:
      circle(75, 515, 60);
      break;
    case green:
      circle(35, 565, 60);
      break;
    case yellow:
      circle(75, 565, 60);
      break;
    case black:
      circle(35, 615, 60);
      break;
    case white:
      circle(75, 615, 60);
      break;
    default:
      circle(75, 615, 60);
      break;
  }
}

// This method will display the delete button in the canvas.
void drawDeleteOption(){
  stroke(0);
  textSize(32);
  fill(255, 0, 0);
  text("DELETE", 20, 850);
}

// This method will return a color given an enumerator value.
color getColor(COLOUR colour){
  switch(colour){
    case blue:
      return color(50, 200, 255);
    case orange:
      return color(255, 150, 50);
    case green:
      return color(100, 255, 50);
    case yellow:
      return color(250, 250, 50);
    case black:
      return color(192);
    case white:
      return color(255);
    default:
      return color(255);
  }
}

// Click method.
void mouseClicked() {
  // Check if the user clicked a valid option.
  clickPressedOptions();
}

void mousePressed(){
  // Avoid contact with the options menu.
  if(mouseX <= 240){
    return;
  }
  
  // Create the figure.
  Drawing d = new Drawing();
  
  // Apply parameters.
  d.figure = currentFigure;
  d.colour = currentColour;
  d.filled = filled;
  d.p1 = new PVector(mouseX, mouseY);
  
  // Add the new figure to the list.
  drawings.add(d);
 
}

void mouseReleased(){
  // Avoid drawing figures on the options menu.
  if(mouseX <= 240){
    if(drawings.size() != 0){
      if(drawings.get(drawings.size() - 1).finishedFigure == false){
        print("Removing figure...\n");
        drawings.remove(drawings.size() - 1);
      }
    }
    return;
  }
  
  // Avoid finishing a drawing if none exists.
  if(drawings.size() == 0){
    return;
  }  
  
  // Get the latest drawing in the list (current figure being drawn).
  Drawing currentDrawing = drawings.get(drawings.size() - 1);
  // Finish it's position.
  currentDrawing.p2 = new PVector(mouseX, mouseY);
  // Set it as finished to start drawing the true figure.
  currentDrawing.finishedFigure = true;
}

// This method will check if the user has clicked on a valid menu option.
void clickPressedOptions(){
  // Fill picker :
  if(overOption(30, 30, 60, 90)){
    filled = true;
  }
  else if(overOption(110, 30, 60, 90)){
    filled = false;
  }
  
  // Figure picker :
  else if(overOption(20, 230, 190, 40)){
    currentFigure = FIGURE.point;
  } 
  else if(overOption(15, 280, 190, 40)){
    currentFigure = FIGURE.line;
  }
  else if(overOption(15, 330, 190, 40)){
    currentFigure = FIGURE.rectangle;
  }
  else if(overOption(15, 380, 190, 40)){
    currentFigure = FIGURE.ellipse;
  }
  
  // Colour picker : 
  else if(overOption(20, 500, 30, 30)){
    currentColour = COLOUR.blue;
  }
  else if(overOption(60, 500, 30, 30)){
    currentColour = COLOUR.orange;
  }
  else if(overOption(20, 550, 30, 30)){
    currentColour = COLOUR.green;
  }
  else if(overOption(60, 550, 30, 30)){
    currentColour = COLOUR.yellow;
  }
  else if(overOption(20, 600, 30, 30)){
    currentColour = COLOUR.black;
  }
  else if(overOption(60, 600, 30, 30)){
    currentColour = COLOUR.white;
  }
  
  // Delete option : 
  else if(overOption(10, 830, 150, 130)){
    deleteDrawings();
  }
}

// This method will pick a new figure if the user has typed a key corresponding to the first letter of a figure.
void keyPressedOptions(){
  if (keyPressed) {
    if (key == 'p' || key == 'P') {
      currentFigure = FIGURE.point;
    }
    else if (key == 'l' || key == 'L') {
      currentFigure = FIGURE.line;
    }
    else if (key == 'r' || key == 'R') {
      currentFigure = FIGURE.rectangle;
    }
    else if (key == 'e' || key == 'E') {
      currentFigure = FIGURE.ellipse;
    }
  }
}

// This method will display each figure in the user-drawn list.
void printDrawings(){
  for (int i = 0; i < drawings.size(); i++) {
    Drawing d = drawings.get(i);
    d.display();
  }
}

// This method will delete all drawings in the user-drawn list.
void deleteDrawings(){
  for (int i = drawings.size(); i-- != 0; drawings.remove(i));
}

// This method will return true if the mouse click is on a given coordinate with width and height.
boolean overOption(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
