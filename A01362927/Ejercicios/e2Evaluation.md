# A01362927 - Ejercicio 3: Transformaciones

## **Calificación**: 80

## **Comentarios**:

Muy agradable menú, bien espaciado y con elementos bien organizados.

La selección color y de relleno funcionan adecuadamente.

Buen manejo de variables para representar strings, y posiciones.

En tu función *setup* estás asignando valores a los colores cada vez que se inicializa el programa. Buena práctica.

Buena implementación de la función *draw_toolbar* y las subfunciones relacionadas.

El archivo debe llamarse *e2Paint.pde* y no *paint_01.pde*.

Tu menú no indica qué elemento (figura, color o relleno) está seleccionado.

En el caso de las líneas, todas tienen el mismo origen, y no permiten al usuario seleccionar el origen y final de la línea.

En el caso del rectángulo, todos tienen el mismo tamaño, al igual que la línea, el usuario debería poder personalizar el tamaño de los rectángulos.

Por otro lado la elipse no se está dibujando en el panel.

No se implemento la opción de borrar o de seleccionar la figura utilizando la primer letra del nombre de la figura.

La implementación de *mousePressed* podría mejorarse separando la idenrificación de rellenos, formas y colores en diferentes subfunciones, por ejemplo *pick_color* y *pick_shape*.
