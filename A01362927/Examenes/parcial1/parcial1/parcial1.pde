int nivel;

float p1_X;
float p2_X;
float p1_Y;
float p2_Y;

float i = 0;
float length_arist = 400;

void setup()
{
  size(1000,700,P3D);
  p1_X = length_arist/(-2);
  p1_Y = 0;
  p2_X = length_arist/2;
  p2_Y = 0;
  nivel = 5;
  
}

void draw()
{
  background(51);
  translate(500,500,0);
  rotateY(i);
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
  translate(0,0,p1_X);
  rotateX(-PI/4.7);
  draw_triangle_fractal(nivel, p1_X, p1_Y, p2_X, p2_Y);
  i = i + 0.01;
}

void draw_triangle_fractal(int level, float p1_x, float p1_y, float p2_x, float p2_y)
{
  float dx = (p2_x - p1_x)/2;
  float dy = (p2_y - p1_y)/2;
  
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
    float dx1 = (p1_x + p2_x)/2;
    float dx2 = (p2_x + p3_x)/2;
    float dx3 = (p3_x + p1_x)/2;
    float dy1 = (p1_y + p2_y)/2;
    float dy2 = (p2_y + p3_y)/2;
    float dy3 = (p3_y + p1_y)/2;
    
    draw_triangle_fractal(level, p1_x, p1_y, dx1, dy1);
    draw_triangle_fractal(level, dx1, dy1, p2_x, p2_y);
    draw_triangle_fractal(level, dx3, dy3, dx2, dy2);    
  }
}
