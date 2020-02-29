int sizeX=700;
int sizeY=700;
void setup(){
  size(700,700);
}

void draw(){
  postulado1();
  postulado2();
  postulado3();
  postulado4();
  postulado5();
  postulado6();
}

void postulado1(){
  //line(150,25, mouseX,mouseY);
  strokeWeight(4);
  point(100,60);
  point(120,40);
  strokeWeight(1);
  line(60,100,160,0);
}

void postulado2(){
  ellipseMode(RADIUS);
  ellipse(200,200,50,50);
  strokeWeight(4);
  point(200,200);
  strokeWeight(1);
  line(200,200,200,150);
}

void postulado3(){
 
 for(int i=0;i<700;i=i+3){
   point(i,145);
   if(i>250||i<350){
     continue;
   }
 }
 line(250,145,350,145);
 
}

void postulado4(){
 int x = 150;
 int y = 300;
 
 line(x,y,x+100,y);
 line(x+50,y,x+50,y+50);
 x=x+40;
 for(int i=y;i<y+10;i=i+3){
   point(x,i);
 }
 y=y+10;
 for(int i = x;i<x+20;i=i+3){
   point(i,y);
 }
 x=x+20;
 
 for(int i=y;i>y-10;i=i-3){
   point(x,i);
 }
}

void postulado5(){
 int x = 300;
 int y = 425;
 line(0,y,sizeX,y);
 strokeWeight(4);
 point(x,y-50);
 strokeWeight(1);
 for(int i = 0;i<sizeX;i=i+3){
  point(i,y-50); 
 }
}

void postulado6(){
 int x = 400;
 int y = 500;
 line(x,y-50,x,y+150);
 y=y-25;
 line(x-180,y+90,x+20,y-10);
 y=y+150;
 line(x-180,y-90,x+20,y+10);
 noFill();
 ellipseMode(RADIUS);
 ellipse(x-150,y-75,20,20);
}
