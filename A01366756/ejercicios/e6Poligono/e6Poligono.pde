import peasy.*;

PeasyCam cam;
PImage img;
float angle = 0.0;
float d = 1000;
boolean isRotating = true;
//variables for the rotation of the figures
float counterForRotationX=0, counterForRotationY=0;

void setup(){
  size(700,500,P3D);
  img = loadImage("texture.png");
}

void draw(){
  background(0);
  noStroke();
  lights();
  //icosaedro(width/2,height/2,0);
  dodecaedro(width/2,height/2,0);
}

void icosaedro(int x, int y, int z){

  float widthRect = width/4;
  float heightRect = height/6;

  translate(x, y, z);

  rotateFigure(true);

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
  
  rotateFigure(true);

  noFill();
  stroke(#09fbc3);
  beginShape();
  texture(img);
  vertex(0, -widthRectIco, heightRect, 303,256);
  vertex(-cubeSize, -cubeSize, cubeSize,417,337);
  vertex(-widthRectIco, -heightRect, 0, 373,472);
  vertex(widthRectIco, -heightRect, 0, 232,472);
  vertex(cubeSize, -cubeSize, cubeSize, 188,337);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(widthRectIco, -heightRect, 0, 303,256);
  vertex(cubeSize, -cubeSize, -cubeSize,417,337);
  vertex(heightRect, 0, -widthRectIco,373,472);
  vertex(heightRect, 0, widthRectIco,232,472);
  vertex(cubeSize, -cubeSize, cubeSize, 188,337);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(heightRect, 0, widthRectIco, 303,256);
  vertex(cubeSize, cubeSize, cubeSize,417,337);
  vertex(0, widthRectIco, heightRect,373,472);
  vertex(0, -widthRectIco, heightRect, 232,472);
  vertex(cubeSize, -cubeSize, cubeSize, 188,337);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(0, widthRectIco, heightRect, 303,256);
  vertex(-cubeSize, cubeSize, cubeSize, 417,337);
  vertex(-widthRectIco, heightRect, 0, 373,472);
  vertex(widthRectIco, heightRect, 0, 232,472);
  vertex(cubeSize, cubeSize, cubeSize, 188,337);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(cubeSize, cubeSize, -cubeSize, 303,256);
  vertex(heightRect, 0, -widthRectIco, 417,337);
  vertex(heightRect, 0, widthRectIco, 373,472);
  vertex(cubeSize, cubeSize, cubeSize, 232,472);
  vertex(widthRectIco, heightRect, 0, 188,337);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(-cubeSize, -cubeSize, -cubeSize, 303,256);
  vertex(-heightRect, 0, -widthRectIco, 417,337);
  vertex(-heightRect, 0, widthRectIco, 373,472);
  vertex(-cubeSize, -cubeSize, cubeSize, 232,472);
  vertex(-widthRectIco, -heightRect, 0, 188,337);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(-heightRect, 0, -widthRectIco, 303,256);
  vertex(-heightRect, 0, widthRectIco, 417,337);
  vertex(-cubeSize, cubeSize, cubeSize,373,472);
  vertex(-widthRectIco, heightRect, 0, 232,472);
  vertex(-cubeSize, cubeSize, -cubeSize, 188,337);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(-heightRect, 0, widthRectIco, 303,256);
  vertex(-cubeSize, -cubeSize, cubeSize, 417,337);
  vertex(0, -widthRectIco, heightRect, 373,472);
  vertex(0, widthRectIco, heightRect, 232,472);
  vertex(-cubeSize, cubeSize, cubeSize, 188,337);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(0,widthRectIco, -heightRect, 303,256);
  vertex(cubeSize, cubeSize, -cubeSize, 417,337);
  vertex(widthRectIco, heightRect, 0, 373,472);
  vertex(-widthRectIco, heightRect, 0, 232,472);
  vertex(-cubeSize, cubeSize, -cubeSize, 188,337);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(0,-widthRectIco, -heightRect, 303,256);
  vertex(cubeSize, -cubeSize, -cubeSize, 417,337);
  vertex(widthRectIco, -heightRect, 0, 373,472);
  vertex(-widthRectIco, -heightRect, 0, 232,472);
  vertex(-cubeSize, -cubeSize, -cubeSize,188,337);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(0,-widthRectIco, -heightRect, 303,256);
  vertex(cubeSize, -cubeSize, -cubeSize, 417,337);
  vertex(heightRect, 0, -widthRectIco, 373,472);
  vertex(cubeSize, cubeSize, -cubeSize, 232,472);
  vertex(0,widthRectIco, -heightRect, 188,337);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(0,-widthRectIco, -heightRect, 303,256);
  vertex(-cubeSize, -cubeSize, -cubeSize, 417,337);
  vertex(-heightRect, 0, -widthRectIco, 373,472);
  vertex(-cubeSize, cubeSize, -cubeSize, 232,472);
  vertex(0,widthRectIco, -heightRect, 188,337);
  endShape(CLOSE);
}

void rotateFigure(boolean positiveDirection){
  if (positiveDirection)
    counterForRotationX++;
  else
    counterForRotationX--;

  rotateY(radians(counterForRotationX));
  rotateX(radians(counterForRotationY));
}

void mouseDragged() {
  counterForRotationX = mouseX/5;
  counterForRotationY = -mouseY/5;
}