// Simple library for orbital camera: PeasyCam (Sketch -> Import Library -> PeasyCam -> Install)
import peasy.*;
PeasyCam camera;

void setup(){
  size(500, 500, P3D);  
  
  camera = new PeasyCam(this,250, 250, 10, 500);
}

void draw(){
  background(255);
  lights();
  icosaedro(250, 250, 0);

}

void icosaedro(int x, int y, int z){
  
  // Translate to the origin
  pushMatrix();
  
    translate(x,y,z);
    
    // Draw the rectangle # 1.
    fill(255,255,0);
    beginShape();
      vertex(-100, -50, 0);
      vertex(100, -50, 0);
      vertex(100, 50, 0);
      vertex(-100, 50, 0);    
    endShape(CLOSE);
     
    // Draw the rectangle # 2.
    fill(0,255,255);
    beginShape();
      vertex(0, -100, 50);
      vertex(0, -100, -50);   
      vertex(0, 100, -50);
      vertex(0, 100, 50);    
    endShape(CLOSE);
    
    // Draw the rectangle # 3.
    fill(255,0,255);
    beginShape();
      vertex(-50, 0, 100);
      vertex(50, 0, 100);
      vertex(50, 0, -100);
      vertex(-50, 0, -100);  
    endShape(CLOSE);
    
    // Draw the points.
    noFill();
    beginShape();
      vertex(100, 50, 0);
      vertex(0, 100, 50);
      vertex(50, 0, 100);
    endShape(CLOSE);
    beginShape();
      vertex(100, -50, 0);
      vertex(50, 0, 100);
      vertex(0, -100, 50);
    endShape(CLOSE);
    beginShape();
      vertex(0, 100, 50);
      vertex(-100, 50, 0);
      vertex(-50, 0, 100);
    endShape(CLOSE);
    beginShape();
      vertex(0, -100, 50);
      vertex(-50, 0, 100);
      vertex(-100, -50, 0);
    endShape(CLOSE);
    beginShape();
      vertex(100, 50, 0);
      vertex(0, 100, 50);
      vertex(0, 100, -50);
    endShape(CLOSE);
    beginShape();
      vertex(-100, 50, 0);
      vertex(0, 100, 50);
      vertex(0, 100, -50);
    endShape(CLOSE);
    beginShape();
      vertex(-100, -50, 0);
      vertex(0, -100, -50);
      vertex(-50, 0, -100);
    endShape(CLOSE);
    beginShape();
      vertex(0, 100, -50);
      vertex(50, 0, -100);
      vertex(-50, 0, -100);
    endShape(CLOSE);
    beginShape();
      vertex(0, -100, -50);
      vertex(100, -50, 0);
      vertex(50, 0, -100);
    endShape(CLOSE);
    beginShape();
      vertex(50, 0, -100);
      vertex(100, 50, 0);
      vertex(0, 100, -50);
    endShape(CLOSE);
    beginShape();
      vertex(-100, -50, 0);
      vertex(-50, 0, -100);
      vertex(-100, 50, 0);
    endShape(CLOSE);

  popMatrix();

}
