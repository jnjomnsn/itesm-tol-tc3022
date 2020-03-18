# A01366208 - Ejercicio 6: Icosahedron

## **Calificación**: 93

## **Comentarios**:

Tu entrega incluye ambos poliédros, dodecaedro e icosaedro, aunque de manera individual. Sería deseable ver ambos polígonos simultáneamente.

La rotación de los poliédros funciona adecuadamente.

Aunque se incluye la imagen para la textura, y se carga en el código, ésta no se agrega en ningún momento a las caras del dodecaedro como lo pide la especificación. Para lograr este punto, es necesario agregar las coordenadas de la textura en el primer vértice de cada forma (shape).

La ventana del dibujo se puede maximizar correctamente, y los polígonos se escalan proporcionalmente.

Tu función para dibujar cada poliédro se basa en dibujar polígonos repetidos. Sin embargo tu código podría optimizarse si, por ejemplo, generas una nueva función que reciba como parámetros arreglos con las posiciones de los vertices. De esta manera al menos no tendrías que escribir *beginShape* y *endShape* tantas veces.
