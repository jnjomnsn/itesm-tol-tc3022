/**
* Title: Tarea 1
* author: Sergio Gabriel Domínguez Cordero
* date: 26-02-2020
*/
int circleX, circleY;//position of circle
int circleSize = 50;   // Diameter of circle
boolean resp;
boolean global_btnPointActive = false, global_btnLineActive = false, global_btnRectActive = false, global_btnEllipseActive = true, global_btn_clear = false;
boolean firstPointDrawn = false;
int originX = 20;
int space_between_buttons = 65;
int x_line, y_line;//Vars to draw the line

int x_area_draw = width/2, y_area_draw = 30;
int width_area_draw = 300, height_area_draw = 600;

void setup(){
  size(640, 500);
   circleX = width/2;
   circleY = height/2;
   areaToDraw(width_area_draw, height_area_draw);
   
   /*buttonPoint(originX, height/2 - space_between_buttons * 2);
   buttonLine(originX, height/2 - space_between_buttons);
   buttonRect(originX, height/2);
   buttonEllipse(originX, height/2 + space_between_buttons);*/
    
}

void draw(){
  new Button(originX, height/2 - space_between_buttons * 2,160, 60, "Punto").genButton(Figura.PUNTO);
  new Button(originX, height/2 - space_between_buttons,160, 60, "Linea").genButton(Figura.LINEA);
  new Button(originX, height/2,160, 60, "Rectángulo").genButton(Figura.RECTANGULO);
  new Button(originX, height/2 + space_between_buttons,160, 60, "Elipse").genButton(Figura.ELIPSE);  
  new Button(originX, height/2 + space_between_buttons * 2,160, 60, "Borrar").genButton(Figura.BLANK);

  new Action(x_area_draw, y_area_draw, width_area_draw, height_area_draw)
                      .drawPoint(originX, height/2 - space_between_buttons * 2,160, 60);
new Action(x_area_draw, y_area_draw, width_area_draw, height_area_draw)
                       .drawLine(originX, height/2 - space_between_buttons, 160,60);
  new Action(x_area_draw, y_area_draw, width_area_draw, height_area_draw).
                      drawRectangle(originX, height/2,160, 60);
  new Action(x_area_draw, y_area_draw, width_area_draw, height_area_draw).                    
                      drawEllipse(originX, height/2 + space_between_buttons,160, 60);
  new Action(x_area_draw, y_area_draw, width_area_draw, height_area_draw)
                        .cleanCanvas(originX, height/2 + space_between_buttons * 2,160, 60);
  //buttonPoint(originX, height/2 - space_between_buttons * 2);
   /*buttonLine(originX, height/2 - space_between_buttons);
   buttonRect(originX, height/2);
   buttonEllipse(originX, height/2 + space_between_buttons);
   buttonBorrar(originX, height/2 + space_between_buttons*2);*/
} 

/*void buttonLine(int originX, int originY) {
  int padding = 7;
  int anchoGlobal = 160, altoGlobal = 60;
  float coordsX_innerRect_origin = originX + padding;
  
  float coordsX_innerRect_end = coordsX_innerRect_origin + (anchoGlobal - anchoGlobal*.65);
  
   fill(255);
   strokeWeight(1);
  //Exterior Rectangle
    stroke(0);
   rect(20, originY, anchoGlobal, altoGlobal);
 
   fill(0);
   //Inner Rectangle
   strokeWeight(5);
    line(coordsX_innerRect_origin + 30, originY + 28, 30 ,originY + 28);
 
   textSize(16);
   //Word
    text("Line", coordsX_innerRect_end + padding , originY + 30);
    
    boolean isOver = overRect(originX, originY, anchoGlobal, altoGlobal);
    if(isOver && mousePressed) {
        btnLineActive = true;
        stroke(255,0,0);
        rect(20, originY, anchoGlobal, altoGlobal);
        line(width/2 + 300, originY + 28, width - 150 ,originY + 28);
    }
}*/

/*void buttonRect(int originX, int originY) {
    int padding = 7, paddingY = 16;
    int anchoGlobal = 160, altoGlobal = 60;
    
    float coordsX_innerRect_origin = originX + padding;
    
    float coordsX_innerRect_end = coordsX_innerRect_origin + (anchoGlobal - anchoGlobal*.65);
  
    fill(255);
    //Exterior Rectangle
    strokeWeight(1);
   rect(20, originY, anchoGlobal, altoGlobal);
   
   fill(0);
   //Inner Rectangle
   rect(coordsX_innerRect_origin, originY + paddingY, anchoGlobal - anchoGlobal*.65, altoGlobal - altoGlobal*.60);
   
   textSize(16);
   //Word
    text("Rectangulo", coordsX_innerRect_end + padding , originY + 30);
    boolean isOver = overRect(originX, originY, anchoGlobal, altoGlobal);
    if(isOver && mousePressed) {
       btnRectActive = true;
       btnPointActive = false;
       btnLineActive = false;
    }
      boolean isInside = overRect(width/2, 30, 300, 600);
    if(btnRectActive && mousePressed && isInside) {
       rect(mouseX, mouseY, 80, 45); 
    }    
}*/

/*void buttonEllipse(int originX, int originY) {
  int padding = 7;
    int anchoGlobal = 160, altoGlobal = 60;
    
    float coordsX_innerRect_origin = originX + padding;
    
    float coordsX_innerRect_end = coordsX_innerRect_origin + (anchoGlobal - anchoGlobal*.65);
    
    fill(255);
    //Exterior Rectangle
    strokeWeight(1);
   rect(20, originY, anchoGlobal, altoGlobal);
   
   fill(0);
   //Inner Rectangle
   ellipse(coordsX_innerRect_origin + 28, originY + 25, anchoGlobal - anchoGlobal*.65, altoGlobal - altoGlobal*.60);
   
   textSize(16);
   //Word
    text("Ellipse", coordsX_innerRect_end + padding , originY + 30);
    boolean isOver = overRect(originX, originY, anchoGlobal, altoGlobal);
    if(isOver && mousePressed)
       btnEllipseActive = true;
       btnRectActive = false;
       btnPointActive = false;
       btnLineActive = false;
     
    boolean isInside = overRect(width/2, 30, 300, 600);
    if(btnRectActive && mousePressed && isInside) {
       ellipse(mouseX, mouseY, 80, 45); 
    }   
}*/

void areaToDraw(int width_area_draw, int hight_area_draw) {
    strokeWeight(1);
    stroke(0);
    fill(38, 94, 55);
   rect(width/2, 30, width_area_draw, hight_area_draw); 
}


enum Figura {
   PUNTO, LINEA, RECTANGULO, ELIPSE, TRIANGULO, BLANK 
}

class Button {
    private int x, y, width, height;
    private String name;
    
    public Button(int x, int y,int width, int height, String name) {//width: 160  height:60
      this.x = x;
      this.y = y;
      this.width = width;
      this.height = height;
      this.name = name;
    }
  
    public void genButton(Figura figure) {//Exterior Rectangle
      fill(255);
      //Exterior Rectangle
        strokeWeight(1);
       rect(20, this.y, this.width, this.height);//Same Rectangle
       
       switch(figure) {
         case PUNTO:
           new InnerFigure(this.x, this.y, this.width, this.height, this.name).genInnerPoint();
           break;
         case LINEA:
           new InnerFigure(this.x, this.y, this.width, this.height, this.name).genInnerLine();
           break;
         case RECTANGULO:
             new InnerFigure(this.x, this.y, this.width, this.height, this.name).genInnerRectangle();
             break;
         case ELIPSE:
           new InnerFigure(this.x, this.y, this.width, this.height, this.name).genInnerEllipse();
           break;
         case BLANK:
           new InnerFigure(this.x, this.y, this.width, this.height, this.name).genInnerClear();
           break;
       }
       
    }
  
    class InnerFigure { 
        private float coordsX_innerRect_origin;
        private float coordsX_innerRect_end;
        private int x, y;
        
        
        public InnerFigure(int x, int y, int width, int height, String name) {
          this.x = x;
          this.y = y;
          coordsX_innerRect_origin = this.x + 7;  
          coordsX_innerRect_end = coordsX_innerRect_origin + (width - width*.65);
        }
        
        public void genInnerPoint() {
            //Inner Rectangle
           strokeWeight(10);
           point(coordsX_innerRect_origin + 30, this.y + 25); 
           genInnerText();
        }
        
        public void genInnerLine() {
            //Inner Rectangle
            fill(0);   
             strokeWeight(2);
            line(coordsX_innerRect_origin + 30, this.y + 28, 30 , this.y + 28);
 
           genInnerText();
        }
        
        public void genInnerRectangle() {
            //Inner Rectangle
           strokeWeight(1);
           fill(0);
           rect(coordsX_innerRect_origin, this.y + 7, width - width*.65, height - height*.60);
           
           genInnerText();
        }
        
        public void genInnerEllipse() {
            strokeWeight(1);
            fill(0);
           ellipse(coordsX_innerRect_origin + 28, this.y + 25, width - width*.65, height - height*.60); 
           genInnerText();
        }
        
        public void genInnerClear() {
           strokeWeight(10); 
           genInnerText();
        }
        
        private void genInnerText() {
           textSize(16);
           fill(0);
          text(name, coordsX_innerRect_end + 7 , this.y + 30); 
        }
    }
}

class Action {
    private int x_draw_area, y_draw_area, width_draw_area, height_draw_area;
   
   public Action(int x_draw_area, int y_draw_area, int width_draw_area, int height_draw_area) {
     this. x_draw_area = x_draw_area;
     this.y_draw_area = y_draw_area;
     this.width_draw_area = width_draw_area;
     this.height_draw_area = height_draw_area;
   }
   
   public void cleanCanvas(int x_btn, int y_btn, int width_btn, int height_btn) {
       //This func determines if the cursor is over the button
       boolean isOver = overRect(x_btn, y_btn, width_btn, height_btn);//Aqui las coords y dimensiones del boton
       isActive(isOver, Figura.BLANK);
       if(global_btn_clear) {
           background(204, 204, 204);
           areaToDraw(width_area_draw, height_area_draw);
       }
       //Restart state of buuton
       global_btn_clear = false;
       
   }
   
   
   public void drawPoint(int x_btn, int y_btn, int width_btn, int height_btn) {       
       
       //This func determines if the cursor is over the draw area
       boolean isInside = overRect(320, this.y_draw_area, this.width_draw_area, this.height_draw_area);//! Modificar coords más adelante
       validatePressedButton(x_btn, y_btn, width_btn, height_btn, Figura.PUNTO);//modify the state of the point button

       if(global_btnPointActive && mousePressed && isInside) {
            strokeWeight(15);
            stroke(255,0,0);
            point(mouseX, mouseY);
        }
   }
   
   public void drawRectangle(int x_btn, int y_btn, int width_btn, int height_btn) {
        //This func determines if the cursor is over the draw area
       boolean isInside = overRect(320, this.y_draw_area, this.width_draw_area, this.height_draw_area);//! Modificar coords más adelante
       validatePressedButton(x_btn, y_btn, width_btn, height_btn, Figura.RECTANGULO);//modify the state of the point button

       if(global_btnRectActive && mousePressed && isInside) {
            strokeWeight(1);
            stroke(0,255,0);
            rect(mouseX,mouseY,70,45);
        }
   }
   
    public void drawEllipse(int x_btn, int y_btn, int width_btn, int height_btn) {
        //This func determines if the cursor is over the draw area
       boolean isInside = overRect(320, this.y_draw_area, this.width_draw_area, this.height_draw_area);//! Modificar coords más adelante
       validatePressedButton(x_btn, y_btn, width_btn, height_btn, Figura.ELIPSE);//modify the state of the point button
       if(global_btnEllipseActive && mousePressed && isInside) {
            strokeWeight(1);
            stroke(0,0,255);
            ellipse(mouseX,mouseY,70,45);
        }
   }
   
   public void drawLine(int x_btn, int y_btn, int width_btn, int height_btn) {
        //This func determines if the cursor is over the draw area
       boolean isInside = overRect(320, this.y_draw_area, this.width_draw_area, this.height_draw_area);//! Modificar coords más adelante
       validatePressedButton(x_btn, y_btn, width_btn, height_btn, Figura.LINEA);//modify the state of the point button
       if(global_btnLineActive && mousePressed && isInside) {
            strokeWeight(1);
            stroke(0,0,255);
            line(320,this.y_draw_area,mouseX,mouseY);
        }
   }

   private void validatePressedButton(int x_btn, int y_btn, int width_btn, int height_btn, Figura boton_figura) {
        //This func determines if the cursor is over the button
       boolean isOver = overRect(x_btn, y_btn, width_btn, height_btn);//Aqui las coords y dimensiones del boton
       isActive(isOver, boton_figura);
       //Change the visual state of the button
        if(global_btnPointActive && mousePressed && isOver) {
            strokeWeight(15);
            fill(255);
        }      
   }

   private boolean overRect(int x, int y, int width, int height) {
     if(mouseX >= x && mouseX <= (x + width) && mouseY >= y && mouseY <= (y + height))
       return true;
     else
       return false; 
   }
   
   //Validates if a button is active
   private void isActive(boolean isOver, Figura boton_figura) {
     if(isOver && mousePressed) { //Detect if point button is active
     
           switch(boton_figura) {
              case PUNTO:
                global_btnPointActive = true;//Global
                global_btnLineActive = false;
                global_btnRectActive = false;
                global_btnEllipseActive = false;
                global_btn_clear = false;
                 break;
              case LINEA:
                global_btnPointActive = false;//Global
                global_btnLineActive = true;
                global_btnRectActive = false;
                global_btnEllipseActive = false;
                global_btn_clear = false;
                break;
              case RECTANGULO:
                global_btnRectActive = true;
                global_btnPointActive = false;//Global
                global_btnLineActive = false;
                global_btnEllipseActive = false;
                global_btn_clear = false;
                break;
            case ELIPSE:
                global_btnRectActive = false;
                global_btnPointActive = false;//Global
                global_btnLineActive = false;
                global_btnEllipseActive = true;
                global_btn_clear = false;
              break;
              case BLANK:
                global_btn_clear = true;
                break;
           }
           
           //btnLineActive = false;//Global
           stroke(255,0,0);
           //rect(x, y, this.width, this.height);//Same Rectangle
       }
   }
   
}





/*if(btnLineActive && mousePressed && !firstPointDrawn) {
      strokeWeight(3);     
      firstPointDrawn = true;
      x_line = mouseX;
      y_line = mouseY;
      point(x_line, y_line);
    } else {   
         firstPointDrawn = false;//At this point the second point was drawn
         //At this point the line was not completed
          for(int x = x_line; x <= mouseX; x++){
             for(int y = y_line; y <= mouseY; y++) {
               point(x, y);
             }
          }
    }*/
