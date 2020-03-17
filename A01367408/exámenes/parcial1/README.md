Piramide de Sierpinsky

El objetivo de este proyecto es crear una piramide cuyas caras sean triangulos de Sierpinsky con al menos 5 subniveles.


Solución:

Para la elaboración de esta aplicación se utilizaron los principios de los fráctales, utilizando la recursividad para la creación de los subriangulos que conforman las caras de la piramide, a continuación se exponen los componentes más importantes de la aplicación.

drawTriangle(): esta es la función encargada de dibujar las distintas caras de la piramide, llamando a sus funciones correspondientes.

drawFace(): esta es la función encargada de dubujar la cara de la piramide así como de hacer la rotacion adecuada para que esta concuerde con el resto de la piramide, esta es la función encargada de llamar a la función sierpinskyT() la encargada de dibujar el fractal.

sierpinskyT(): esta función es la encargada de dibujar el fractal del triangulo de Sierpinski, la función recibe cuatro parametros:
  -coordenada a
  -coordenada b
  -coordenada c
  -numero de iteraciones 
En cada una de las iteraciones se calculan nuevas coordenadas que son enviadas a la función nuevamente, estas están definidas por la división de las distancias entre los vertices del triangulo.
Esta función tiene una naturaleza recursiva, en cada una de sus iteraciones la función calcula tres nuevos triangulos a partir de las coordenadas del triangulo "padre" el numero de iteraciones es definido por la variable n que se recibe como parametro.

rotateFigure(): esta es la función que permite a la piramide rotar sobre un eje determinado

mouseWheel(): esta es la función que nos permite hacer zoom a nuestro plano al momento de usar la rueda del ratón.


  
