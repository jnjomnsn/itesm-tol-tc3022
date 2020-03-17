# Examen parcial 1

## ¿Como se implemento?

Primero leí sobre la teoría del triángulo de Sierpinski para darme una idea de cómo podía generar fractales con recursión.

Utilice dos conceptos básicos pero importantes para generar el fractal, el primero fue el punto medio y la altura de un triángulo equilátero.

Utilice 2 funciones para generar el fractal.
- trianguloGrande(): Esta función crea los dos primeros triángulos, uno externo que es el que va a contener todos los triángulos internos y otro interno invertido. Lo hice de esta manera ya que no quería preocuparme por el cambio de dirección del triángulo más adelante.

triangulo(): Con esta función se crea el resto de triángulos internos invertidos posicionándose a la izquierda, derecha y arriba de un triángulo padre, está función recibe el número de niveles de triángulos.

Lo que más me costó trabajo fue el hecho de colocar los fractales de tal forma que se generará una pirámide. Debido a que no tome en cuenta que podía utilizar la matriz de transformación para rotar y trasladar los triángulos a la posición deseada. Una estrategia que pensaba usar era modificar la función triángulo() para que soportará recursión en el eje Z y de esta forma el fractal se fuera ajustando a la dirección pero no pude lograrlo, así que lo deje en 2 dimensiones. 

Para el zoom y ver la pirámide desde distintos ángulos use la clase PesasyCam de la librería peasy.
