
//estas variables nos permiten hacer la rotación de nuestra escena
float counterForRotationX=0, counterForRotationY=0;
//esta variable guarda la imagen de nuestro fondo
PImage bimg;
//esta variable nos permite hacer la escala de nuestra escena 
float scaleFactor;

void setup() {
  scaleFactor = 1;
  size(800, 800,P3D);
  smooth();
  stroke(1);
  bimg=loadImage("trippy.jpg");
}

void draw(){
  scale(scaleFactor);
  //definimos el background
  background(bimg);
  //llamamos a la funcion drawtriangle la cual dubujará nuestra piramide
  drawTriangle();
}
//esta funcion dibuja los triangulos recursivamente a partir del numero de iteraciones o subtriangulos que se requieran (n)
void sierpinskyT(float x1, float y1, float x2, float y2, float x3, float y3, int n) {
  if ( n > 0 ) {
    //randomizamos el color de los triangulos 
    fill(random(50,255), random(50,255), random(50,255));
    //dibujamos los triangulos
    triangle(x1, y1, x2, y2, x3, y3);
    //obtenemos las coordenadas de las coordenadas de los nuevos subtriangulos
    float h1 = (x1+x2)/2.0;
    float w1 = (y1+y2)/2.0;
    float h2 = (x2+x3)/2.0;
    float w2 = (y2+y3)/2.0;
    float h3 = (x3+x1)/2.0;
    float w3 = (y3+y1)/2.0;
    
    //hacemos la recursion con los  los subtriangulos
    sierpinskyT(x1, y1, h1, w1, h3, w3, n-1);
    sierpinskyT(h1, w1, x2, y2, h2, w2, n-1);
    sierpinskyT(h3, w3, h2, w2, x3, y3, n-1);
  }
}

//esta funcion hace rotar nuestra poramide a través del eje X
void rotateFigure(boolean positiveDirection){
    translate(350,0,-350);
    float rotateRate = 0.25;
    //contadores para elegir la dirección de la rotación    
    if (positiveDirection)
        counterForRotationX+= rotateRate;
    else
        counterForRotationX-= rotateRate;
    //rotar el plano como corresponda
    rotateY(radians(counterForRotationX));
    rotateX(radians(counterForRotationY));
}

//esta funcion llama a las fucniones correspondientes para dibujar cada cara de la piramide
void drawTriangle(){
  rotateFigure(true);
  drawFace1();
  drawFace2();
  drawFace3();
  drawFace4(); 
}

//esta funcion dibuja la primera cara de la piramide
void drawFace1(){
  pushMatrix();
  rotateX(radians(35));
  sierpinskyT(0, 606, 350, 0, 700, 606, 6);
  popMatrix();
}
//esta funcion dibuja la segunda cara de la piramide
void drawFace2(){
  pushMatrix();
  translate(700, 0, 0);
  rotateY(1.5708);
  translate(-350, 0, -350);
  rotateX(radians(35));
  sierpinskyT(0, 606, 350, 0, 700, 606, 6);
  popMatrix();
}

//esta funcion dibuja la tercera cara de la piramide
void drawFace3(){
  pushMatrix();
  rotateX(radians(-35));
  sierpinskyT(0, 606, 350, 0, 700, 606, 6);
  popMatrix();
}

//esta funcion dibuja la cuarta cara de la piramide
void drawFace4(){
  pushMatrix();
  translate(700, 0, 0);
  rotateY(1.5708);
  translate(-350, 0, -350);
  rotateX(radians(-35));
  sierpinskyT(0, 606, 350, 0, 700, 606, 6);
  
  popMatrix();
}

//esta función nos permite hacer zoom a nuestra escena por medio de la rueda del mouse
void mouseWheel(MouseEvent e)
{
  scaleFactor += e.getAmount() / 100;
 
  if (scaleFactor < 1.0) scaleFactor = 1.0;
 
  if (scaleFactor > 2.0) scaleFactor = 2.0;
}
