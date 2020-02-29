void setup(){
  size(400,400);
}
void draw(){
  translate(40,40);
  myFilledShape();
 
  pushMatrix();
  translate(40,40);
  rotate(radians(45));
  scale(2.0);
  myEmptyShape();
  popMatrix();
  
}
void myFilledShape()
{
  fill(#039be5);
  noStroke();
  rect(0,0,40,40);
}
void myEmptyShape()
{
  noFill();
  stroke(#0069c0);
  rect(0,0,40,40);
}
