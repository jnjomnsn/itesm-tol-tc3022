int x=200;
int y=300;
int z=0;

void setup()
{
  size(500,500,P3D);
}

void draw()
{
  background(0);
  pointLight(255, 0, 0, width/2,height/2, 400);
  noStroke();
  fill(200);
  camera(mouseX,height/2,(height/2) / tan(PI/6),width/2,height/2,0,0,1,0);
  skeleton(x,y,z);
}

void skeleton(int x, int y, int z)
{
  //mostrar el origen  X = 200 Y = 300 Z = 0
  pushMatrix();
  translate(x,y,z);   //movernos al punto de origen
  box(5,5,5);         //marcar el origen
  popMatrix();
  
  pushMatrix();
  //cabeza
  translate(x,y-220,z);    // mover al 200,80,0
  sphere(30);              //dibujar la cabeza con diametro 30
  //tronco
  translate(x-200,y-220,z);   // mover los ejes 0,80,0
  box(60,100,20);             //dibujar torso de 60x100x20
  //Brazo Der
  translate(x-140,y-310,z);   //mover los ejes 60,-10,0
  rotate(radians(-30));       //Rotar el brazo -30 grados
  box(20,80,20);              //dibujar el brazo de 20x80x20
  //Brazo Izq
  translate(x-300,y-360,z);   //mover los ejes -100,-60,0
  rotate(radians(60));        // rotar el brazo 60 grados
  box(20,80,20);              //dibujar el brazo de 20x80x20
  //Pierna Der
  translate(x-115,y-230,z);   //mover los ejes 85,70,0
  rotate(radians(-30));       //rotar -30 para quedar en 0 
  box(20,90,20);              //dibujar la pierna de 20X90x20
  //Pierna Izq
  translate(x-165,y-300,z);   //mover los ejes 35,0,0
  box(20,90,20);              //dibujar la pierna de 20x90x20
  
  popMatrix();
}
