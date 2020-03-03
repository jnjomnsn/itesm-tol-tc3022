//Postulados de Euclides
/*
1.- Dos puntos cualquiera respresentan un segmento de recta
2.- Un segrmento de recta se puede extender indefinidamente en una linea recta
3.- Se puede trazar una circunferencia con un centro y un radio cualquiera
4.-Todos los angulos rectos son iguales entre si
5.- Por un punto exterior a una recta se puede trazar una unica paralela
6.-
*/
void setup(){
  size(500,500);
}

void draw(){
 primero();
 segundo();
 tercero();
 cuarto();
 quinto();
 sexto();
}

void primero(){
 line(1,10,100,10);
 ellipse(30,10,5,5); 
 ellipse(60,10,5,5);
}

void segundo(){
  
 line(0,50,300,50); 
 ellipse(10,50,5,5);
 ellipse(30,50,5,5);
 ellipse(50,50,5,5);
 ellipse(290,50,5,5);
 ellipse(270,50,5,5);
 ellipse(250,50,5,5);
}

void tercero(){
  ellipse(30,30,20,20);
  point(30,30);
  line(30,30,20,30);
}

void cuarto(){
 line(100,300,200,300);//horizontal
 line(150,200,150,300);//vertical
 line(125,300,125,280);
 line(175,300,175,280);
 line(125,280,175,280);
}

void quinto(){
  for(int i=0; i<=200; i++){
    ellipse(i,80,2,2);
    ellipse(50,80,10,10);
  }
  for(int i=0; i<=200; i=i+3){
    ellipse(i+10,100,1,1);
  }
  
}

void sexto(){
  line(450,450,250,450);
  line(300,470,350,300);
  line(400,470,300,300);
}
