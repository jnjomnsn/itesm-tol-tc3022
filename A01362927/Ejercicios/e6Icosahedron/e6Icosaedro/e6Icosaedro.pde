float[] pos_X;
float[] pos_Y;
float[] pos_Z;
//vetex[] vertices;

float fi;
float origen;
float escala;

void setup()
{
  size(500,500,P3D);
  ortho();
  fi = (1+sqrt(5))/2;
  origen = 250;
  escala = 50;
  fill_all_Arrays();
}

void draw()
{
  //draw_rect_03();
}

void fill_all_Arrays()
{
  for(int i = 0; i < 12; i++)
  {
    pos_X[i] = 
  
}

void draw_rect_03()
{
  beginShape();
  vertex(150, 150, 200);
  vertex(250, 150, 200);
  vertex(250, 200, 200);
  vertex(150, 200, 200);
  endShape(CLOSE);
}
