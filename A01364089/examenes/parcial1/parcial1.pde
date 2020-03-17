import peasy.*;
PeasyCam cam;

void setup()
{
  size(800,800,P3D);
  background(0);         //Fondo negro
  lights();              //encender iluminacion
  

}

void draw()
{
  float i = 0;
  rotateY(i);
  //sierpinsky();                             //funcion manual implementada a un inicio
  drawSierpinsky(0,700,400,0,800,700,5);      //funcion que dibuja la cara del triangulo de forma recursiva para un nivel n=5
  drawPyramid();     //funcion que pinta la piramide en 3d
  i = i + 0.01;
  
}

void sierpinsky()
{
    //primer nivel triangulo fondo blanco
    fill(255);
    triangle(200,800,800,800,500,200);
    
    //Segundo nivel triangulos fondo negro
    fill(0);
    triangle(500,800,350,500,650,500);
    fill(0);
    triangle(425,350,575,350,500,500);
    fill(0);
    triangle(275,650,425,650,350,800);
    fill(0);
    triangle(575,650,725,650,650,800);
    
    //tercer nivel triangulos pequeños fondo negro
    fill(0);
    triangle(462.5,275,500,350,537.5,275.5);
    fill(0);
    triangle(537.5,425,575,500,612.5,425);
    fill(0);
    triangle(612.5,575,687.5,575,650,650);
    fill(0);
    triangle(687.5,725,762.5,725,725,800);
    fill(0);
    triangle(537.5,725,612.5,725,575,800);
    fill(0);
    triangle(312.5,725,237.5,725,275,800);
    fill(0);
    triangle(387.5,725,425,800,462.5,725);
    fill(0);
    triangle(312.5,575,350,650,387.5,575);
    fill(0);
    triangle(387.5,425,462.5,425,425,500);
    
}

void drawSierpinsky(float x1, float y1, float x2, float y2, float x3, float y3, int n)
{
  if(n>0) 
  {
    fill (50,100,255);                    //indicar los colores de relleno
    triangle(x1,y1,x2,y2,x3,y3);          //dibujar el triangulo en los puntos determinados
    
    //especificar los puntos a modificar para los triangulos
    float h1 = (x1+x2)/2.0;
    float w1 = (y1+y2)/2.0;
    float h2 = (x2+x3)/2.0;
    float w2 = (y2+y3)/2.0;
    float h3 = (x3+x1)/2.0;
    float w3 = (y3+y1)/2.0;
    
    //llamar de nuevo la funcion para hacerlo de una forma recursiva
    drawSierpinsky(x1,y1,h1,w1,h3,w3,n-1);      
    drawSierpinsky(h1,w1,x2,y2,h2,w2,n-1);
    drawSierpinsky(h3,w3,h2,w2,x3,y3,n-1);
  }
  
}

void drawPyramid()
{
  translate(width/2, height/2, 0);
  stroke(0);
  rotateX(PI/2);
  rotateZ(-PI/6);
  noFill();
  
  
  beginShape();
  vertex(-100,-100,-100);
  vertex(100,-100,-100);
  vertex(0,0,100);
  
  vertex(100,-100,-100);
  vertex(100,100,-100);
  vertex(0,0,100);
  
  vertex(100,100,-100);
  vertex(-100,100,-100);
  vertex(0,0,100);
  
  vertex(-100,100,-100);
  vertex(-100,-100,-100);
  vertex(0,0,100);
  endShape();
}
