import java.util.concurrent.ThreadLocalRandom; //libreria utilizada para generar números al azar
//objeto utilizado para crear números al azar
ThreadLocalRandom generator = ThreadLocalRandom.current();
//variables for the rotation of the figures
float counterForRotationX=0, counterForRotationY=0;
//variable global para definir el tamaño/escala de la imagen
float escala = 2;
//variables globales para definir el color de las imágenes
float r=255, g=255, b=255;
//variable global para controlar el número de fractales
int numFractales = 5;
/*
variable para seleccionar la figura a mostrar 
1 triangulo
2 piramide
*/
int opcionDeFigura;
/*
variable para mostrar o no las instrucciones
true = mostrar el menu
false = no mostrar el menu
*/
boolean mostrarMenu = true;


/*
Clase para guardar y manipular con mayor facilidad las coordenadas 
de los puntos de los triangulos
*/
public class Punto {
    float x;
    float y;
    public Punto (float x,float y) {
        this.x = x;
        this.y = y;
    }
}

void setup(){
    size(1000,400,P3D);
}

void draw(){
    background(0);
    //printear el menu
    menu();
    noStroke();
    lights();
}
/*
Función que ayuda a desplegar el menú con las instucciones cuando es 
requerido, además manda a llamar las funciones que se requieren cuando 
es necesario.
*/
void menu(){
    textSize(15);
    fill(255);
    if (mostrarMenu)
        text("Instrucciones:\n"
        +"\t    Presionar '+' o '-' para cambiar el número de fractales\n"
        +"\t    Puede agrandar la pantalla  y la imagen también lo hará\n"
        +"\t    Dar click para cambiar de color de la imagen\n"
        +"\t    Presionar 'T' o 't' para mostrar el Triángulo\n"
        +"\t    Presionar 'P' o 'p' para mostrar la Pirámide\n"
        +"\t    Presionar 'M' o 'm' para esconder el Menú\n"
        +"\t    Arrastrar el mouse clickeado para rotar\n", 10, 30);
    //escoger que imagen se requiere mostrar
    switch (opcionDeFigura) {
        case 1 :
            trianguloDeSierpinski(width/2,height/2,0,-1);
        break;
        case 2 :
            piramide();
        break;
        default :
            piramide();
        break;	
    }
}

/*
Función que crea la piramide creando 4 triangulos con diferentes
ángulos.
*/
void piramide(){
    for (int i = 0; i < 4; ++i) {
        //llamar a la función que crea los triangulos para cada cara
        pushMatrix();
            trianguloDeSierpinski(width/2,height/2,0,90*i);
        popMatrix();
    }
}

/*
Función para calcular los puntos iniciales del triangulo 
y hacer la primera llamada, al mismo tiempo recibe la cantidad de 
grados que se quiere rotar cada triangulo. 

En caso de requerir que no se rote el triangulo para crear la priamide,
llamar la función con un -1, o cualquier número negativo, en el último 
parametro.
*/
void trianguloDeSierpinski(int x, int y, int z, int grados){
    /*
    Se recibe el centro de donde debe estar el triangulo
    eso sería el punto medio de la altura, y los puntos de
    cada lado se van a calcular en proporcion a la altura
    */
    
    //trasladar la figura al centro que se requiere
    translate(x, y, z);
    
    //rotar la figura constantemente y si se desea también arrastrando el mouse
    rotateFigure(true);

    //escalar la figura para dar la sensación de zoom
    scaleFigure();

    //calcular todas las medidas necesarias para crear los triangulos
    float altura = y/2;
    float lado = altura/sin(radians(60));
    float tamEnX = lado * sin(radians(30));
    float movimientoEnZ = altura*cos(radians(60));

    //Hacer las transformaciones necesarias si se requiere
    if (grados>-1) {
        rotateY(radians(grados));
        rotateX(radians(35));
        translate(0, 0, movimientoEnZ-(movimientoEnZ*.30));
    }

    //punto del centro
    Punto punto1 = new Punto(0,-altura/2);
    //punto de la izquierda
    Punto punto2 = new Punto(-tamEnX,altura/2);
    //punto de la derecha
    Punto punto3 = new Punto(tamEnX,altura/2);
    
    //primera llamada a la función que dibuja el triangulo
    triangulo(numFractales, punto1, punto2, punto3);
}

/*
Funcion recursiva para dibujar el triangulo de Sierpinski.

El primer parametro es el que decide el nivel del triangulo
y los parametros siguientes dicen los puntos iniciales de cada triangulo.

La funcion hace tres llamadas recursivas mientras el nivel no sea igual a 0,
para hacer los tres triangulos que forman el triangulo más grande.
*/
void triangulo(int nivel, Punto punto1, Punto punto2, Punto punto3){
    //si el nivel aún no es 0 hacer las llamadas recursivas
    if(nivel<=0){
        //dibujar el triangulo recibido
        fill(r, g, b);
        beginShape();
            vertex(punto2.x, punto2.y, 0);
            vertex(punto3.x, punto3.y, 0);
            vertex(punto1.x, punto1.y, 0); 
        endShape();
    }else{
        //definir los puntos nuevos
        Punto nuevoPunto1 = new Punto((punto2.x+punto1.x)/2.0,(punto2.y+punto1.y)/2.0);
        Punto nuevoPunto2 = new Punto((punto3.x+punto2.x)/2.0,(punto3.y+punto2.y)/2.0);
        Punto nuevoPunto3 = new Punto((punto1.x+punto3.x)/2.0,(punto1.y+punto3.y)/2.0);
        
        triangulo(nivel-1, punto1, nuevoPunto1, nuevoPunto3);
        triangulo(nivel-1, punto2, nuevoPunto2, nuevoPunto1);
        triangulo(nivel-1, punto3, nuevoPunto3, nuevoPunto2);
    }
}

/*
Función para hacer rotar cualquier imagen o figura en la que se mande
a llamar y que se encuentre en el centro del plano. 

El parametro sirve para elegir la direccion de la rotación en el eje x.

Necesita de las variables globales: 
    float counterForRotationX=0, counterForRotationY=0;
*/
void rotateFigure(boolean positiveDirection){
    float rotateRate = 0.25;
    //contadores para elegir la dirección de la rotación    
    if (positiveDirection)
        counterForRotationX+= rotateRate;
    else
        counterForRotationX-= rotateRate;
    //rotar el plano como corresponda
    rotateY(radians(counterForRotationX));
    rotateX(radians(counterForRotationY));
}

/*
Función para escalar cualquier imagen o figura en la que se mande a 
llamar y que se encuentre en el centro del plano.

No deja desaparecer la imagen en caso de que la variable global pueda
disminuir a 0 en algún caso.

Aún necesita mejoras para que sea totalmente reutilizable. Aún requiere
ayuda de un controlador.
*/
void scaleFigure(){
    if(escala<1)
        escala=1;
    scale(escala, escala, escala);
}

/*
Función que ayuda a la función "rotateFigure" a rotar la figura como
el usuario lo desee.
*/
void mouseDragged() {
  counterForRotationX = mouseX/5;
  counterForRotationY = -mouseY/5;
}

/*
Función que recibe la señal de la rueda de mouse, en este caso se usa 
para aumentar o disminuir el tamaño de la piramide o de el triangulo 
que se este dibujando en pantalla.
*/
void mouseWheel(MouseEvent event) {
    if (event.getCount()<1 && escala<1)
        escala = 1.0;
    else
        escala += event.getCount();

}


void mouseClicked() {
    int lower = 1;
    int upper = 255;
    r = (float)generator.nextDouble(lower,upper);
    g = (float)generator.nextDouble(lower,upper);
    b = (float)generator.nextDouble(lower,upper);
}

void keyPressed() { 
    if (key == 't' || key == 'T')
        opcionDeFigura =1;
    if (key == 'p' || key == 'P')
        opcionDeFigura =2;
    if (key == 'm' || key == 'M')
        mostrarMenu = !mostrarMenu;
    if (key == '+' && numFractales<6)
        numFractales++;
    if (key == '-' && numFractales>1)
        numFractales--;
}