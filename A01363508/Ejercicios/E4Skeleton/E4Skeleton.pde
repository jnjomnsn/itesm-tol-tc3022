void setup() {
  size(600,600,P3D);
}
void draw(){
  body();
}

void body() {
  pushMatrix();
  translate(200,300);
  fill(#039be5);
  noStroke();
  box(40,100,10);
  popMatrix();
  pushMatrix();
  translate(50,100);
  fill(#039be5);
  noStroke();
  box(40,100,10);
  popMatrix();
  /*pushMatrix();
  translate(0,-100);
  fill(#039be5);
  noStroke();
  rect(0,0,90,100);
  popMatrix();
  pushMatrix();
  translate(-20,-103);
  rotate(radians(10));
  fill(#039be5);
  noStroke();
  rect(0,0,20,100);
  popMatrix();
  pushMatrix();
  translate(90,-99);
  rotate(radians(-10));
  fill(#039be5);
  noStroke();
  rect(0,0,20,100);
  popMatrix();*/
  
  
}
