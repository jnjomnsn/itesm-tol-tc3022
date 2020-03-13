
PImage img;
int ancho = 50;
int alto = 100;
float totalh = 111.26;
float catmodl = 47.55;//2.34
int lado = 50;//2.23
float radio = 42.5;//2.6
float apotema = 34.4;//3.23
float catmods = 15.45;//7.2
float ang = 0;
int speed = 1;
boolean isIco = true;
boolean isStroked = true;
public class Vertice{
    public int x, y, z;
    public Vertice (int x, int y, int z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }
}
public class VerticeD{
    public float x, y, z;
    public VerticeD (float x, float y, float z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }
}

void setup() {
    size(600, 600,P3D);
    surface.setResizable(true);
    img = loadImage("Textura.JPG");
}

void mouseReleased() {
    isIco = !isIco;
}
void keyReleased() {
    if(key=='s'){
        isStroked = !isStroked;
    }
    if(key=='+'){
        speed++;
    }
    if(key=='-'){
        speed--;
    }
}

void drawPentagons(){   

    VerticeD vd1 = new VerticeD(lado/2,0,-apotema);
    VerticeD vd2 = new VerticeD(lado/2+catmods,0,-apotema+catmodl);
    VerticeD vd3 = new VerticeD(0,0,radio);
    VerticeD vd4 = new VerticeD(-(lado/2+catmods),0,-apotema+catmodl);
    VerticeD vd5 = new VerticeD(-lado/2,0,-apotema);

    VerticeD vd6 = new VerticeD(-lado/2,totalh,apotema);
    VerticeD vd7 = new VerticeD(-(lado/2+catmods),totalh,apotema-catmodl);
    VerticeD vd8 = new VerticeD(0,totalh,-radio);
    VerticeD vd9 = new VerticeD(lado/2+catmods,totalh,apotema-catmodl);
    VerticeD vd10 = new VerticeD(lado/2,totalh,apotema);
    if(isStroked){
        noStroke();
        
    }
    else{
        stroke(0);
        noFill();
    }
    
    beginShape();    
    texture(img);
    vertex(vd1.x, vd1.y, vd1.z,0,0);
    vertex(vd2.x, vd2.y, vd2.z,200,0);
    vertex(vd3.x, vd3.y, vd3.z,300,200);
    vertex(vd4.x, vd4.y, vd4.z,150,225);
    vertex(vd5.x, vd5.y, vd5.z,0,200);
    vertex(vd1.x, vd1.y, vd1.z,0,0);
    endShape();
    
    rotateZ(radians(180));
    beginShape();
    texture(img);
    vertex(vd6.x, vd6.y, vd6.z,0,0);
    vertex(vd7.x, vd7.y, vd7.z,200,0);
    vertex(vd8.x, vd8.y, vd8.z,300,200);
    vertex(vd9.x, vd9.y, vd9.z,150,225);
    vertex(vd10.x, vd10.y, vd10.z,0,200);
    vertex(vd6.x, vd6.y, vd6.z,0,0);
    endShape();
}

void dibujarIco(int x, int y, int z){

    alto = width/2;
    ancho = alto/2;
    Vertice v1 = new Vertice(-ancho/2,0,-alto/2);
    Vertice v2 = new Vertice(ancho/2,0,-alto/2);
    Vertice v3 = new Vertice(ancho/2,0,alto/2);
    Vertice v4 = new Vertice(-ancho/2,0,alto/2);

    Vertice v5 = new Vertice(0,alto/2,-ancho/2);
    Vertice v6 = new Vertice(0,alto/2,ancho/2);
    Vertice v7 = new Vertice(0,-alto/2,ancho/2);
    Vertice v8 = new Vertice(0,-alto/2,-ancho/2);


    Vertice v9 = new Vertice(-alto/2,ancho/2,0);
    Vertice v10 = new Vertice(-alto/2,-ancho/2,0);
    Vertice v11 = new Vertice(alto/2,-ancho/2,0);
    Vertice v12 = new Vertice(alto/2,ancho/2,0);

    ang= ang+speed;
    pushMatrix();
    translate(x,y,z);
    rotateY(radians(ang));
    rotateY(radians(45));
    rotateX(radians(45));
    fill(255,0,0);
    beginShape();
    vertex(v1.x, v1.y, v1.z);
    vertex(v2.x, v2.y, v2.z);
    vertex(v3.x, v3.y, v3.z);
    vertex(v4.x, v4.y, v4.z);
    endShape(CLOSE);
    fill(0,255,0);
    beginShape();
    vertex(v5.x, v5.y, v5.z);
    vertex(v6.x, v6.y, v6.z);
    vertex(v7.x, v7.y, v7.z);
    vertex(v8.x, v8.y, v8.z);
    endShape(CLOSE);
    fill(0,0,255);
    beginShape();
    vertex(v9.x, v9.y, v9.z);
    vertex(v10.x, v10.y, v10.z);
    vertex(v11.x, v11.y, v11.z);
    vertex(v12.x, v12.y, v12.z);
    endShape(CLOSE);
    noFill();
    stroke(0);
    beginShape(TRIANGLE_FAN);
    vertex(v1.x, v1.y, v1.z);
    vertex(v2.x, v2.y, v2.z);
    vertex(v5.x, v5.y, v5.z);
    vertex(v9.x, v9.y, v9.z);
    vertex(v10.x, v10.y, v10.z);
    vertex(v8.x, v8.y, v8.z);
    vertex(v2.x, v2.y, v2.z);
    endShape();
    beginShape(TRIANGLE_FAN);
    vertex(v11.x, v11.y, v11.z);
    vertex(v12.x, v12.y, v12.z);
    vertex(v2.x, v2.y, v2.z);
    vertex(v8.x, v8.y, v8.z);
    vertex(v7.x, v7.y, v7.z);
    vertex(v3.x, v3.y, v3.z);
    vertex(v12.x, v12.y, v12.z);
    endShape();
    beginShape(TRIANGLE_FAN);
    vertex(v6.x, v6.y, v6.z);
    vertex(v5.x, v5.y, v5.z);
    vertex(v12.x, v12.y, v12.z);
    vertex(v3.x, v3.y, v3.z);
    vertex(v4.x, v4.y, v4.z);
    vertex(v9.x, v9.y, v9.z);
    vertex(v5.x, v5.y, v5.z);
    endShape();
    beginShape(TRIANGLE);
    vertex(v4.x, v4.y, v4.z);
    vertex(v9.x, v9.y, v9.z);
    vertex(v10.x, v10.y, v10.z);
    endShape();
    beginShape(TRIANGLE);
    vertex(v7.x, v7.y, v7.z);
    vertex(v8.x, v8.y, v8.z);
    vertex(v10.x, v10.y, v10.z);
    endShape();
    beginShape(TRIANGLE);
    vertex(v3.x, v3.y, v3.z);
    vertex(v4.x, v4.y, v4.z);
    vertex(v7.x, v7.y, v7.z);
    endShape();
    beginShape(TRIANGLE);
    vertex(v5.x, v5.y, v5.z);
    vertex(v12.x, v12.y, v12.z);
    vertex(v2.x, v2.y, v2.z);
    endShape();
    popMatrix();

}

void dibujarDod(int x, int y, int z){
    lado = width/4  ;
    totalh = lado*2.23;
    catmodl = totalh/2.34;
    radio = totalh/2.6;
    apotema = totalh/3.23;
    catmods = totalh/7.2;

    ang= ang+speed;
    pushMatrix();
    translate(x, y+(totalh/2), z);
    rotateY(radians(ang));
    stroke(255,0,0);
    drawPentagons();
    popMatrix();
    
    stroke(0,255,0);
    pushMatrix();
    translate(x, y+(totalh/2), z);
    rotateY(radians(ang));
    rotateX(radians(-63.43));
    translate(0,(totalh/3.6),-(totalh/2.23));
    rotateY(radians(180));
    drawPentagons();
    popMatrix();

    stroke(0,0,255);
    pushMatrix();
    translate(x, y+(totalh/2), z);
    rotateY(radians(ang));
    rotateY(radians(72));
    rotateX(radians(-63.43));
    translate(0,(totalh/3.6),-(totalh/2.23));
    rotateY(radians(180));
    drawPentagons();
    popMatrix();

    stroke(12,200,149);
    pushMatrix();
    translate(x, y+(totalh/2), z);
    rotateY(radians(ang));
    rotateY(radians(72*2));
    rotateX(radians(-63.43));
    translate(0,(totalh/3.6),-(totalh/2.23));
    rotateY(radians(180));
    drawPentagons();
    popMatrix();

    stroke(54,62,212);
    pushMatrix();
    translate(x, y+(totalh/2), z);
    rotateY(radians(ang));
    rotateY(radians(72*3));
    rotateX(radians(-63.43));
    translate(0,(totalh/3.6),-(totalh/2.23));
    rotateY(radians(180));
    drawPentagons();
    popMatrix();

    stroke(90,40,4);
    pushMatrix();
    translate(x, y+(totalh/2), z);
    rotateY(radians(ang));
    rotateY(radians(72*4));
    rotateX(radians(-63.43));
    translate(0,(totalh/3.6),-(totalh/2.23));
    rotateY(radians(180));
    drawPentagons();
    popMatrix();
}

void draw() {
    camera(mouseX, mouseY, (height/2)/tan(PI/6), width/2, height/2, 0, 0, 1, 0);
    background(255);
    if(isIco){
        dibujarIco(200,200,-200);
    }else{
        dibujarDod(200,200,-200);
    }


    
}
