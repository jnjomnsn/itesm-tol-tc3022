import peasy.*;

float x1=2 * 100, x2=5 * 100, x3 = 3.5 * 100;
float y1 = 3.59808 * 100, y2=3.59807 * 100, y3 = 1.00192 * 100;
float altura = abs(x1-x2) * sqrt(3)/2;//altura del triangulo
float largo_cuadrado = abs(x1-x2);//longitud del lado del cuadrado
int contador = 0;
float rot = 0;
int NIVELES_TRIANGULO = 4; //permite incrementar el número triangulos o niveles

//Variables del punto medio del lado de un triangulo que ocupa la función triangulo()
float mid_X1, mid_Y1, mid_X2, mid_Y2, mid_X3, mid_Y3;
PeasyCam cam;

float X = 300, Y = 200;

void setup() {
  size(800, 600, P3D);
   cam = new PeasyCam(this, x1,  y1, 0, 500);
}

void draw() {
  background(255);
  pushMatrix();
  rotateX(radians(180));
  rot += .02;  
  translate(width/2,  height/2,0);
  rotateY(rot);
  drawRect(x1,y1 +150,largo_cuadrado+ (largo_cuadrado*.25), largo_cuadrado);
  piramide();
  popMatrix();
}

void piramide() {
  //Triangulo 1
 pushMatrix();
  translate(0,y1,0);
  rotateX(radians(90));
  translate(x1 - largo_cuadrado*.7,largo_cuadrado*.2,x1-(largo_cuadrado + largo_cuadrado*.8));
  rotateX(radians(30));
  trianguloGrande(x1, y1, x2, y2, x3, y3);
  triangulo(mid_X1, mid_Y1,mid_X2, mid_Y2, mid_X3, mid_Y3, 3);
  popMatrix();
  //Triangulo 2
   pushMatrix();
  translate(0,y1,0);
  rotateX(radians(90));
  translate(x1 - largo_cuadrado*.7,largo_cuadrado*.2,x1-(largo_cuadrado + largo_cuadrado*.4));
  rotateX(radians(-30));
  trianguloGrande(x1, y1, x2, y2, x3, y3);
  triangulo(mid_X1, mid_Y1,mid_X2, mid_Y2, mid_X3, mid_Y3, 3);
  popMatrix();
  //Triangulo 3
  pushMatrix();
  translate(x1,largo_cuadrado,0);
  rotateX(radians(90));
  rotateY(radians(90));
  //rotateZ(radians(10));
  trianguloGrande(x1, y1, x2, y2, x3, y3);
  triangulo(mid_X1, mid_Y1,mid_X2, mid_Y2, mid_X3, mid_Y3, 4);
  popMatrix();

  //Triangulo 4
  pushMatrix();
  translate(x1+ largo_cuadrado*.9,largo_cuadrado,0);
  rotateX(radians(90));
  rotateY(radians(90));
  //rotateZ(radians(10));
  trianguloGrande(x1, y1, x2, y2, x3, y3);
  triangulo(mid_X1, mid_Y1,mid_X2, mid_Y2, mid_X3, mid_Y3, NIVELES_TRIANGULO);
  popMatrix();
  
}
/**
 * Crea los 2 primeros triangulos, el externo y el primer interno invertido
 */
void trianguloGrande(float x1, float y1, float x2, float y2, float x3, float y3) {
  strokeWeight(10);
  strokeWeight(1);
  contador = contador + 1;
  if (contador < 3) {
    //Las siguietes variables guardan los puntos medios de cada lado de los triangulos
    mid_X1 = (x2 + x3)/2;
    mid_Y1 = (y2 + y3)/2;
    mid_X2 = (x2 + x1)/2;
    mid_Y2 = (y2+y1)/2;
    mid_X3 = (x1 + x3)/2;
    mid_Y3 = (y1 + y3)/2;
    strokeWeight(10);
    beginShape();

    vertex(x1, y1);//Punta izq
    vertex(x2, y2);//Punta derecha
    vertex(x3, y3);//Punta Norte

    endShape(CLOSE); 
    trianguloGrande(mid_X1, mid_Y1, mid_X2, mid_Y2, mid_X3, mid_Y3);
  }
}

/**
 * Crea triangulos por la izquierda, derecha y abajo a partir de un triangulo padre
 * 
 */
void triangulo(float x1, float y1 ,float x2, float y2, float x3, float y3, int i) {
  //Las siguietes variables guardan los puntos medios de cada lado de los triangulos
  float coordsX_1 = (x2 + x3)/2;
  float coordsY_1 = (y2 + y3)/2;
  float coordsX_2 = (x2 + x1)/2;
  float coordsY_2 = (y2+y1)/2;
  float coordsX_3 = (x1 + x3)/2;
  float coordsY_3 = (y1 + y3)/2;
  if (i != 0) {   
    float lado_longitud = abs(x2 - x1);
    float altura = lado_longitud * sqrt(3)/2;

    //Genaracion de triangulos por arriba
    pushMatrix();
    noFill();
    translate(0, - altura);
    strokeWeight(5);          
    triangle(x1, (y1 - altura), x2, (y1 - altura), x3, (y3 + altura));
    triangulo(coordsX_1, coordsY_1, coordsX_3, coordsY_3, coordsX_2, coordsY_2 - altura, --i);
    //Este contador ayuda a que se puedan seguir generando triangulos por la izquierda, después de haber terminado
    //de generar todos los de arriba
    ++i;
    popMatrix();

    //Genaracion de triangulos por la izquierda
    pushMatrix();
    translate(-altura -(altura * .15), altura);
    strokeWeight(5);
    noFill();
    triangle(x1, (y1 - altura), x2, (y1 - altura), x3, y3 + altura);//izq, der, abajo
    triangulo(coordsX_1, coordsY_1, coordsX_3, coordsY_3, coordsX_2, coordsY_2 - altura, --i);
    //Este contador ayuda a que se puedan seguir generando triangulos por la derecha, después de haber terminado
    //de generar todos los de la izquierda
    i++;
    popMatrix();

    //Generación de triangulos por la derecha
    pushMatrix();
   translate(altura +(altura * .15), 0);
    strokeWeight(5);
    noFill();
    translate(0, altura);//Bien
    triangle(x1, (y1 - altura), x2, (y1 - altura), x3, y3 + altura);//izq, der, abajo    
    triangulo(coordsX_1, coordsY_1, coordsX_3, coordsY_3, coordsX_2, coordsY_2 - altura, --i);
    popMatrix();
  }
}

/**
 * Dibuja la base de la piramide
 */
void drawRect(float x, float y, float z, float largo_cuadrado) {
  rotateX(radians(90));
    noFill();
  beginShape(); 
  vertex(x,y,z);
  vertex(x+largo_cuadrado,y,z);
  vertex(x+largo_cuadrado, y+largo_cuadrado,z);
  vertex(x,y+largo_cuadrado,z);
  endShape(CLOSE);  
}
