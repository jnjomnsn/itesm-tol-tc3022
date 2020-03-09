 void setup() {
   size(500,500,P3D);
 }
 
 void draw() {
   translate(250, 250);
   polygons3d();
 }
 
 void polygons3d() {
  beginShape();
  vertex(-100,-100,-100);
  vertex(100,-100,-100);
  vertex(0,0,100);
  
  vertex(100,-100,-100);
  vertex(100,100,-100);
  vertex(0,0,100);
  
  vertex(-100,100,-100);
  vertex(-100,-100,-100);
  vertex(0,0,100);
  endShape();
 }
