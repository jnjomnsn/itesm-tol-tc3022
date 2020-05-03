/*
TODO:
- hacer funcion de restart
    - tiene que poner la pelota en el centro
    - false en disparado
- hacer funcion que sume los puntos al jugador correspondiente
- implemetar el sistema de puntuación de cada jugador
    - el primero que llegue a 5 puntos gana la partida 
- printear la puntuación de cada jugador
- hacer que guarde en el archivo la puntuación

- hacer la pantalla de instrucciones
- comentar mejor la parte de la creacion de los objetos
- comentar mejor la parte de los displays de ambas clases
- Hacer que la pelota no pueda rebotar por abajo del jugador
- Hacer que la pelota tenga una dirección diferente cada que choca con un jugador
*/
boolean disparado = false;
Barra player1;
Barra player2;
Bola bola;
Game control = Game.INICIO;
color colorPlayer1;
color colorPlayer2;

/*Enumerador para los estados del juego*/
enum Game{
    INICIO,
    JUGANDO1,
    JUGANDO2,
    GANAR
}

/*Clase para poder crear varias barras y tengas su propia informaci+on cada una*/
public class Barra {
    float x;
    float y;
    color colorBarra;
    float ancho;
    static final int alto = 25;
    int puntaje = 0;

    Barra(float x, float y, float ancho, color colorBarra){
        this.x = x;
        this.y = y;
        this.colorBarra = colorBarra;
        this.ancho = ancho;
    }

    void display(){
        fill(colorBarra);
        rect(x, y, ancho, alto);
    }

    void moveUpDown(int dir){
        if(y>height/2 && y<height-alto)
            y+= dir;
        else if(y<= height/2 && dir>0)
            y+= dir;
        else if(y>=height-alto && dir<0)
            y+= dir;
    }

    void moveSides(int dir){
        if(x>0 && x<width-ancho)
            x+= dir;
        else if(x<=0 && dir>0)
            x+= dir;
        else if(x>=width-ancho && dir<0)
            x+= dir;
    }
}

public class Bola {
    float x;
    float y;
    float velX;
    float velY;
    float velGeneral = 5;
    float radio;
    float diametro;
    float deg = -25;
    color colorBola;
    boolean tope = false;
	
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
            //serie de ifs que cambian la dirección de la pelota si esta choca contra alguna de las paredes del juego
            if((x<radio)||(x>width))//paredes laterales
                velX *= -1;
            if(y<radio+100) //techo
                velY *= -1;
            else if(y>height-50-radio){ //linea punteada de abajo
                velY *= -1;
            }else if(control == Game.JUGANDO1){ //si es el turno del jugador1
                if(( y+radio >=player1.y)&& (y-radio <= player1.y+player1.alto) &&(x>=player1.x)&&(x<= player1.x+player1.ancho)){
                    velY *= -1;
                    control = Game.JUGANDO2;
                    colorBola = colorPlayer2;
                }
            }else if( control == Game.JUGANDO2){// si es el turno del jugador2
                if(( y+radio >=player2.y) && (y-radio <= player2.y+player2.alto) && (x>=player2.x) && (x<= player2.x+player2.ancho)){
                    velY *= -1;
                    control = Game.JUGANDO1;
                    colorBola = colorPlayer1;
                }
            }
        }
        fill(colorBola);
        circle(x, y, diametro);
    }

    void fire(){
        disparado = true;
        control = Game.JUGANDO1;
        this.velX = cos(radians(deg));
        this.velY = sin(radians(deg));
    }

    void flechaDireccion(){
        float tamFelcha = diametro*2;
        float tamFelcha2 = tamFelcha -5;
        if(deg==-25)
            tope=false;
        if(deg==-155)
            tope = true;
        if(!tope)
            deg-=2.5;
        else
            deg+=2.5;
        float auxDeg = deg-5;
        float x2 = tamFelcha*cos(radians(deg));
        float y2 = tamFelcha*sin(radians(deg));
        float xFlecha1 = tamFelcha2 *cos(radians(auxDeg));
        float yFlecha1 = tamFelcha2 *sin(radians(auxDeg));
        auxDeg = deg+5;
        float xFlecha2 = tamFelcha2 *cos(radians(auxDeg));
        float yFlecha2 = tamFelcha2*sin(radians(auxDeg));

        pushMatrix();
            translate(x, y);
            line(0, 0, x2, y2);
            line(x2, y2, xFlecha1, yFlecha1);
            line(x2, y2, xFlecha2, yFlecha2);
        popMatrix();
    }
}

//función que ayuda a reconocer cuando una tecla fue presionada
//y en este caso se usa para modificar la posicioón de los jugadores
void keyPressed() {
    //variable para modificar de manera rápida la velocidad con la que los jugadores se mueven
    int moveSpeed = 30;
    //presionar la tecla de espacio para hacer el disparo, solo debe funcionar cada que se quiere empezar el juego
    if (keyCode == 32 && disparado == false)
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
    }
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

void setup() {
    size(1300,900);
    smooth();
    //creación de las variables con los colores de cada jugador
    colorPlayer1 = color(#A2EDF9);
    colorPlayer2 = color(#E3462D);
    //creación de los objetos de la n¿bola, el jugador 1 y el jugador 2
    bola = new Bola(colorPlayer1, 40);
    player1 = new Barra(width/4 - bola.diametro*2, 3*height/4, bola.diametro*2, colorPlayer1);
    player2 = new Barra(3*width/4, 3*height/4, bola.diametro*2, colorPlayer2);
}


void restart(){
    bola.x = width/2;
    bola.y = height/2;
    disparado = false;
    sumarPuntos();
}

void sumarPuntos(){
    if(control == Game.JUGANDO1)
        jugador2.puntaje++;
    else if(control == Game.JUGANDO2)
        jugador1.puntaje++;
}

void draw() {
    background(255);
    cancha();
    bola.display(player1, player2);
    player1.display();
    player2.display();
}