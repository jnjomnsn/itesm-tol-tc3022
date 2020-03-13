float rotation=0;

void setup(){
  size(700,500,P3D);
}

void draw(){
    background(0);
    noStroke();
    lights();
    icosaedro(350,250,0);
    // dodecaedro(350,250,0);
    camera(mouseX, mouseY, (height/2)/tan(PI/6), width/2, height/2, 0, 0, 1, 0);

}

void icosaedro(int x, int y, int z){

    float widthRect = width/4;
    float heightRect = height/6;

    translate(x, y, z);
    //plano 0 en z, con width en x y height en y
    beginShape();
    vertex(-widthRect, heightRect, 0);
    vertex(widthRect, heightRect, 0);
    vertex(widthRect, -heightRect, 0);
    vertex(-widthRect, -heightRect, 0);
    endShape(CLOSE);

    //plano 0 en x con width en y y height en z
    beginShape();
    vertex(0, widthRect, heightRect);
    vertex(0, widthRect, -heightRect);
    vertex(0, -widthRect, -heightRect);
    vertex(0, -widthRect, heightRect);
    endShape(CLOSE);
    
    //plano 0 en y con width en z y height en x
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

    beginShape(TRIANGLE_FAN);
    //centro
    vertex(-heightRect, 0, widthRect);
    vertex(0, widthRect, heightRect);
    vertex(-widthRect, heightRect, 0);
    vertex(-widthRect, -heightRect, 0);
    vertex(0, -widthRect, heightRect);
    endShape(CLOSE);

    beginShape(TRIANGLE_FAN);
    //centro
    vertex(heightRect, 0, -widthRect);
    vertex(0, widthRect, -heightRect);
    vertex(widthRect, heightRect, 0);
    vertex(widthRect, -heightRect, 0);
    vertex(0, -widthRect, -heightRect);
    vertex(-heightRect, 0, -widthRect);
    vertex(0, widthRect, -heightRect);
    endShape(CLOSE);

    beginShape(TRIANGLE_FAN);
    //centro
    vertex(-heightRect, 0, -widthRect);
    vertex(0, widthRect, -heightRect);
    vertex(-widthRect, heightRect, 0);
    vertex(-widthRect, -heightRect, 0);
    vertex(0, -widthRect, -heightRect);
    endShape(CLOSE);

    beginShape(LINES);
    vertex(0, -widthRect, -heightRect);
    vertex(0, -widthRect, heightRect);
    endShape(CLOSE);

    beginShape(LINES);
    vertex(0, widthRect, -heightRect);
    vertex(0, widthRect, heightRect);
    endShape(CLOSE);
    fill(255);
}


void dodecaedro(int x, int y, int z){
  float widthRect = width/6;
  float widthRectIco = width/4;
  float heightRect = widthRectIco;

  PImage img = loadImage("texture.jpg");

//height/6
  translate(x, y, z);

  //plano 0 en z, con width en x y height en y
  beginShape();
  vertex(-widthRect, heightRect, 0);
  vertex(widthRect, heightRect, 0);
  vertex(widthRect, -heightRect, 0);
  vertex(-widthRect, -heightRect, 0);
  endShape(CLOSE);

  //plano 0 en x con width en y y height en z
  beginShape();
  vertex(0, widthRect, heightRect);
  vertex(0, widthRect, -heightRect);
  vertex(0, -widthRect, -heightRect);
  vertex(0, -widthRect, heightRect);
  endShape(CLOSE);
  
  //plano 0 en y con width en z y height en x
  beginShape();
  vertex(-heightRect, 0, widthRect);
  vertex(heightRect, 0, widthRect);
  vertex(heightRect, 0, -widthRect);
  vertex(-heightRect, 0, -widthRect);
  endShape(CLOSE);

  beginShape(QUADS);
  //atras z
  vertex(widthRect, -widthRect, -widthRect);
  vertex(-widthRect, -widthRect, -widthRect);
  vertex(-widthRect, widthRect, -widthRect);
  vertex(widthRect, widthRect, -widthRect);
  //adelante z
  vertex(widthRect, -widthRect, widthRect);
  vertex(-widthRect, -widthRect, widthRect);
  vertex(-widthRect, widthRect, widthRect);
  vertex(widthRect, widthRect, widthRect);
  //bottom y
  vertex(widthRect, widthRect, -widthRect);
  vertex(-widthRect, widthRect, -widthRect);
  vertex(-widthRect, widthRect, widthRect);
  vertex(widthRect, widthRect, widthRect);
  //top y
  vertex(widthRect, -widthRect, -widthRect);
  vertex(-widthRect, -widthRect, -widthRect);
  vertex(-widthRect, -widthRect, widthRect);
  vertex(widthRect, -widthRect, widthRect);
  //right x
  vertex(-widthRect, -widthRect, -widthRect);
  vertex(-widthRect, -widthRect, widthRect);
  vertex(-widthRect, widthRect, widthRect);
  vertex(-widthRect, widthRect, -widthRect);
  //left x
  vertex(widthRect, -widthRect, -widthRect);
  vertex(widthRect, widthRect, -widthRect);
  vertex(widthRect, widthRect, widthRect);
  vertex(widthRect, -widthRect, widthRect);
  endShape();

  beginShape();
  vertex(-heightRect, 0, widthRectIco);
  vertex(heightRect, 0, widthRectIco);
  vertex(heightRect, 0, -widthRectIco);
  vertex(-heightRect, 0, -widthRectIco);
  endShape(CLOSE);

}