# Examen Parcial 1

El objetivo de este programa es dibujar una piramide cuadrangular en la que cada cara triangular esté presente el triangulo fractal de Sierpinski.
Para lograr esto, el programa está dividido en dos secciones. Una para la creacion de la piramide y otra para hacer el triangulo de Sierpinski.

# Variables principales
El valor de las siguientes variables son las unicas que pueden ser modificadas para la cunstruccion de la piramide y del triangulo:

* length_arist: En esta variable se define el largo de las aristas de la piramide. Dado que la piramide es cuadrangular equilatera, todos las aristas miden lo mismo. Por esto solo se tienen que definir una vez.
* nivel: Nivel maximo para la construccion del triangulo de Sierpinski.

El valor de las siguientes variables son generadas automaticamente por el programa en base a los valores de las variables anteriores:

* p1_X: Ubicacion del punto inicial uno en X. Su valor es la mitad del valor de length_arist en negativo.
* p1_Y: Ubicacion del punto inicial uno en Y. Su valor es 0.
* p2_X: Ubicacion del punto inicial dos en X. Su valor es la mitad del valor de length_arist.
* p2_Y: Ubicacion del punto inicial dos en Y. Su valor es 0.

# Triangulo de Sierpinski
Para dibujar un triangulo necesitamos recivir dos puntos(p1, p2) para buscar el punto medio entre estos y buscar el tercer punto (p3) en el cual si se unen forma un triangulo equilatero. Para crear el fractal debemos buscar los puntos medios entre cada arista (d1, d2, d3) para formar un total de 4 triangulos. Esto se hace de manera recursiva en los 3 triangulos laterales hasta cumplir los nieveles necesarios (level). Una vez que se llega al ultimo nivel, el triangulo (p1, p2, p3) es pintado de color negro. El primer triangulo es pintado de blanco para que se distingan los triangulos invertidos de cadad nivel.

# Piramide
Para dibujar una piramide primero debemos ubicar el origen ya que apartir de este empezaremos. La logica es dibujar cada cara triangular para formar la piramide.

1. Primero trasladamos el origen la mitad del valor de length_arist en Z negativo.
2. Rotamos el plano en X -PI/4.7 rad el cual dibujara el triangulo ya inclinado. (El valor del angulo NO es exacto, fue encontrado con prueba y error).
3. Dibujamos el triangulo de Sierpinski.
4. Rotamos el plano en X PI/4.7 rad para regresar a su forma original.
5. Trasladamos el origen la mitad del valor de length_arist en Z positivo para volver a su posicion original.
6. Rotamos el plano en Y PI/2 (90°) antes de dibujar el siguiente lado.
7. Repetimos los pasos anteriores hasta dibujar los cuatro triangulos y formamo ya una piramide.