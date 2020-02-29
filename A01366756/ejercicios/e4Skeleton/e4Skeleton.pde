void setup(){
  size(500,700,P3D);
  
}

void draw(){
    background(0);
    noStroke();
    lights();
    ortho(-width/2, width/2, -height/2, height/2);
    skeleton(250,50,0,200);
    camera(mouseX, mouseY, (height/2)/tan(PI/6), width/2, height/2, 0, 0, 1, 0);
}

void skeleton(int x, int y, int z, int height){
    float radious = height/5;
    translate(x, y, z);
    sphere(radious);
    translate(0,y+radious*2, 0);
    box(radious*2, radious*4, radious*2);
    //brazo izquierdo   
    pushMatrix();
        rotate(radians(-20));
        translate(radious*2, 0, 0);
        box(radious-10, radious*3, radious);
    popMatrix();
    //brazo derecho
    pushMatrix();
        rotate(radians(20));
        translate(-radious*2, 0, 0);
        box(radious-10, radious*3, radious);
    popMatrix();
    //pierna izquierda
    pushMatrix();
        translate(radious- radious/2, radious*4, 0);
        box(radious-10, radious*4, radious);
    popMatrix();
    //pierna derecha
    pushMatrix();
        translate(-(radious- radious/2), radious*4, 0);
        box(radious-10, radious*4, radious);
    popMatrix();
    rotateY(radians(90));
    
}
