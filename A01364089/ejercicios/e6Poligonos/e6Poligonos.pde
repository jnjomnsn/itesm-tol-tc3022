PImage textura = null;

void setup()
{
   size(800,800,P3D); 
   textura = loadImage("texture.jpg");
}

void draw()
{
  background(0);                                                                          //fondo negro
  lights();                                                                               //poner luz
  stroke(255);                                                                            //quitar contorno
  camera(mouseX, mouseY, (height/2)/tan(PI/6), width/2, height/2, 0, 1, 0, 0);    //modificar camara
  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
  icosaedro(400,400,0);                                                           //funcion que dibuja el icosaedro
  
}

void icosaedro(int x, int y, int z)
{
  float w = width/4;
  float h = height/4;
  
  
  translate(x,y,z);
  //Draw the rectangle 1   AZUL
  beginShape();
    fill(#000EFF);
    //texture(textura);
    vertex(-w, h, 0);    //- + 0
    vertex(w, h, 0);     //+ + 0
    vertex(w, -h, 0);    //+ - 0
    vertex(-w, -h, 0);   //- - 0
  endShape(CLOSE);
  //draw the recantgle 2    ROJO
  beginShape();
    fill(#FF0335);
    //texture(textura);
    vertex(0, w, h);     //0 + + 
    vertex(0, w, -h);    //0 + - 
    vertex(0, -w, -h);   //0 - - 
    vertex(0, -w, h);    //0 - + 
   endShape(CLOSE);
   //Draw the rectangle 3  AMARILLO
  beginShape();
    fill(#FAFF03);
    //texture(textura);
    vertex(-h, 0, w);    //- 0 +
    vertex(h, 0, w);     //+ 0 +
    vertex(h, 0, -w);    //+ 0 -
    vertex(-h, 0, -w);   //- 0 -
  endShape(CLOSE);
  
    noFill();
    stroke(255);         //Contornos en blanco y sin relleno
    beginShape();
    
    // Draw the points.
    noFill();
    
    beginShape();
      vertex(h, w, 0);
      vertex(0, h, w);
      vertex(w, 0, h);
    endShape(CLOSE);
    
    beginShape();
      vertex(h, -w, 0);
      vertex(w, 0, h);
      vertex(0, -h, w);
    endShape(CLOSE);
    beginShape();
      vertex(0, h, w);
      vertex(-h, w, 0);
      vertex(-w, 0, h);
    endShape(CLOSE);
    beginShape();
      vertex(0, -h, w);
      vertex(-w, 0, h);
      vertex(-h, -w, 0);
    endShape(CLOSE);
    beginShape();
      vertex(h, w, 0);
      vertex(0, h, w);
      vertex(0, h, -w);
    endShape(CLOSE);
    beginShape();
      vertex(-h, w, 0);
      vertex(0,h,w);
      vertex(0,h, -w);
    endShape(CLOSE);
    beginShape();
      vertex(-h, -w, 0);
      vertex(0, -h, -w);
      vertex(-w, 0, -h);
    endShape(CLOSE);
    beginShape();
      vertex(0, h, -w);
      vertex(w, 0, -h);
      vertex(-w, 0, -h);
    endShape(CLOSE);
    beginShape();
      vertex(0, -h, -w);
      vertex(h, -w, 0);
      vertex(w, 0, -h);
    endShape(CLOSE);
    beginShape();
      vertex(w, 0, -h);
      vertex(h, w, 0);
      vertex(0, h, -w);
    endShape(CLOSE);
    beginShape();
      vertex(-h, -w, 0);
      vertex(-w, 0, -h);
      vertex(-h, w, 0);
    endShape(CLOSE);
   
    fill(255);
}
