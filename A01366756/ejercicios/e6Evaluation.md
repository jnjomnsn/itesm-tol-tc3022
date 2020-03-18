# A01366756 - Ejercicio 6: Icosahedron

## **Calificación**: 96

## **Comentarios**:

Tu entrega incluye ambos polígonos, dodecaedro e icosaedro, aunque de manera individual. Sería deseable ver ambos polígonos simultáneamente.

Excelente implementación del dodecaedro. El manejo de texturas, rotación y escala es extraordinario.

Con respecto al icosaedro, hubiera sido bueno definir diferentes colores para cada plano, de tal manera que sean más agradables visualmente.

Tu función para dibujar cada poliédro se basa en dibujar polígonos repetidos. Sin embargo tu código podría optimizarse si, por ejemplo, generas una nueva función que se reciba como parámetros arreglos con las posiciones de los vertices. De esta manera al menos no tendrías que escribir *beginShape* y *endShape* repetidas veces, pues delegas esa funcionalidad a otro método.
