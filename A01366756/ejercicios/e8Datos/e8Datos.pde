import java.util.Collections;//libreria utilizada para ordenar la lista de objetos
//Tabla para manipular los datos del archivo
Table table;
//Lista de arreglo para almacenar la información del archivo
ArrayList<Informacion> infoList = new ArrayList<Informacion>();
//Suma total de los valores en al tabla
int totalDeValores = 0;

/*
variable para seleccionar la figura a mostrar 
1 gráfica de barras
2 gráfica de pastel
*/
int opcionDeFigura;


public class Informacion implements Comparable<Informacion>{
    String id;
    int valor;
    float rgb[] = new float[3];
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

    public Informacion (String id,int valor, String resaltar) {
        this.id = id;
        this.valor = valor;
        if(resaltar.equals("resaltar"))
            this.resaltar = true;
        else
            this.resaltar = false;
        for (int i = 0; i < 3; ++i) {
            rgb[i] = random(255);
        }
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
    pieChart(width/2,height/2,0,400);
    //menu();
    noStroke();
    lights();
}

void loadInfo(){

    table = loadTable("mammals.csv", "header");

    println(table.getRowCount() + " total rows in table");

    for (TableRow row : table.rows()) {
        Informacion info = new Informacion(row.getString("id"),row.getInt("valor"),row.getString("resaltar"));
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

void pieChart(int x, int y, int z, float diameter) {
    //trasladar la figura al centro que se requiere
    translate(x, y, z);
    rotateZ(radians(-90));
    float lastAngle = 0;
    int infoListSize = infoList.size();
    int contador = 0;
    for (Informacion info : infoList) {
        float grados = map(info.valor, 0, totalDeValores, 0, 360);
        fill(info.rgb[0],info.rgb[1],info.rgb[2]);
        
        if (info.isResaltar())
            stroke(150);
        else
            noStroke();
        
        arc(0, 0, diameter, diameter, lastAngle, lastAngle+radians(grados));
        lastAngle += radians(grados);

        //float xLabel = diameter + 
        contador++;
    }
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