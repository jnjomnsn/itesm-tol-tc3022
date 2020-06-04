void setup()
{
   size(500,500); 
}

void draw()
{
  transformation();
}

void transformation()
{
  pushMatrix();
  //mover el rectangulo lleno
  translate(40,40);
  myFilledShape();
  
  //rotar y agrandar el contorno
  translate(40,40);
  rotate(radians(45));
  scale(2);
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
