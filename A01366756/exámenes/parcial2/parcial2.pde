boolean disparado = false;
Barra player1;
Barra player2;
Bola bola;
int tiempoInicio;
Game control = Game.INICIO;

color colorPlayer1;
color colorPlayer2;

/*Enumerador para los estados del juego*/
enum Game{
    INICIO,
    JUGANDO1,
    JUGANDO2,
    PERDER,
    GANAR
}

public class Barra {
    float x;
    float y;

    color colorBarra;

    float ancho;
    static final int alto = 25;

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
    float velGeneral = 10;
    float radio;
    float diametro;
    float deg = 0;
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

    void display(Barra player1, Barra player2){
        this.x += velGeneral*velX;
        this.y += velGeneral*velY;

        if((x<radio)||(x>width))
            velX *= -1;
        if(y<radio)
            velY *= -1;
        if(y>height-radio){
            control = Game.PERDER;
            velY *= -1;
        }
        if(disparado){
            if(control == Game.JUGANDO1){
                if(( y+radio >=player1.y)&&(x>=player1.x)&&(x<= player1.x+player1.ancho)){
                    velY *= -1;
                    control = Game.JUGANDO2;
                    colorBola = colorPlayer2;
                }
            }else if( control == Game.JUGANDO2){
                if(( y+radio >=player2.y)&&(x>=player2.x)&&(x<= player2.x+player2.ancho)){
                    velY *= -1;
                    control = Game.JUGANDO1;
                    colorBola = colorPlayer1;
                }
            }
        } else {
            flechaDireccion();
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
        if(deg==0)
            tope=false;
        if(deg==-180)
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

void keyPressed() {
    int moveSpeed = 20;
    if (keyCode == 32 && disparado == false)
        bola.fire();
    else if(key == CODED){
        if (keyCode == UP)
            player2.moveUpDown(-moveSpeed);
        if (keyCode == DOWN)
            player2.moveUpDown(moveSpeed);
        if (keyCode == LEFT)
            player2.moveSides(-moveSpeed);
        if (keyCode == RIGHT)
            player2.moveSides(moveSpeed);
    } 
    else{

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

void cancha(){
    strokeWeight(1);
    //lineas grandes
    line(0, height/2, width, height/2);
    line(width/2, height, width/2, height/2);
    //lineas pequeñas de la izquiera
    line(width/4, height/2, width/4, 3*height/4);
    line(0, 3*height/4, width/4, 3*height/4);
    //lineas pequeñas derecha
    line(3*width/4, height/2, 3*width/4, 3*height/4);
    line(3*width/4, 3*height/4, width, 3*height/4);
}

void setup() {
    size(1300,900);
    smooth();
    colorPlayer1 = color(#A2EDF9);
    colorPlayer2 = color(#E3462D);
    bola = new Bola(colorPlayer1, 40);
    player1 = new Barra(width/4 - bola.diametro*2, 3*height/4, bola.diametro*2, colorPlayer1);
    player2 = new Barra(3*width/4, 3*height/4, bola.diametro*2, colorPlayer2);
}

void draw() {
    background(255);
    cancha();
    bola.display(player1, player2);
    player1.display();
    player2.display();
}


