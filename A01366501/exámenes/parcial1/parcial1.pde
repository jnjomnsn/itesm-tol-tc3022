// Simple library for orbital camera: PeasyCam (Sketch -> Import Library -> PeasyCam -> Install)
import peasy.*;
// Math library to calculate the number of fractals in each side.
import java.lang.Math;

// Declare the camera.
PeasyCam camera;

// Rotation variables.
float rotationSpeed = 0.02; 

// Color swaping variables.
float colorAngle = 0;
float colorSwapSpeed = 0.015;

// Number of fractals 
float startTime = millis();

// Triangle making variables.
int k = 0;
int maxK = 5;
float initialLeftX = 0, initialLeftY = 300;
float initialRightX = 300, initialRightY = 300;
float initialCenterX = 150, initialCenterY = 0;


void setup() {
  // Set the 3D space.
  size(600, 700, P3D);
  
  // Set the fps to 60.
  frameRate(60);
  
  lights();
  
  // Create the PeasyCam object in the middle of the screen.
  camera = new PeasyCam(this, 300, 300, 0, 500);
}


void draw() {
  // Draw a black backgorund.
  background(0);
  
  // Change the color over time.
  changeColor();
  
  // Change the k value over time.
  changeK();
  
  // Create the pyramid!
  createSierpinski();
  
  // Create the stats on the screen.
  displaySierpinskiInformation();
  
  // Display the instructions.
  displayInstructions();
  
  // Rotate the pyramid if the mouse is not being pressed to allow free movement.
  if (mousePressed == false) {
    camera.rotateY(rotationSpeed);
  }
}


/**
* This function will create the four sides of the pyramid, along with the 
* base given the initial global coordinates. It will also call the recursive 
* function to draw the fractals in 
* each side.
*
* @see createTriangleSide();
**/
void createSierpinski(){
  // Move the triangle to a comfortable position in the screen.
  translate(width/4, 50, 150);
  
  // Draw the base.
  pushMatrix();
    rotateX(radians(90));
    translate(0,-300,-346);
    rect(0, 0, 300, 300);
  popMatrix();
  
  // Draw first, front face.
  pushMatrix();
    rotateX(radians(30));
    translate(0,0,-174);
    createTriangleSide(initialLeftX, initialLeftY, 
                       initialRightX, initialRightY,
                       initialCenterX, initialCenterY, 
                       k, 0); 
  popMatrix();
  
  // Draw second, left face.
  pushMatrix();
    rotateY(radians(90));
    rotateX(radians(-30));
    translate(0,0, 174);
    createTriangleSide(initialLeftX, initialLeftY, 
                       initialRightX, initialRightY,
                       initialCenterX, initialCenterY, 
                       k, 0); 
  popMatrix();
  
  // Draw third, right face.
  pushMatrix();
    translate(300, 0);
    rotateY(radians(90));
    rotateX(radians(30));
    translate(0,0,-174);
    createTriangleSide(initialLeftX, initialLeftY, 
                       initialRightX, initialRightY,
                       initialCenterX, initialCenterY, 
                       k, 0); 
  popMatrix();
  
  // Draw fourth, back face. 
  pushMatrix();
    translate(0, 0, -300);
    rotateX(radians(-30));
    translate(0,0, 174);
    createTriangleSide(initialLeftX, initialLeftY, 
                       initialRightX, initialRightY,
                       initialCenterX, initialCenterY, 
                       k, 0);  
  popMatrix();
}


/**
* This function will create the tirangles calculating the 
* coordinates of each triangle following the shrinking and 
* duplication algorithm (found in https://en.wikipedia.org/wiki/Sierpiński_triangle#Shrinking_and_duplication):
*
* 1. Calculate the new middle, left and right coordinates of 
*    the 3 child triangles using the given values and dividing them by 2.
*
* 2. Repeat step 1 until the child's k value is the same as the given global k.
*
* 3. Once the child's k is the same as the given k, draw a triangle on the child's coordinates.
**/
void createTriangleSide(float lowLeftX, float lowLeftY, float lowRightX, float lowRightY, float topX, float topY, int currentK, int childK) {
  // If the child k has not met the current value of general k...
  if (childK < currentK) {
    // Create the child triangles:
    
    // Middle left tirangle coordinates.
    float middleLeftX = lowLeftX + (topX - lowLeftX) / 2; 
    float middleLeftY = lowLeftY + (topY - lowLeftY) / 2;
    
    // Middle right tirangle coordinates.
    float middleRightX = lowRightX + (topX - lowRightX) / 2; 
    float middleRightY = lowRightY + (topY - lowRightY) / 2;

    // Bottom triangle coordinates.
    float bottomCenterX = lowLeftX + (lowRightX - lowLeftX) / 2;
    float bottomCenterY = lowLeftY;
    
    // Set the new k value for the next iterations of traingles.
    int newChildK = childK + 1;
    
    // Call the three next triangle iterations:
    //Top center.
    createTriangleSide(middleLeftX, middleLeftY,   middleRightX, middleRightY,  topX, topY, currentK, newChildK);
    // Bottom left.
    createTriangleSide(lowLeftX, lowLeftY, bottomCenterX, bottomCenterY, middleLeftX, middleLeftY,  currentK, newChildK);
    // Bottom right.
    createTriangleSide(bottomCenterX, bottomCenterY, lowRightX, lowRightY,   middleRightX, middleRightY, currentK, newChildK);
    
  } else {
    // Draw the triangles of the corresponding child triangle.
    triangle(lowLeftX, lowLeftY, lowRightX, lowRightY, topX, topY);
  }
}


/**
* This function will change the color of the fill between Blue and Violet, 
* using a Sin and lerp function for a smooth and repeatable change between 
* the values.
**/
void changeColor(){
  fill(lerpColor(color(0,191,255), color(138,43,226), (sin(colorAngle += colorSwapSpeed) + 1.0) / 2.0));
}


/**
* This function will change the global k value 
* each second using a counter since the program 
* started.
**/
void changeK(){
  // Get the elapsed time of the program since starting. (It is in milliseconds, so get the seconds dividing it by 1000)
  float timeElapsed = (millis() - startTime) / 1000;
  // If a second has passed...
  if (timeElapsed >= 1.0) {
    // Add a level to the pyramid iterations.
     k++;
     // Check the limit of 5 iterations of k.
     if(k > maxK) {
       k = 0;
     }
     // Reset the timer.
     startTime = millis();
  }
}


/**
* This function will display the information 
* about the current k (level) value and the 
* n (number of triangles per face) value of 
* the pyramid.
**/
void displaySierpinskiInformation(){
  // Stop PeasyCam.
  camera.beginHUD();
  
  // Set the size of the text.
  textSize(32);
  fill(255,165,0);
  // k is the level of the pyramid.
  text("k = " + k, 20, 50,0); 
  // The number of fractals in a side is given by k^(3-1), as the implementation is already assuming k = k-1, only calculate 3^k.
  text("n = " + (int)(Math.pow(3, k)), 20, 90,0); 
  // Calculate the area.
  double a = Math.pow(0.75, k);
  text("A = " + a, 20, 130, 0);
  // Calculate the perimeter.
  double p = 3*(Math.pow(1.5, k));
  text("P = " + p, 20, 170, 0);
  // Resume PeasyCam.
  camera.endHUD();
}


/**
* This function will display the instructions 
* of PeasyCam and the rotation of the pyramid.
**/
void displayInstructions(){
  // Stop PeasyCam.
  camera.beginHUD();
  
  // Set the size of the text.
  textSize(16);
  fill(255,165,0);
  text("Click and drag to move around.", 340, height-70,0); 
  text("Double click to reset movement.", 340, height-50,0);
  text("Use the scroll wheel to zoom.", 340, height-30,0);
  // Resume PeasyCam.
  camera.endHUD();
}
