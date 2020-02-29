int posFilledX = 80;
int posFilledY = 130;
int posNoFilledX = 120;
int posNoFilledY = 130;
int posShapeX =80;
int posShapeY = 230;
int intervalShapeY = 30;
int colorPosX = 80;
int colorPosY = 430;
int intervalColorX = 40;
int intervalColorY = 40;
int blue[] = {0,112,254};
int red[] = {255,15,0};
int green[] = {50,255,44};
int purple[] = {236,27,242};
int orange[] = {255,139,0};
int cian[] = {0,232,255};
int shape = 0;
int colorNum = 0;
int initialX;
int initialY;
boolean fil = false, isDrawing = false;

public ArrayList<Figures> sceneFigures = new ArrayList<Figures>();

public class Figures {
  public int coloFig;
  public boolean isFilled;
  public int shape;
  public int []posI = new int[2];
  public int []posF = new int[2];
  public int radious;

  public Figures(int coloFig, boolean isFilled, int shape, int x1, int y1, int x2, int y2){
    this.coloFig = coloFig;
    this.isFilled = isFilled;
    this.shape = shape;
    posI[0] = x1;
    posI[1] = y1;
    posF[0] = x2;
    posF[1] = y2;
    radious = 0;
  }
  public Figures(int coloFig, boolean isFilled, int shape, int x1, int y1, int radious){
    this.coloFig = coloFig;
    this.isFilled = isFilled;
    this.shape = shape;
    posI[0] = x1;
    posI[1] = y1;
    posF[0] = 0;
    posF[1] = 0;
    this.radious = radious;
  }
}

void setup(){
  size(1000,1000);
}

void draw(){
  menu();
  for (int i = 0; i < sceneFigures.size(); ++i) {
    Figures actual = sceneFigures.get(i);
    if(actual.isFilled){
      if(actual.coloFig==1){
        fill(blue[0],blue[1],blue[2]);
        stroke(blue[0],blue[1],blue[2]);
      }
      if(actual.coloFig==2){
        fill(red[0],red[1],red[2]);
        stroke(red[0],red[1],red[2]);
      }
      if(actual.coloFig==3){
        fill(green[0],green[1],green[2]);
        stroke(green[0],green[1],green[2]);
      }
      if(actual.coloFig==4){
        fill(purple[0],purple[1],purple[2]);
        stroke(purple[0],purple[1],purple[2]);
      }
      if(actual.coloFig==5){
        fill(orange[0],orange[1],orange[2]);
        stroke(orange[0],orange[1],orange[2]);
      }
      if(actual.coloFig==6){
        fill(cian[0],cian[1],cian[2]);
        stroke(cian[0],cian[1],cian[2]);
      }
    }
    
    if(actual.radious!=0){
      stroke(0);
      ellipseMode(CORNER);
      ellipse(actual.posI[0],actual.posI[1],actual.radious,actual.radious);
    }
    else{
      if(actual.shape==2){
        line(actual.posI[0],actual.posI[1],actual.posF[0],actual.posF[1]);
      }
      if(actual.shape==3){
        stroke(0);
        rectMode(CORNERS);
        rect(actual.posI[0],actual.posI[1],actual.posF[0],actual.posF[1]);
      }
      if(actual.shape==4){
        stroke(0);
        ellipseMode(CORNERS);
        ellipse(actual.posI[0],actual.posI[1],actual.posF[0],actual.posF[1]);
      }
    }
    stroke(0);
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
  }
}
void mousePressed(){
 //circle(posFilledX,posFilledY,40);
  if(mouseX>(posFilledX-10)&&mouseX<(posFilledX+10)&&mouseY>(posFilledY-10)&&mouseY<(posFilledY+10))
    fil=true;
 else if(mouseX>(posNoFilledX-10)&&mouseX<(posNoFilledX+10)&&mouseY>(posNoFilledY-10)&&mouseY<(posNoFilledY+10))
   fil=false;
 else if(mouseX>(posShapeX-30)&&mouseX<(posShapeX+110)&&mouseY>(posShapeY-15)&&mouseY<(posShapeY+15))
    shape = 1;
 else if(mouseX>(posShapeX-30)&&mouseX<(posShapeX+110)&&mouseY>(posShapeY-15+(intervalShapeY))&&mouseY<(posShapeY+15+(intervalShapeY)))
    shape = 2;
 else if(mouseX>(posShapeX-30)&&mouseX<(posShapeX+110)&&mouseY>(posShapeY-15+(intervalShapeY*2))&&mouseY<(posShapeY+15+(intervalShapeY*2)))
    shape = 3;
 else if(mouseX>(posShapeX-30)&&mouseX<(posShapeX+110)&&mouseY>(posShapeY-15+(intervalShapeY*3))&&mouseY<(posShapeY+15+(intervalShapeY*3)))
    shape = 4;
 else if(mouseX>(colorPosX-10)&&mouseX<(colorPosX+10)&&mouseY>(colorPosY-10)&&mouseY<(colorPosY+10))
   colorNum = 1;
 else if(mouseX>(colorPosX+intervalColorX-10)&&mouseX<(colorPosX+intervalColorX+10)&&mouseY>(colorPosY-10)&&mouseY<(colorPosY+10))
   colorNum = 2;
 else if(mouseX>(colorPosX-10)&&mouseX<(colorPosX+10)&&mouseY>(colorPosY+intervalColorY-10)&&mouseY<(colorPosY+intervalColorY+10))
   colorNum = 3;
 else if(mouseX>(colorPosX+intervalColorX-10)&&mouseX<(colorPosX+intervalColorX+10)&&mouseY>(colorPosY+intervalColorY-10)&&mouseY<(colorPosY+intervalColorY+10))
   colorNum = 4;
 else if(mouseX>(colorPosX-10)&&mouseX<(colorPosX+10)&&mouseY>(colorPosY+(intervalColorY*2)-10)&&mouseY<(colorPosY+(intervalColorY*2)+10))
   colorNum = 5;
 else if(mouseX>(colorPosX+intervalColorX-10)&&mouseX<(colorPosX+intervalColorX+10)&&mouseY>(colorPosY+(intervalColorY*2)-10)&&mouseY<(colorPosY+(intervalColorY*2)+10))
   colorNum = 6;
 else{
   isDrawing = true;
   initialX = mouseX;
   initialY = mouseY;
 }
}

void mouseReleased() {
  if(isDrawing){
    if(shape==1)
      sceneFigures.add(new Figures(colorNum,fil,shape,initialX,initialY,(mouseX-initialX)));
    else
      sceneFigures.add(new Figures(colorNum,fil,shape,initialX,initialY,mouseX,mouseY));
    isDrawing = !isDrawing;
  }
}

void menu(){
  background(255,255,255);
  textSize(40);
  fill(180,210,100);
  text("Filled?",50,100);
  rectMode(CENTER);
  rect(posFilledX,posFilledY,20,20);
  noFill();
  rect(posNoFilledX,posNoFilledY,20,20);
  //Shape to Draw
  text("Shape?",50,200);
  circle(posShapeX-20,posShapeY,20);
  textSize(20);
  text("Circle",posShapeX,posShapeY+10);
  line(posShapeX-30,posShapeY+intervalShapeY,posShapeX-10,posShapeY+intervalShapeY);
  text("Line",posShapeX,posShapeY+10+intervalShapeY);
  rectMode(CENTER);
  rect(posShapeX-20,posShapeY+(2*intervalShapeY),20,10);
  text("Rectangle",posShapeX,posShapeY+10+(2*intervalShapeY));
  ellipse(posShapeX-20,posShapeY+(3*intervalShapeY),20,10);
  text("Ellipse",posShapeX,posShapeY+10+(3*intervalShapeY));
  //Colour
  textSize(40);
  text("Color?",50,400);
  fill(blue[0],blue[1],blue[2]);
  rect(colorPosX,colorPosY,20,20);
  fill(red[0],red[1],red[2]);
  rect(colorPosX+intervalColorX,colorPosY,20,20);
  fill(green[0],green[1],green[2]);
  rect(colorPosX,colorPosY+intervalColorY,20,20);
  fill(purple[0],purple[1],purple[2]);
  rect(colorPosX+intervalColorX,colorPosY+intervalColorY,20,20);
  fill(orange[0],orange[1],orange[2]);
  rect(colorPosX,colorPosY+(2*intervalColorY),20,20);
  fill(cian[0],cian[1],cian[2]);
  rect(colorPosX+intervalColorX,colorPosY+(2*intervalColorY),20,20);
  noFill();
  //Selected Options
  if(fil)
    circle(posFilledX,posFilledY,40);
  if(!fil)
    circle(posNoFilledX,posNoFilledY,40);
  if(shape==1)
    rect(posShapeX+30,posShapeY,140,30);
  if(shape==2)
    rect(posShapeX+30,posShapeY+intervalShapeY,140,30);
  if(shape==3)
    rect(posShapeX+30,posShapeY+(intervalShapeY*2),140,30);
  if(shape==4)
    rect(posShapeX+30,posShapeY+(intervalShapeY*3),140,30);
  if(colorNum==1)
    circle(colorPosX,colorPosY,40);
  if(colorNum==2)
    circle(colorPosX+intervalColorX,colorPosY,40);
  if(colorNum==3)
    circle(colorPosX,colorPosY+intervalColorY,40);
  if(colorNum==4)
    circle(colorPosX+intervalColorX,colorPosY+intervalColorY,40);
  if(colorNum==5)
    circle(colorPosX,colorPosY+(2*intervalColorY),40);
  if(colorNum==6)
    circle(colorPosX+intervalColorX,colorPosY+(2*intervalColorY),40);
}
