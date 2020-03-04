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
  background(0);                                                              //fondo negro
  pointLight(255, 0, 0, width/2,height/2, 400);                               //luz tono rojo
  noStroke();                                                                 //quitar contorno
  float cameraZ = (height/2.0) / tan((PI/3.0)/2.0);
  perspective(PI/3.0, float(width)/ float(height), cameraZ, cameraZ*2.0);     //modificar la perspectiva
  camera(mouseX,height/2,(height/2) / tan(PI/6),width/2,height/2,0,0,1,0);    //modificar camara
  skeleton(x,y,z);                                                            //Funcion que dibuja el esqueleto
}

void skeleton(int x, int y, int z)
{
  //mostrar el origen  X = 200 Y = 300 Z = 0
  pushMatrix();
  translate(x,y,z);   //movernos al punto de origen
  box(5,5,5);         //marcar el origen
  popMatrix();
  
  pushMatrix();
  //iniciar dibujo del esqueleto
  //cabeza
  pushMatrix();
  translate(x,y-210,z);       //subir 210 unidades
  sphere(30);                 //dibujar la cabeza con radio de 30
  popMatrix();
  //tronco
  pushMatrix();
  translate(x,y-130,z);       //subir 130 unidades
  box(60,90,20);              //dibujar torso de 60x100x20
  popMatrix();
  //Brazo Der
  pushMatrix();
  translate(x+60,y-140,z);    //mover 60 a la derecha, subir 140
  rotate(radians(-30));       //Rotar el brazo -30 grados
  box(20,80,20);              //dibujar el brazo de 20x80x20
  popMatrix();                
  //Brazo Izq
  pushMatrix();
  translate(x-60,y-140,z);    //mover 60 a la izquierda y subir 140
  rotate(radians(30));        // rotar el brazo 30 grados
  box(20,80,20);              //dibujar el brazo de 20x80x20
  popMatrix();
  //Pierna Der
  pushMatrix();
  translate(x+20,y-40,z);     //mover 20 a la derecha, subir 40
  box(20,90,20);              //dibujar la pierna de 20X90x20
  popMatrix();
  //Pierna Izq
  pushMatrix();
  translate(x-20,y-40,z);     //mover 20 a la izquierda y subir 40
  box(20,90,20);              //dibujar la pierna de 20x90x20
  popMatrix();
}
