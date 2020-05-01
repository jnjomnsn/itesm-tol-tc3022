import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

// This class will be used to saveinformation of the products in the .csv .
class InfectedDataPercentage{
  String age;
  int percentage;
  boolean highlight;
  
  // Constructor.
  public InfectedDataPercentage(String age, int percentage, boolean highlight){
    this.age = age;
    this.percentage = percentage;
    this.highlight = highlight;
  }
}

class InfectedDataNumbers{
  String country;
  int total;
  boolean highlight;
  
  // Constructor.
  public InfectedDataNumbers(String country, int total, boolean highlight){
    this.country = country;
    this.total = total;
    this.highlight = highlight;
  }
}

class RecoveredDataNumbers{
  int month;
  int mexico_total, eu_total;
  
  // Constructor.
  public RecoveredDataNumbers(int month, int mexico_total, int eu_total){
    this.month = month;
    this.mexico_total = mexico_total;
    this.eu_total = eu_total;
  }
}

class InfectedDataLines{
  String country;
  int[] infected = new int[7];
  
  // Constructor.
  public InfectedDataLines(String country, int[] infected){
    this.country = country;
    this.infected = infected;
  }
}


// This list will contain all the graphic cards that are stores in the .csv .
ArrayList<InfectedDataPercentage> infectedDataPercentage = new ArrayList<InfectedDataPercentage>();
ArrayList<InfectedDataNumbers> infectedDataNumbers = new ArrayList<InfectedDataNumbers>();
ArrayList<RecoveredDataNumbers> recoveredDataNumbers = new ArrayList<RecoveredDataNumbers>();
ArrayList<InfectedDataLines> infectedDataLines = new ArrayList<InfectedDataLines>();

void getData(){
  
  // Get the data for the pie chart.
  Table data = loadTable("infected_percentage.csv", "header");
  for (TableRow row : data.rows()) {
    InfectedDataPercentage c = new InfectedDataPercentage(row.getString("age"), row.getInt("percentage"), getHighlight(row.getString("highlight")));
    infectedDataPercentage.add(c);
  }
  
  // Get the data for the bar chart.
  data = loadTable("infected_numbers.csv", "header");
  for (TableRow row : data.rows()) {
    InfectedDataNumbers c = new InfectedDataNumbers(row.getString("country"), row.getInt("total"), getHighlight(row.getString("highlight")));
    infectedDataNumbers.add(c);
  }
  
  // Get the data for the table chart.
  data = loadTable("recovered_numbers.csv", "header");
  for (TableRow row : data.rows()) {
    RecoveredDataNumbers c = new RecoveredDataNumbers(row.getInt("month"), row.getInt("mexico_total"), row.getInt("eu_total"));
    recoveredDataNumbers.add(c);
  }
  
  // Get the data for the line chart.
  data = loadTable("infected_lines.csv", "header");
  int h = 0;
  for (TableRow row : data.rows()) {
    if(h < data.getColumnCount()){
      InfectedDataLines c = new InfectedDataLines(row.getColumnTitle(h), data.getIntColumn(row.getColumnTitle(h)));
      infectedDataLines.add(c);
      //println(c.country);
      //println(c.infected);
    } 
    h++;
  }
}

void sortData(){
  
  // Use insertion sort descendent for the pie chart.
  InfectedDataPercentage[] infectedDataPercentageArray = infectedDataPercentage.toArray(new InfectedDataPercentage[infectedDataPercentage.size()]);
  int n = infectedDataPercentageArray.length;  
  for (int j = 1; j < n; j++) {  
      InfectedDataPercentage key = infectedDataPercentageArray[j];  
      int i = j;  
      while ( (i > 0) && ( infectedDataPercentageArray [i-1].percentage < key.percentage ) ) {  
          infectedDataPercentageArray [i] = infectedDataPercentageArray [i-1];  
          i--;  
      }  
      infectedDataPercentageArray[i] = key;  
  }
  infectedDataPercentage.clear();
  for(int i = 0; i<infectedDataPercentageArray.length; i++){
    infectedDataPercentage.add(infectedDataPercentageArray[i]);
  } 
  
  // Use insertion sort ascendent for the pie chart.
  InfectedDataNumbers[] infectedDataNumbersArray = infectedDataNumbers.toArray(new InfectedDataNumbers[infectedDataNumbers.size()]);
  n = infectedDataNumbersArray.length;  
  for (int j = 1; j < n; j++) {  
      InfectedDataNumbers key = infectedDataNumbersArray[j];  
      int i = j-1;  
      while ( (i > -1) && ( infectedDataNumbersArray [i].total > key.total ) ) {  
          infectedDataNumbersArray [i+1] = infectedDataNumbersArray [i];  
          i--;  
      }  
      infectedDataNumbersArray[i+1] = key;  
  }
  infectedDataNumbers.clear();
  for(int i = 0; i<infectedDataNumbersArray.length; i++){
    infectedDataNumbers.add(infectedDataNumbersArray[i]);
  }          
}


boolean getHighlight(String sHighlight){
  switch(sHighlight){
    case "YES":
      return true;
    case "NO":
      return false;
  }
  return false;
}


/*
    Pie chart functions.
}*/


void pieChart(float diameter, float x, float y) {
  float lastAngle = 0;
  int i = 0;
  
  fill(0);
  textSize(40);
  text("Infectados (edad)", 60, 60);
  
  for(InfectedDataPercentage c : infectedDataPercentage){
    
    if(c.percentage == 0){
      return;
    }
    
    float mappedPercentage = c.percentage;
    
    mappedPercentage = map(mappedPercentage,0, 100, 0, 360);

    stroke(0);
    
    // Check highlight.
    if(!c.highlight){
      
      fill(145, 205, 246);
    }else{
      fill(52, 88, 164);
    }
    
    // Draw arc.
    arc(x, y, diameter, diameter, lastAngle, lastAngle+radians(mappedPercentage));
    
    // Draw lines.
    line( x, y, x + diameter/2.0 * cos(lastAngle), y + diameter/2.0 * sin(lastAngle) );
    line( x, y, x + diameter/2.0 * cos(lastAngle+radians(mappedPercentage)), y + diameter/2.0 * sin(lastAngle+radians(mappedPercentage)) );
    
    lastAngle += radians(mappedPercentage);
    
    // Draw information.
    rect(380, 120 + (i*40), 15, 15);
    fill(0);
    textSize(15);
    text(c.age + " ( %"+c.percentage+" )", 400, 130 + (i*40));
    
    i++;
  }

}


/*
    Bar chart functions.
*/

void barChart(){

  fill(0);
  textSize(40);
  text("Infectados (país)", 800, 60);
  
  fill(120);
  stroke(220);
  strokeWeight(1);
  textSize(10);
  textAlign(CENTER);
  
  // Print the lines of the background.
  line (850, 100, 850, 400);
  text(0, 850, 430);
  
  float mappedLine = map(50000, 0, 250000, 850, 1300);
  line(mappedLine, 100, mappedLine, 400);
  text(50000, mappedLine, 430);
  
  mappedLine = map(100000, 0, 250000, 850, 1300);
  line(mappedLine, 100, mappedLine, 400);
  text(100000, mappedLine, 430);
  
  mappedLine = map(150000, 0, 250000, 850, 1300);
  line(mappedLine, 100, mappedLine, 400);
  text(150000, mappedLine, 430);
  
  mappedLine = map(200000, 0, 250000, 850, 1300);
  line(mappedLine, 100, mappedLine, 400);
  text(200000, mappedLine, 430);
  
  mappedLine = map(250000, 0, 250000, 850, 1300);
  line(mappedLine, 100, mappedLine, 400);
  text(250000, mappedLine, 430);
  
  int i = 0;
  for(InfectedDataNumbers c : infectedDataNumbers){
    // Get the difference between pixels and the total length.
    float mappedTotal = map(c.total, 0, 250000, 850, 1300);
    mappedTotal = mappedTotal - 850;
    
    float percentage = c.total;
    
    // Check highlight.
    if(!c.highlight){
      
      fill(145, 205, 246);
    }else{
      fill(52, 88, 164);
    }
    
    // Draw the bar.
    stroke(52, 88, 164);
    rect(850, 400-((i+1)*40), mappedTotal, 25);
    
    // Draw the line and the percentage in the x-axis.
    strokeWeight(1);
    stroke(0);
    fill(0);
    textSize(10);
    textAlign(LEFT);
    text((int)percentage, 860+mappedTotal, 415 -((i+1)*40));

    // Draw information in the y-axis.
    fill(0);
    textSize(10);
    textAlign(RIGHT);
    text(c.country, 840, 415 -((i+1)*40));
    
    i++;
  }
}


/*
    Table chart functions.
*/

void tableChart(){

  fill(0);
  textSize(40);
  textAlign(LEFT);
  text("Recuperados (E.U. vs México)", 800, 520);
  
  fill(255, 0, 0);
  stroke(0);
  strokeWeight(1);
  
  // Lines of the y axis.
  textAlign(LEFT);
  fill(0);
  textSize(12);
  
  text("0", 810, 900+5);
  text("100", 810, 850+5);
  text("200", 810, 800+5);
  text("300", 810, 750+5);
  text("400", 810, 700+5);
  text("500", 810, 650+5);
  text("600", 810, 600+5);
  
  stroke(220,220,220);
  line(850, 900, 1300, 900);
  line(850, 850, 1300, 850);
  line(850, 800, 1300, 800);
  line(850, 750, 1300, 750);
  line(850, 700, 1300, 700);
  line(850, 650, 1300, 650);
  line(850, 600, 1300, 600);
  
  
  int i = 1;
  for(RecoveredDataNumbers c : recoveredDataNumbers){
    float mappedEUTotal = map(c.eu_total, 0, 600, 900, 600);
    float mappedMEXTotal = map(c.mexico_total, 0, 600, 900, 600);
    stroke(0);
    
    // Draw the bar.
    fill(145, 205, 246);
    rect(850+(i*50), mappedEUTotal, 20, 900-mappedEUTotal);
    
    fill(152,251,152);
    rect(850+(i*50)+20, mappedMEXTotal, 20, 900-mappedMEXTotal);
    
    fill(0);
    textAlign(CENTER);
    text(c.month, 850+(i*50)+20, 930);
    
    i++;
  }
  
  // Draw information.
  fill(145, 205, 246);
  rect(1020, 940, 15, 15);
  fill(0);
  text("E.U.", 1030, 975);
  
  fill(152,251,152);
  rect(1100, 940, 15, 15);
  fill(0);
  text("MEX.", 1110, 975);
  
}

/*
    Line chart.
*/
void lineChart(){

  fill(0);
  textSize(40);
  textAlign(LEFT);
  text("Infectados (Comparativo)", 50, 520);
  
  fill(255, 0, 0);
  stroke(0);
  strokeWeight(1);
  
  
  // Lines of the y axis.
  textAlign(LEFT);
  fill(0);
  textSize(12);
  
  text("0", 50, 900);
  text("1000", 50, 850+5);
  text("2000", 50, 800+5);
  text("3000", 50, 750+5);
  text("4000", 50, 700+5);
  text("5000", 50, 650+5);
  text("6000", 50, 600+5);
  
  stroke(220,220,220);
  line (100, 900, 550, 900);
  line(100, 850, 550, 850);
  line(100, 800, 550, 800);
  line(100, 750, 550, 750);
  line(100, 700, 550, 700);
  line(100, 650, 550, 650);
  line(100, 600, 550, 600);
  
                 /*  Blue     Grey     Orange   Yellow*/
  color[] colors = {#446fb2, #9e9e9e, #e9842e, #f2c53e};
  int colorIndex = 0;
  int textIndex = 0;
  
  for(InfectedDataLines c : infectedDataLines){
    int[] x = new int[c.infected.length];
    int[] y = new int[c.infected.length];
    
    int rowSpacing = 0;
    for(int j = 0; j < c.infected.length; j++){
      
      float mappedInfected = map(c.infected[j], 0, 6000, 900, 600);

      strokeWeight(3);

      // Add to the points array.
      x[j] = 150+(50*rowSpacing);
      y[j] = (int) mappedInfected;
      
      // Add to the row spacing.
      rowSpacing++;
    }
    
    // Draw the lines!
    stroke(colors[colorIndex]);
    for(int j = 0; j < x.length-1; j++){
      line(x[j], y[j],x[j+1], y[j+1]);
    }
    
    // Draw the label.
    line(600, 700+(colorIndex*30), 630, 700+(colorIndex*30));
    text(c.country, 640, 700+(textIndex*30)+5);
    
    textIndex++;
    colorIndex++;
    rowSpacing = 0;
  }
  
  // Draw x-axis label information.
  textAlign(CENTER);
  int month = 11;
  for(int i = 0; i < 7; i++, month++){
    text(month, 150+(50*i), 930);
  } 
}


/*
    Processing functions.
*/
void setup() {
  size(1400, 1000);
  noStroke();
  noLoop();
  
  // Fetch .csv data.
  getData();
  sortData();

}


void draw() {
  background(255);
  
  pieChart(300, 200, 250);
  barChart();
  tableChart();
  lineChart();
}


/*
    Debugging functions.
*/
void mousePressed(){
  println(mouseX+"_"+mouseY);
}
