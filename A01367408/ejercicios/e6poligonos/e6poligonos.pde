void setup() {
    size(500, 500);
    
}

void draw() {
    drawPlanes(200,200,200);
    
}

void drawPlanes(int x, int y, int z){
    pushMatrix();
    translate(x+200, y+200, z+200);
    rect(x, y, 100, 100);
    popMatrix();


}
