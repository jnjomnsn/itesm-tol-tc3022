/*
  Rigoberto Pérez Iturbide. A01362927.
*/
int nivel = 5; //Niveles del triangulo de Sierpinski
float length_arist = 400; //Tamaño de cada arista

float p1_X;
float p2_X;
float p1_Y;
float p2_Y;

float i = 0; //Constante de rotacion en Y
float e = 1; //Constante para la escala

void setup()
{
  size(1000,700,P3D);
  p1_X = length_arist/(-2);
  p1_Y = 0;
  p2_X = length_arist/2;
  p2_Y = 0;
}

void draw()
{
  background(51); //Borra el ciclo anterior
  translate(500,500,0); //Se ubica el origen
  scale(e); //Escala de la imagen
  rotateY(i); // Nueva rotacion
  
  translate(0,0,p1_X); //Mover el origen en -Z
  rotateX(-PI/4.7); //Inclinar en X
  draw_triangle_fractal(nivel, p1_X, p1_Y, p2_X, p2_Y); //Dibujar triangulo
  rotateX(PI/4.7); //Inclinamos en sentido contrario en X
  translate(0,0,p2_X); //Regresamos el origen en su posicion original
  rotateY(PI/2.0); // Rotamos en Y 90° para el siguiente triangulo
  
  translate(0,0,p1_X);
  rotateX(-PI/4.7);
  draw_triangle_fractal(nivel, p1_X, p1_Y, p2_X, p2_Y);
  rotateX(PI/4.7);
  translate(0,0,p2_X);
  rotateY(PI/2.0);
  
  translate(0,0,p1_X);
  rotateX(-PI/4.7);
  draw_triangle_fractal(nivel, p1_X, p1_Y, p2_X, p2_Y);
  rotateX(PI/4.7);
  translate(0,0,p2_X);
  rotateY(PI/2.0);
  
  translate(0,0,p1_X);
  rotateX(-PI/4.7);
  draw_triangle_fractal(nivel, p1_X, p1_Y, p2_X, p2_Y);
  rotateX(PI/4.7);
  translate(0,0,p2_X);
  rotateY(PI/2.0);
  
  i = i + 0.01; //Aumenta la constante de rotacion
}

void draw_triangle_fractal(int level, float p1_x, float p1_y, float p2_x, float p2_y)
{
  float dx = (p2_x - p1_x)/2;
  float dy = (p2_y - p1_y)/2;
  
  //Pos del punto 3 (Vertice superior)
  float p3_x = p1_x + dx - (2*dy*sin(60));
  float p3_y = p1_y - dx + (2*dx*sin(60));
  
  if(level == nivel)
  {
    fill(255);
    triangle(p1_x, p1_y, p2_x, p2_y, p3_x, p3_y);
  }
    
  
  if(level <= 0)
  {
    fill(0);
    triangle(p1_x, p1_y, p2_x, p2_y, p3_x, p3_y);
  }else
  {
    level = level - 1;
    float dx1 = (p1_x + p2_x)/2; //Pos en X del punto medio entre p1 y p2
    float dx2 = (p2_x + p3_x)/2; //Pos en X del punto medio entre p2 y p3
    float dx3 = (p3_x + p1_x)/2; //Pos en X del punto medio entre p3 y p1
    float dy1 = (p1_y + p2_y)/2; //Pos en Y del punto medio entre p1 y p2
    float dy2 = (p2_y + p3_y)/2; //Pos en Y del punto medio entre p2 y p3
    float dy3 = (p3_y + p1_y)/2; //Pos en Y del punto medio entre p3 y p1
    
    draw_triangle_fractal(level, p1_x, p1_y, dx1, dy1);
    draw_triangle_fractal(level, dx1, dy1, p2_x, p2_y);
    draw_triangle_fractal(level, dx3, dy3, dx2, dy2);    
  }
}

void mouseWheel(MouseEvent event)
{
  float count = event.getCount();
  if(count > 0) //Si la rueda gira hacia atras aumenta la escala
  {
    e = e + 0.01;
  }
  if(count < 0) //Si la rueda gira hacia adelante disminuye la escala
  {
     e = e - 0.01;
  }
}
