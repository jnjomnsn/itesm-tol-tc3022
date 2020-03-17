# Exemen parcial 1 triángulo de Sierpinski

El codigo crea cuatro triángulos de Sierpinski que se usan como caras para formar una piramide con base cuadrada.

## Triángulo de Sierpinski

El código cuenta con una función llamada “triangulo”, la cual recibe 4 parámetros. Estos parámetros son las variables x, y, lado y num.
Las variables anteriores pueden ser modificadas dependiendo de lo grande que se requiera el triángulo, o el lugar de inicio del vértice izquierdo del triángulo.
Siendo:

•	“x” y “y” el punto del primer vértice del triángulo.
•	“lado” siendo la medida de cada uno de los lados del triángulo.
•	 “num” el número de niveles del triángulo (con un máximo de 5)

Una vez se manda a llamar a la función “triangulo” se procede a calcular la altura del triángulo y los dos vértices restantes, para lograr un triangulo equilátero.
En esta parte se inicializan las variables:

•	s el cual es el perímetro del triangulo dividido a la mitad
•	area la cual es el área del triangulo
•	h que es la altura del triangulo
•	“x2” y “y2” el vértice de la parte alta del triángulo
•	“x3” y “y3” el vértice inferior derecho del triángulo

A continuación, se divide la variable lado a la mitad para obtener la mitad de los lados del triángulo, (pues es necesario para la formación de los siguientes triángulos) y se da paso a dos condicionales.

1.	Si el número de iteraciones o niveles es 0 se forman los triángulos necesarios haciendo uso del método vertex de processing. Las coordenadas de los vertex se obtienen usando las variables de “x” y “y” previamente mencionadas

2.	Si el numero de niveles o iteraciones es mayor a 0 pero menor a 6 se hace una llamada recursiva a la función triangulo, a la cual se le envían la medida del lado y los niveles restantes, además de las coordenadas de cada vértice en donde se va a dibujar un triángulo nuevo.


## Piramide

En la función draw se llama la función “triangulo” 4 veces, esto con el fin de generar 4 triángulos de Sierpinski.
Cada llamada de la función a excepción de la ultima cuenta con lo siguiente:

•	Un método translate que posicionara el triangulo junto a los otros 3, para simular que tienen un cuadrado como base
•	Un método rotateX que lo que hará será inclinar cada triangulo para que los vértices más altos puedan tocarse
•	Otro método translate que reubicara los triángulos para que estos queden completamente pegados después de la rotación

Para la ultima llamada de la función “triangulo” no se utiliza el primer translate, pues su posición inicial es la que se uso como base para unir los tres triángulos anteriores.
Al inicio se trasladan todos los triángulos a una posición mas centrada en pantalla y se hace uso del método scale que nos permitirá hacer zoom a la pirámide, así como el método rotateY lo que hará que la pirámide este girando en el eje Y.


## Zoom y giro de la Piramide

Para el zoom se hizo uso de la función “mouseWheel” y una variable “e” la cual obtendrá un valor positivo o negativo dependiendo de si la rueda del mouse se mueve hacia adelante o hacia atrás. Se colocaron dos condiciones en las cuales si el numero registrado por “e” era positivo se le aumento 0.02 a la variable escala y si es negativo se le resta, resultando en la modificación de la escala, lo que nos permite hacer el zoom.

Para lograr que la pirámide gire se usó el método rotateY al cual se le dio la variable Angulo, la cual esta conformada por una dirección en este caso igual a 1 y una velocidad, resultando en un giro en el eje Y hacia la izquierda.s
