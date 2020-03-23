/*
Benjamín Avila Rosas
A01361843

16 / 03 / 2020
*/

void setup() {
  size(1000,700,P3D);
}

void draw() {
  // cam function will call every other method needed to build the pyramid
  cam();
}

/* Script for camera rendering */ 
void cam() {
  background(0);
  //translate(width/2, height/2, -100);
  stroke(255);
  noFill();
  // Camera settings (eyes(x,y,z), center(x,y,z), upPosition(x,y,z))
  camera(mouseX, mouseY, (height/2) / tan(PI/6),   width/2, height/2,0,   0,1,0);
  
  // You might call your shape rendering functions here
  pushMatrix();
  scale(1.0);
  // Sierpinski pyramid on regular scale aprox 250*250px
  sierpinski();
  popMatrix();
} 


// Main Trinalge function
// X & Y are the position where it is going to be set 
// R is going to set triangles size based on R as the radius to each point
void mainTriangle(int x, int y, int r) {
  // Variables used to store position of triangle vertex
  float angle, xPos, yPos;
  
  pushMatrix();
  
  translate(x,y,0);
  // Rotate 30º the generated shape so the triangle looks to be upwards 
  rotate(radians(30));
  // Base triangle going to be RED
  fill(#E5006B);
  stroke(255);
  /* Main triangle creation */
  // Every 120ª a vertex point will be set
  beginShape();
  for(int deg = 0; deg < 360; deg += 120)
  {
    angle = deg * PI / 180;
    xPos = cos(angle) * r;
    yPos = sin(angle) * r;
    vertex(xPos, yPos,0);
  }
  endShape(CLOSE);
  
  popMatrix();
  
  // Function called for creating first child triangle inside the main one
  // Children going to be color GREEN
  firstChildTriangle(x,y,r/2);
}

// First Child Triangle function
// X & Y are the position where it is going to be set 
// R is going to set triangles size based on R as the radius to each point
void firstChildTriangle(int x, int y, int r) {
  // Variables used to store position of triangle vertex
  float angle, xPos, yPos;
  
  pushMatrix();
  translate(x,y,0);
  // Rotate 210º the generated shape so the triangle looks to be downwards
  rotate(radians(210));
  // Children triangles going to be GREEN
  fill(#16DB93);
  stroke(255);
  beginShape();
  /* Triangles creation */
  // Every 120ª a vertex point will be set
  for(int deg = 0; deg < 360; deg += 120)
  {
    angle = deg * PI / 180;
    xPos = cos(angle) * r;
    yPos = sin(angle) * r;
    vertex(xPos, yPos,0);
  }
  endShape(CLOSE);
  
  popMatrix();
  
  // Function called for creating second children triangles inside the main one
  // Children going to be color GREEN
  secondChildTriangles(x,y,r/2);
}

// Second Children Triangle function
// X & Y are the position where it is going to be set 
// R is going to set triangles size based on R as the radius to each point
void secondChildTriangles(int x, int y, int r) {
  // Variables used to store position of triangle vertex
  float angle, xPos, yPos;
  
  /*  Triangle #1 */
  pushMatrix();
  translate(x+(r*1.75),y+r,0);
  // Rotate 210º the generated shape so the triangle looks to be downwards
  rotate(radians(210));
  // Children triangles going to be GREEN
  fill(#16DB93);
  stroke(255);
  beginShape();
  /* Triangles creation */
  // Every 120ª a vertex point will be set
  for(int deg = 0; deg < 360; deg += 120)
  {
    angle = deg * PI / 180;
    xPos = cos(angle) * r;
    yPos = sin(angle) * r;
    vertex(xPos, yPos,0);
  }
  endShape(CLOSE);
  popMatrix();
  
  // secondChild #1 children
  thirdChildTriangles(x,y-(2*r),r/2);
  
  /*  Triangle #2 */
  pushMatrix();
  translate(x-(r*1.75),y+r,0);
  // Rotate 210º the generated shape so the triangle looks to be downwards
  rotate(radians(210));
  // Children triangles going to be GREEN
  fill(#16DB93);
  stroke(255);
  beginShape();
  /* Triangles creation */
  // Every 120ª a vertex point will be set
  for(int deg = 0; deg < 360; deg += 120)
  {
    angle = deg * PI / 180;
    xPos = cos(angle) * r;
    yPos = sin(angle) * r;
    vertex(xPos, yPos,0);
  }
  endShape(CLOSE);
  popMatrix();
  
  // secondChild #2 children
  thirdChildTriangles(x-(1.75*r),y+r,r/2);
  
  /*  Triangle #3 */
  pushMatrix();
  translate(x,y-(r*2),0);
  // Rotate 210º the generated shape so the triangle looks to be downwards
  rotate(radians(210));
  // Children triangles going to be GREEN
  fill(#16DB93);
  stroke(255);
  beginShape();
  /* Triangles creation */
  // Every 120ª a vertex point will be set
  for(int deg = 0; deg < 360; deg += 120)
  {
    angle = deg * PI / 180;
    xPos = cos(angle) * r;
    yPos = sin(angle) * r;
    vertex(xPos, yPos,0);
  }
  endShape(CLOSE);
  popMatrix();
  
  // secondChild #3 children
  thirdChildTriangles(x+(1.75*r),y+r,r/2);
}


// third Children Triangle function
// X & Y are the position where it is going to be set 
// R is going to set triangles size based on R as the radius to each point
void thirdChildTriangles(float x, float y, int r) {
  float angle, xPos, yPos;
  
  /*  Triangle #1 */
  pushMatrix();
  translate(x+(r*1.75),y+r,0);
  rotate(radians(210)); 
  fill(#16DB93);
  stroke(255);
  beginShape();
  for(int deg = 0; deg < 360; deg += 120)
  {
    angle = deg * PI / 180;
    xPos = cos(angle) * r;
    yPos = sin(angle) * r;
    vertex(xPos, yPos,0);
  }
  endShape(CLOSE);
  popMatrix();
  
  /*  Triangle #2 */
  pushMatrix();
  translate(x-(r*1.75),y+r,0);
  rotate(radians(210)); 
  fill(#16DB93);
  stroke(255);
  beginShape();
  for(int deg = 0; deg < 360; deg += 120)
  {
    angle = deg * PI / 180;
    xPos = cos(angle) * r;
    yPos = sin(angle) * r;
    vertex(xPos, yPos,0);
  }
  endShape(CLOSE);
  popMatrix();
  
  /*  Triangle #3 */
  pushMatrix();
  translate(x,y-(r*2),0);
  rotate(radians(210)); 
  fill(#16DB93);
  stroke(255);
  beginShape();
  for(int deg = 0; deg < 360; deg += 120)
  {
    angle = deg * PI / 180;
    xPos = cos(angle) * r;
    yPos = sin(angle) * r;
    vertex(xPos, yPos,0);
  }
  endShape(CLOSE);
  popMatrix();
}

void sierpinski() {
  /* BASE OF PYRAMID */
  // Made of a regular rectangle rotated on X to be used as pyramid's base
  pushMatrix();
  translate(width/2,height/2 + 62,0);
  rotateX(PI/2);
  fill(#E5006B);
  rectMode(CENTER);
  rect(0,0,260,260);
  popMatrix();
  
  /* Face #1 of pyramid */
  // This is the front face of pyramid
  pushMatrix();
  translate(width/2,height/2,87);
  rotateX(radians(35));
  mainTriangle(0,0,150);
  popMatrix();
  
  /* Face #2 of pyramid */
  // This is the right side of pyramid
  pushMatrix();
  translate(width/2 + 87,height/2,0);
  rotateZ(-radians(35));
  rotateY(PI/2);
  mainTriangle(0,0,150);
  popMatrix();
  
  /* Face #3 of pyramid */
  // This is the left side of pyramid
  pushMatrix();
  translate(width/2 - 87,height/2,0);
  rotateZ(radians(35));
  rotateY(PI/2);
  mainTriangle(0,0,150);
  popMatrix();
  
  /* Face #4 of pyramid */
  // This is the back face of pyramid
  pushMatrix();
  translate(width/2,height/2,-87);
  rotateX(-radians(35));
  mainTriangle(0,0,150);
  popMatrix();
}
