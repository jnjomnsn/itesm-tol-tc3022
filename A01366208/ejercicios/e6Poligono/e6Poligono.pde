PImage img;
float angulo=0.0;
float velocidad=0.04;

void setup(){
  size(900,800,P3D);
  surface.setResizable(true);
  img = loadImage("textura.png");
}

void draw(){
  background(255);
  noStroke();
  lights();
  camera(mouseX, mouseY, (height/2)/tan(PI/6), width/2, height/2, 0, 1, 0, 0); 
  //icosaedro(width/2,height/2,0);
  dodecaedro(width/2,height/2,0);
}

void icosaedro(int x, int y, int z){

  
  float a = height/4;
  float b = width/3;
  pushMatrix();
  translate(x, y, z);
  
 
  rotateZ(radians(180));
  rotate(angulo);
  angulo+=velocidad;
  
  beginShape();
   texture(img);
  vertex(-a, 0, b);
  vertex(a, 0, b);
  vertex(a, 0, -b);
  vertex(-a, 0, -b);
  endShape(CLOSE);
  
  beginShape();
  texture(img);
  vertex(-b, a, 0);
  vertex(b, a, 0);
  vertex(b, -a, 0);
  vertex(-b, -a, 0);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(0, b, a);
  vertex(0, b, -a);
  vertex(0, -b, -a);
  vertex(0, -b, a);
  endShape(CLOSE);
  
  noFill();
  stroke(#CC3333);
  
  
  beginShape(TRIANGLE_FAN);
  vertex(a, 0, b);
  vertex(0, b, a);
  vertex(b, a, 0);
  vertex(b, -a, 0);
  vertex(0, -b, a);
  vertex(-a, 0, b);
  vertex(0, b, a);
  endShape(CLOSE);

  beginShape(TRIANGLE_FAN);
  vertex(-a, 0, b);
  vertex(0, b, a);
  vertex(-b, a, 0);
  vertex(-b, -a, 0);
  vertex(0, -b, a);
  endShape(CLOSE);

  beginShape(TRIANGLE_FAN);
  vertex(a, 0, -b);
  vertex(0, b, -a);
  vertex(b, a, 0);
  vertex(b, -a, 0);
  vertex(0, -b, -a);
  vertex(-a, 0, -b);
  vertex(0, b, -a);
  endShape(CLOSE);

  beginShape(TRIANGLE_FAN);
  vertex(-a, 0, -b);
  vertex(0, b, -a);
  vertex(-b, a, 0);
  vertex(-b, -a, 0);
  vertex(0, -b, -a);
  endShape(CLOSE);
  
  popMatrix();
  }

void dodecaedro(int x, int y, int z){
  float tamano = width/6;
  float gold = 1.618033;
  float a=gold*tamano;
  float goldenr=0.618033;
  float b=(1-pow(goldenr,2))*tamano;

  
  pushMatrix();
  
  translate(x,y,z);
  rotateX(radians(180));
  rotate(angulo);
  angulo += velocidad;
    
  beginShape();
  texture(img);
  vertex(tamano,tamano,tamano);
  vertex(a,  0, 30.9);
  vertex(tamano, -tamano,  tamano);
  vertex(0,-b,  a);
  vertex(0,b, a);
  endShape(CLOSE);
  
  beginShape();
  texture(img);
  vertex(a,0,b);
  vertex(a,0,-b);
  vertex(tamano,tamano,-tamano);
  vertex(b,a,0);
  vertex(tamano,tamano,tamano);
  endShape(CLOSE);
  
  beginShape();
  texture(img);
  vertex(tamano,-tamano,tamano);
  vertex(b, -a, 0);
  vertex(-b, -a,0);
  vertex(-tamano,-tamano,tamano);
  vertex(0, -b,a);
  endShape(CLOSE);
  
  beginShape();
  texture(img);
  vertex(tamano,tamano,-tamano);
  vertex(0,b, -a);
  vertex(0,-b, -a);
  vertex(tamano, -tamano, -tamano);
  vertex(a,  0, -b);
  endShape(CLOSE);
  
  beginShape();
  texture(img);
  vertex(b, -a,  0);
  vertex(tamano,-tamano,-tamano);
  vertex(a,0, -b);
  vertex(a,0,  b);
  vertex(tamano,-tamano,tamano);
  endShape(CLOSE);
  
  beginShape();
  texture(img);
  vertex(tamano,-tamano,-tamano);
  vertex(0, -b, -a);
  vertex(-tamano, -tamano,-tamano);
  vertex(-b, -a,  0);
  vertex(b, -a,  0);
  endShape(CLOSE);
  
  beginShape();
  texture(img);
  vertex(-tamano,tamano,tamano);
  vertex(0,b, a);
  vertex(0,-b,  a);
  vertex(-tamano,-tamano,tamano);
  vertex(-a,0,b);
  endShape(CLOSE);
  
   beginShape();
   texture(img);
  vertex(tamano,tamano,-tamano);
  vertex(b, a,0);
  vertex(-b, a,0);
  vertex(-tamano,tamano,-tamano);
  vertex(0,b, -a);
  endShape(CLOSE);
  
  beginShape();
  texture(img);
  vertex(-tamano,tamano,-tamano);
  vertex(-a,  0, -b);
  vertex(-tamano, -tamano, -tamano);
  vertex(0, -b, -a);
  vertex(0,  b, -a);
  endShape(CLOSE);
  beginShape();
  texture(img);
  vertex(-b, -a,  0);
  vertex(-tamano, -tamano, -tamano);
  vertex(-a,0, -b);
  vertex(-a,0, b);
  vertex(-tamano, -tamano, tamano);
  endShape(CLOSE);
  
   beginShape();
   texture(img);
  vertex(-b,  a,  0);
  vertex(-tamano,tamano, -tamano);
  vertex(-a,0, -b);
  vertex(-a,0,b);
  vertex(-tamano,tamano,tamano);
  endShape(CLOSE);
  popMatrix();
}
