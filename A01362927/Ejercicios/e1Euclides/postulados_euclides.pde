void setup(){
  size(1000,600);
}

void draw(){
  post01();
  post02();
  post03();
  post04();
  post05();
  post06();
}

void post01(){
  float x1 = 45;
  float y1 = 75;
  float x2 = 159;
  float y2 = 185;
  circle(x1, y1, 5);
  circle(x2, y2, 5);
  line(x1, y1, x2, y2);
}

void post02(){
  for(int i = 10; i<=400; i+=3)
  {
    point(i, 300);
  }
  line(110, 300, 300, 300);
}

void post03(){
  float centerX = 300;
  float centerY = 100;
  float radius = 60;
  float diame = radius*2;
  float endX = centerX + radius;
  circle(centerX, centerY, diame);
  line(centerX, centerY, endX, centerY);
  circle(centerX, centerY, 5);
}

void post04(){
  float rectX1 = 650;
  float rectY1 = 150;
  rect(rectX1, rectY1, 100, 50);
  line(600, 200, 800, 200);
  line(700, 70, 700, 200);  
}

void post05(){  
  line(600, 280, 800, 280);
  for(int i = 650; i<=850; i+=3)
  {
    point(i, 245);
  }
  circle(750, 245, 8);  
}

void post06(){
  line(400, 400, 460, 570);
  line(360, 430, 580, 440);
  line(410, 560, 580, 415);
}
