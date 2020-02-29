int x1 = 120, y1 = 120;
int x2 = 400, y2 = 100;

int circlePoint_x = 300;
int circlePoint_y = 300;
int circleDiameter = 300;

int line_x = 600, line_y = 100;

int parallelLine_x = 600, parallelLine_y = 200;
int cuttingLine_x = 600, cuttingLine_y = 500;
void setup(){
  size(1000, 700);
}

void draw(){
  background(0);
  stroke(255);
  
  euclids_1();
  euclids_2();
  euclids_3();
  euclids_4();
  euclids_5();
  euclids_6();
}

void euclids_1(){
  strokeWeight(4);
  point(x1,y1);
  point(x2,y2);
  
  strokeWeight(1);
  line(x1, y1, x2, y2);
}

void euclids_2(){
  noFill();
  circle(circlePoint_x, circlePoint_y, circleDiameter);
  
  strokeWeight(5);
  point(circlePoint_x, circlePoint_y);
  
  strokeWeight(1);
  line(circlePoint_x, circlePoint_y, circlePoint_x, circlePoint_y - (circleDiameter/2));
}

void euclids_3(){
  strokeWeight(2);
  int i = 0;
  for(i = 0; i<200; i+=5){
    point(50+i, 500);
  }
  strokeWeight(3);
  line(50+(i/4), 500, 50+(i/2), 500);
}

void  euclids_4(){
  strokeWeight(3);
  line(line_x, line_y,line_x+100, line_y);
  line(line_x+50, line_y,line_x+50, line_y-75);
  strokeWeight(1);
  line(line_x+25, line_y,line_x+25, line_y-25);
  line(line_x+25, line_y-25,line_x+75, line_y-25);
  line(line_x+75, line_y,line_x+75, line_y-25);
}

void euclids_5(){
  strokeWeight(1);
  
  int overflow_x = 30, overflow_y = 20;
  
  line(parallelLine_x, parallelLine_y, parallelLine_x + 200, parallelLine_y);
  
  int i = 0;
  for(i = 0; i<200; i+=5){
    point(parallelLine_x+overflow_x+i, parallelLine_y-overflow_y);
  }
  
  strokeWeight(3);
  circle(parallelLine_x + overflow_x + i - 100, parallelLine_y - overflow_y, 10);
}

void euclids_6(){
  strokeWeight(1);
  
  int i = 0;
  
  for(i = 0; i<300; i+=5){
    int pointX_1, pointY_1;
    int pointX_2, pointY_2;
    int pointX_3, pointY_3;
    
    pointX_1 = cuttingLine_x+i;
    pointY_1 = cuttingLine_y-(i/2);
    pointX_2 = cuttingLine_x+i;
    pointY_2 = (cuttingLine_y-20)+(i/2);
    pointX_3 = 800;
    pointY_3 = 350+i;
    
    circle(620,490,50);
    
    point(pointX_1, pointY_1);
    point(pointX_2, pointY_2);
    point(pointX_3, pointY_3);
  }
}
