boolean fill = true;
String figure;
int shape=0;
int colour; // 0 - rojo, 1 - azul, 2 - verde, 3-morado, 4-azul cielo, 5 - rosa

class Figura{
  int shape;
  color fillColor;
  PVector p1, p2;
  boolean fill;
  boolean terminada = false; 
  
  public void despliega(){
    if(!terminada){
      return;
    }
    if(fill == false){
      noFill();
    }
    else{
      fill(colour);
    }
    stroke(colour);
    
   if(shape == 0){ // Punto
      circle(p1.x, p1.y, p1.dist(p2));
   }
   else if(shape == 1){
     line(p1.x, p1.y, p2.x, p2.y);
   }
   else if(shape == 2){
     rect(p1.x, p1.y, p2.x-p1.x, p2.y-p1.y);
   }
   else if(shape == 3){
     ellipse(p1.x, p1.y, p2.x-p1.x, p2.y-p1.y);
   }
  }
}

ArrayList<Figura> figuras = new ArrayList<Figura>();

void setup(){
  size(500,500);
}

void draw(){
  background(255);
  drawMenu();
  drawFilledOptions();
  drawFigureOptions();
  drawColorOptions();
  drawFigures();
 
}

void drawMenu(){
  stroke(0);
  textSize(20);
  text("Figuritas pa dibujar",20,20);  
  
  textSize(15);
  fill(0);
  text("relleno?", 20,50);
  rect(25,60,15,15);
  noFill();
  rect(50,60,15,15);
  
  
  text("Figura?",20,100);
  strokeWeight(10);
  point(20,120);
  text("punto",40,125);
  strokeWeight(1);
  line(10,150,30,150);
  text("linea",40,150);
  rect(15,170,15,15);
  text("cuadrado",40,180);
  ellipseMode(CENTER);
  ellipse(20,210,15,15);
  text("elipse",40,215);
  
  text("Color?",20,280);
  fill(#FF2D00);
  rect(20,300,15,15);
  fill(#1BFF00);
  rect(20,320,15,15);
  fill(#00C5FF);
  rect(20,340,15,15);
  fill(#0064FF);
  rect(45,300,15,15);
  fill(#8B00FF);
  rect(45,320,15,15);
  fill(#FF00C5);
  rect(45,340,15,15);
  fill(0);
}

void drawFilledOptions(){
  noFill();
  if(fill == true){
    ellipse(32,67,30,30);
  }
  else if(fill == false){
    ellipse(57,67,30,30);
  }
}

void drawFigureOptions(){
  noFill();
  if(shape == 0){
    ellipse(20,120,30,30);
  }
  else if(shape == 1){
     ellipse(20,150,30,30);
   }
   else if(shape == 2){
      ellipse(20,177,30,30);
   }
   else if(shape == 3){
     ellipse(20,210,30,30);
   }
}

void drawColorOptions(){
  if(colour == 0){
    rect(15,295,25,25); // rojo
  }
  else if(colour == 1){
    rect(40,295,25,25); // azul
  }
  else if(colour == 2){
    rect(15,315,25,25); // verde
  }
  else if(colour == 3){
    rect(40,315,25,25); // morado
  }
  else if(colour == 4){
    rect(15,335,25,25); // azul cielo
  }
  else if(colour == 5){
    rect(40,335,25,25); // morado
  }
}

void mouseClicked(){

  if(overOption(25,60,15,15)){
     fill=true;
  }
  else if(overOption(50,60,15,15)){
     fill=false;
  }
  
  
  //Seleccion de figura
  if(overOption(12,100,90,30)){
    shape = 0;
  }
  else if(overOption(12,140,90,30)){
    shape = 1;
  }
  else if(overOption(12,170,90,30)){
    shape = 2;
  }
  else if(overOption(12,200,90,30)){
    shape = 3;
  }
  
  // Color.
  if(overOption(15,295,25,25)){
    colour = #FF2D00; // rojo
  }
  else if(overOption(40,295,25,25)){
    colour = #0064FF; // azul
  }
  else if(overOption(15,315,25,25)){
    colour = #1BFF00; // verde
  }
  else if(overOption(40,315,25,25)){
    colour = #8B00FF; // morado
  }
  else if(overOption(15,335,25,25)){
    colour = #00C5FF; // azul cielo
  }
  else if(overOption(40,335,25,25)){
    colour = #FF00C5; // morado
  }
  
}

void mousePressed(){
  print(mouseX+"_"+mouseY+"\n");
  if(mouseX < 120){
    return;
  }
  Figura f = new Figura();
  f.shape = this.shape;
  f.p1 = new PVector(mouseX, mouseY);
  f.fill = this.fill;
  figuras.add(f);
  

}

void mouseReleased(){
  if(mouseX <= 120){
    if(figuras.size() != 0){
      if(figuras.get(figuras.size() - 1).terminada == false){
        print("Removing figure...\n");
        figuras.remove(figuras.size() - 1);
      }
    }
    return;
  }
  Figura ultima = figuras.get(figuras.size() - 1);
  ultima.p2 = new PVector(mouseX, mouseY);
  ultima.terminada = true;
}

void drawFigures(){
  for (int i = 0; i < figuras.size(); i++) {
    Figura d = figuras.get(i);
    d.despliega();
  }
}

boolean overOption(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
