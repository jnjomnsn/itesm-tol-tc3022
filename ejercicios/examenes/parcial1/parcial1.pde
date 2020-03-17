ArrayList<SierpinskiTriangle> triangles[] = new ArrayList[6]; //Variable para tener las variaciones de las 5 posibles etapas
ArrayList<SierpinskiTriangle> actualTriangles;                //Variable para apuntar a la Arraylist que contenga la etapa a mostrar en pantalla
float baseSize;                     //Tamaño de la base de la pirámide
float triangleHeight;               //Altura de cada triangulo
float scaleFactor;                  //Factor de escala para poder hacer zoom
boolean isWhite = true;             //Indica si el background es blanco o no
float rotationAngle = 0;            //Ángulo de rotación para girar la pirámide
int speed = 1;                      //Velocidad con la que gira la pirámide
int stage = 5;                      //Número de etapa
/*
Clase que describe cada uno de los triángulos, tiene como atributos 3 puntos descritos mediante PVectors
Tiene el constructor para inicializar los puntos
Tiene una función para dibujar el objeto utilizando sus puntos como vértices
Tiene una función para calcular cada uno de los 6 puntos que conformarán los triángulos
que se encontrarán en su interior en la siguiente etapa
*/
class SierpinskiTriangle {
    PVector leftPoint;
    PVector topPoint;
    PVector rightPoint;
    SierpinskiTriangle (PVector pointOne, PVector pointTwo, PVector pointThree) {
        leftPoint  = pointOne;
        topPoint   = pointTwo;
        rightPoint  = pointThree;
    }
    void display(){
        beginShape(TRIANGLE);
        vertex(leftPoint.x, leftPoint.y);
        vertex(topPoint.x, topPoint.y);
        vertex(rightPoint.x, rightPoint.y);
        endShape();
    }
    PVector sierpinskiA(){
        return topPoint;
    }
    PVector sierpinskiB(){
        PVector b = new PVector(leftPoint.x,leftPoint.y);
        PVector auxiliar = PVector.sub(rightPoint,leftPoint);
        auxiliar.div(2);
        auxiliar.rotate(-radians(60));
        b.add(auxiliar);
        return b;
    }
      PVector sierpinskiC() {
        PVector c = new PVector(topPoint.x,topPoint.y);
        PVector auxiliar = PVector.sub(rightPoint,leftPoint);
        auxiliar.div(2);
        auxiliar.rotate(radians(60));
        c.add(auxiliar);
        return c;
    }
    PVector sierpinskiD(){
        return leftPoint;
    }
    PVector sierpinskiE(){
        PVector e = PVector.sub(rightPoint,leftPoint);
        e.div(2);
        e.add(leftPoint);
        return e;
    }
    PVector sierpinskiF(){
        return rightPoint;
    }
}
/*
Función para hacer zoom en la pirámide, con un factor de escala máximo de 4 y mínimo de 1
*/
void mouseWheel(MouseEvent e){
    scaleFactor += e.getAmount() / 10;
    if(scaleFactor < 1)
        scaleFactor = 1;
    else if (scaleFactor > 4)
        scaleFactor = 4;
}
/*
Control de los botones del mouse:
    1) Con el click izquierdo se cambia el color de la pirámide por uno aleatorio
    2) Con el click derecho se alterna el color del fondo de blanco a negro
*/
void mousePressed(){
    if (mouseButton == LEFT) 
        fill(random(255),random(255),random(255));
    if(mouseButton == RIGHT)
        isWhite = !isWhite;
}
/*
Control de las teclas:
    1) Con las flechas de arriba y abajo se puede cambiar entre una etapa y otra
    2) Con las flechas de los lados se puede modificar la velocidad de giro hacia ambas direcciones
    3) Con la tecla 'r' se resetea el factor de escala (se regresa el zoom al valor inicial)
*/
void keyPressed() {
    if(key == CODED){
        if(keyCode == RIGHT)
            speed++;
        if(keyCode == LEFT)
            speed--;
        if(keyCode == UP){
            stage = (stage+1)%6;
            actualTriangles = triangles[stage];
        }
        if(keyCode == DOWN){
            if(--stage==-1)
                stage = 5;
            actualTriangles = triangles[stage];
        }
    }
    if(key == 'r')
        scaleFactor = 2;
}
/*
Para comenzar el programa se define el tamaño de la pantalla,
con ese tamaño se define el tamaño de la base de la pirámide y la altura de los triángulos
Después se inicializa el primer ArrayList con los puntos específicos del triángulo más grande,
Una vez hecho esto se manda llamar la función para generar los conjuntos de triángulos de cada etapa
Se define como el conjunto actual el de la etapa 5
*/
void setup() {
    size(900, 900,P3D);
    scaleFactor = 2;
    baseSize = width/2;
    triangleHeight = (sqrt(3)/2)*(baseSize);
    triangles[0] = new ArrayList<SierpinskiTriangle>();
    PVector p1 = new PVector(0,0);
    PVector p2 = new PVector(baseSize/2, -triangleHeight);
    PVector p3 = new PVector(baseSize,0);
    triangles[0].add(new SierpinskiTriangle(p1,p2,p3));    
    for (int i = 0; i < 5; i++){
        generate(i);
    }
    actualTriangles = triangles[stage];
}
/*
Función para llenar las ArrayList
*/
void generate(int x) {
  ArrayList next = new ArrayList<SierpinskiTriangle>();     //Se crea una ArrayList nueva para guardar la siguiente etapa
  for (SierpinskiTriangle triangle : triangles[x]) {        //Para cada triángulo que haya en la etapa actual
    PVector a = triangle.sierpinskiA();                     //Calcular las 6 coordenadas necesarias para hacer los tres triángulos de la etapa siguiente
    PVector b = triangle.sierpinskiB();
    PVector c = triangle.sierpinskiC();
    PVector d = triangle.sierpinskiD();
    PVector e = triangle.sierpinskiE();
    PVector f = triangle.sierpinskiF();
    next.add(new SierpinskiTriangle(b, a, c));              //Generar los tres triángulos e insertarlos en la etapa nueva
    next.add(new SierpinskiTriangle(d, b, e));
    next.add(new SierpinskiTriangle(e, c, f));
  }
  triangles[x+1] = next;                                    //Guardar la lista nueva en la posición correspondiente a la etapa generada
}
void draw() {
    if(isWhite)                                 //Cambiar el color del fondo
        background(255);
    else
        background(0);
    pushMatrix();
    translate(width/2, height*2/3, -width);     //Mover el origen al punto donde estará el centro de la pirámide
    rotationAngle +=speed;                      //Añadir la rotación
    rotateY(radians(rotationAngle));
    scale(scaleFactor);                         //Ajustar la escala (el zoom) en este punto
    translate(-baseSize/2, 0, baseSize/2);      //Mover el origen a la esquina de la pirámide
    beginShape();                               //Dibujar la base de la pirámide
    vertex(0,0,0);
    vertex(baseSize,0,0);
    vertex(baseSize,0,-baseSize);
    vertex(0,0,-baseSize);
    endShape();
    for (int x = 0; x < 4; x++) {                               //Para cada cara de la pirámide
        rotateX(radians(35));                                   //Ajustar la inclinación
        for (SierpinskiTriangle triangle : actualTriangles) {   //Dibujar todos los tríangulos (de la etapa actual)
            triangle.display();
        }
        rotateX(-radians(35));                                  //Regresar la ratación ocupada para inclinar la cara
        rotateY(radians(90));                                   //Mover el punto para dibujar la siguiente cara
        translate(0,0,baseSize);
    }
    popMatrix();
}