void setup(){
  //camera(mouseX,height/2,(height/2)/tan(PI/6),width/2,height/2,0,0,1,0);
  size(500,500,P3D);
}

void lights(){
  spotLight(255, 0, 0, width/2, height/2,400, 0, 0, -1, PI/4, 2);
}

void  draw(){
  skeleton(200,150,200);
  
}

void rightArm(){
  
}

void leftArm(){
  box(20,60,20);
}

void torso(){
}

void rightLeg(){
  box(10,30,10);
}

void leftLeg(){
  box(10,30,10);
}

void head(){
  sphere(20);
}

void skeleton(int x, int y, int z){
  pushMatrix();
  lights();
  strokeWeight(1);
  translate(x,y+100,z);
  head();
  popMatrix();
  pushMatrix();
  translate(x,y+140,z);
  box(22,40,20);
  popMatrix();
  //translate(int)
  pushMatrix();
  translate(x-10,y+180,z);
  box(5,40,5);
  popMatrix();
  pushMatrix();
  translate(x+10,y+180,z);
  box(5,40,5);
  popMatrix();
  pushMatrix();
  translate(x+15,y+140,z);
  rotate(radians(45));
  box(5,40,5);
  popMatrix();
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
