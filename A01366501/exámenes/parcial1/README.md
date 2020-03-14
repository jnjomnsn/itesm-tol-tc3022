# Exámen Primer Parcial

Pirámide de Sierpiński en Processing.

![alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Sierpinski_triangle_evolution.svg/1920px-Sierpinski_triangle_evolution.svg.png)

## Resumen

Implementación del triángulo de Sierpiński en 3D con una pirámide de 4 caras utilizando Processing y lenguaje Java.


### Prerrequisitos

El programa utiliza la librería PeasyCam para crear una cámara orbital. 

Pasos para instalar la librería en Processing:

```
Sketch -> Import Library -> Buscar: PeasyCam -> Install
```

![alt text](https://raw.githubusercontent.com/jnjomnsn/itesm-tol-tc3022/A01366501/A01366501/ex%C3%A1menes/parcial1/screenshots/img_3.JPG)

![alt text](https://raw.githubusercontent.com/jnjomnsn/itesm-tol-tc3022/A01366501/A01366501/ex%C3%A1menes/parcial1/screenshots/img_4.JPG)

## Algoritmo de reducción y duplicación

El algoritmo para crear los fractales dentro de cara lado de la pirámide es el de reducción y duplicación, un agoritmo "tail-recursion":

1. Calcule las nuevas coordenadas del medio, izquierda y derecha de los 3 triángulos hijos usando los valores dados y dividiéndolos entre 2.
```
void createTriangleSide(float lowLeftX, float lowLeftY, float lowRightX, float lowRightY, float topX, float topY, int currentK, int childK) {
  ...
  float middleLeftX = lowLeftX + (topX - lowLeftX) / 2; 
  float middleLeftY = lowLeftY + (topY - lowLeftY) / 2;

  // Middle right tirangle coordinates.
  float middleRightX = lowRightX + (topX - lowRightX) / 2; 
  float middleRightY = lowRightY + (topY - lowRightY) / 2;

  // Bottom triangle coordinates.
  float bottomCenterX = lowLeftX + (lowRightX - lowLeftX) / 2;
  float bottomCenterY = lowLeftY;
  ...
}
```

2. Repita el paso 1 hasta que el valor k del niño sea el mismo que el k global dado.
```
void createTriangleSide(float lowLeftX, float lowLeftY, float lowRightX, float lowRightY, float topX, float topY, int currentK, int childK) {
  if (childK < currentK) {
    float middleLeftX = lowLeftX + (topX - lowLeftX) / 2; 
    float middleLeftY = lowLeftY + (topY - lowLeftY) / 2;

    // Middle right tirangle coordinates.
    float middleRightX = lowRightX + (topX - lowRightX) / 2; 
    float middleRightY = lowRightY + (topY - lowRightY) / 2;

    // Bottom triangle coordinates.
    float bottomCenterX = lowLeftX + (lowRightX - lowLeftX) / 2;
    float bottomCenterY = lowLeftY;
  }
  ...
}
```

3. Una vez que la k del niño es la misma que la k dada, dibuja un triángulo en las coordenadas del niño.
```
void createTriangleSide(float lowLeftX, float lowLeftY, float lowRightX, float lowRightY, float topX, float topY, int currentK, int childK) {
  if (childK < currentK) {
  
    // Middle left tirangle coordinates.
    float middleLeftX = lowLeftX + (topX - lowLeftX) / 2; 
    float middleLeftY = lowLeftY + (topY - lowLeftY) / 2;
    
    // Middle right tirangle coordinates.
    float middleRightX = lowRightX + (topX - lowRightX) / 2; 
    float middleRightY = lowRightY + (topY - lowRightY) / 2;

    // Bottom triangle coordinates.
    float bottomCenterX = lowLeftX + (lowRightX - lowLeftX) / 2;
    float bottomCenterY = lowLeftY;

    int newChildK = childK + 1;
    
    createTriangleSide(middleLeftX, middleLeftY,   middleRightX, middleRightY,  topX, topY, currentK, newChildK);
    createTriangleSide(lowLeftX, lowLeftY, bottomCenterX, bottomCenterY, middleLeftX, middleLeftY,  currentK, newChildK);
    createTriangleSide(bottomCenterX, bottomCenterY, lowRightX, lowRightY,   middleRightX, middleRightY, currentK, newChildK);
    
  } else {
    triangle(lowLeftX, lowLeftY, lowRightX, lowRightY, topX, topY);
  }
}
```

### Cambios de color

Para cambiar el color de la pirámide, se uso una función de lerping con una función de sin 
para la transición fluida de colores azul y morado. 

```
fill(lerpColor(color(0,191,255), color(138,43,226), (sin(colorAngle += colorSwapSpeed) + 1.0) / 2.0));
```

## Cambio de nivel de fractales

El cambio de nivel de fractales se hizo con un contador para que cada segundo 
se aumentara el nivel de fractales en la pirámide (el nivel de fractales es dado por 
la variable 'k').

```
float timeElapsed = (millis() - startTime) / 1000;
if (timeElapsed >= 1.0) {
   k++;
   if(k > maxK) {
     k = 0;
   }
   startTime = millis();
}
```

## Cámara Orbital

Se utilizó la librería PeasyCam para crear una cámara orbital que pudiera mover la figura con el mouse.
Uno de los requisitos de la implementación era que la figura rotara constantemente, así que tambipén se usó la 
librería para rotar la figura automáticamente cuando NO se esta controlando manualmente.

```
void setup() {
  ...
  camera = new PeasyCam(this, 300, 300, 0, 500);
  ...
}

...

void draw(){
  ...
  if (mousePressed == false) {
    camera.rotateY(rotationSpeed);
  }
  ...
}
```

## Resultado

Este fue el resultado de la implementación de la pirámide, con instrucciones desplegadas en el canvas.

![alt text](https://raw.githubusercontent.com/jnjomnsn/itesm-tol-tc3022/A01366501/A01366501/ex%C3%A1menes/parcial1/screenshots/img1.JPG)


## Estado del nivel del triángulo y del número de fractales por cara.

Se despliega en la pantalla la variable 'k', que indica el nivel del triángulo de Sierpiński & la variable 'n', que indica 
el número de triángulos en cada cara de la pirámide.

-> La variable n está dada por n = (3^k) − 1

![alt text](https://i.stack.imgur.com/7bx9C.png)


-> Esos valores se despliegan en la esquina superior izquiera y cambian cada segundo.

![alt text](https://raw.githubusercontent.com/jnjomnsn/itesm-tol-tc3022/A01366501/A01366501/ex%C3%A1menes/parcial1/screenshots/img_2.JPG)


## Autores

* **César Iván Pedrero Martínez**


## Referencias

* https://en.wikipedia.org/wiki/Sierpi%C5%84ski_triangle#Shrinking_and_duplication
* http://www.fractal-explorer.com/sierpinskitriangle.html
* https://math.stackexchange.com/questions/1855106/sierpinski-triangle-formula-how-to-take-into-account-for-0th-power

