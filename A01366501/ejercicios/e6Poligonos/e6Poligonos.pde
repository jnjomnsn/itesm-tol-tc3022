// Simple library for orbital camera: PeasyCam (Sketch -> Import Library -> PeasyCam -> Install)
import peasy.*;
PeasyCam camera;

// Width and height values.
float w = 0, h = 0;

// Number of vertices for the dodecahedron.
int numFaces = 12, numVertices = 5;

// Golden ratio for regular dodecahedrons = (1 + sqr(5) / 2) from Wikipedia.
final float golden_ratio = 1.618033989; 
final float golden_ratio_inverse = 0.618033989;

PImage loadedTexture = null;

void setup(){
  size( 600, 600, P3D);  
  
  lights();
  w = width;
  h = height;
  
  camera = new PeasyCam(this,250, 250, 10, 500);
  
  loadedTexture = loadImage("texture.JPG");
}

void draw(){
  background(255);
  lights();
  
  //icosaedro(250, 250, 0);
  dodecaedro(250, 250, 0);

}

// Method called after each draw
void pre() {
  if (w != width || h != height) {
    // Sketch window has resized
    w = width;
    h = height;

  }
}

void icosaedro(int x, int y, int z){
  
  // Translate to the origin
  pushMatrix();
  
    translate(x,y,z);
    
    // Scale according the original coordinates
    scale(w/500);
    
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


void dodecaedro(int x, int y, int z){
  
  PVector[] vVector = new PVector[20];
  int[][] fVector =  new int[numFaces][numVertices];
  

  pushMatrix();
  
    // Move to origin. 
    translate(x,y,z);
    
    // Scale according the original coordinates
    scale(w/500);
    
    // Set vertices in the array of vectors (using the formulas from https://en.wikipedia.org/wiki/Dodecahedron#Regular_dodecahedra).
    vVector[0] = new PVector( 100,  100,  100);
    vVector[1] = new PVector( 100,  100, -100);
    vVector[2] = new PVector( 100, -100,  100);
    vVector[3] = new PVector( 100, -100, -100);  
    vVector[4] = new PVector(-100,  100,  100);
    vVector[5] = new PVector(-100,  100, -100);
    vVector[6] = new PVector(-100, -100,  100);
    vVector[7] = new PVector(-100, -100, -100); 
    vVector[8] = new PVector( 0,  golden_ratio_inverse*100,  golden_ratio*100);
    vVector[9] = new PVector( 0,  golden_ratio_inverse*100, -golden_ratio*100);
    vVector[10] = new PVector( 0, -golden_ratio_inverse*100,  golden_ratio*100);
    vVector[11] = new PVector( 0, -golden_ratio_inverse*100, -golden_ratio*100); 
    vVector[12] = new PVector( golden_ratio_inverse*100,  golden_ratio*100,  0*100);
    vVector[13] = new PVector( golden_ratio_inverse*100, -golden_ratio*100,  0);
    vVector[14] = new PVector(-golden_ratio_inverse*100,  golden_ratio*100,  0);
    vVector[15] = new PVector(-golden_ratio_inverse*100, -golden_ratio*100,  0);
    vVector[16] = new PVector( golden_ratio*100,  0,  golden_ratio_inverse*100);
    vVector[17] = new PVector( golden_ratio*100,  0, -golden_ratio_inverse*100);
    vVector[18] = new PVector(-golden_ratio*100,  0,  golden_ratio_inverse*100);
    vVector[19] = new PVector(-golden_ratio*100,  0, -golden_ratio_inverse*100); 
    
    // Set faces in order of placement in the matrix of faces.
    fVector[0] = new int[] { 0, 16,  2, 10,  8};
    fVector[1] = new int[] { 0,  8,  4, 14, 12};
    fVector[2] = new int[] {16, 17,  1, 12,  0};
    fVector[3] = new int[] { 1,  9, 11,  3, 17};
    fVector[4] = new int[] { 1, 12, 14,  5,  9};
    fVector[5] = new int[] { 2, 13, 15,  6, 10};
    fVector[6] = new int[] {13,  3, 17, 16,  2};
    fVector[7] = new int[] { 3, 11,  7, 15, 13};
    fVector[8] = new int[] { 4,  8, 10,  6, 18};
    fVector[9] = new int[] {14,  5, 19, 18,  4};
    fVector[10] = new int[] { 5, 19,  7, 11,  9};
    fVector[11] = new int[] {15,  7, 19, 18,  6};
    
    for (int i = 0; i < numFaces; i = i+1) {
      beginShape();
      texture(loadedTexture);
      for (int j = 0; j < numVertices; j = j+1) {
        vertex(vVector[fVector[i][j]].x,vVector[fVector[i][j]].y,vVector[fVector[i][j]].z, vVector[fVector[i][j]].x, vVector[fVector[i][j]].z);
      }
      endShape(CLOSE);
    }
  
  popMatrix();

}
