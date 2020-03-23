void setup() {
  size(1000,700,P3D);
}

void draw() {
  float fov = PI/3.0;
  float cameraZ = (height/2.0)/tan(fov/2.0);
  perspective(fov, float(width)/float(height), cameraZ/2.0, cameraZ*2.0);
  cam();
}

void cam() {
  background(0);
  translate(width/2, height/2, -100);
  stroke(255);
  noFill();
  camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0,0,1,0);
  rectangulos(width/2, height/2);
} 

void rectangulos(int x, int y) {
  /* RECTANGULO 1 */ 
  pushMatrix();
  
  translate(x,y);
  
  rotateX(PI/2);
  
  fill(#039b34);
  rectMode(CENTER);
  rect(0,0,200,100);
  
  popMatrix();
  
  /* RECTANGULO 2 */ 
  pushMatrix();
  
  translate(x,y);
  
  rotateY(PI/2);
  
  fill(#340081);
  rectMode(CENTER);
  rect(0,0,200,100);
  
  popMatrix();
  
  /* RECTANGULO 3 */ 
  pushMatrix();
  
  translate(x,y);
  
  rotateZ(PI/2);
  
  fill(#081ABC);
  rectMode(CENTER);
  rect(0,0,200,100);
  
  popMatrix();
  
  /* ICOSAHEDRON LINES */ 
  pushMatrix();
  
  translate(x,y);
  //line(100,50,0,100,50,100);
  
  popMatrix();
}
