# A01363508 - Ejercicio 6: Icosahedron

## **Calificación**: 90

## **Comentarios**:

Tu entrega incluye ambos polígonos, dodecaedro e icosaedro simultáneamente.

Aunque se incluye la imagen para la textura, y se carga en el código, ésta no se agrega en ningún momento a las caras del dodecaedro como lo pide la especificación.

Aunque la ventana del dibujo se puede maximizar correctamente, los polígonos no se escalan proporcionalmente.

Tu función para dibujar los poliedros se basa en dibujar polígonos repetidos. Sin embargo tu código podría optimizarse si, por ejemplo, generas una nueva función que se llame pentágono, y que reciba como parámetros arreglos con las posiciones de los vertices. De esta manera al menos no tendrías que escribir *beginShape* y *endShape* tantas veces.
