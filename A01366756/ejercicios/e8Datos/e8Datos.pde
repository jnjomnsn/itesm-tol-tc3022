import java.util.Collections;//libreria utilizada para ordenar la lista de objetos
//Tabla para manipular los datos del archivo
Table table;
//Lista de arreglo para almacenar la información del archivo
ArrayList<Informacion> infoList = new ArrayList<Informacion>();
//Suma total de los valores en al tabla
int totalDeValores = 0;
//variable con el nombre del archivo a abrir
String archivo = "csv.csv";
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

    public Informacion (String id,int valor, String resaltar, color colorDeFigura) {
        this.id = id;
        this.valor = valor;
        if(resaltar.equals("resaltar"))
            this.resaltar = true;
        else
            this.resaltar = false;
        this.colorDeFigura = colorDeFigura;
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
    loadInfo();
    size(600,600,P3D);
}

void draw(){
    background(100);
    menu();
    lights();
}

void loadInfo(){

    table = loadTable(archivo, "header");

    println(table.getRowCount() + " total rows in table");
    
    for (TableRow row : table.rows()) {
        // color from = color(random(143, 233),random(143, 213),random(173, 233));
        // color to = color(#F07C95);  lerpColor(from, to, aumentoColor);
        color colorDeFigura = color(random(143, 233),random(143, 213),random(173, 233));
        Informacion info = new Informacion(row.getString("id"),row.getInt("valor"),row.getString("resaltar"),colorDeFigura);
        totalDeValores += row.getInt("valor");
        infoList.add(info);
    }

    Collections.sort(infoList);

    for (Informacion infoFor : infoList) {
        if(infoFor.resaltar)
            println("resaltar   :\t" + infoFor);
        else
            println("no resaltar:\t" + infoFor);
    }
}

/*
Función que ayuda a desplegar el menú con las instucciones cuando es 
requerido, además manda a llamar las funciones que se requieren cuando 
es necesario.
*/
void menu(){
    textSize(15);
    fill(255);
    textAlign(RIGHT);
    text("Presionar 'b' o 'p' para cambiar la gráfica ", width, height-15);
    textAlign(CENTER);
    //escoger que imagen se requiere mostrar
    switch (opcionDeFigura) {
        case 1 :
            barChart();
        break;
        case 2 :
            pieChart(width/2,height/2,0,400);
        break;
        default :
            barChart();
        break;	
    }
}

void barChart(){
    //determinar las variables necesarias para imprimir las barras
    float maxValor = infoList.get(0).valor*1.2;
    float maxValorEscala = map(infoList.get(0).valor, 0, maxValor, 0, width);
    float espaciadoX = (width-maxValorEscala)/2 + 20 ;
    float espaciadoY = height/((infoList.size()*2)+1);
    float acumulador = espaciadoY*2;
    textAlign(CENTER);
    textSize(26); 
    text("Bar Chart", espaciadoX+10, espaciadoY);
    textSize(13);
    for (Informacion info : infoList) {
        float escalaValor = map(info.valor, 0, maxValor, 0, width);
        float halfBar = acumulador+(espaciadoY/2);
        if(info.isResaltar()){
            stroke(255);
            strokeWeight(4);
        } else
            noStroke();
        println("Escala valor: "+escalaValor);
        fill(info.colorDeFigura);
        rect(espaciadoX, acumulador, escalaValor-espaciadoX, espaciadoY);

        //imprimir label y alinear
        textAlign(LEFT);
        text("Valor: "+info.valor, escalaValor+6, halfBar);
        textAlign(RIGHT);
        text("ID: "+info.id, espaciadoX-6, halfBar);

        acumulador += espaciadoY*2;
    }
}

void pieChart(int x, int y, int z, float diameter) {
    
    float halfAngle;
    float lastAngle = radians(-90);
    float desplazamiento = diameter/10;
    float maxValor = infoList.get(0).valor*1.2;
    float maxValorEscala = map(infoList.get(0).valor, 0, maxValor, 0, width);
    float espaciadoX = (width-maxValorEscala)/2 + 20 ;
    float espaciadoY = height/((infoList.size()*2)+1);

    textAlign(CENTER);
    textSize(26); 
    text("Pie Chart", espaciadoX+6, espaciadoY);
    textSize(15);
    
    pushMatrix();
        //trasladar la figura al centro que se requiere
        translate(x, y, z);
        //ángulo inicial para el primar angúlo y la mitad del segmento para el label
        for (Informacion info : infoList) {
            float grados = map(info.valor, 0, totalDeValores, 0, 360);
            float porcentaje = map(info.valor, 0, totalDeValores, 0, 100);
            halfAngle = lastAngle + radians(grados/2);
            float radio = diameter/2;
            float xLabel = (desplazamiento + radio) * cos(halfAngle); 
            float yLabel = (desplazamiento + radio) * sin(halfAngle);

            fill(info.colorDeFigura);

            //imprimir resaltado
            if (info.isResaltar())
                printLinesResaltado(lastAngle,grados,radio);
            else
                noStroke();
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
    stroke(255);
    strokeWeight(4);
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