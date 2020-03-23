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
  camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0,0,1,0);
  //skeletonBuild(200,50);
  icosaedro(width/2,height/2);
}

int r = 70;
float phi = r*(1+sqrt(5)) / 2;
float diagonal = sqrt(( 5 + sqrt(5) ) / 2);
float s = r / diagonal;

void icosaedro(int x, int y) {
  
  pushMatrix();
  
  translate(x,y);
  beginShape(POINTS);
  // Los 12 puntos para hacer el icosaedro
  /*
  vertex(0,s,phi);
  vertex(0,-s,phi);
  vertex(0,s,-phi);
  vertex(0,-s,-phi);
  vertex(s,phi,0);
  vertex(-s,phi,0);
  vertex(s,-phi,0);
  vertex(-s,-phi,0);
  vertex(phi,0,s);
  vertex(-phi,0,s);
  vertex(phi,0,-s);
  vertex(-phi,0,-s);
  */
  
  line(0,s,phi,0,-s,phi);
  line(0,s,phi,s,phi,0);
  line(0,s,phi,-s,phi,0);
  line(0,s,-phi,-s,phi,0);
  line(0,s,-phi,0,-s,-phi);
  line(0,s,-phi,s,phi,0);
  line(s,phi,0,-s,phi,0);
  line(s,-phi,0,0,-s,phi);
  line(-s,-phi,0,0,-s,phi);
  line(s,-phi,0,0,-s,-phi);
  line(-s,-phi,0,0,-s,-phi);
  line(s,-phi,0,-s,-phi,0);
  line(phi,0,s,7*phi/8,3*phi/4,0);
  line(phi,0,-s,7*phi/8,3*phi/4,0);
  line(0,s,phi,7*phi/8,3*phi/4,0);
  line(0,s,-phi,7*phi/8,3*phi/4,0);
  line(s,phi,0,7*phi/8,3*phi/4,0);
  line(phi,0,s,0,s,phi);
  line(phi,0,-s,0,s,-phi);
  line(phi,0,s,phi,0,-s);
  line(-phi,0,s,-phi,0,-s);
  line(7*phi/8,-3*phi/4,0,phi,0,s);
  line(7*phi/8,-3*phi/4,0,phi,0,-s);
  line(7*phi/8,-3*phi/4,0,0,-s,phi);
  line(7*phi/8,-3*phi/4,0,0,-s,-phi);
  line(7*phi/8,-3*phi/4,0,s,-phi,0);
  line(phi,0,s,0,-s,phi);
  line(phi,0,-s,0,-s,-phi);
  
  endShape();
  
  beginShape(POINTS);
  
  /*vertex(phi,0,s);
  vertex(-phi,0,s);
  vertex(-phi,0,-s);
  vertex(7*phi/8,3*phi/4,0);
  vertex(7*phi/8,-3*phi/4,0);
  vertex(-7*phi/8,3*phi/4,0);
  vertex(-7*phi/8,-3*phi/4,0);*/
  
  endShape();
  
  popMatrix();
}
