void setup()
{
  size(500,500,P3D);
}

void draw()
{
  draw_rect_01();
  draw_rect_02();
  //draw_rect_03();
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
void draw_rect_02()
{
  beginShape();
  vertex(175, 175, 125);
  vertex(225, 175, 125);
  vertex(225, 175, 225);
  vertex(175, 175, 225);
  endShape(CLOSE);
}
void draw_rect_01()
{
  beginShape();
  vertex(150, 150, 200);
  vertex(250, 150, 200);
  vertex(250, 200, 200);
  vertex(150, 200, 200);
  endShape(CLOSE);
}
