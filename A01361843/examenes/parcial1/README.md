# 1º Parcial - Pirámide Sierpinski

## Datos
Benjamín Avila Rosas
A01361843


## Resumen
Este programa es mi implementación en Processing de una pirámide de Sierpinski, en mi pirámide cada cara está formada por 4 distintos tamaños de triángulos equilateros con los cuales construyo el patrón de Sierpinski y en la parte inferior cuenta con un cuadrado perfecto como base.

Cada triángulo se construye con un ciclo tipo For que crea 3 puntos en un circulo de radio R, el método recibe el valor de R y en el ciclo se asigna un vértice cada 120º. Al crear cada triángulos se rota según sea necesario. Cada triángulo manda a llamar un método para crear los triángulos de menos tamaño que lo rodearán, de esta forma denomino como triángulo padre a aquel que manda a llamar la creación de los más pequeños (hijos). Los triángulos hijos descubren su posición y tamaño basandose en la posición y radio del padre y así sucesivamente. Solo es necesario asignar tamaño del triángulos a el padre de la pirámide (creado con la función mainTriangle), los hijos de este iran heredando el tamaño siendo este la mitad de su padre directo.
