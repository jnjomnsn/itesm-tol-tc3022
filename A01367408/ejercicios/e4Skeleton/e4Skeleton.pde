void setup(){
  size(500,500,P3D);
}

void lights(){
  spotLight(255, 0, 0, width/2, height/2,400, 0, 0, -1, PI/4, 2);
}

void  draw(){
  background(255);
  camera(mouseX,height/2,(height/2)/tan(PI/6),width/2,height/2,0,0,1,0);
  skeleton(200,150,200);
  
}

void rightArm(){
  box(5,40,5);
}

void leftArm(){
  box(5,40,5);
}

void torso(){
  box(20,40,20);
}

void rightLeg(){
    box(5,40,5);
}

void leftLeg(){
    box(5,40,5);
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
  //torso
  torso();
  popMatrix();
  //translate(int)
  pushMatrix();
  translate(x-8,y+180,z);
  //rightLeg
  rightLeg();
  popMatrix();
  pushMatrix();
  translate(x+8,y+180,z);
  //leftleg
  leftLeg();
  popMatrix();
  pushMatrix();
  translate(x+25,y+135,z);
  rotate(radians(-45));
  //rightarm
  rightArm();
  popMatrix();
  pushMatrix();
  translate(x-25,y+135,z);
  rotate(radians(45));
  //leftarm
  leftArm();
  popMatrix();
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
