float num=((1+sqrt(5))/2)*50;
float nums=1*50;
float angulo=0.0;
float direccion=1;
PImage img;
float vel=0.02;
float golden=1.618033*nums;
float goldenr=0.618033;
float numi=1.0*50;
float goldencuadra=(1-pow(goldenr,2))*nums;



void setup(){
  size(700,700,P3D);
  surface.setResizable(true);
  img=loadImage("textura.jpg");
}

void draw()
{
  background(0);
  camera(mouseX, height/2, (height/2)/tan(PI/6), width/2, height/2,0,0,1,0);
  translate(mouseX,mouseY);
  icosaedron(200,200,50);
  //dodecaedro(200,200,50);
}

void icosaedron(int x, int y, int z)
{

  
  pushMatrix();
  translate(x,y,z);
  
  rotateY(radians(135));
  rotate(angulo);
  angulo+=vel*direccion;

  fill(255,255,0);//amarillo
  beginShape();
  //scale(50.0);
  vertex(-num,-nums,0);//2
  vertex(num,-nums,0);
  vertex(num,nums,0); // ya
  vertex(-num,nums,0);
  endShape(CLOSE);
  
  fill(248, 49, 6);//rojo
  beginShape();
  vertex(-nums,0,num);//2
  vertex(nums,0,num);//ya
  vertex(nums,0,-num);
  vertex(-nums,0,-num);
  
  endShape(CLOSE);
  
  fill(0,0,255);//azul
  beginShape();
  vertex(0,-num,nums);//2
  vertex(0,-num,-nums);
  vertex(0,num,-nums);
  vertex(0,num,nums);//ya
  
  endShape(CLOSE);
  

  noFill();
  stroke(0,128,0);
  beginShape();
  vertex(-num, -nums, 0);
  vertex(0, -num, nums);
  vertex(-nums, 0, num);
  endShape(CLOSE);
    
  beginShape();
  vertex(num, -nums, 0);
  vertex(0, -num, nums);
  vertex(nums, 0, num);
  endShape(CLOSE);
    
  beginShape();
  vertex(num, nums, 0);
  vertex(0, num, nums);
  vertex(nums, 0, num);
  endShape(CLOSE);
    
  beginShape();
  vertex(-num, nums, 0);
  vertex(0, num, nums);
  vertex(-nums, 0, num);
  endShape(CLOSE);
    
  beginShape();
  vertex(num, nums, 0);
  vertex(0, num, -nums);
  vertex(nums, 0, -num);
  endShape(CLOSE);
    
  beginShape();
  vertex(num, -nums, 0);
  vertex(0, -num, -nums);
  vertex(nums, 0, -num);
  endShape(CLOSE);
    
  beginShape();
  vertex(-num, nums, 0);
  vertex(0, num, -nums);
  vertex(-nums, 0, -num);
  endShape(CLOSE);
    
  beginShape();
  vertex(-num, -nums, 0);
  vertex(0, -num, -nums);
  vertex(-nums, 0, -num);
  endShape(CLOSE);
    
  beginShape();
  vertex(nums,0,num);
  vertex(0, num, nums);
  vertex(-nums, 0, num);
  endShape(CLOSE);
   
  popMatrix();
}

void dodecaedro(int x, int y, int z)
{
  pushMatrix();
  translate(x,y,z);
  rotateY(radians(135));
  rotate(angulo);
  angulo+=vel*direccion;
  fill(0,0,255);
  beginShape();
  vertex(50,50,50);
  vertex(golden,  0, goldencuadra);
  vertex(nums, -nums,  nums);
  vertex(0,-goldencuadra,  golden);
  vertex(0,goldencuadra, golden);
  endShape(CLOSE);
  beginShape();

  vertex(golden,0,goldencuadra);
  vertex(golden,0,-goldencuadra);
  vertex(nums,nums,-nums);
  vertex(goldencuadra,golden,0);
  vertex(nums,nums,nums);
  endShape(CLOSE);
  
  beginShape();
  vertex(nums,-nums,nums);
  vertex(goldencuadra, -golden, 0);
  vertex(-goldencuadra, -golden,0);
  vertex(-nums,-nums,nums);
  vertex(0, -goldencuadra,  golden);
  endShape(CLOSE);
  
  beginShape();
  vertex(nums,nums,-nums);
  vertex(0,goldencuadra, -golden);
  vertex(0,-goldencuadra, -golden);
  vertex(nums, -nums, -nums);
  vertex(golden,  0, -goldencuadra);
  endShape(CLOSE);
  
  beginShape();
  vertex(goldencuadra, -golden,  0);
  vertex(nums,-nums,-nums);
  vertex(golden,0, -goldencuadra);
  vertex(golden,0,  goldencuadra);
  vertex(nums,-nums,nums);
  endShape(CLOSE);
  
  beginShape();
  vertex(nums,-nums,-nums);
  vertex(0, -goldencuadra, -golden);
  vertex(-nums, -nums,-nums);
  vertex(-goldencuadra, -golden,  0);
  vertex(goldencuadra, -golden,  0);
  endShape(CLOSE);
  
  beginShape();
  vertex(-nums,nums,nums);
  vertex(0,goldencuadra, golden);
  vertex(0,-goldencuadra,  golden);
  vertex(-nums,-nums,nums);
  vertex(-golden,0,goldencuadra);
  endShape(CLOSE);
  
   beginShape();
  vertex(nums,nums,-nums);
  vertex(goldencuadra, golden,0);
  vertex(-goldencuadra, golden,0);
  vertex(-nums,nums,-nums);
  vertex(0,goldencuadra, -golden);
  endShape(CLOSE);
  
  beginShape();
  vertex(-nums,nums,-nums);
  vertex(-golden,  0, -goldencuadra);
  vertex(-nums, -nums, -nums);
  vertex(0, -goldencuadra, -golden);
  vertex(0,  goldencuadra, -golden);
  endShape(CLOSE);
  beginShape();
  vertex(-goldencuadra, -golden,  0);
  vertex(-nums, -nums, -nums);
  vertex(-golden,0, -goldencuadra);
  vertex(-golden,0, goldencuadra);
  vertex(-nums, -nums, nums);
  endShape(CLOSE);
  
   beginShape();
  vertex(-goldencuadra,  golden,  0);
  vertex(-nums,nums, -nums);
  vertex(-golden,0, -goldencuadra);
  vertex(-golden,0,goldencuadra);
  vertex(-nums,nums,nums);
  endShape(CLOSE);
  popMatrix();
}
