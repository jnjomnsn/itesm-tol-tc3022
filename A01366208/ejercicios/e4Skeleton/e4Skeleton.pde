int x=300;
int y=400;
int z=-40;

void setup()
{
  size(600,600,P3D); 
}

void draw()
{
  float fov= PI/3.0;
  background(255);                                                              
  pointLight(20, 80, 150, width/2,height/2, 400);                              
  noStroke();                                                                 
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(PI/3.0, float(width)/ float(height), cameraZ, cameraZ*2.0);    //perspectiva
  camera(mouseX,height/2,(height/2) / tan(PI/6),width/2,height/2,0,0,1,0);  //camara
  skeleton(x,y,z);                                                           
}

void skeleton(int x, int y, int z)   
{
  
  pushMatrix();
  translate(x,y,z);  
  popMatrix();
  
 
  pushMatrix();
  translate(x,y-200,z);       
  sphere(60);             
  popMatrix();
  
  //cuerpo
  pushMatrix();
  translate(x,y-80,z);     
  box(60,120,60);            
  popMatrix();
  
  //derecha
  pushMatrix();
  translate(x+50,y-90,z);    
  rotate(radians(-20));       
  box(15,90,15);             
  popMatrix();  
  
  //izquierda
  pushMatrix();
  translate(x-50,y-90,z);    
  rotate(radians(20));        
  box(15,90,15);              
  popMatrix();

//patita derecha
  pushMatrix();
  translate(x+18,y+25,z);     
  box(25,90,25);              
  popMatrix();
  
//Patita izquierda
  pushMatrix();
  translate(x-18,y+25,z);     
  box(25,90,25);              
  popMatrix();
}
