int tipo;
int Amarillo,Rojo,Verde,Azul,Gris,GrisClaro;
boolean relleno;
color coloractual;

void setup(){
  size(800,900);
  Amarillo = color(255,255,0);
  Rojo = color(255,0,0);
  Verde = color(0,255,0);
  Azul = color(0,0,255);
  Gris= color(102);
  GrisClaro = color(200);
  coloractual = color(0);
  relleno=true;
  background(Gris);
  
}

void draw()
{
  fill(color(200));
  rect(0,0,110,140);
  fill(color(50));
  text("Selecciona la figura",5,25);
  strokeWeight(5);
  point(20,50);
  text("Punto",40,55);
  strokeWeight(1);
  line(10,70,30,70);
  text("Linea",40,75);
  rect(10,90,20,10);
  text("Rectangulo",40,100);
  ellipse(19,120,30,20);
  text("Elipse",40,125);
  fill(GrisClaro);
  rect(110,0,65,140);
  fill(Amarillo);
  rect(115,20,20,20);
  fill(Rojo);
  rect(145,20,20,20);
  fill(Verde);
  rect(115,60,20,20);
  fill(Azul);
  rect(145,60,20,20);
  fill(255);
  rect(115,100,20,20);
  fill(0);
  rect(145,100,20,20);
  fill(GrisClaro);
  rect(170,0,110,140);
  fill(color(50));
  text("Filled?",210,25);
  triangle(200, 50, 185, 90, 215, 90);
  noFill();
  triangle(250, 50, 235, 90, 265, 90);
  fill(GrisClaro);
  rect(280,0,65,45);
  fill(color(50));
  text("Borrar todo",283,25);

  if(tipo==4)
  {
     noFill();
     stroke(Rojo);
     rect(0,60,110,20);
     stroke(0);
     fill(0);
  }
  if(tipo==1)
  {
     noFill();
     stroke(Rojo);
     rect(0,85,110,20);
     stroke(0);
     fill(0);
  }
  if(tipo==2)
  {
     noFill();
     stroke(Rojo);
     rect(0,110,110,20);
     stroke(0);
     fill(0);
  }
  if(tipo==3)
  {
     noFill();
     stroke(Rojo);
     rect(0,40,110,20);
     stroke(0);
     fill(0);
  }
  selectfigure();
}

void selectfigure()
{
  if (mousePressed)
 {
   if(relleno==true)
   {
     if (tipo==1 )
     {
         fill(coloractual);
         stroke(coloractual);
         rect(mouseX-25,mouseY-25,55,35);       
     }
     if (tipo==2)
     {
         fill(coloractual);
         stroke(coloractual);
         ellipse(mouseX,mouseY,55,35);    
     }
     if (tipo==3)
     {
         stroke(coloractual);
         strokeWeight(10);
         point(mouseX,mouseY);
         strokeWeight(0);   
     }
     if (tipo==4)
     {       
         stroke(coloractual);
         strokeWeight(5);
         line(mouseX, mouseY, pmouseX, pmouseY);
         strokeWeight(0);   
     }
   }
   else
   {
     if (tipo==1 )
     {
         noFill();
         stroke(coloractual);
         rect(mouseX-25,mouseY-25,55,35);       
     }
     if (tipo==2)
     {
         noFill();
         stroke(coloractual);
         ellipse(mouseX,mouseY,55,35); 
     }
     if (tipo==3)
     {
         stroke(coloractual);
         strokeWeight(10);
         point(mouseX,mouseY);
         strokeWeight(0); 
     }
     if (tipo==4)
     {     
         stroke(coloractual);
         //noStroke();
         strokeWeight(5);
         line(mouseX, mouseY, pmouseX, pmouseY);
         strokeWeight(0);   
     }
   }
 }
}

void mousePressed()
{
//click en las figuras
if ((mouseX>10) && (mouseY>90) && (mouseX<50) && (mouseY<100))
 {
   tipo = 1;
 }
 if ((mouseX>0) && (mouseY>100) && (mouseX<50) && (mouseY<130))
 {
   tipo = 2;
 }
 if ((mouseX>10) && (mouseY>45) && (mouseX<50) && (mouseY<55))
 {
    tipo=3;
 }
 if ((mouseX>10) && (mouseY>65) && (mouseX<50) && (mouseY<75))
 {  
  tipo=4;
 }
 if ((mouseX>115) && (mouseY>20) && (mouseX<135) && (mouseY<40))
 {  
  coloractual=color(Amarillo);
 }
 if ((mouseX>145) && (mouseY>20) && (mouseX<165) && (mouseY<40))
 {  
  coloractual=color(Rojo);
 }
 if ((mouseX>115) && (mouseY>60) && (mouseX<135) && (mouseY<80))
 {  
  coloractual=color(Verde);
 }
 if ((mouseX>145) && (mouseY>60) && (mouseX<165) && (mouseY<80))
 {  
  coloractual=color(Azul);
 }
 if ((mouseX>115) && (mouseY>100) && (mouseX<135) && (mouseY<120))
 {  
  coloractual=color(255);
 }
 if ((mouseX>145) && (mouseY>100) && (mouseX<165) && (mouseY<120))
 {  
  coloractual=color(0);
 }
 if ((mouseX>183) && (mouseY>47) && (mouseX<238) && (mouseY<92))
 {  
  relleno=true;
 }
 if ((mouseX>233) && (mouseY>47) && (mouseX<268) && (mouseY<92))
 {  
  relleno=false;
 }
 if ((mouseX>280) && (mouseY>0) && (mouseX<345) && (mouseY<45))
 {  
  background(Gris);
 }
}
