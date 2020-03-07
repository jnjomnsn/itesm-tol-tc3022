PFont font;

int yellow;
int blue;
int red;
int green;
int black;
int white;

String point_str = "Point";
String line_str = "Line";
String rect_str = "Rectangle";
String ellip_str = "Ellipse";

color actual_color = color(255, 255, 255);    // Para saber el color actual
boolean is_fill = false;       // Para saber si la figura tiene relleno
int actual_shape = 0;      // Para saber que figura se selecciono (0 = point, 1 = line, 2 = rect, 3 = ellipse)

int pos_init_X = 0;
int pos_init_Y = 0;
int pos_final_X = 0;
int pos_final_Y = 0;
int dist_X = 0;
int dist_Y = 0;

void setup(){
  size(1200,650);
  background(255);
  yellow = color(255, 255, 0);
  blue = color(0, 0, 255);
  red = color(255, 0, 0);
  green = color(0, 255, 0);
  black = color(0, 0, 0);
  white = color(255, 255, 255);
  draw_toolbar();
}

void draw(){
  
  if(mousePressed)
  {
    stroke(actual_color);
    if(is_fill){
      fill(actual_color);
    }
    else
    {
      noFill();
    }
    if((mouseX >= 255) && (mouseY >= 0) && (mouseX <= 1200) && (mouseY <= 650))
    {
      pos_init_X = mouseX;
      pos_init_Y = mouseY;
      if(actual_shape == 0)
      {
        point(pos_init_X,pos_init_Y);
      }
      if(actual_shape == 1)
      {
        line(pos_init_X,pos_init_Y, 900,500);
      }
      if(actual_shape == 2)
      {
        rectMode(CORNER);        
        rect(pos_init_X,pos_init_Y,50,80);        
      }
      if(actual_shape == 3)
      {
      }
    }
  }
}


void mousePressed(){
  // IS FILL?
  if((mouseX >= 30) && (mouseY >= 100) && (mouseX <= 60) && (mouseY <= 130))
  {
    is_fill = true;
  }
  if((mouseX >= 90) && (mouseY >= 100) && (mouseX <= 120) && (mouseY <= 130))
  {
    is_fill = false;
  }
  // ACTUAL SHAPE
  if((mouseX >= 30) && (mouseY >= 240) && (mouseX <= 50) && (mouseY <= 260))
  {
    actual_shape = 0;  // IS POINT
  }
  if((mouseX >= 5) && (mouseY >= 292) && (mouseX <= 75) && (mouseY <= 308))
  {
    actual_shape = 1;  // IS LINE
  }
  if((mouseX >= 10) && (mouseY >= 340) && (mouseX <= 70) && (mouseY <= 360))
  {
    actual_shape = 2;  // IS RECTANGLE
  }
  if((mouseX >= 10) && (mouseY >= 400) && (mouseX <= 70) && (mouseY <= 420))
  {
    actual_shape = 3;  // IS ELLIPSE
  }
  // ACTUAL COLOR
  if((mouseX >= 30) && (mouseY >= 530) && (mouseX <= 50) && (mouseY <= 550))
  {
    actual_color = color(white);
  }
  if((mouseX >= 70) && (mouseY >= 530) && (mouseX <= 90) && (mouseY <= 550))
  {
    actual_color = color(yellow);
  }
  if((mouseX >= 110) && (mouseY >= 530) && (mouseX <= 130) && (mouseY <= 550))
  {
    actual_color = color(green);
  }
  if((mouseX >= 30) && (mouseY >= 570) && (mouseX <= 50) && (mouseY <= 590))
  {
    actual_color = color(black);
  }
  if((mouseX >= 70) && (mouseY >= 570) && (mouseX <= 90) && (mouseY <= 590))
  {
    actual_color = color(blue);
  }
  if((mouseX >= 110) && (mouseY >= 570) && (mouseX <= 130) && (mouseY <= 590))
  {
    actual_color = color(red);
  }
  print(actual_shape + "Pos: "+mouseX+","+mouseY+"\n");
}

void draw_toolbar(){
  rect(0, 0, 250, 650);
  draw_fill_btn();
  draw_shape_btn();
  draw_colors_btn();  
}

void draw_fill_btn(){
  font = createFont("Georgia", 20, true);
  textFont(font);
  fill(blue);
  text("Choose a fill", 10, 50);
  fill(black);
  triangle(30, 130, 45, 100, 60, 130);
  fill(white);
  triangle(90, 130, 105, 100, 120, 130);
}

void draw_shape_btn(){
  font = createFont("Georgia", 20, true);
  textFont(font);
  fill(blue);
  text("Choose a shape", 10, 200);
  font = createFont("Arial", 20, true);
  textFont(font);
  fill(black);
  ellipseMode(CENTER);
  ellipse(40, 250, 20 , 20);
  text(point_str, 100, 260);
  rectMode(CENTER);
  rect(40, 300, 70, 4);
  text(line_str, 100, 310);
  rect(40, 350, 60, 20);
  text(rect_str, 100, 360);
  ellipse(40, 410, 60, 20);
  text(ellip_str, 100, 420);
}

void draw_colors_btn(){
  font = createFont("Georgia", 20, true);
  textFont(font);
  fill(blue);
  text("Choose a color", 10, 490);
  fill(white);
  rectMode(CENTER);
  rect(40,540,20,20);
  fill(yellow);
  rect(80,540,20,20);
  fill(green);
  rect(120,540,20,20);
  fill(black);
  rect(40,580,20,20);
  fill(blue);
  rect(80,580,20,20);
  fill(red);
  rect(120,580,20,20);
}
