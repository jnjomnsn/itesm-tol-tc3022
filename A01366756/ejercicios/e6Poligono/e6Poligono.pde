import peasy.*;

PeasyCam cam;
PImage img;
float angle = 0.0;
float d = 1000;
boolean isRotating = true; 
int counterForRotation=0;

void setup(){
  size(700,500,P3D);
  img = loadImage("texture.png");
  cam = new PeasyCam(this, 0, 0, 0, 50);
}

void draw(){
  background(0);
  noStroke();
  lights();
  //icosaedro(width/2,height/2,0);
  dodecaedro(width/2,height/2,0);
  camera(mouseX, mouseY, (height/2)/tan(PI/6), width/2, height/2, 0, 0, 1, 0);
}

void icosaedro(int x, int y, int z){

  float widthRect = width/4;
  float heightRect = height/6;

  translate(x, y, z);

  counterForRotation++;
  rotateY(radians(counterForRotation));    // rotate

  //plano 0 en z, con width en x y height en y
  beginShape();
  vertex(-widthRect, heightRect, 0);
  vertex(widthRect, heightRect, 0);
  vertex(widthRect, -heightRect, 0);
  vertex(-widthRect, -heightRect, 0);
  endShape(CLOSE);

  //plano 0 en x con width en y y height en z
  beginShape();
  vertex(0, widthRect, heightRect);
  vertex(0, widthRect, -heightRect);
  vertex(0, -widthRect, -heightRect);
  vertex(0, -widthRect, heightRect);
  endShape(CLOSE);
  
  //plano 0 en y con width en z y height en x
  beginShape();
  vertex(-heightRect, 0, widthRect);
  vertex(heightRect, 0, widthRect);
  vertex(heightRect, 0, -widthRect);
  vertex(-heightRect, 0, -widthRect);
  endShape(CLOSE);

  noFill();
  stroke(#33FF43);
  beginShape(TRIANGLE_FAN);
  //centro
  vertex(heightRect, 0, widthRect);
  vertex(0, widthRect, heightRect);
  vertex(widthRect, heightRect, 0);
  vertex(widthRect, -heightRect, 0);
  vertex(0, -widthRect, heightRect);
  vertex(-heightRect, 0, widthRect);
  vertex(0, widthRect, heightRect);
  endShape(CLOSE);

  beginShape(TRIANGLE_FAN);
  //centro
  vertex(-heightRect, 0, widthRect);
  vertex(0, widthRect, heightRect);
  vertex(-widthRect, heightRect, 0);
  vertex(-widthRect, -heightRect, 0);
  vertex(0, -widthRect, heightRect);
  endShape(CLOSE);

  beginShape(TRIANGLE_FAN);
  //centro
  vertex(heightRect, 0, -widthRect);
  vertex(0, widthRect, -heightRect);
  vertex(widthRect, heightRect, 0);
  vertex(widthRect, -heightRect, 0);
  vertex(0, -widthRect, -heightRect);
  vertex(-heightRect, 0, -widthRect);
  vertex(0, widthRect, -heightRect);
  endShape(CLOSE);

  beginShape(TRIANGLE_FAN);
  //centro
  vertex(-heightRect, 0, -widthRect);
  vertex(0, widthRect, -heightRect);
  vertex(-widthRect, heightRect, 0);
  vertex(-widthRect, -heightRect, 0);
  vertex(0, -widthRect, -heightRect);
  endShape(CLOSE);

  beginShape(LINES);
  vertex(0, -widthRect, -heightRect);
  vertex(0, -widthRect, heightRect);
  endShape(CLOSE);

  beginShape(LINES);
  vertex(0, widthRect, -heightRect);
  vertex(0, widthRect, heightRect);
  endShape(CLOSE);
  fill(255);
}


void dodecaedro(int x, int y, int z){
  float goldenRatio = 1.618033;
  float invGoldenRatio = 0.618033;
  float cubeSize = width/8;
  float widthRectIco = cubeSize*invGoldenRatio;
  float heightRect = cubeSize*goldenRatio;
  
  translate(x, y, z);
  
  counterForRotation++;
  rotateY(radians(counterForRotation));    // rotate

  noFill();
  stroke(#09fbc3);
  beginShape();
  texture(img);
  vertex(0, -widthRectIco, heightRect, 0, -widthRectIco);
  vertex(-cubeSize, -cubeSize, cubeSize,-cubeSize, -cubeSize);
  vertex(-widthRectIco, -heightRect, 0, -widthRectIco, -heightRect);
  vertex(widthRectIco, -heightRect, 0, widthRectIco, -heightRect);
  vertex(cubeSize, -cubeSize, cubeSize, cubeSize, -cubeSize);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(widthRectIco, -heightRect, 0, widthRectIco, -heightRect);
  vertex(cubeSize, -cubeSize, -cubeSize, cubeSize, -cubeSize);
  vertex(heightRect, 0, -widthRectIco, heightRect, 0);
  vertex(heightRect, 0, widthRectIco, heightRect, 0);
  vertex(cubeSize, -cubeSize, cubeSize, cubeSize, -cubeSize);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(heightRect, 0, widthRectIco, heightRect, 0);
  vertex(cubeSize, cubeSize, cubeSize, cubeSize, cubeSize);
  vertex(0, widthRectIco, heightRect, 0, widthRectIco);
  vertex(0, -widthRectIco, heightRect, 0, -widthRectIco);
  vertex(cubeSize, -cubeSize, cubeSize, cubeSize, -cubeSize);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(0, widthRectIco, heightRect, 0, widthRectIco);
  vertex(-cubeSize, cubeSize, cubeSize, -cubeSize, cubeSize);
  vertex(-widthRectIco, heightRect, 0, -widthRectIco, heightRect);
  vertex(widthRectIco, heightRect, 0, widthRectIco, heightRect);
  vertex(cubeSize, cubeSize, cubeSize, cubeSize, cubeSize);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(cubeSize, cubeSize, -cubeSize, cubeSize, cubeSize);
  vertex(heightRect, 0, -widthRectIco, heightRect, 0);
  vertex(heightRect, 0, widthRectIco, heightRect, 0);
  vertex(cubeSize, cubeSize, cubeSize,cubeSize, cubeSize);
  vertex(widthRectIco, heightRect, 0, widthRectIco, heightRect);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(-cubeSize, -cubeSize, -cubeSize, -cubeSize, -cubeSize);
  vertex(-heightRect, 0, -widthRectIco, -heightRect, 0);
  vertex(-heightRect, 0, widthRectIco, -heightRect, 0);
  vertex(-cubeSize, -cubeSize, cubeSize, -cubeSize, -cubeSize);
  vertex(-widthRectIco, -heightRect, 0, -widthRectIco, -heightRect);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(-heightRect, 0, -widthRectIco, -heightRect, 0);
  vertex(-heightRect, 0, widthRectIco, -heightRect, 0);
  vertex(-cubeSize, cubeSize, cubeSize, -cubeSize, cubeSize);
  vertex(-widthRectIco, heightRect, 0, -widthRectIco, heightRect);
  vertex(-cubeSize, cubeSize, -cubeSize, -cubeSize, cubeSize);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(-heightRect, 0, widthRectIco, -heightRect, 0);
  vertex(-cubeSize, -cubeSize, cubeSize, -cubeSize, -cubeSize);
  vertex(0, -widthRectIco, heightRect, 0, -widthRectIco);
  vertex(0, widthRectIco, heightRect, 0, widthRectIco);
  vertex(-cubeSize, cubeSize, cubeSize, -cubeSize, cubeSize);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(0,widthRectIco, -heightRect, 0,widthRectIco);
  vertex(cubeSize, cubeSize, -cubeSize, cubeSize, cubeSize);
  vertex(widthRectIco, heightRect, 0, widthRectIco, heightRect);
  vertex(-widthRectIco, heightRect, 0, -widthRectIco, heightRect);
  vertex(-cubeSize, cubeSize, -cubeSize, -cubeSize, cubeSize);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(0,-widthRectIco, -heightRect, 0,-widthRectIco);
  vertex(cubeSize, -cubeSize, -cubeSize, cubeSize, -cubeSize);
  vertex(widthRectIco, -heightRect, 0, widthRectIco, -heightRect);
  vertex(-widthRectIco, -heightRect, 0, -widthRectIco, -heightRect);
  vertex(-cubeSize, -cubeSize, -cubeSize, -cubeSize, -cubeSize);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(0,-widthRectIco, -heightRect, 0,-widthRectIco);
  vertex(cubeSize, -cubeSize, -cubeSize, cubeSize, -cubeSize);
  vertex(heightRect, 0, -widthRectIco, heightRect, 0);
  vertex(cubeSize, cubeSize, -cubeSize, cubeSize, cubeSize);
  vertex(0,widthRectIco, -heightRect, 0,widthRectIco);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(0,-widthRectIco, -heightRect, 0,-widthRectIco);
  vertex(-cubeSize, -cubeSize, -cubeSize, -cubeSize, -cubeSize);
  vertex(-heightRect, 0, -widthRectIco, -heightRect, 0);
  vertex(-cubeSize, cubeSize, -cubeSize, -cubeSize, cubeSize);
  vertex(0,widthRectIco, -heightRect, 0, widthRectIco);
  endShape(CLOSE);
}