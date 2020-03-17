Para realizar la implementación fue necesario crear la clase de SierpinskiTriangle,
que contiene los puntos de un tríangulo, un método para dibujarlo y además 6 métodos 
para generar 6 puntos que son necesarios para crear los 3 triángulos que debe contener cada triángulo
al avanzar a una etapa siguiente en el triángulo de Sierpinski, la distribución de estos puntos 
se ilustra en la imágen 'triangulo.jpg', partiendo de esta clase y a partir de un triángulo grande,
de forma recursiva se generan los triángulos nuevos, es decir, en la primera etapa se generan tres triángulos,
uniendo los puntos: a-b-c, b-d-e y c-e-f; en la siguiente, se repite el proceso sobre cada uno de esos tres,
y después sobre todos los resultantes se repite este proceso,
esto se genera de forma relativa a la posición de cada triángulo utilizando los puntos como vectores (PVectors),
para poder realizar el áljebra vectorial y así obtener los puntos más facilmente.

En el programa se guardan todas las etapas por separado con el único fin de poder iterar visualmente sobre las
etapas sin necesidad de repetir los cálculos.

Con todos los valores de cada triángulo por cada etapa guardados, mostrarlo en pantalla es relativamente sencillo:
    1) Primero se trazlada el origen a donde debe quedar el centro de la pirámide -> Translate en el eje X y el eje Z
        a) En este punto se aplica la rotación que se haya calculado hasta ese momento (sobre su propio eje) -> RotateY
        b) También se aplica el factor de escala sobre este punto, es decir que el zoom parte del centro
    2) Una vez ajustado esto se trazlada el origen a un punto de la base de la pirámide,
    el inferior izquierdo de la primer cara a dibujar, aquí comienza un proceso iterativo 
    para cada una de las caras -> Translate en el eje X y el eje Z
        a) Primero se rota respecto a la base para lograr la inclinación de la cara -> RotateX
        b) Una vez ajustado el sistema de cooordenadas se dibuja cada triángulo de la cara (considerando el número de etapa)
        c) Se hace una rotación contraria a la del inciso '2a' para que el sistema de coordenadas quede orientado de forma correcta -> RoatateX
        d) Se gira 90 grados sobre el eje y, para que el sistema de coordenadas tenga como fondo 
        la parte de atrás de la siguiente cara -> RotateY
        e) Se trazlada el sistema de coordenadas sobre el eje z la distancia que mide la base de la pirámide,
         para que quede el la esquina inferior izquierda de la siguiente cara a dibujar -> Translate en el eje Z
        f) Se repiten tres veces (uno por cara) los pasos desde el inciso '2a'

Para el control de la visualización añadí varios controles extras:
    1) Las flechas de arriba y abajo sirven para alternar la visualización de las 5 etapas solicitadas
    2) Las flechas de izquierda y derecha sirven para cambiar la velocidad con la que gira la pirámide
    y poder alternar entre los dos sentidos
    3) La tecla 'r' sirve para regresar el zoom a la posición inicial
    4) El botón izquierdo del mouse sirve para cambiar el color de la pirámide por un color aleatorio
    5) El botón derecho del mouse sirve para alternar el color del fondo entre blanco y negro