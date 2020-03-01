void setup() {
    size(800,800,P3D);
}

void draw() {
    //Fondo de color blanco
    background(255);
    //Luz ambiental con color tipo cian
    ambientLight(35,232,208);
    //Dibujar el esqueleto
    skeleton(200,500,-60);
    //Ajustar la perspectiva
    float cameraZ = (height/2.0) / tan((PI/3.0)/2.0);
    perspective(PI/3.0, float(width)/ float(height), cameraZ, cameraZ*2.0);
    //Cambiar posición de la cámara
    camera(mouseX-200, mouseY, (height/2)/tan(PI/6), width/4,height/2,0,0,1,0);
}
void mousePressed(){            //Si se presiona el mouse
    stroke(0,0,255);            //Dibujar las líneas de contorno
}

void mouseReleased() {          //Si se suelta el mouse
    noStroke();                 //Borrar las líneas de contorno
}
void skeleton(int x, int y, int z){
    pushMatrix();
    translate(x, y);
    circle(0,0,10);             //Dibujar un círculo en el origen deseado
    popMatrix();
    pushMatrix();
    translate(x,y-195,z);       //Mover el centro de la cabeza 195 unidades sobre el origen
    sphere(40);                 //Dibujar la cabeza con un tamaño de 40 unidades
    popMatrix();
    pushMatrix();
    translate(x,y-110,z);       //Mover el centro del torso 110 unidades sobre el origen
    box(50, 90, 40);            //Dibujar el cuerpo de 50 unidades de ancho, 90 de alto y 40 de fondo
    popMatrix();
    pushMatrix();
    translate(x-15,y-30,z);     //Mover el centro de la pierna izquierda 15 unidades a la izquierda y 30 hacia arriba
    box(20, 65, 40);            //Dibujar la pierna izquierda de 20 unidades de ancho, 65 de alto y 40 de fondo
    popMatrix();
    pushMatrix();
    translate(x+15,y-30,z);     //Mover el centro de la pierna derecha 15 unidades a la derecha y 30 hacia arriba
    box(20, 65, 40);            //Dibujar la pierna derecha de 20 unidades de ancho, 65 de alto y 40 de fondo
    popMatrix();
    pushMatrix();
    translate(x+35, y-155,z);   //Mover el centro del brazo derecho a la altura de donde debería estar el hombro
    rotateZ(radians(-25));      //Rotar el plano para poder dar inclinación al brazo
    translate(0,(65/2));        //Una vez rotado, recorrer el centro haci abajo sobre el plano actual para obtener el centro del brazo
    box(20, 65, 40);            //Dibujar el brazo derecho de 20 unidades de ancho, 65 de alto (igual que las piernas) y 40 de fondo
    popMatrix();
    pushMatrix();
    translate(x-35, y-155,z);   //Repetir proceso con el brazo izquierdo
    rotateZ(radians(25));
    translate(0,(65/2));
    box(20, 65, 40);
    popMatrix();
}
