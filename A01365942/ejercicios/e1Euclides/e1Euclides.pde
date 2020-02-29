//Funciones generadoras de figuras básicas
//Punto
//point(x,y);
//Rectangulo
//rect(x,y,ancho,alto);
//ellipse
//ellipse(x,y,ancho,alto);

/* EJercicios del 1 al 5
*/
void setup() {
     size(800, 700);
     //draw_1();
     //draw_point(500);//EJercicio2
     //draw_3();
     draw_4();
     draw_parallel_line();//Ejercicio5
}

void draw() {

}

void draw_1() {
  int x1 = 150, x2 = 325;
  int y1 = 275, y2 = 460;
  line(x1,y1,x2,y2); 
}

void draw_3() {
   int diametro = 150;
   int x = 300, y = 300;
   int x1 = x;
   int y1 = y + diametro/2;
   circle(x, y, diametro); 
   line(x, y, x1, y1);
}

void draw_4() {
 int x1 = 400, y1 = 400, x2 = 600, y2 =400;
 
 line(x1,y1,x2,y2);
 line(500,y1, 500, 200);
 rect(500,370,30,30);
 rect(470,370,30,30);
 }
 //EJercicio 2
 void draw_point(int y) {
   int x = 255;
   for(int i = 0; i <100000; i++) {
       point(i, y); 
   }
 }
 //EJercicio 5
 void draw_parallel_line() {
   int y = 500; 
   draw_point(y);
   for(int i = 0; i <100000; i+=3) {
       point(i, y + 50); 
   }   
 }
 
