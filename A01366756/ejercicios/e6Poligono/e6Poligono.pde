import peasy.*;
float rotate=0;


void setup(){
  size(700,500,P3D);
  cam = new PeasyCam(this, width/2, height/2, depth/2, depth*1.25);
  cam.rotateY(radians(90));
  cam.rotateZ(radians(-90));
}

void draw(){
    background(0);
    noStroke();
    lights();
    // ortho(-width/2, width/2, -height/2, height/2);
    icosaedro(350,250,0);
    // camera(mouseX, mouseY, (height/2)/tan(PI/6), width/2, height/2, 0, 0, 1, 0);
    cam.rotateY(radians(1));
    rotate+=90;
}

void icosaedro(int x, int y, int z){
    float widthRect = width/4;
    float heightRect = height/8;

    translate(x, y, z);

    beginShape();
    vertex(-widthRect, heightRect, 0);
    vertex(widthRect, heightRect, 0);
    vertex(widthRect, -heightRect, 0);
    vertex(-widthRect, -heightRect, 0);
    endShape(CLOSE);

    beginShape();
    vertex(0, widthRect, heightRect);
    vertex(0, widthRect, -heightRect);
    vertex(0, -widthRect, -heightRect);
    vertex(0, -widthRect, heightRect);
    endShape(CLOSE);

    beginShape();
    vertex(-heightRect, 0, widthRect);
    vertex(heightRect, 0, widthRect);
    vertex(heightRect, 0, -widthRect);

    vertex(-heightRect, 0, -widthRect);
    endShape(CLOSE);

    noFill();
    stroke(#33FF43);
    beginShape(TRIANGLE_FAN);
    //centro
    vertex(heightRect, 0, widthRect);
    vertex(0, widthRect, heightRect);
    vertex(widthRect, heightRect, 0);
    vertex(widthRect, -heightRect, 0);
    vertex(0, -widthRect, heightRect);
    vertex(-heightRect, 0, widthRect);
    vertex(0, widthRect, heightRect);
    endShape(CLOSE);
    fill(255);
    
    noFill();
    stroke(#33FF43);
    beginShape(TRIANGLE_FAN);
    //centro
    vertex(-heightRect, 0, widthRect);
    vertex(0, widthRect, heightRect);
    vertex(-widthRect, heightRect, 0);
    vertex(-widthRect, -heightRect, 0);
    vertex(0, -widthRect, heightRect);
    endShape(CLOSE);
    fill(255);
}