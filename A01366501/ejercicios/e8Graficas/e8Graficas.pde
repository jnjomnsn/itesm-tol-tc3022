// This class will be used to saveinformation of the products in the .csv .
class Card{
  String name;
  int fps;
  boolean highlight;
  
  // Constructor.
  public Card(String name, int fps, boolean highlight){
    this.name = name;
    this.fps = fps;
    this.highlight = highlight;
  }
  
}

// This list will contain all the graphic cards that are stores in the .csv .
ArrayList<Card> cards = new ArrayList<Card>();


void getData(){
  Table data = loadTable("database.csv", "header");
  
  println(data.getRowCount() + " total rows in table");
  
  for (TableRow row : data.rows()) {
    Card c = new Card(row.getString("name"), row.getInt("fps"), getHighlight(row.getString("highlight")));
    cards.add(c);
  }

}


void setup() {
  size(1500, 500);
  noStroke();
  noLoop();
  
  // Fetch .csv data.
  getData();

}


void draw() {
  background(255);
  
  pieChart(300, 200, 250);
  barChart();
}

/*
    Data fetching functions.
*/


int getMaxFPS(){
  int max = 0;
  
  for(Card card : cards){
    if (card.fps > max){
      max = card.fps;
      
    }
  }
  return max;
}


int getTotalFPS(){
  int sum = 0;
  for(Card card : cards){
    sum += card.fps;
  }
  return sum;
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
  int total_fps = getTotalFPS();
  int i = 0;
  
  fill(0);
  textSize(40);
  text("Pie Chart", 60, 60);
  
  for(Card c : cards){
    
    float mappedFPS = (100.0/total_fps)*c.fps;
    mappedFPS = map(mappedFPS,0, 100, 0, 360);

    float gray = map(i, 0, cards.size(), 0, 255);
    fill(gray);
    
    // Check highlight.
    if(c.highlight){
      strokeWeight(3);
      stroke(0, 255, 0);
    }else{
      strokeWeight(1);
      stroke(0);
    }
    
    arc(x, y, diameter, diameter, lastAngle, lastAngle+radians(mappedFPS));
    
    lastAngle += radians(mappedFPS);
    
    // Draw information.
    rect(380, 120 + (i*40), 15, 15);
    fill(0);
    textSize(15);
    text(c.name + " - "+c.fps+" fps ( %"+(int)mappedFPS+" )", 400, 130 + (i*40));
    
    i++;
  }

}


/*
    Bar chart functions.
}*/

void barChart(){
  
  int maxFPS = getMaxFPS();
  
  fill(0);
  textSize(40);
  text("Bar Chart", 800, 60);
  
  fill(255, 0, 0);
  stroke(0);
  strokeWeight(1);
  line (850, 100, 850, 450);
  line (800, 400, 1300, 400);
  
  int i = 0;
  for(Card c : cards){
    // 400 is the delta of the two distances in X axis, get the width with that.
    float mappedFPS = map(c.fps, 0, maxFPS, 0, 400); 
    
    float gray = map(i, 0, cards.size(), 0, 255);
    fill(gray);
    
    // Check highlight.
    if(c.highlight){
      strokeWeight(3);
      stroke(0, 255, 0);
    }else{
      strokeWeight(1);
      stroke(0);
    }
    
    // Draw the bar.
    rect(850, 400-((i+1)*40), mappedFPS, 25);
    
    // Draw the line and the fps in the x-axis.
    strokeWeight(1);
    stroke(0);
    line(850 + mappedFPS, 395, 850 + mappedFPS, 405);
    fill(0);
    textSize(10);
    text(c.fps+"\nfps", 850 + mappedFPS + 10, 425);
    print(mappedFPS);
    
    // Draw information in the y-axis.
    fill(0);
    textSize(10);
    textAlign(RIGHT);
    text(c.name, 840, 415 -((i+1)*40));
    
    i++;
  }
}


/*
    Debugging functions.

void mousePressed(){
  println(mouseX+"_"+mouseY);
}

*/
