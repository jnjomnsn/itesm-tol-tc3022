# A01364089 - Ejercicio 2: Paint

## **Calificación**: 75

## **Comentarios**:

Tu entrega presenta un intento considerable por implementar la especificación. En principio la mayoría las funcionalidades están cubiertas, aunque su comportamiento no es el más adecuado.

Las figuras aparecen siempre en el mismo lugar, no hay manera de personalizar el tamaño o posición de las figuras.

El menú no tiene íconos que representen las figuras.

Ninguna selección dentro del menú presenta alguna indicación visual.

La selección de colores no se aplica adecuadamente, parece que se sobreescribe el color de elementos existentes, o reinserta automaticamente la última figura seleccionada.

Con respecto a tu código, la imlpementación de las funciones draw y menu es demasiado compleja y difícil de entender. Sería muy recomendable que separaras tu código en funciones más pequeñas que se encarguen de una tarea específica. Por ejemplo una función *menuShape* que se encargue de dibujar el menú de las figuras, y otro *shapeSelection* que se encargue de actualizar la selección de la figura; ambas funciones pueden después ser llamadas dentro de *draw*. De esta manera tu código será más legible, fácil de mantener, y de reutilizar.