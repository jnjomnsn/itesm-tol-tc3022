import java.util.Random;
float e = 0.0;
float p1[] = new float[3],p2[] = new float[3],p3[] = new float[3], p4[] = new float[3];
int colors[] = new int[6];
float i = 0;
float scala = 1;
Random r = new Random();
int low = 0;
int high = 5;
int x = r.nextInt(high-low) + low;
int n = 0;


void setup() {
  surface.setResizable(true);
  size(1000,1000,P3D);
}
void draw(){
  background(0);
  cube(5);
  
}

void mouseWheel(MouseEvent event) { 
  float e = event.getCount();
  scala += e *.01 ;
}

  
  
void cube(float n) {
  colors[0] = #EFB810;
  colors[1] = #D4AF37;
  colors[2] = #AE8625;
  colors[3] = #F7EF8A;
  colors[4] = #D2AC47;
  colors[5] = #EDC967;
  n = pow(3, n);
  pushMatrix();
  translate(500,500,500);
  scale(scala);
  stroke(255);
  noFill();
  //rotateX(PI/4);
  //rotateZ((-PI/6)*2);
  //rotate(i);
  //fill(255);
  
  //Arriba
  beginShape();
    vertex(-n,  n,  n);
    vertex( n,  n,  n);
    vertex( n, -n,  n);
    vertex(-n, -n,  n);
  endShape(CLOSE);
  p1[0] = -n; p1[1] = n; p1[2] = n;
  p2[0] = n; p2[1] = n; p2[2] = n;
  p3[0] = n; p3[1] = -n; p3[2] = n;
  p4[0] = -n; p4[1] = -n; p4[2] = n;
  sierpinski(p1,p2,p3,p4,n);
  //derecha
  beginShape();
    vertex( n,  n,  n);
    vertex( n,  n, -n);
    vertex( n, -n, -n);
    vertex( n, -n,  n);
  endShape(CLOSE);
  p1[0] = n; p1[1] = n; p1[2] = n;
  p2[0] = n; p2[1] = n; p2[2] = -n;
  p3[0] = n; p3[1] = -n; p3[2] = -n;
  p4[0] = n; p4[1] = -n; p4[2] = n;
  sierpinski(p1,p2,p3,p4,n);
  //izquierda
  beginShape();
    vertex(-n,  n, -n);
    vertex(-n,  n,  n);
    vertex(-n, -n,  n);
    vertex(-n, -n, -n);
  endShape(CLOSE);
  p1[0] = -n; p1[1] = n; p1[2] = -n;
  p2[0] = -n; p2[1] = n; p2[2] = n;
  p3[0] = -n; p3[1] = -n; p3[2] = n;
  p4[0] = -n; p4[1] = -n; p4[2] = -n;
  sierpinski(p1,p2,p3,p4,n);
  //enfrente
  beginShape();
    vertex(-n,  n, -n);
    vertex( n,  n, -n);
    vertex( n,  n,  n);
    vertex(-n,  n,  n);
  endShape(CLOSE);
  p1[0] = -n; p1[1] = n; p1[2] = -n;
  p2[0] = n; p2[1] = n; p2[2] = -n;
  p3[0] = n; p3[1] = n; p3[2] = n;
  p4[0] = -n; p4[1] = n; p4[2] = n;
  sierpinski(p1,p2,p3,p4,n);
  //abajo
 beginShape();
    vertex(-n, -n, -n);
    vertex( n, -n, -n);
    vertex( n, -n,  n);
    vertex(-n, -n,  n);
  endShape(CLOSE);
  p1[0] = -n; p1[1] = -n; p1[2] = -n;
  p2[0] = n; p2[1] = -n; p2[2] = -n;
  p3[0] = n; p3[1] = -n; p3[2] = n;
  p4[0] = -n; p4[1] = -n; p4[2] = n;
  sierpinski(p1,p2,p3,p4,n);
  popMatrix();
  i = i + 0.01;
}

void sierpinski(float p1[],float p2[],float p3[], float p4[], float n) {
  n = n /2;
  p1[0] = p1[0] / 2;
  p1[1] = p1[1] / 2;
  p1[2] = p1[2] / 2;
  p2[0] = p2[0] / 2;
  p2[1] = p2[1] / 2;
  p2[2] = p2[2] / 2;
  p3[0] = p3[0] / 2;
  p3[1] = p3[1] / 2;
  p3[2] = p3[2] / 2;
  p4[0] = p4[0] / 2;
  p4[1] = p4[1] / 2;
  p4[2] = p4[2] / 2;
  
  if (n>=1)  { 
    
    square(p1,p2,p3,p4,-n,-n);
    square(p1,p2,p3,p4,0,-n);
    square(p1,p2,p3,p4,n,-n);
    square(p1,p2,p3,p4,n,0);
    square(p1,p2,p3,p4,n,n);
    square(p1,p2,p3,p4,0,n);
    square(p1,p2,p3,p4,-n,n);
    square(p1,p2,p3,p4,-n,0);
    
    
  }
  
}

void square(float p1[],float p2[],float p3[], float p4[], float n1, float n2) {
  pushMatrix();  
  beginShape();
    vertex(p1[0],  p1[1], p1[2]);
    vertex(p2[0],  p2[1], p2[2]);
    vertex(p3[0],  p3[1], p3[2]);
    vertex(p4[0],  p4[1], p4[2]);
  endShape(CLOSE);
  translate(n1, n2);
  sierpinski(p1,p2,p3,p4,n);
  popMatrix();
}
  
  
  
  
 
