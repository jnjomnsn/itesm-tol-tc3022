int lado = 400;//largo de los lados del triangulo
int x = 200;//primer punto lado izquierto inferior del triangulo
int y = 600;
int num=5;//numero de iteraciones
float angulo=0.0;
float direccion=1;
float vel=0.01;
float escala=1;

void setup(){
   size(1000,800,P3D);
  if(num>=6)
   {
     print("El triangulo debe tener como maximo 5 iteraciones");
   }  
}

void draw(){
  
background(6,197,248);
translate(500,-200,-600);
scale(escala);//variable para el zoom
translate(0,0);
rotateY(angulo); //movimiento de la piramide
angulo+=vel*direccion; 
//dibujar cuatro triangulos y posicionarlos para formar la piramide
pushMatrix();
translate(0,0,-lado);
rotateX(radians(-36));
translate(0,-116,350);
triangulo(x,y,lado,num);
popMatrix();

pushMatrix();
rotateY(radians(90));
translate(-x,0,x);
rotateX(radians(-36));
translate(0,-116,350);
triangulo(x,y,lado,num);
popMatrix();
     
pushMatrix();
rotateY(radians(90));
translate(-x,0,x+lado);
rotateX(radians(36));
translate(0,-116,-350);
triangulo(x,y,lado,num);
popMatrix();

pushMatrix();
rotateX(radians(36));
translate(0,-116,-350);
triangulo(x,y,lado,num);
popMatrix();

base(x,y,lado);
   
}

public void triangulo(float x, float y, float lado, int num){

float s=(lado*3)/2;//perimtro a la mitad
float area=sqrt(s*(s-lado)*(s-lado)*(s-lado));//area del triangulo
float h=(2*area)/lado;//altura del triangulo para que sea equilatero
float x2 = x + lado/2;//punto mas alto del triangulo
float y2 = y - h;
float x3 = x + lado;//punto inferior derecho del triangulo
float y3 = y;

lado=lado/2;
strokeWeight(2);//grosor de laslineas del triangulo 
fill(0);

if(num==0)
 {
  //Creacion de triangulo 
  beginShape();
  vertex(x,y,0);
  vertex(x2,y2,0);
  vertex(x3,y3,0);
  endShape(CLOSE);
 
 }
  
if(num>=0 && num<=5)//llamadas recursivas de la funcion
 {
   num=num-1;
   triangulo(x,y,lado,num);
   triangulo(x+lado,y,lado,num);
   triangulo(x+(lado/2),y-h/2,lado,num);     
 }
 
}

void base(float x, float y, float lado)
{
  noFill();
  beginShape();
  //vertices de la base de la piramide
  vertex(x,y,0);
  vertex(x,y,-lado);
  
  vertex(x+lado,y,-lado);
  vertex(x+lado,y,0);
  endShape(CLOSE);
}

void mouseWheel(MouseEvent event) {//funcion zoom
  float e = event.getCount();
  if(e>=1)
  {
    escala=escala+0.02;
  }
  if(e<=-1)
  {
     escala=escala-0.02;
  }
}
