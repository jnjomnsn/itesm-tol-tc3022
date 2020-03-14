 PImage texture;
 
 void setup() {
   surface.setResizable(true);
   size(1000,1000,P3D);

 }
 
 void draw() {
   texture = loadImage("textura.png");
   camera(mouseX, mouseY, (height/2)/tan(PI/6), width/2, height/2, 0, 0, 1, 0);
   background(255);
   icosahedron(200,200,0);
   dodecahedron(400,400,0);
     
 }
 
 void icosahedron(int x, int y, int z) {
   pushMatrix();
   //rotateX(frameCount*PI/200);
   rotateY(frameCount*PI/300);
   translate(x,y,z);
    
    fill(#787276);
    beginShape();
      vertex(0, -100, 50);
      vertex(0, -100, -50);   
      vertex(0, 100, -50);
      vertex(0, 100, 50);    
    endShape(CLOSE);
    
    fill(#828282);
    beginShape();
      vertex(-100, -50, 0);
      vertex(100, -50, 0);
      vertex(100, 50, 0);
      vertex(-100, 50, 0);    
    endShape(CLOSE);
    
    fill(#88807B);
    beginShape();
      vertex(-50, 0, 100);
      vertex(50, 0, 100);
      vertex(50, 0, -100);
      vertex(-50, 0, -100);  
    endShape(CLOSE);
    
    noFill();
    beginShape();
      vertex(100, 50, 0);
      vertex(0, 100, 50);
      vertex(50, 0, 100);
    endShape(CLOSE);
    beginShape();
      vertex(0, 100, -50);
      vertex(50, 0, -100);
      vertex(-50, 0, -100);
    endShape(CLOSE);
    beginShape();
      vertex(100, -50, 0);
      vertex(50, 0, 100);
      vertex(0, -100, 50);
    endShape(CLOSE);
    beginShape();
      vertex(-100, -50, 0);
      vertex(-50, 0, -100);
      vertex(-100, 50, 0);
    endShape(CLOSE);
    beginShape();
      vertex(100, 50, 0);
      vertex(0, 100, 50);
      vertex(0, 100, -50);
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
      vertex(-100, -50, 0);
      vertex(0, -100, -50);
      vertex(-50, 0, -100);
    endShape(CLOSE);
    beginShape();
      vertex(0, -100, -50);
      vertex(100, -50, 0);
      vertex(50, 0, -100);
    endShape(CLOSE);
    beginShape();
      vertex(-100, 50, 0);
      vertex(0, 100, 50);
      vertex(0, 100, -50);
    endShape(CLOSE);
    beginShape();
      vertex(50, 0, -100);
      vertex(100, 50, 0);
      vertex(0, 100, -50);
    endShape(CLOSE);
    popMatrix();
   
  
 }
 
 void dodecahedron(int x, int y, int z) {
   float goldenR = (1 + sqrt(5))/2;
   float goldenReverse= ((1 + sqrt(5))/2) - 1;
   float goldenPow = 1-pow(goldenReverse,2);
   pushMatrix();
   //rotateX(frameCount*PI/185);
   rotateY(frameCount*PI/-200);
   translate(x,y,z);
   
   beginShape();
     texture(texture);
     vertex(100,100,100);
     vertex(goldenR * 100,  0, goldenPow*100);
     vertex(100, -100,  100);
     vertex(0,-goldenPow*100,  goldenR*100);
     vertex(0,goldenPow*100, goldenR*100);
   endShape(CLOSE);
   beginShape();
     texture(texture);
     vertex(goldenR*100,0,goldenPow*100);
     vertex(goldenR*100,0,-goldenPow*100);
     vertex(100,100,-100);
     vertex(goldenPow*100,goldenR*100,0);
     vertex(100,100,100);
   endShape(CLOSE);
   beginShape();
     texture(texture);
     vertex(100,-100,100);
     vertex(goldenPow*100, -goldenR*100, 0);
     vertex(-goldenPow*100, -goldenR*100,0);
     vertex(-100,-100,100);
     vertex(0, -goldenPow*100,  goldenR*100);
   endShape(CLOSE);
   beginShape();
     texture(texture);
     vertex(100,100,-100);
     vertex(0,goldenPow*100, -goldenR*100);
     vertex(0,-goldenPow*100, -goldenR*100);
     vertex(100, -100, -100);
     vertex(goldenR*100,  0, -goldenPow*100);
   endShape(CLOSE);
   beginShape();
     texture(texture);
     vertex(-100,100,100);
     vertex(0,goldenPow*100, goldenR*100);
     vertex(0,-goldenPow*100,  goldenR*100);
     vertex(-100,-100,100);
     vertex(-goldenR*100,0,goldenPow*100);
   endShape(CLOSE);
   beginShape();
     texture(texture);
     vertex(-goldenPow*100,  goldenR*100,  0);
     vertex(-100,100, -100);
     vertex(-goldenR*100,0, -goldenPow*100);
     vertex(-goldenR*100,0,goldenPow*100);
     vertex(-100,100,100);
   endShape(CLOSE);
   beginShape();
     texture(texture);
     vertex(goldenPow*100, -goldenR*100,  0);
     vertex(100,-100,-100);
     vertex(goldenR*100,0, -goldenPow*100);
     vertex(goldenR*100,0,  goldenPow*100);
     vertex(100,-100,100);
   endShape(CLOSE);
   beginShape();
     texture(texture);
     vertex(100,100,-100);
     vertex(goldenPow*100, goldenR*100,0);
     vertex(-goldenPow*100, goldenR*100,0);
     vertex(-100,100,-100);
     vertex(0,goldenPow*100, -goldenR*100);
   endShape(CLOSE);
   beginShape();
     texture(texture);
     vertex(-100,100,-100);
     vertex(-goldenR*100,  0, -goldenPow*100);
     vertex(-100, -100, -100);
     vertex(0, -goldenPow*100, -goldenR*100);
     vertex(0,  goldenPow*100, -goldenR*100);
   endShape(CLOSE);
   beginShape();
     texture(texture);
     vertex(100,-100,-100);
     vertex(0, -goldenPow*100, -goldenR*100);
     vertex(-100, -100,-100);
     vertex(-goldenPow*100, -goldenR*100,  0);
     vertex(goldenPow*100, -goldenR*100,  0);
   endShape(CLOSE);
   beginShape();
     texture(texture);
     vertex(-goldenPow*100, -goldenR*100,  0);
     vertex(-100, -100, -100);
     vertex(-goldenR*100,0, -goldenPow*100);
     vertex(-goldenR*100,0, goldenPow*100);
     vertex(-100, -100, 100);
   endShape(CLOSE);
  
   popMatrix();
 }
