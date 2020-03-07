void setup()
{
  size(500,500,P3D);
}

void draw()
{
  cam();
  skeleton(150,40,40);
}

void skeleton(int x, int y, int z)
{
  pushMatrix();
    //cabeza  
    translate(200 + x,80 + y,0 + z);
    lights();
    sphere(30);
  
  //tronco
    translate(0,80,0);
    box(60,100,20);
  //Brazo Derecho
    translate(60,-10,0);
    rotate(radians(-30));
    box(20,80,20);
  
  //Brazo Izquierdo
    translate(-100,-60,0);
    rotate(radians(60));
    box(20,80,20);
  //Pierna Der
    translate(85,70,0);
    rotate(radians(-30));
    box(20,80,20);
  //Pierna Izq
    translate(35,0,0);
    rotate(radians(0));
    box(20,80,20);
  popMatrix();
}

void cam()
{
  background(0);
  translate(0,0,-100);
  noStroke();
  fill(200);
  camera(mouseX,height/2,(height/2) / tan(PI/6),width/2,height/2,0,0,1,0);
}
