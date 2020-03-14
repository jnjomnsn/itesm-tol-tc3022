float commonReference = 120;
final float h_wedged_shape = 0.618033988;
final float expression_1 = 1+h_wedged_shape; 
final float expression_2 = 1-pow(h_wedged_shape,2);

PImage textura;
float rotacion = 0;

void setup(){
  size( 800, 800, P3D);  
  lights();
  textura = loadImage("textura.jpg");
}

void draw(){
  background(255);
  lights();
  dodecaedro(width/2, height/2, 0);
  //icosaedro(width/2, height/2, 0);
  
}

void dodecaedro(int x, int y, int z){  
    translate(x,y,z);
    rotateY(rotacion+=0.01);
      beginShape();
        texture(textura);
        vertex(commonReference,commonReference,commonReference);
        vertex(expression_1*commonReference,  0,  expression_2*commonReference);
        vertex(commonReference, -commonReference,  commonReference);
        vertex(0, -(expression_2*commonReference),  expression_1*commonReference);
        vertex(0,  expression_2*commonReference, expression_1*commonReference);
      endShape(CLOSE);
      beginShape();
        texture(textura);
        vertex(commonReference,commonReference,commonReference);
        vertex(0,  expression_2*commonReference, expression_1*commonReference);
        vertex(-commonReference,  commonReference,  commonReference);
        vertex(-(expression_2*commonReference),  expression_1*commonReference,  0);
        vertex(expression_2*commonReference,  expression_1*commonReference,  0);
     endShape(CLOSE);
     beginShape();
         texture(textura);
        vertex(expression_1*commonReference,  0,  expression_2*commonReference);
        vertex(expression_1*commonReference,  0, -(expression_2*commonReference));
        vertex(commonReference,  commonReference, -commonReference);
        vertex(expression_2*commonReference,  expression_1*commonReference,  0);
        vertex(commonReference,  commonReference,  commonReference);
      endShape(CLOSE);
      beginShape();
        texture(textura);
        vertex(commonReference,  commonReference, -commonReference);
        vertex(0,  expression_2*commonReference, -(expression_1*commonReference));
        vertex(0, -(expression_2*commonReference), -(expression_1*commonReference));
        vertex(commonReference, -commonReference, -commonReference);
        vertex(expression_1*commonReference,  0, -(expression_2*commonReference));
      endShape(CLOSE);
      beginShape();
        texture(textura);
        vertex(commonReference,  commonReference, -commonReference);
        vertex(expression_2*commonReference,  expression_1*commonReference,  0);
        vertex(-(expression_2*commonReference),  expression_1*commonReference,  0);
        vertex(-commonReference,  commonReference, -commonReference);
        vertex(0,  expression_2*commonReference, -(expression_1*commonReference));
      endShape(CLOSE);
      beginShape();
        texture(textura);
        vertex(commonReference, -commonReference,  commonReference);//Esquina derecha 1*
        vertex(expression_2*commonReference, -(expression_1*commonReference),  0);
        vertex(-(expression_2*commonReference), -(expression_1*commonReference),  0);
        vertex(-commonReference, -commonReference,  commonReference);
        vertex(0, -(expression_2*commonReference),  expression_1*commonReference);
      endShape(CLOSE);
      beginShape();
      texture(textura);
        vertex(expression_2*commonReference, -(expression_1*commonReference),  0);
        vertex(commonReference, -commonReference, -commonReference);
        vertex(expression_1*commonReference,  0, -(expression_2*commonReference));
        vertex(expression_1*commonReference,  0,  expression_2*commonReference);
        vertex(commonReference, -commonReference,  commonReference);//Union con esquina derecha del de arriba 1*
      endShape(CLOSE);
      beginShape();
        texture(textura);
        vertex(commonReference, -commonReference, -commonReference);
        vertex(0, -(expression_2*commonReference), -(expression_1*commonReference));
        vertex(-commonReference, -commonReference, -commonReference);
        vertex(-(expression_2*commonReference), -(expression_1*commonReference),  0);
        vertex(expression_2*commonReference, -(expression_1*commonReference),  0);
    endShape(CLOSE);
    beginShape();
        texture(textura);
        vertex(-commonReference,  commonReference,  commonReference);
        vertex( 0,  expression_2*commonReference, expression_1*commonReference);
        vertex(0, -(expression_2*commonReference),  expression_1*commonReference);
        vertex(-commonReference, -commonReference,  commonReference);
        vertex(-(expression_1*commonReference),  0,  expression_2*commonReference);
    endShape(CLOSE);
    beginShape();
        texture(textura);
        vertex(-(expression_2*commonReference),  expression_1*commonReference,  0);
        vertex(-commonReference,  commonReference, -commonReference);
        vertex(-(expression_1*commonReference),  0, -(expression_2*commonReference));
        vertex(-(expression_1*commonReference),  0,  expression_2*commonReference);
        vertex(-commonReference,  commonReference,  commonReference);
    endShape(CLOSE);
    beginShape();
        texture(textura);
        vertex(-commonReference,  commonReference, -commonReference);
        vertex(-(expression_1*commonReference),  0, -(expression_2*commonReference));
        vertex(-commonReference, -commonReference, -commonReference);
        vertex(0, -(expression_2*commonReference), -(expression_1*commonReference));
        vertex(0,  expression_2*commonReference, -(expression_1*commonReference));
    endShape(CLOSE);
    beginShape();
        texture(textura);
        vertex(-(expression_2*commonReference), -(expression_1*commonReference),  0);
        vertex(-commonReference, -commonReference, -commonReference);
        vertex(-(expression_1*commonReference),  0, -(expression_2*commonReference));
        vertex(-(expression_1*commonReference),  0,  expression_2*commonReference);
        vertex(-commonReference, -commonReference,  commonReference);
      endShape(CLOSE); 
}

void icosaedro(int x, int y, int z){  
    translate(x,y,z);
    rotateY(rotacion+=0.01);
     //Plano 1
    fill(#DD3069);
    beginShape();
      vertex(-commonReference/2, 0, commonReference);
      vertex(commonReference/2, 0, commonReference);
      vertex(commonReference/2, 0, -commonReference);
      vertex(-commonReference/2, 0, -commonReference);  
    endShape(CLOSE);
    
    //Plano 2
    fill(#c8ffc5);
    beginShape();
      vertex(0, -commonReference, commonReference/2);
      vertex(0, -commonReference, -commonReference/2);   
      vertex(0, commonReference, -commonReference/2);
      vertex(0, commonReference, commonReference/2);    
    endShape(CLOSE);
    
    //Plano 3
    fill(#fea87d);
    beginShape();
      vertex(-commonReference, -commonReference/2, 0);
      vertex(commonReference, -commonReference/2, 0);
      vertex(commonReference, commonReference/2, 0);
      vertex(-commonReference, commonReference/2, 0);    
    endShape(CLOSE);
    
    
    //Puntos
    noFill();
    beginShape();
      vertex(commonReference, commonReference/2, 0);
      vertex(0, commonReference, commonReference/2);
      vertex(commonReference/2, 0, commonReference);
    endShape(CLOSE);
    beginShape();
      vertex(commonReference, -commonReference/2, 0);
      vertex(commonReference/2, 0, commonReference);
      vertex(0, -commonReference, commonReference/2);
    endShape(CLOSE);
    beginShape();
      vertex(0, commonReference, commonReference/2);
      vertex(-commonReference, commonReference/2, 0);
      vertex(-commonReference/2, 0, commonReference);
    endShape(CLOSE);
    beginShape();
      vertex(0, -commonReference, commonReference/2);
      vertex(-commonReference/2, 0, commonReference);
      vertex(-commonReference, -commonReference/2, 0);
    endShape(CLOSE);
    beginShape();
      vertex(commonReference, commonReference/2, 0);
      vertex(0, commonReference, commonReference/2);
      vertex(0, commonReference, -commonReference/2);
    endShape(CLOSE);
    beginShape();
      vertex(-commonReference, commonReference/2, 0);
      vertex(0, commonReference, commonReference/2);
      vertex(0, commonReference, -commonReference/2);
    endShape(CLOSE);
    beginShape();
      vertex(-commonReference, -commonReference/2, 0);
      vertex(0, -commonReference, -commonReference/2);
      vertex(-commonReference/2, 0, -commonReference/2);
    endShape(CLOSE);
    beginShape();
      vertex(0, commonReference, -commonReference/2);
      vertex(commonReference/2, 0, -commonReference);
      vertex(-commonReference/2, 0, -commonReference);
    endShape(CLOSE);
    beginShape();
      vertex(0, -commonReference, -commonReference/2);
      vertex(commonReference, -commonReference/2, 0);
      vertex(commonReference/2, 0, -commonReference);
    endShape(CLOSE);
    beginShape();
      vertex(commonReference/2, 0, -commonReference);
      vertex(commonReference, commonReference/2, 0);
      vertex(0, commonReference, -commonReference/2);
    endShape(CLOSE);
    beginShape();
      vertex(-commonReference, -commonReference/2, 0);
      vertex(-commonReference/2, 0, -commonReference);
      vertex(-commonReference, commonReference/2, 0);
    endShape(CLOSE);
}
