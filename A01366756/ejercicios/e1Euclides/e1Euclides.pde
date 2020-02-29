void setup(){
  size(400,400);
  post1();
  post2();
  post3();
  post4();
  post5();
  post6();
}

void draw(){
  
}

void post1(){
  line(20,200,170,200);
  strokeWeight(5);
  point(50,200);
  point(100,200);
  strokeWeight(1);
}

void post2(){
  for(int i = 0; i<150; i+=3){
    point(20+i,300);
  }
  strokeWeight(2);
  line(70,300,120,300);
}

void post3(){
  noFill();
  ellipse(200,50,50,50); //ancho y alto
  strokeWeight(5);
  point(200,50);
  strokeWeight(1);
  line(200,50,200,25);
}


void post4(){
  line(75,50,75,150);
  line(25,150,125,150);
  for(int i = 0; i<25; i+=3){
    point(50,150-i);
    point(100,150-i);
    point(50+i,125);
    point(75+i,125);
  }
}


void post5(){
  for(int i = 0; i<150; i+=3){
    point(20+i,325);
  }
  strokeWeight(5);
  point(95,325);
  strokeWeight(1);
  
  line(20,350,170,350);
}


void post6(){

  /*line(200,300, 325,350);
  line(200,375, 325,325);*/
  line(225,290, 225,375);
  
  for(int i=0, j=0; i<100; i+=2,j++){
    
    point(200+i,300+j);
    point(200+i,375-j);
    if((375-j)==(300+j)){
      noFill();
      circle(200+i,300+j,40);
    }
  }
  /*for(int i = 0; i<150; i+=3){
    point(200+i,325+j);
  }*/
}
