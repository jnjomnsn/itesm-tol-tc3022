void setup(){
  size(200, 250);
  background(0);
}

void draw(){
  translate(40,40);
  myFilledShape();
  
  pushMatrix();
  
  transformFigure();
  
  rotateFigure();
  
  scaleFigure();
  
  myEmptyShape();
  
  popMatrix();
}

void myFilledShape(){
  fill(#039be5);
  noStroke();
  rect(0,0,40,40); 
}

void myEmptyShape(){
  noFill();
  stroke(#0069c0);
  rect(0,0,40,40); 
}

void scaleFigure(){
  scale(2.0); 
}
void transformFigure(){
  translate(40,40);
}
void rotateFigure(){
  rotate(radians(45));
}
