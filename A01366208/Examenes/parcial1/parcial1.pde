int n = 6;
float escala =0.0;

 
void setup() {
  size(1000,1000,P3D);
  background(0);
  smooth();
  noStroke();
  triangle(width/4, 0, 0, height/2, width/2, height/2);
  trianguloSierpinski (width/4, 0, 0, height/2, width/2, height/2, n);
  loop();
  
}

void draw(){
 
}
 
void trianguloSierpinski(float x1, float y1, float x2, float y2, float x3, float y3, int n) {
  //numero de interaciones (5)
  if ( n > 0 ) {
    fill(255, 255/n, 100);
    triangle(x1, y1, x2, y2, x3, y3);
 
    // calcular los puntos medios
    float posX1 = (x1+x2)/2.0;
    float posY1 = (y1+y2)/2.0;
    float posX2 = (x2+x3)/2.0;
    float posY2 = (y2+y3)/2.0;
    float posX3 = (x3+x1)/2.0;
    float posy3 = (y3+y1)/2.0;
 
    trianguloSierpinski(x1, y1, posX1, posY1, posX3, posy3, n-1);
    trianguloSierpinski(posX1, posY1, x2, y2, posX2, posY2, n-1);
    trianguloSierpinski(posX3, posy3, posX2, posY2, x3, y3, n-1);
      

  }
}


void mouseWheel(MouseEvent event) {
    if (event.getCount()<1 && escala<1)
        escala = 1.0;
    else
        escala += event.getCount();

}
