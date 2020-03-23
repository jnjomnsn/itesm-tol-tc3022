void setup() {
  size(500,500);
}

void draw() {
  translationFilledShape();
  transformationEmptyShape();  
}

void myFilledShape() {
  fill(#039be5);
  noStroke();
  rect(0,0,40,40);
}

void translationFilledShape() {
  pushMatrix();
  
  /* Transladamos el sistemas de coordenadas */
  translate(40,40);
  
  /* Mi rectangulo */
  myFilledShape();
  
  popMatrix();
}

void myEmptyShape() {
  noFill();
  stroke(#039be5);
  rect(0,0,40,40);
}

void transformationEmptyShape() {
  pushMatrix();
  
  /* Transladamos el sistemas de coordenadas */
  translate(80,80);
  scale(2.0);
  rotate(radians(45));
  
  /* Mi rectangulo */
  myEmptyShape();
  
  popMatrix();
}
