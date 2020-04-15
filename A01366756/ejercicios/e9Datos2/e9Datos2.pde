import java.util.Collections;//libreria utilizada para ordenar la lista de objetos
import java.util.*;
//Tabla para manipular los datos del archivo
Table table;
//Lista de arreglo para almacenar la información del archivo
ArrayList<Informacion> listBarras = new ArrayList<Informacion>();
ArrayList<Informacion> listPie = new ArrayList<Informacion>();
ArrayList<Informacion> listColumnas1 = new ArrayList<Informacion>();
ArrayList<Informacion> listColumnas2 = new ArrayList<Informacion>();
ArrayList<ArrayList<Informacion> > listLineas =  new ArrayList<ArrayList<Informacion> >();
//Suma total de los valores en al tabla
int totalDeValoresBarras = 0;
int totalDeValoresPie = 0;
int maxValorColumna = 0;
int maxValorLinea = 0;
int cuantosValoresLinea = 0;

float separacion = 0;
/*
variable para seleccionar la figura a mostrar 
1 gráfica de barras
2 gráfica de pastel
*/
int opcionDeFigura;


public class Informacion implements Comparable<Informacion>{
    String id;
    int valor;
    color colorDeFigura;
    boolean resaltar;
    String nombreLinea;

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

	public boolean isResaltar() {
		return this.resaltar;
	}

	public void setResaltar(boolean resaltar) {
		this.resaltar = resaltar;
	}

    public Informacion (String id,int valor, String resaltar) {
        this.id = id;
        this.valor = valor;
        this.colorDeFigura = color(#59B8F5);
        if(resaltar.equals("resaltar")){
            this.colorDeFigura = color(#34EAE7);
            this.resaltar = true;
        }
        else
            this.resaltar = false;
    }

    public Informacion (String id, int valor, color colorDeFigura, String nombreLinea) {
        this.id = id;
        this.valor = valor;
        this.colorDeFigura = colorDeFigura;
        this.nombreLinea = nombreLinea;
    }

    @Override     
    public int compareTo(Informacion info) {          
        return (this.getValor() > info.getValor() ? -1 : 
        (this.getValor() == info.getValor() ? 0 : 1));
    }

    @Override     
    public String toString() {         
        return " Id: " + this.id + ", Valor: " + this.valor;     
    } 
}

void setup(){
    loadCharts();
    size(1920,920,P3D);
}

void draw(){
    background(0);
    barChart();
    pieChart();
    lineChart();
    columnChart();
    lights();
}

void loadCharts(){
    loadInfo("graficaBarras");
    loadInfo("graficaCircular");
    loadLineChart();
    loadColumnChart();
}

void loadInfo(String archivo){

    table = loadTable(archivo+".csv", "header");
    
    for (TableRow row : table.rows()) {
        Informacion info = new Informacion(row.getString("id"),row.getInt("valor"),row.getString("resaltar"));
        if (archivo.equals("graficaBarras")) {
            totalDeValoresBarras += row.getInt("valor");
            listBarras.add(info);
        } else if (archivo.equals("graficaCircular")) {
            totalDeValoresPie += row.getInt("valor");
            listPie.add(info);
        }
    }

    Collections.sort(listBarras);
    Collections.sort(listPie);
}

void loadLineChart(){
    table = loadTable("graficaLineas.csv");
    for (int columna = 1; columna < table.getColumnCount(); ++columna) {
        color colorDeFigura = color(random(94,192), random(115, 248), random(94, 248));
        listLineas.add(new ArrayList<Informacion>());
        cuantosValoresLinea = table.getRowCount();
        for (int linea = 1; linea < table.getRowCount(); ++linea) {
            Informacion info = new Informacion(table.getString(linea,0),table.getInt(linea,columna),colorDeFigura, table.getString(0,columna));
            if(maxValorLinea<table.getInt(linea,columna))
                maxValorLinea = table.getInt(linea,columna);
            listLineas.get(columna-1).add(info);
        }
    }

}

void loadColumnChart(){
    table = loadTable("graficaColumnas.csv");   
    color color1 = color(115, 248, 94);
    color color2 = color(94, 192, 248);
    for (int linea = 1; linea < table.getRowCount(); ++linea) {
        Informacion info = new Informacion(table.getString(linea,0),table.getInt(linea,1),color1, table.getString(0,1));
        Informacion info2 = new Informacion(table.getString(linea,0),table.getInt(linea,2),color2, table.getString(0,2));
        listColumnas1.add(info);
        listColumnas2.add(info2);
        if(maxValorColumna<table.getInt(linea,1))
            maxValorColumna = table.getInt(linea,1);
        if(maxValorColumna<table.getInt(linea,2))
            maxValorColumna = table.getInt(linea,2);
    }
}

void columnChart(){
    pushMatrix();
        translate(0, height/2.5, 0);
        //determinar las variables necesarias para imprimir las barras
        float maxValor = maxValorColumna*1.2;
        float newHeight = (height/2.5)*.8;
        float maxValorEscala = map(maxValorColumna, 0, maxValor,0, newHeight);
        float espaciadoY = (newHeight - maxValorEscala)/2;
        float espaciadoX = ((width/2.5)/((listColumnas1.size()*3)+1));
        float acumulador = espaciadoX*3 + width/2;
        textAlign(CENTER);
        textSize(26);
        fill(255);
        text("Column Chart", width/4, -height/2);
        textSize(13);
        int posActual = 0;
        for (Informacion info : listColumnas1) {
            noStroke();
            Informacion info2 = listColumnas2.get(posActual);
            float escalaValor1 = map(info.valor, 0, maxValor, 0, newHeight);
            float escalaValor2 = map(info2.valor, 0, maxValor, 0, newHeight);
            float halfBar = acumulador+(espaciadoX/2);
            fill(info.colorDeFigura);
            rect(acumulador, -espaciadoY, espaciadoX,-escalaValor1);
            
            fill(info2.colorDeFigura);
            rect(acumulador+espaciadoX, -espaciadoY, espaciadoX,-escalaValor2);
            
            //imprimir label y alinear
            textAlign(CENTER);
            text(""+info.valor, halfBar,-escalaValor1-35);
            textAlign(CENTER);
            text("ID: "+info.id, halfBar,-(espaciadoY/2)+20);

            textAlign(CENTER);
            text(""+info2.valor, halfBar+espaciadoX,-escalaValor2-35);
            textAlign(CENTER);
            text("ID: "+info2.id, halfBar+espaciadoX,-(espaciadoY/2)+20);

            acumulador += espaciadoX*3;
            posActual++;
        }
        // stroke(255);
        // strokeWeight(4);
        // //linea vertical
        // line(separacion, acumulador+espaciadoY*2, separacion, espaciadoY*2 + height/2 -10);
        // //linea horizontal
        // line(separacion-10, acumulador+espaciadoY*2 - 10, width/2-separacion, acumulador+espaciadoY*2 - 10);
        // //lineas pequeñas verticales
        // for (int i = 1; i < 7; ++i) {
        //     float poslineaPeq = map(i, 0, 6, separacion-10, width/2-separacion);
        //     line(poslineaPeq, acumulador+espaciadoY*2, poslineaPeq, acumulador+espaciadoY);
        //     float valorRespectoALista = map(poslineaPeq, 0, width/2, 0, maxValor);
        //     textAlign(CENTER);
        //     fill(255);
        //     text(""+valorRespectoALista, poslineaPeq, acumulador+espaciadoY*2 + 20);
        // }
    popMatrix();
}

void lineChart(){
    //determinar las variables necesarias para imprimir las barras
    pushMatrix();
        translate(0, height/2.5, 0);
        float maxValor = maxValorLinea*1.2;
        float newHeight = (height/2.5)*.8;
        float lastLine = 0;
        textAlign(CENTER);
        textSize(26);
        fill(255);
        text("Line Chart", width/4, -newHeight-20);
        textSize(13);

        for (ArrayList listaActualLinea : listLineas) {
            ListIterator<Informacion> iteradorLista = listaActualLinea.listIterator();
            int i = 1;
            while (iteradorLista.hasNext()){
                float espaciadoX = map(i, 0, cuantosValoresLinea, 0, width/2-separacion);
                
                Informacion info = iteradorLista.next();
                stroke(info.colorDeFigura);
                strokeWeight(3);
                float valorEscalado = -1*map(info.valor, 0, maxValor,0, newHeight);
                
                if(iteradorLista.hasNext()){
                    Informacion info2 = iteradorLista.next();
                    float valorEscalado2 = -1*map(info2.valor, 0, maxValor,0, newHeight);
                    float espaciadoX2 = map(i+1, 0, cuantosValoresLinea, 0, width/2-separacion);
                    strokeWeight(2);
                    line(espaciadoX, valorEscalado, espaciadoX2, valorEscalado2);
                    iteradorLista.previous();
                }

                stroke(255);
                line(espaciadoX, 15, espaciadoX, -15);
                textAlign(CENTER);
                fill(255);
                text("id: "+info.id, espaciadoX, 30);
                
                lastLine = espaciadoX;

                i++;
            }
            
        }
        
        int contadorE = 1;
        for (ArrayList lista : listLineas) {
            ListIterator<Informacion> iteradorLista = lista.listIterator();
            Informacion info = iteradorLista.next();
            fill(info.colorDeFigura);
            stroke(info.colorDeFigura);
            line(lastLine+20, -newHeight+(contadorE*30), lastLine+45, -newHeight+(contadorE*30));
            textAlign(LEFT);
            text("Linea: "+info.nombreLinea, lastLine+60, -newHeight+(contadorE*30));
            contadorE++;
        }

        stroke(255);
        strokeWeight(4);
        //linea vertical    
        line(separacion, 0, separacion, -newHeight);
        //linea horizontal
        line(separacion-10, 0, lastLine, 0);
        //lineas pequeñas horizontales
        for (int i = 1; i < 6; ++i) {
            float poslineaPeq = map(i, 0, 5, 0, maxValor);
            float valorEscalado = -1*map(poslineaPeq, 0, maxValor,0, newHeight);
            line(separacion-10, valorEscalado, separacion+10, valorEscalado);
            textAlign(RIGHT);
            fill(255);
            text(String.format("%.2f", poslineaPeq), separacion-20, valorEscalado);
        }
    popMatrix();
}


void barChart(){
    //determinar las variables necesarias para imprimir las barras
    float maxValor = listBarras.get(0).valor*1.2;
    float maxValorEscala = map(listBarras.get(0).valor, 0, maxValor,0, width/2);
    float espaciadoX = (width/2 - maxValorEscala)/2 + 20 ;
    separacion = espaciadoX;
    float espaciadoY = ((height/2.5)/((listBarras.size()*2)+1));
    float acumulador = espaciadoY*2 + height/2;
    textAlign(CENTER);
    textSize(26);
    fill(255);
    text("Bar Chart", width/4, height/2);
    textSize(13);
    for (Informacion info : listBarras) {
        float escalaValor = map(info.valor, 0, maxValor, 0, width/2);
        float halfBar = acumulador+(espaciadoY/2);
        if(info.isResaltar()){
            stroke(255);
            strokeWeight(4);
        } else
            noStroke();
        fill(info.colorDeFigura);
        rect(espaciadoX, acumulador, escalaValor-espaciadoX, espaciadoY);

        //imprimir label y alinear
        textAlign(LEFT);
        text("Valor: "+info.valor, escalaValor+6, halfBar);
        textAlign(RIGHT);
        text("ID: "+info.id, espaciadoX-6, halfBar);

        acumulador += espaciadoY*2;
    }
    stroke(255);
    strokeWeight(4);
    //linea vertical
    line(separacion, acumulador+espaciadoY*2, separacion, espaciadoY*2 + height/2 -10);
    //linea horizontal
    line(separacion-10, acumulador+espaciadoY*2 - 10, width/2-separacion, acumulador+espaciadoY*2 - 10);
    //lineas pequeñas verticales
    for (int i = 1; i < 7; ++i) {
        float poslineaPeq = map(i, 0, 6, separacion-10, width/2-separacion);
        line(poslineaPeq, acumulador+espaciadoY*2, poslineaPeq, acumulador+espaciadoY);
        float valorRespectoALista = map(poslineaPeq, 0, width/2, 0, maxValor);
        textAlign(CENTER);
        fill(255);
        text(""+valorRespectoALista, poslineaPeq, acumulador+espaciadoY*2 + 20);
    }
}

void pieChart() {
    float x = (width*3 /4);
    float y = (height*3 /4);
    float z = 0;
    float diameter = x/5;
    float halfAngle;
    float lastAngle = radians(-90);
    float desplazamiento = diameter/8;

    textAlign(CENTER);
    textSize(26); 
    fill(255);
    text("Pie Chart", x, y*2/3);
    textSize(15);
    
    pushMatrix();
        //trasladar la figura al centro que se requiere
        translate(x, y, z);

        Informacion info = listPie.get(0);
        float grados = map(info.valor, 0, totalDeValoresPie, 0, 360);
        float porcentaje = map(info.valor, 0, totalDeValoresPie, 0, 100);
        halfAngle = lastAngle + radians(grados/2);
        float radio = diameter/2;
        float xLabel = (desplazamiento + radio) * cos(halfAngle); 
        float yLabel = (desplazamiento + radio) * sin(halfAngle);
        fill(info.colorDeFigura);

        printLinesResaltado(lastAngle,grados,radio);

        //Imprimir segmento de gráfica
        arc(0, 0, diameter, diameter, lastAngle, lastAngle+radians(grados));
        lastAngle += radians(grados);

        //imprimir label y alinear
        textAlign(CENTER);
        text("Id: " + info.id+"\n"+String.format("%.2f", porcentaje)+"%", xLabel, yLabel);

        for (int i = listPie.size()-1; i >= 1; --i) {
            info = listPie.get(i);
            grados = map(info.valor, 0, totalDeValoresPie, 0, 360);
            porcentaje = map(info.valor, 0, totalDeValoresPie, 0, 100);
            halfAngle = lastAngle + radians(grados/2);
            radio = diameter/2;
            xLabel = (desplazamiento + radio) * cos(halfAngle); 
            yLabel = (desplazamiento + radio) * sin(halfAngle);
            fill(info.colorDeFigura);

            printLinesResaltado(lastAngle,grados,radio);

            //Imprimir segmento de gráfica
            arc(0, 0, diameter, diameter, lastAngle, lastAngle+radians(grados));
            lastAngle += radians(grados);

            //imprimir label y alinear
            textAlign(CENTER);
            text("Id: " + info.id+"\n"+String.format("%.2f", porcentaje)+"%", xLabel, yLabel);
        }
    popMatrix();
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

/*
Función que ayuda a cambiar las variables globales que controlan lo que
se despliega en pantalla
*/
void keyPressed() { 
    if (key == 'b' || key == 'B')
        opcionDeFigura =1;
    if (key == 'p' || key == 'P')
        opcionDeFigura =2;
}