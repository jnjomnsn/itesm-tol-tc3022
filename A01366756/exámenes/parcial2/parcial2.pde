import java.util.Collections;//libreria utilizada para ordenar la lista de objetos
import java.util.*;

/*
TODO:
- hacer la pantalla de instrucciones
- comentar mejor la parte de la creacion de los objetos
- comentar mejor la parte de los displays de ambas clases
- Hacer que la pelota no pueda rebotar por abajo del jugador
- Hacer que la pelota tenga una dirección diferente cada que choca con un jugador
- Poner el contador de rebotes
*/

boolean disparado = false; //variable para controlar cuando se va a disparar la pelota
boolean guardado = false; //variable para controlar cuando ya se hizo el guardado de la victoria
boolean pausado = false; //variable para controlar cuando se hizo el pausado del juego

Barra player1; //objeto con la información del jugador 1
Barra player2; //objeto con la información del jugador 2
Bola bola; //Objeto con la información de la pelota

Game control = Game.INICIO; //Variable del tipo enumerador para tener el control del estado del juego

color colorPlayer1; //Variable con el color del jugador 1
color colorPlayer2; //Variable con el color del jugador 2

int puntajeMax = 0; //Variable con el puntaje mayor actual para decidir cuando el juego termina

Table table;//Tabla para manipular los datos del archivo
int totalDeValoresPie = 0;//Suma total de los valores en al tabla
ArrayList<Informacion> listPie = new ArrayList<Informacion>(); //Lista con la información del archivo

PImage wasd; //variable para almacenar la imagen de las teclas WASD
PImage arrows; //variable para almacenar la imagen de las flechas

/*Enumerador para los estados del juego
INICIO - Para mostrar las instrucciones
JUGANDO1 - Para el turno del jugador 1
JUGANDO2 - Para el turno del jugador 2
GANAR - Para cuando alguno de los dos jugadores ganó
*/
enum Game{
    INICIO,
    JUGANDO1,
    JUGANDO2,
    GANAR
}

/*Clase para poder crear varias barras y tengas su propia informaci+on cada una*/
public class Barra {
    float x; //posición en x
    float y; //posición en y
    color colorBarra; //color de la figura
    float ancho; //ancho de la figura
    static final int alto = 25; //altura de la figura
    int puntaje = 0; //puntaje correspondiente a la figura
    
    //constructor del objeto
    Barra(float x, float y, float ancho, color colorBarra){
        this.x = x;
        this.y = y;
        this.colorBarra = colorBarra;
        this.ancho = ancho;
    }

    //método para mostrar la barra
    void display(){
        fill(colorBarra);
        rect(x, y, ancho, alto);
    }

    //metodo para mover la barra dentro de los parametros permitidos en el eje y
    void moveUpDown(int dir){
        if(y>height/2 && y<height-alto-50)
            y+= dir;
        else if(y<= height/2 && dir>0)
            y+= dir;
        else if(y>=height-alto-50 && dir<0)
            y+= dir;
    }
    //método para mover la barra dentro de los parametros permitidos en el eje x
    void moveSides(int dir){
        if(x>0 && x<width-ancho)
            x+= dir;
        else if(x<=0 && dir>0)
            x+= dir;
        else if(x>=width-ancho && dir<0)
            x+= dir;
    }
}

/*Clase para poder crear la bola y controlar toda la información respecto a ella*/
public class Bola {
    float x; //posicion en x
    float y; //posicion en y
    float velX; //componente en x
    float velY; //componente en y
    float velGeneral = 5; //magnitud de la velocidad
    float radio; //radio de la pelota
    float diametro; //diametro de la pelota
    float deg = -25; //grados para la dirección del componente
    color colorBola; //color de la pelota
    boolean tope = false; //tope de la flecha que apunta la dirección
	
    //constructor del objeto
    Bola(color colorBola, float diametro){
        this.velX = 0;
        this.velY = 0;
        this.colorBola = colorBola;
        this.diametro = diametro;
        this.radio = diametro/2;
        this.x = width/2;
        this.y = height/2;
    }
    /*Función que printea la pelota y al mismo tiempo checa si ha chocado con alguna de las
    dos barras del jugador y también cualquier colisión con los bordes de la cancha*/
    void display(Barra player1, Barra player2){
        //si aun no se dispara la pelota entonces no hacer ninguna comprobacion
        if(!disparado){
            //pintar la flecha que indica la dirección de la pelota 
            flechaDireccion();
        } else {
            //mover la pelota en la direccion que se le dio al ser disparada
            this.x += velGeneral*velX;
            this.y += velGeneral*velY;
            //si la pelota choca contra alguna de las paredes del juego, cambia de dirección
            if((x<radio)||(x>width))//paredes laterales
                velX *= -1;
            if(y<radio+100) //techo
                velY *= -1;
            else if(y>height-50-radio){ //linea punteada de abajo
                pierde();
            } 
            if(control == Game.JUGANDO1){ //si es el turno del jugador1
                if(( y+radio >=player1.y)&& (y-radio <= player1.y+player1.alto) &&(x>=player1.x)&&(x<= player1.x+player1.ancho)){
                    velY *= -1;
                    control = Game.JUGANDO2; //cambiar al turno del jugador 2
                    colorBola = colorPlayer2; //cambiar el color de la pelota
                }
            } 
            if( control == Game.JUGANDO2){// si es el turno del jugador2
                if(( y+radio >=player2.y) && (y-radio <= player2.y+player2.alto) && (x>=player2.x) && (x<= player2.x+player2.ancho)){
                    velY *= -1;
                    control = Game.JUGANDO1; //cambiar al turno del jugador 1
                    colorBola = colorPlayer1;//cambiar el color de la pelota
                }
            }
        }
        fill(colorBola);
        circle(x, y, diametro);
    }
    
    /*Método para disparar la pelota, establece que ya se disparó la pelota y establece los
    componentes del vector de movimiento de la pelota*/
    void fire(){
        disparado = true;
        this.velX = cos(radians(deg));
        this.velY = sin(radians(deg));
    }
    
    /*Método que muestra la flecha que apunta en la dirección que se va a mover la pelota
    cuando ésta se dispare*/
    void flechaDireccion(){
        float tamFelcha = diametro*2; //definir el tamaño de la linea principal
        float tamFelcha2 = tamFelcha -5; //definir la posición donde estará las flechas pequeñas que simulan la flecha
        //para que la flecha vaya y venga dentro del rango de angulos definido
        if(deg==-25) // si ya se llagó al grado -25
            tope=false;
        if(deg==-155) //si ya se llegó al grado -155
            tope = true;
        if(!tope) // si se no se ha llegado al tope seguir restando para mover en contra de las manecillas del reloj
            deg-=2.5;
        else // si ya se llegó, entonces sumar para que se mueva en sentido de las manecillas del reloj
            deg+=2.5;
        float auxDeg = deg-5; //variable para las lineas que simulan la flecha
        float x2 = tamFelcha*cos(radians(deg)); //posición en x de la linea principal
        float y2 = tamFelcha*sin(radians(deg)); //posición en y de la linea principal
        float xFlecha1 = tamFelcha2 *cos(radians(auxDeg)); //posición en x de la linea principal
        float yFlecha1 = tamFelcha2 *sin(radians(auxDeg)); //posición en y de la linea principal
        auxDeg = deg+5; //cambiar el auxiliar para la otra linea pequeña
        float xFlecha2 = tamFelcha2 *cos(radians(auxDeg)); //posición en x de las lineas pequeñas que simulan la flecha
        float yFlecha2 = tamFelcha2*sin(radians(auxDeg)); //posición en y de las lineas pequeñas que simulan la flecha

        pushMatrix();
            translate(x, y);
            line(0, 0, x2, y2);
            line(x2, y2, xFlecha1, yFlecha1);
            line(x2, y2, xFlecha2, yFlecha2);
        popMatrix();
    }
}

/*Clase para almacenar la información para crear la gráfica circular*/
public class Informacion implements Comparable<Informacion>{
    String id; //identificador de la linea en la que está el dato
    int valor; //valor del dato

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getValor() {
		return this.valor;
	}

	public void setValor(int valor) {
		this.valor = valor;
	}
    //constructor del objeto
    public Informacion (String id,int valor) {
        this.id = id;
        this.valor = valor;
    }
    //método para poder ordenar cuando el objeto se encuentre en una lista
    @Override     
    public int compareTo(Informacion info) {          
        return (this.getValor() > info.getValor() ? -1 : 
        (this.getValor() == info.getValor() ? 0 : 1));
    }
    //método para poder imprimir el elemento de ser necesario
    @Override     
    public String toString() {         
        return " Id: " + this.id + ", Valor: " + this.valor;     
    } 
}

/*Función para cargar la informacion del archivo correspondiente*/
void loadInfo(String archivo){
    //cargar el archivo que contiene la información
    table = loadTable(archivo+".csv", "header");
    for (TableRow row : table.rows()) {
        Informacion info = new Informacion(row.getString(0),row.getInt(1)); //crear el objeto para almacenarlo en la lista
        totalDeValoresPie += row.getInt("valor"); //sumar el valor para mantener el total y poder imprimir la gráfica
        listPie.add(info); //adjuntar el objeto a la lista
    }
    Collections.sort(listPie); //ordenar la lista 
}

/*Función para imprimir la gráfica de pastel*/
void pieChart(){
    float diameter = width/2.5; //diametro de la gráfica
    float halfAngle; //variable para almacenar la mitad del angulo que representa el segmento de la gráfica de barras
    float lastAngle = radians(-90); //variable para almacenar dónde se terminó el segmento anterior
    float desplazamiento = diameter/8; //variable para mover la etiqueta lo suficiente para que no se encime a la barra

    textAlign(CENTER);
    textSize(50); 
    fill(0);
    text("Resultados Globales", width/2, 100);
    textSize(15);

    pushMatrix();
        //trasladar la figura al centro que se requiere
        translate(width/2, height/2);

        Informacion info = listPie.get(0); //el primer objeto de la lista que no obedece a la regla
        float grados = map(info.valor, 0, totalDeValoresPie, 0, 360); //grados que representa el segmento respecto a los grados de un circulo
        float porcentaje = map(info.valor, 0, totalDeValoresPie, 0, 100); //porcentaje que representa el valor del total de los valores
        halfAngle = lastAngle + radians(grados/2); //obtener la mitad del angulo de dicho segmento
        float radio = diameter/2; //radio de la gráfica
        float xLabel = (desplazamiento + radio) * cos(halfAngle); //posición en x de la etiqueta del segmento
        float yLabel = (desplazamiento + radio) * sin(halfAngle); //posición en y de la etiqueta del segmento
        fill(info.colorDeFigura); //llenar el segmento del color correspondiente

        printLinesResaltado(lastAngle,grados,radio); //imprimir las lineas divisoras

        //Imprimir segmento de gráfica
        arc(0, 0, diameter, diameter, lastAngle, lastAngle+radians(grados));
        lastAngle += radians(grados);

        //imprimir la etiqueta y alinear
        textAlign(CENTER);
        text(info.id+"\n"+String.format("%.2f", porcentaje)+"%", xLabel, yLabel);

        /*empezar a imprimir los segmentos del menor al mayor después de que el primer elemento (el más grande)
        ya fue impreso, para que tnega sentido con las reglas para imprimir una gráfica circular y repetir el 
        proceso que se tomó para el primer elemento*/
        for (int i = listPie.size()-1; i >= 1; --i) {
            //obtener los ángulos para imprimir el segmento
            info = listPie.get(i); 
            grados = map(info.valor, 0, totalDeValoresPie, 0, 360);
            porcentaje = map(info.valor, 0, totalDeValoresPie, 0, 100);
            halfAngle = lastAngle + radians(grados/2);
            radio = diameter/2;
            xLabel = (desplazamiento + radio) * cos(halfAngle); 
            yLabel = (desplazamiento + radio) * sin(halfAngle);
            fill(info.colorDeFigura);

            printLinesResaltado(lastAngle,grados,radio); //imprimir las lineas divisoras

            //Imprimir segmento de gráfica
            arc(0, 0, diameter, diameter, lastAngle, lastAngle+radians(grados));
            lastAngle += radians(grados);

            //imprimir la etiqueta y alinear
            textAlign(CENTER);
            text("Id: " + info.id+"\n"+String.format("%.2f", porcentaje)+"%", xLabel, yLabel);
        }
    popMatrix();

    textAlign(RIGHT);
    textSize(15);
    text("Presione 'r' o 'R' para reiniciar el juego",width-20,height-50); //mensaje para informar de la opción de reiniciar
}

/*Función para aumentar las victorias de cada jugador en la lista con la información */
void addWins(){
    String str = " ";
    Informacion info = new Informacion(" ",0," ");
    if(player1.puntaje == 5){
        info = listPie.get(0);
        TableRow row = table.getRow(0);
        row.setInt("valor",row.getInt("valor")+1);
        saveTable(table, "graficaCircular.csv");
    }else if(player2.puntaje == 5){
        info = listPie.get(1);
        TableRow row = table.getRow(1);
        row.setInt("valor",row.getInt("valor")+1);
        saveTable(table, "graficaCircular.csv");
    }

    info.valor++;
    totalDeValoresPie++;
}

void printLinesResaltado(float lastAngle, float grados, float radio){
    stroke(100);
    strokeWeight(1);
    float xResaltadoInicio = radio * cos(lastAngle); 
    float yResaltadoInicio = radio * sin(lastAngle);
    float xResaltadoFin = radio * cos(lastAngle+radians(grados)); 
    float yResaltadoFin = radio * sin(lastAngle+radians(grados));
    line(0, 0, xResaltadoInicio, yResaltadoInicio);
    line(0, 0, xResaltadoFin, yResaltadoFin);
}

//función que ayuda a dibujar la cancha donde se pueden mover los jugadores
void cancha(){
    strokeWeight(1);
    //lineas grandes
    line(0, 100, width, 100); //linea de arriba
    line(0, height/2, width, height/2); //linea horizontal
    line(width/2, height, width/2, height/2); //linea vertical
    //lineas pequeñas de la izquierda
    line(width/4, height/2, width/4, 3*height/4); //linea vertical
    line(0, 3*height/4, width/4, 3*height/4); //linea horizontal
    //lineas pequeñas derecha
    line(3*width/4, height/2, 3*width/4, 3*height/4); //linea vertical
    line(3*width/4, 3*height/4, width, 3*height/4); //linea horizontal
    //linea punteada
    for (int i = 0; i < width; i+=5) {
        if(i%2 == 0){
            stroke(#EA1515);
            line(i, height-50, i+5, height-50);
        }
    }
    stroke(0);
}

/*funcion para reiniciar la partida para que continuae el juego después de que caiga la pelota*/
void pierde(){
    sumarPuntos();
    bola.x = width/2;
    bola.y = height/2;
    disparado = false;
}

void restart(){
    control = Game.INICIO;
    disparado = false;
    guardado = false;
    puntajeMax = 0;
    totalDeValoresPie = 0;
    wasd = loadImage("wasd.png");
    arrows = loadImage("arrows.png");
    listPie = new ArrayList<Informacion>();
    loadInfo("graficaCircular");
    //creación de las variables con los colores de cada jugador
    colorPlayer1 = color(#A2EDF9);
    colorPlayer2 = color(#E3462D);
    //creación de los objetos de la n¿bola, el jugador 1 y el jugador 2
    bola = new Bola(colorPlayer1, 40);
    player1 = new Barra(width/4 - bola.diametro*2, 3*height/4, bola.diametro*2, colorPlayer1);
    player2 = new Barra(3*width/4, 3*height/4, bola.diametro*2, colorPlayer2);
}

/*función para sumar los puntos al jugador correspondiente y registrar el puntaje maximo*/
void sumarPuntos(){
    if(control == Game.JUGANDO1){
        player2.puntaje++;
        if(player2.puntaje > puntajeMax)
            puntajeMax = player2.puntaje;
    }else if(control == Game.JUGANDO2){
        player1.puntaje++;
        if(player1.puntaje > puntajeMax)
            puntajeMax = player1.puntaje;
    }
    if(puntajeMax == 5){
        control = Game.GANAR;
    }
}

void texto(String mensaje){
    textAlign(CENTER);
    textSize(45); 
    fill(#15EAAD);
    text(mensaje,width/2,height/2-100);
}

/*Función para mostrar las instrucciones en pantalla*/
void instrucciones(){
    imageMode(CENTER);
    image(wasd, width/4,height*.35,226,152);
    image(arrows, 3*width/4,height*.35,256,256);
    textAlign(CENTER);
    textSize(55);
    text("INSTRUCCIONES",width/2,100);
    textSize(35); 
    fill(colorPlayer1);
    text("Usa las teclas W A S D\npara usar la barra azul",width/4,height/2);
    fill(colorPlayer2);
    text("Usa las flechas\n para usar la barra roja",3*width/4,height/2);
    fill(#15EA3C);
    text("Presione espacio para disparar\n"+
    "Presione 'p' o 'P' para pausar\n"+
    "Presione 'r' o 'R' para reiniciar\n"+
    "De click para continuar",width/2,height*.70);
    fill(0);
}

void setup() {
    size(1300,900);
    smooth();
    restart();
}

void draw() {
    background(255);
    switch (control) {
        case INICIO :
            instrucciones();
        break;
        case GANAR :
            if(!guardado){
                addWins();
                guardado = true;
            }
            pieChart();
        break;	
        default :
            textAlign(LEFT);
            fill(colorPlayer1);
            text("Jugador 1: "+player1.puntaje,50,50);
            textAlign(RIGHT);
            fill(colorPlayer2);
            text("Jugador 2: "+player2.puntaje,width-50,50);
            cancha();
            bola.display(player1, player2);
            player1.display();
            player2.display();
        break;	
    }
}

/*función que ayuda a reconocer cuando una tecla fue presionada
y en este caso se usa para modificar la posicioón de los jugadores*/
void keyPressed() {
    //variable para modificar de manera rápida la velocidad con la que los jugadores se mueven
    int moveSpeed = 30;
    //presionar la tecla de espacio para hacer el disparo, solo debe funcionar cada que se quiere empezar el juego
    if (keyCode == 32 && disparado == false && (control == Game.JUGANDO1 || control == Game.JUGANDO2))
        bola.fire();
    else if(key == CODED){
        //teclas que controlan el jugador numero 2
        //son las flechas del teclado
        if (keyCode == UP)
            player2.moveUpDown(-moveSpeed);
        if (keyCode == DOWN)
            player2.moveUpDown(moveSpeed);
        if (keyCode == LEFT)
            player2.moveSides(-moveSpeed);
        if (keyCode == RIGHT)
            player2.moveSides(moveSpeed);
    }else{
        //teclas que controlan el jugador numero 1
        //son las teclas WASD
        if (key == 'w' || key == 'W')
            player1.moveUpDown(-moveSpeed);
        if (key == 's' || key == 'S')
            player1.moveUpDown(moveSpeed);
        if (key == 'a' || key == 'A')
            player1.moveSides(-moveSpeed);
        if (key == 'd' || key == 'D')
            player1.moveSides(moveSpeed);
        if (key == 'p' || key == 'P') //tecla para pausar
            println("holi");
        if (key == 'r' || key == 'R') //tecla para reiniciar
            restart();
    }
}

/*Función para pasar las instrucciones y empezar el juego */
void mouseClicked() {
    if(control == Game.INICIO)
        control = Game.JUGANDO1;
}