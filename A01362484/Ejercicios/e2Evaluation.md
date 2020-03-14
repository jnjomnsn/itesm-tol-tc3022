# A01362484 - Ejercicio 2: Paint

## **Calificación**: 80

## **Comentarios**:
Tu entrega cumple con la mayoría de las consideraciones importantes del ejercicio. Algunas de las funcionalidades no se ejecutan de la manera esperada. El código tiene varias áreas de oportunidad, especialmente descomponiendo métodos complejos en métodos más simples.

La selección de las opciones del menú no es completamente funcional, ya que sólo permite seleccionar al hacer click sobre el ícono, pero no el nombre. Tampoco permite seleccionar utilizando la letra inicial de la figura.

El rectángulo y la elipse no deberían ser de tamaño fijo, sino que deberían permitir al usuario escoger estos tamaños utilizando el mouse.

En tu código, todo el menu se dibuja directamente dentro del método *draw*. Es recomendable separar el menu en diferentes métodos para reducir la complejidad del código. Por ejemplo, podrías tener una función que se se encargue de representar solamente las figuras, y otra función que se encargue del menú de los colores, etc.

Interesante manejo de los eventos en *mousePressed*. Sin embargo, al igual que el método *draw*, éste es demasiado complejo. Podrías considerar separar la detección de figuras, de la detección de colores y relleno, etc.

Por otro lado la selección de colores y de relleno funcionan correctamente. Así como la opción de borrar.

Muy interesante ejecución del trazo de línea.
