void setup() {
  size(600,600);
}
void draw(){
  
  rotationAndScaling();
}
void myFilledShape() {
  translate(40,40);
  fill(#039be5);
  noStroke();
  rect(0,0,40,40);
}

void myEmptyShape(){
 noFill();
 stroke(#0069c0);
 rect(0,0,40,40);
}

void rotationAndScaling() {
 myFilledShape();
 pushMatrix();
 translate(40,40);
 rotate(radians(45));
 scale(2.0);
 myEmptyShape();
 popMatrix();
}
