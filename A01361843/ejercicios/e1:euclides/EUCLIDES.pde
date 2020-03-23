// Una linea dinamica
void setup() {
  size(500,500);
}

void draw() {
  // Correr de 1 en 1 para que no se vean encimados
  
  postulado1();
  
  postulado2();
  
  // Llamada con punto de origen X, Y y el tercer argumento es el radio
  postulado3(250,235,120);
  
  // Longitud de la linea base (minimo 60)
  postulado4(60);  
  
  // Hacer la llamada del postulado 5 con un entero para asignar la distancia 
  // entre la linea original y la paralela con un punto a trazar
  postulado5(120);

  postulado6();
}

void postulado1() {
  ellipse(30,30,10,10);
  ellipse(80,50,10,10);
  line(20,26,100,58);
}

void postulado2() {
  for(int i = 0; i <= 500; i++) {
    point(i,20);
    i+= 4;
  }
  
  line(30,20,180,20);
}

void postulado3(int x, int y, int r) {
  ellipse(x,y,r,r);
}

void postulado4(int length) {
  line(length,30,length*2,30);
  line(length*1.5,30,length*1.5,length);
  
  
  line(length+30,200,length*2,200);
  line(length*1.5+30,200,length*1.5+30,100);
}

void postulado5(int d) {
  line(80,30,320,30);
  
  for(int i = 100; i <= 300; i++) {
    point(i,30+d);
    i+= 2;
  }
  
  ellipse(220,30+d,10,10);
}

void postulado6() {
  line(100,100,300,300);
  line(100,140,320,80);
  line(250,80,300,320);
}
