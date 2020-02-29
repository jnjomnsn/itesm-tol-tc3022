//Una linea estatica
//line(15, 25, 70, 90);

void setup(){
  size(800,900);
}

void draw(){
  linea1();
  linea2();
  elipse3();
  angulo4();
  paralela5();
  angulorecta6();
}
void linea1(){
  line(150,25,70,90);
  stroke(#336699);
  ellipse(70,90,5,5);
  ellipse(150,25,5,5);
}
void linea2(){
  for(int i=50;i<=500;i+=5)
  {
    point(i,150);
  }
  
  line(150,150,300,150);
 
}
void elipse3(){
  ellipse(100,300,100,100);
  line(100,300,100,250);
  ellipse(100,300,5,5);
 
}
void angulo4()
{
  rect(70,530,145,70);
  line(40,600,250,600);
  line(140,600,140,450);
  
}
void paralela5()
{
  line(400,600,650,600);
  for(int i=450;i<=700;i+=3)
  {
    point(i,570);
  }
  ellipse(575,570,7,7);
}
void angulorecta6()
{
  line(600,220,550,400);
  line(500,220,580,400);
  line(470,230,620,240);
  //line(600,250,550,400);
}


//point(50,50);
//rect(60,60,90,30);
