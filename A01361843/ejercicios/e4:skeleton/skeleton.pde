void setup() {
  size(500,500,P3D);
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
  camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0,0,1,0);
  skeletonBuild(200,50);
}

void skeletonBuild(int x, int y) {
  /* HEAD */
  //camera(width/2, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0,0,1,0);
  noStroke();
  fill(#039be5);
  lights();
  pushMatrix();
  translate(x,y,0);
  sphere(25);
  popMatrix();
  
  /* BODY */
  fill(#039be5);
  noStroke();
  pushMatrix();
  translate(x,y+80,0);
  box(60,100,20);
  popMatrix();
  
  /* LEFT ARM */
  fill(#039be5);
  noStroke();
  pushMatrix();
  translate(x-50,y+70,0);
  rotateZ(PI/8);
  box(20,80,20);
  popMatrix();
  
  /* RIGHT ARM */
  fill(#039be5);
  noStroke();
  pushMatrix();
  translate(x+50,y+70,0);
  rotateZ(-PI/8);
  box(20,80,20);
  popMatrix();
  
  /* LEFT LEG */
  fill(#039be5);
  noStroke();
  pushMatrix();
  translate(x-35,y+170,0);
  rotateZ(PI/8);
  box(20,100,20);
  popMatrix();
  
  /* RIGHT LEG */
  fill(#039be5);
  noStroke();
  pushMatrix();
  translate(x+35,y+170,0);
  rotateZ(-PI/8);
  box(20,100,20);
  popMatrix();
}
