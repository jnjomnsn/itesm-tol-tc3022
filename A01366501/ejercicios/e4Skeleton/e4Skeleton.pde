// Simple library for orbital camera: PeasyCam (Sketch -> Import Library -> PeasyCam -> Install)
import peasy.*;
PeasyCam camera;

void setup(){
  size(500, 900, P3D);
  
  camera = new PeasyCam(this,250, 100, 20, 900);
  
}

void draw(){
  background(0);
  noStroke();
  lights();
  skeleton(250, 100, 20, 180);

}

void skeleton(int x, int y, int z, float sHeight){
  
  // Translate to the origin
  translate(x,y,z);

  float realHeight = -y-sHeight;
  
  // Draw head
  pushMatrix();
    fill(#ffe6e6);
    translate(0,realHeight,0);
    sphere(30);
  popMatrix();
  
  // Draw torso
  pushMatrix();
    fill(#b3d9ff);
    translate(0, realHeight+80, 0); 
    box(50, 100, 50);
  popMatrix();
  
  // Draw first arm
  pushMatrix();
    fill(#ffe6e6);
    translate(55, realHeight+70, 0); 
    rotate(radians(-30));
    box(20, 100, 20);
  popMatrix();
  
  // Draw second arm
  pushMatrix();
    fill(#ffe6e6);
    translate(-55, realHeight+70, 0); 
    rotate(radians(30));
    box(20, 100, 20);
  popMatrix();
  
  fill(#7b1d08);
  // Draw first leg
  pushMatrix();
    translate(12, realHeight+190, 0);
    box(20, 150, 20);
  popMatrix();
  
  // Draw second leg
  pushMatrix();
    translate(-12, realHeight+190, 0);
    box(20, 150, 20);
  popMatrix();
  
  // Draw a plane
  pushMatrix();
    fill(#0dc651);
    rotateX(radians(90));
    translate(-150, -150, 14);  // Add the radius of the head to the (z-axis - 1) to touch the figure.
    rect(0,0,300,300);
  popMatrix();

}
