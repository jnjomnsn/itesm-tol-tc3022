import java.util.Random;
float e = 0.0;
int n = 0;
float p1[] = new float[3],p2[] = new float[3],p3[] = new float[3];
int colors[] = new int[6];
float i = 0;
float scala = 1;
Random r = new Random();
int low = 0;
int high = 5;


 
void setup() {
  surface.setResizable(true);
  size(500,500,P3D);
}
 
void draw() {
  background(0);
  pyramid();
  //Retrasar la creacion de todos los triangulos
  try {
    if(n < 6) {
       Thread.sleep(100);
       if(n != 6) n++;}
       }catch(InterruptedException e){}
}

void mouseWheel(MouseEvent event) { 
//Funcion de escalamiento mediante la rueda del mouse
float e = event.getCount();
scala += e *.01 ;
}

void pyramid() {
  //Arreglo para cambio aleatorio de colores
  colors[0] = #EFB810;
  colors[1] = #D4AF37;
  colors[2] = #AE8625;
  colors[3] = #F7EF8A;
  colors[4] = #D2AC47;
  colors[5] = #EDC967;
  //Creacion de piramide
  pushMatrix();
  translate(250,250,250);
  scale(scala);
  stroke(255);
  //Rotacion de la piramide
  rotateX(PI/4);
  rotateZ((-PI/6)*2);
  rotate(i);
  //Creacion de base 
  fill(255);
  beginShape();
    vertex(-50,-50,-50);
    vertex(50,-50,-50);
    vertex(50,50,-50);
    vertex(-50,50,-50);
  endShape();
  //Trinagulo de Atras
  beginShape();
  noFill();
    vertex(-50, -50, -50); //3
    vertex( 50, -50, -50); //2
    vertex(   0,    0,  50); //1
  endShape();
  //Coordenadas de inicio
  p1[0] = 0; p1[1] = 0; p1[2] = 50;
  p2[0] = 50; p2[1] = -50; p2[2] = -50;
  p3[0] = -50; p3[1] = -50; p3[2] = -50;
  //Creacion de triangulos del triangulo de atras
  sierpinski(p1,p2,p3,n);
  //Triangulo de la Derecha
  noFill();
  beginShape();
    vertex( 50, -50, -50); //3
    vertex( 50,  50, -50); //2
    vertex(   0,    0,  50); //1
  endShape();
  //Coordenadas de inicio
  p1[0] = 0; p1[1] = 0; p1[2] = 50;
  p2[0] = 50; p2[1] = 50; p2[2] = -50;
  p3[0] = 50; p3[1] = -50; p3[2] = -50;
  //Creacion de triangulos del triangulo de la derecha
  sierpinski(p1,p2,p3,n);
  //Triangulo de Adelante
  noFill();
  beginShape();
    vertex( 50, 50, -50); //3
    vertex(-50, 50, -50); //2
    vertex(   0,   0,  50); //1
   endShape();
   //Coordenadas de inicio
  p1[0] = 0; p1[1] = 0; p1[2] = 50;
  p2[0] = -50; p2[1] = 50; p2[2] = -50;
  p3[0] = 50; p3[1] = 50; p3[2] = -50;
  //Creacion de triangulos del triangulo de adelante
  sierpinski(p1,p2,p3,n);
   //Triangulo de la Izquierda
   noFill();
   beginShape();
    vertex(-50,  50, -50);
    vertex(-50, -50, -50);
    vertex(   0,    0,  50);
  endShape();
  //Coordenadas de inicio
  p1[0] = 0; p1[1] = 0; p1[2] = 50;
  p2[0] = -50; p2[1] = -50; p2[2] = -50;
  p3[0] = -50; p3[1] = 50; p3[2] = -50;
  //Creacion de triangulos del triangulo de la izquierda
  sierpinski(p1,p2,p3,n-1);
  i = i + 0.01;
  popMatrix();
}
 
void sierpinski(float p1[],float p2[],float p3[], int n) {
  //Arreglo para coordenadas intermedias 
  float s1[] = new float[3],s2[] = new float[3],s3[] = new float[3];
  //Numero aleatorio para los colores
  int x = r.nextInt(high-low) + low;
  if ( n > 0 ) {
  //Punto medio izquierdo
  s1[0] = (p1[0] + p2[0])/2;
  s1[1] = (p1[1] + p2[1])/2;
  s1[2] = (p1[2] + p2[2])/2;
  //Punto medio derecho
  s2[0] = (p1[0] + p3[0])/2;
  s2[1] = (p1[1] + p3[1])/2;
  s2[2] = (p1[2] + p3[2])/2;
  //Punto medio inferior
  s3[0] = (p3[0] + p2[0])/2;
  s3[1] = (p3[1] + p2[1])/2;
  s3[2] = (p3[2] + p2[2])/2;
  fill(colors[x]);
  //Creacion de triangulo
  beginShape();
    vertex(s1[0],s1[1],s1[2]); 
    vertex(s3[0],s3[1],s3[2]); 
    vertex(s2[0],s2[1],s2[2]); 
  endShape(CLOSE);
  //Recursividad hacia arriba
    sierpinski(p1, s1, s2, n-1);
  //Recursividad hacia la izquierda
    sierpinski(s1, p2, s3, n-1);
  //Recursividad hacia la derecha
    sierpinski(s3, s2, p3, n-1);
  }
}
