void setup(){
  size(800,800,P3D);
  int x=5;
  int y=6;
  int z=8;
}
void draw()
{

  skeletonn(180,100,-100);
  
}



void skeletonn(int x, int y, int z)
{
  background(0);
  lights();
  float fov=PI/3.0;
  float camaraZ=(height/2.0)/tan(fov/2.0);
  perspective(fov, float(width)/float(height), camaraZ/2, camaraZ*2);
  
  camera(mouseX, height/2, (height/2)/tan(PI/6), width/2, height/2,0,0,1,0);
  translate(x,y,z); //Traslao al punto de origen
  noStroke();
  fill(255);
  lights();
  pushMatrix();
  translate(200,200,40);
  sphere(40);          //Cabeza del esqueleto
  popMatrix();

  
  stroke(0);
  fill(255);
  lights();
  pushMatrix();
  translate(200,304,40); //Torso del esqueleto
  box(80,120,20);
  popMatrix();
  
  stroke(0);
  fill(255);
  lights();
  pushMatrix();
  translate(120,297,40); //Brazo izquierdo
  rotate(0.25);
  box(40,120,20);
  popMatrix();
  
  stroke(0);
  fill(255);
  lights();
  pushMatrix();
  translate(279,297,40); //Brazo derecho
  rotate(-0.25);
  box(40,120,20);
  popMatrix();
  
  stroke(0);
  fill(255);
  lights();
  pushMatrix();
  translate(225,425,40); //pierna derecha
  box(30,120,20);
  popMatrix();
  
  stroke(0);
  fill(255);
  lights();
  pushMatrix();
  translate(175,425,40); //pierna izquierda
  box(30,120,20);
  popMatrix();
}
