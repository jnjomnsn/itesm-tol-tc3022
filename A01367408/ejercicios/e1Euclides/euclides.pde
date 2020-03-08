void setup(){
  size(400,400);
}

void draw(){
  other();
}

void other(){
  strokeWeight(1);
  line(20, 20, 200,20);
  strokeWeight(5);
  point(100,20);
  point(150,20);
  strokeWeight(1);
  //point();
  noFill();
  circle(175,75,75);
  strokeWeight(5);
  point(175,75);
  strokeWeight(1);
  line(175,75,175,35);
  
  for(int i=220;i<300;i+=3){
    point(200,i);
  }
  line(200,200,200,250);
  
  
  //4
  line(325,325,325,375);
  line(280,375,370,375);
  
  //5
  line(25,300,75,300);
  line(25,290,75,290);
  strokeWeight(3);
  point(30,290);
  
  //6
  strokeWeight(1);
  line(20,180,120,150);
  line(20,170,120,200);
  line(100,130,100,220);
  
  
  
}
