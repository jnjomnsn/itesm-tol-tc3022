PFont font;
//true es lleno
boolean opcionDeLlenado = true;
boolean figura = false;
boolean actual = false;

static final int fontSize = 16;

float tamCirc=25;
float radioCirc = tamCirc/2;
float posXCirc1 = 62;
float posYCirc1 = 123;
float posXCirc2 = 92;
float posYCirc2 = 123;

float posXShape = 50;
float posYPoint = 225;
int dif = 40;
float posYLine = posYPoint + dif;
float posYRect = posYLine + dif;
float posYEll = posYRect + dif;

/**
1 punto
2 linea
3 rectangulo
4 elipse
*/
int opcionDeFigura =1;

//ArrayList[][] valorMouseXY = new ArrayList[1000][2];
int[][] valorMouseXY = new int[1000][8];
int i=0;

int posXColor = 50;
int posXColor2 = posXColor+30;
//String colorSeleccionado = "#7e58a7";

int colorSeleccionado = 1;

void setup(){
  size(500,700);
  font = createFont("Arial",fontSize,true);
}

void draw(){
  menu();
  if (opcionDeLlenado) {
    noFill();
    rect(47,108,29,29);
  } else {
    noFill();
    rect(77,108,29,29);
  }
  switch (opcionDeFigura) {
    case 1 :
      noFill();
      rect(45,posYPoint-fontSize,45,20);
    break;
    case 2 :
      noFill();
      rect(45,posYLine-fontSize,45,20);
    break;
    case 3 :
      noFill();
      rect(45,posYRect-fontSize,95,20);
    break;
    case 4 :
      noFill();
      rect(45,posYEll-fontSize,70,20);
    break;	
  }

  switch (colorSeleccionado) {
    case 1 :
      stroke(#e60000);
      circle(posXColor+10,410, 35);
      stroke(#0a0000);
    break;
    case 2 :
      stroke(#e60000);
      circle(posXColor2+10,410, 35);
      stroke(#0a0000);
    break;
    case 3 :
      stroke(#e60000);
      circle(posXColor+10,450, 35);
      stroke(#0a0000);
    break;
    case 4 :
      stroke(#e60000);
      circle(posXColor2+10,450, 35);
      stroke(#0a0000);
    break;
    case 5 :
      stroke(#e60000);
      circle(posXColor+10,490, 35);
      stroke(#0a0000);
    break;
    case 6 :
      stroke(#e60000);
      circle(posXColor2+10,490, 35);
      stroke(#0a0000);
    break;
  }

  if (figura) {
    for (int j = 1; j <= i; ++j) {
      if(valorMouseXY[j][6]==1)
        switch (valorMouseXY[j][7]) {
          case 1 :
            fill(#7e58a7);
          break;
          case 2 :
            fill(#33ccc4);
          break;
          case 3 :
            fill(#a30a96);
          break;
          case 4 :
            fill(#faf0b7);
          break;
          case 5 :
            fill(#b7fadc);
          break;
          case 6 :
            fill(#72dd0e);
          break;
        }
      else{
        noFill();
        switch (valorMouseXY[j][7]) {
          case 1 :
            stroke(#7e58a7);
          break;
          case 2 :
            stroke(#33ccc4);
          break;
          case 3 :
            stroke(#a30a96);
          break;
          case 4 :
            stroke(#faf0b7);
          break;
          case 5 :
            stroke(#b7fadc);
          break;
          case 6 :
            stroke(#72dd0e);
          break;
        }
      }
      switch (valorMouseXY[j][2]) {
        case 1 :
          ellipseMode(CORNER);
          ellipse(valorMouseXY[j][0],valorMouseXY[j][1],valorMouseXY[j][5],valorMouseXY[j][5]);
          ellipseMode(CENTER);
        break;
        case 2 :
          line(valorMouseXY[j][0],valorMouseXY[j][1],valorMouseXY[j][3],valorMouseXY[j][4]);
        break;
        case 3 :
          rectMode(CORNERS);
          rect(valorMouseXY[j][0],valorMouseXY[j][1],valorMouseXY[j][3],valorMouseXY[j][4]);
          rectMode(CORNER);
        break;
        case 4 :
          ellipseMode(CORNERS);
          ellipse(valorMouseXY[j][0],valorMouseXY[j][1],valorMouseXY[j][3],valorMouseXY[j][4]);
          ellipseMode(CENTER);
        break;
      }
      stroke(0);
    }
  }
}

void menu(){
  background(255);
  textFont(font,fontSize);                  
  fill(0);                         
  text("Filled?",posXShape,100); 
  circle(posXCirc1,posYCirc1,tamCirc);
  
  noFill();
  circle(posXCirc2,posYCirc2,tamCirc);
  
  text("Shape?",posXShape,200);

  fill(0);
  //punto
  circle(30,220,20);
  text("Point",posXShape,posYPoint); 
  //linea
  strokeWeight(2);
  line(20,260,40,260);
  text("Line",posXShape,posYLine);
  //rectangulo
  rect(20,290 , 25,15);
  text("Rectangle",posXShape,posYRect);
  //elipse
  ellipse(30,340, 25,20);
  text("Ellipse",posXShape,posYEll);

  text("Color?",posXShape,390);

  fill(#7e58a7);
  rect(posXColor,400, 20,20);
  fill(#33ccc4);
  rect(posXColor2,400, 20,20);
  fill(#a30a96);
  rect(posXColor,440, 20,20);
  fill(#faf0b7);
  rect(posXColor2,440, 20,20);
  fill(#b7fadc);
  rect(posXColor,480, 20,20);
  fill(#72dd0e);
  rect(posXColor2,480, 20,20);
  fill(0);

  text("Figure: ",posXShape+200,100);

  text("Delete",posXShape,600);
}

void mouseClicked() {
  //println("Pos en x: "+mouseX+" Pos en y: "+mouseY);
  //println("mouseX: "+mouseX+" mouseY: "+mouseY);
  if(clickBotonRelleno())
    opcionDeLlenado = true;
  else if (clickBotonNoRelleno())
    opcionDeLlenado = false;
  else if(clickPuntoShape())
    opcionDeFigura = 1;
  else if(clickLineaShape())
    opcionDeFigura = 2;
  else if(clickRectanguloShape())
    opcionDeFigura = 3;
  else if(clickElipseShape())
    opcionDeFigura = 4;
  else if(clickColor1())
    colorSeleccionado = 1;
  else if(clickColor2())
    colorSeleccionado = 2;
  else if(clickColor3())
    colorSeleccionado = 3;
  else if(clickColor4())
    colorSeleccionado = 4;
  else if(clickColor5())
    colorSeleccionado = 5;
  else if(clickColor6())
    colorSeleccionado = 6;
  else if(clickBorrar())
    i=0;
}

void mousePressed() {
  if(!(clickBotonNoRelleno()&&clickBotonRelleno()&&clickColor1()&&clickColor2()&&clickColor3()&&clickColor4()&&clickColor5()&&clickColor6()&&clickElipseShape()&&clickLineaShape()&&clickPuntoShape()&&clickRectanguloShape()&&clickBorrar())){
    actual = false;
    i++;
    if (opcionDeLlenado)
      valorMouseXY[i][6] = 1;
    else
      valorMouseXY[i][6] = 0;
    valorMouseXY[i][7] = colorSeleccionado;
    valorMouseXY[i][0] = mouseX;
    valorMouseXY[i][1] = mouseY;
    valorMouseXY[i][2] = opcionDeFigura;
    valorMouseXY[i][3] = mouseX;
    valorMouseXY[i][4] = mouseY;
  }
}

void mouseReleased() {
  if(!(clickBotonNoRelleno()&&clickBotonRelleno()&&clickColor1()&&clickColor2()&&clickColor3()&&clickColor4()&&clickColor5()&&clickColor6()&&clickElipseShape()&&clickLineaShape()&&clickPuntoShape()&&clickRectanguloShape()&&clickBorrar())){
    valorMouseXY[i][3] = mouseX;
    valorMouseXY[i][4] = mouseY;
    valorMouseXY[i][5] = (int)dist(valorMouseXY[i][0],valorMouseXY[i][1],valorMouseXY[i][3],valorMouseXY[i][4]);
    figura = true;
    actual = true;
  }
}

void keyPressed() { 
  if (key == 'p' || key == 'P')
    opcionDeFigura =1;
  if (key == 'l' || key == 'L')
    opcionDeFigura =2;
  if (key == 'r' || key == 'R')
    opcionDeFigura =3;
  if (key == 'e' || key == 'E')
    opcionDeFigura =4;
}

boolean clickBorrar(){
  return mouseX>(posXShape) && mouseX < (posXShape+80) && mouseY>(600-fontSize) && mouseY <(600);
}

boolean clickBotonNoRelleno(){
  return mouseX>(posXCirc2-radioCirc) && mouseX < (posXCirc2+radioCirc) && mouseY>(posYCirc2-radioCirc) && mouseY <(posYCirc2+radioCirc);
}

boolean clickBotonRelleno(){
  return mouseX>(posXCirc1-radioCirc) && mouseX < (posXCirc1+radioCirc) && mouseY>(posYCirc1-radioCirc) && mouseY <(posYCirc1+radioCirc);
}

boolean clickPuntoShape(){
  return mouseX>(17) && mouseX < (89) && mouseY>(posYPoint-fontSize) && mouseY <(posYPoint);
}

boolean clickLineaShape(){
  return mouseX>(18) && mouseX < (80) && mouseY>(posYLine-fontSize) && mouseY <(posYLine);
}

boolean clickRectanguloShape(){
  return mouseX>(16) && mouseX < (122) && mouseY>(posYRect-fontSize) && mouseY <(posYRect);
}

boolean clickElipseShape(){
  return mouseX>(15) && mouseX < (99) && mouseY>(posYEll-fontSize) && mouseY <(posYEll);
}

boolean clickColor1(){
  return mouseX>(posXColor) && mouseX < (posXColor+20) && mouseY>(400) && mouseY <(420);
}

boolean clickColor2(){
  return mouseX>(posXColor2) && mouseX < (posXColor2+20) && mouseY>(400) && mouseY <(420);
}

boolean clickColor3(){
  return mouseX>(posXColor) && mouseX < (posXColor+20) && mouseY>(440) && mouseY <(460);
}

boolean clickColor4(){
  return mouseX>(posXColor2) && mouseX < (posXColor2+20) && mouseY>(440) && mouseY <(460);
}

boolean clickColor5(){
  return mouseX>(posXColor) && mouseX < (posXColor+20) && mouseY>(480) && mouseY <(500);
}

boolean clickColor6(){
  return mouseX>(posXColor2) && mouseX < (posXColor2+20) && mouseY>(480) && mouseY <(500);
}