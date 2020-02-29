int stage, c, r;

void setup(){
   stage = 0;
   size(1000,1000);
   background(#B7ACAC);
}

void draw(){
   if (stage == 0)  
   {
    background(#B7ACAC);
    menu();  
   }
   if (stage == 1)   //POINT
   {
     ellipse(600,300,50,50);
     //AZUL
     if(c==1)    
       fill(#2E2EFE);ellipse(600,300,50,50);
     if(r==1)    
       fill(#B7ACAC);ellipse(600,300,50,50);
     if (c==1 && r==1)
        fill(#B7ACAC);ellipse(600,300,50,50);
     if (c==1 && r==2)
       fill(#2E2EFE);ellipse(600,300,50,50);
     //ROJO
     if(c==2)    
       fill(#FF0040);ellipse(600,300,50,50);
     if (c==2 && r==1)
       fill(#B7ACAC);ellipse(600,300,50,50);
     if (c==2 && r==2)
       fill(#FF0040);ellipse(600,300,50,50);
     //AMARILLO  #FFFF00
     if(c==3)    
       fill(#FFFF00);ellipse(600,300,50,50);
     if (c==3 && r==1)
       fill(#B7ACAC);ellipse(600,300,50,50);
     if (c==3 && r==2)
       fill(#FFFF00);ellipse(600,300,50,50);
     //VERDE    #01DF01
     if(c==4)    
       fill(#01DF01);ellipse(600,300,50,50);
     if (c==4 && r==1)
       fill(#B7ACAC);ellipse(600,300,50,50);
     if (c==4 && r==2)
       fill(#01DF01);ellipse(600,300,50,50);
     //ROSA   #F781D8
     if(c==5)    
       fill(#F781D8);ellipse(600,300,50,50);
     if (c==5 && r==1)
       fill(#B7ACAC);ellipse(600,300,50,50);
     if (c==5 && r==2)
       fill(#F781D8);ellipse(600,300,50,50);
     //NARANJA   #FF8000
     if(c==6)    
       fill(#FF8000);ellipse(600,300,50,50);
     if (c==6 && r==1)
       fill(#B7ACAC);ellipse(600,300,50,50);
     if (c==6 && r==2)
       fill(#FF8000);ellipse(600,300,50,50);
   }
      
   if (stage == 2)   //LINE
   {
     line(400,400,800,400);
     //AZUL
     if(c==1)    
       stroke(#2E2EFE);line(400,400,800,400);
     if(r==1)    
       stroke(#2E2EFE);line(400,400,800,400);
     if (c==1 && r==1)
       stroke(#2E2EFE);line(400,400,800,400);
     if (c==1 && r==2)
       stroke(#2E2EFE);line(400,400,800,400);
     //ROJO
     if(c==2)    
       stroke(#FF0040);line(400,400,800,400);
     if (c==2 && r==1)
       stroke(#FF0040);line(400,400,800,400);
     if (c==2 && r==2)
       stroke(#FF0040);line(400,400,800,400);
     //AMARILLO  #FFFF00
     if(c==3)    
       stroke(#FFFF00);line(400,400,800,400);
     if (c==3 && r==1)
       stroke(#FFFF00);line(400,400,800,400);
     if (c==3 && r==2)
       stroke(#FFFF00);line(400,400,800,400);
     //VERDE    #01DF01
     if(c==4)    
       stroke(#01DF01);line(400,400,800,400);
     if (c==4 && r==1)
       stroke(#01DF01);line(400,400,800,400);
     if (c==4 && r==2)
       stroke(#01DF01);line(400,400,800,400);
     //ROSA   #F781D8
     if(c==5)    
       stroke(#F781D8);line(400,400,800,400);
     if (c==5 && r==1)
       stroke(#F781D8);line(400,400,800,400);
     if (c==5 && r==2)
       stroke(#F781D8);line(400,400,800,400);
     //NARANJA   #FF8000
     if(c==6)    
       stroke(#FF8000);line(400,400,800,400);
     if (c==6 && r==1)
       stroke(#FF8000);line(400,400,800,400);
     if (c==6 && r==2)
       stroke(#FF8000);line(400,400,800,400);
   }
   if (stage == 3)   //RECT
   {
      rect(600,500,100,50);
     if(r==1)    
       fill(#B7ACAC);rect(600,500,100,50);
     if(c==1)    
     //AZUL
       fill(#2E2EFE);rect(600,500,100,50);
     if (c==1 && r==1)
       fill(#B7ACAC);rect(600,500,100,50);
     if (c==1 && r==2)
       fill(#2E2EFE);rect(600,500,100,50);
     //ROJO
     if(c==2)    
       fill(#FF0040);rect(600,500,100,50);
     if (c==2 && r==1)
       fill(#B7ACAC);rect(600,500,100,50);
     if (c==2 && r==2)
       fill(#FF0040);rect(600,500,100,50);
     //AMARILLO  #FFFF00
     if(c==3)    
       fill(#FFFF00);rect(600,500,100,50);
     if (c==3 && r==1)
       fill(#B7ACAC);rect(600,500,100,50);
     if (c==3 && r==2)
       fill(#FFFF00);rect(600,500,100,50);
     //VERDE    #01DF01
     if(c==4)    
       fill(#01DF01);rect(600,500,100,50);
     if (c==4 && r==1)
       fill(#B7ACAC);rect(600,500,100,50);
     if (c==4 && r==2)
       fill(#01DF01);rect(600,500,100,50);
     //ROSA   #F781D8
     if(c==5)    
       fill(#F781D8);rect(600,500,100,50);
     if (c==5 && r==1)
       fill(#B7ACAC);rect(600,500,100,50);
     if (c==5 && r==2)
       fill(#F781D8);rect(600,500,100,50);
     //NARANJA   #FF8000
     if(c==6)    
       fill(#FF8000);rect(600,500,100,50);
     if (c==6 && r==1)
       fill(#B7ACAC);rect(600,500,100,50);
     if (c==6 && r==2)
       fill(#FF8000);rect(600,500,100,50);
   }
   if (stage == 4)   //ELLIPSE
   {
      ellipse(600,700,200,100);
      if(r==1)    
       fill(#B7ACAC);ellipse(600,700,200,100);
     if(c==1)    
     //AZUL
       fill(#2E2EFE);ellipse(600,700,200,100);
     if (c==1 && r==1)
       fill(#B7ACAC);ellipse(600,700,200,100);
     if (c==1 && r==2)
       fill(#2E2EFE);ellipse(600,700,200,100);
     //ROJO
     if(c==2)    
       fill(#FF0040);ellipse(600,700,200,100);
     if (c==2 && r==1)
       fill(#B7ACAC);ellipse(600,700,200,100);
     if (c==2 && r==2)
       fill(#FF0040);ellipse(600,700,200,100);
     //AMARILLO  #FFFF00
     if(c==3)    
       fill(#FFFF00);ellipse(600,700,200,100);
     if (c==3 && r==1)
       fill(#B7ACAC);ellipse(600,700,200,100);
     if (c==3 && r==2)
       fill(#FFFF00);ellipse(600,700,200,100);
     //VERDE    #01DF01
     if(c==4)    
       fill(#01DF01);ellipse(600,700,200,100);
     if (c==4 && r==1)
       fill(#B7ACAC);ellipse(600,700,200,100);
     if (c==4 && r==2)
       fill(#01DF01);ellipse(600,700,200,100);
     //ROSA   #F781D8
     if(c==5)    
       fill(#F781D8);ellipse(600,700,200,100);
     if (c==5 && r==1)
       fill(#B7ACAC);ellipse(600,700,200,100);
     if (c==5 && r==2)
       fill(#F781D8);ellipse(600,700,200,100);
     //NARANJA   #FF8000
     if(c==6)    
       fill(#FF8000);ellipse(600,700,200,100);
     if (c==6 && r==1)
       fill(#B7ACAC);ellipse(600,700,200,100);
     if (c==6 && r==2)
       fill(#FF8000);ellipse(600,700,200,100);
   }
   
   if (stage == 10)  // restart
   {
     clear();
     background(#B7ACAC);
     fill(0);
     stroke(0);
     menu();
   }
   
}

void menu(){
  fill(#B7ACAC);
  rect(0,50,300,50);
  rect(0,100,300,50);
  rect(0,150,300,50);
  rect(0,200,300,50);
  
  textSize(36);
   //Seleccionar figura
   fill(255);
   text("Select a Shape",10,30);
   text("Point",50,90);
   //ellipse(25,70,10,10);
   text("Line",50,140);
   //line(10,110,40,110);
   text("Rectangle",50,190);
   //rect(10,145,30,10);
   text("Ellipse",50,240);
   //ellipse(25,190,30,10); 
   
   //Seleccoinar color
   text("Select a Color",10,300);
   
   fill(#2E2EFE);rect(30,320,60,60);     //azul
   fill(#FF0040);rect(120,320,60,60);     //rojo
   
   fill(#FFFF00);rect(30,400,60,60);     //amarillo
   fill(#01DF01);rect(120,400,60,60);      //verde
   
   fill(#F781D8);rect(30,480,60,60);      //rosa
   fill(#FF8000);rect(120,480,60,60);      //naranja
   
   
   //Seleccionar llenado
   fill(255);text("Filled?",10,600);
   fill(#B7ACAC);rect(30,650,80,80);     //sin relleno
   fill(0);rect(150,650,80,80);          //con relleno
   
   //Area de borrar
   rect(900,900,50,50);
   text("Borrar",880,980);
}

void mouseClicked(){
  print(mouseX,".");
  print(mouseY,",");
  print(stage,c,r);
  //Validar clicks de figura
   if(mouseY>50 && mouseY<100 && mouseX>0 && mouseX <300)
     stage = 1;  //point
   if(mouseY>100 && mouseY<150 && mouseX>0 && mouseX <300)
     stage = 2;   //LINE
   if(mouseY>150 && mouseY<200 && mouseX>0 && mouseX <300)
     stage = 3;    //RECTANGLE
   if(mouseY>200 && mouseY<250 && mouseX>0 && mouseX <300)
     stage = 4;     //ELLIPSE
     
     //Validar clicks de color
    if(mouseY>320 && mouseY<380 && mouseX>30 && mouseX <90)  
        c=1;
    if(mouseY>320 && mouseY<380 && mouseX>120 && mouseX <180)  
        c=2;
    if(mouseY>400 && mouseY<460 && mouseX>30 && mouseX <90)  
        c = 3;
    if(mouseY>400 && mouseY<460 && mouseX>120 && mouseX <180)  
        c=4;
    if(mouseY>480 && mouseY<540 && mouseX>30 && mouseX <90)  
        c=5;
    if(mouseY>480 && mouseY<540 && mouseX>120 && mouseX <180)  
        c=6;
      
     //Validar clicks de relleno
     if(mouseY>650 && mouseY<730 && mouseX>30 && mouseX <110)  
        r=1;
    if(mouseY>650 && mouseY<730 && mouseX>150 && mouseX <230)  
        r=2;
        
    //BORRAR
    if(mouseY>900 && mouseY<950 && mouseX>900 && mouseX <950)  
        stage=10;
}
