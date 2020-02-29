 
   void setup(){
    size(800, 800);
  }
  
  //actualizacion del bosquejo
  void draw(){
    other();
  }
  
  void other(){
   
    strokeWeight (4);
    ellipse(150, 25,1,1);
     line(130, 80, 40, 80);
     line(600, 660, 600, 600);
      line(700, 600, 500, 600);
     
     strokeWeight(2);
point(10, 80);
point(15, 80);
point(20, 80);
point(25, 80);
point(30, 80);
point(35, 80);
point(135, 80);
point(140, 80);
point(145, 80);
point(150, 80);
point(155, 80);
point(160, 80);

 ellipse(400,400,80,80);
  line(200, 200, 50, 80);


for (int g = 0; g < 45; g += 4) {
float angle = radians(g);
float x = 50 + (cos(angle) * 80);
float y = 70+ (sin(angle) * 80);
ellipse(x, y, 1, 1);
}

 point(130, 280);
point(125, 280);
point(135, 280);
point(140, 280);
point(145, 280);
point(150, 280);
point(155, 280);

point(165, 280);
point(170, 280);
point(175, 280);
point(180, 280);
point(185, 280);

strokeWeight(5);
point(160, 280);
  }
