# Primer examen parcial
## Pirámide de triángulos de Sierpinski
En este documento se redacta el proceso que lleva a la construcción de la pirámide.

### Resumen
El código está dividido en varios módulos que en su conjunto logran el objetivo del proyecto. Dentro de las funciones importantes se encuentran: la función para inicializar los triángulos, la función para crear las cuatro caras de la pirámide y la función que crea cada fractal de la figura de un triángulo de Sierpinski de forma recursiva.

### Pasos tomados para crear una cara de la Pirámide de triángulos de Sierpinski
1. Tamaño y posicionamiento del primer triangulo.
    - Para este caso se creó la función "trianguloDeSierpinski", que recibe cuatro parámetros. Los primeros tres parámetros representan el centro del tiángulo y el último la rotación que se le dará sobre el eje Y, de tal forma que se pueda reutilizar para cada cara de la figura. 
    `Nota: para no rotar la figura, mandar cualquier valor negativo en el último parámetro.` 

    - El primer reto que se presento fue el calcular de forma automática el tamaño y, por lo tanto, las coordenadas de los puntos de el triángulo dentro del plano. Para esto se usaron los parámetros como la posición del centro del triángulo que se quiere dibujar.
    
    - Una vez obtenida esa información se traslada todo el plano a la posición deseada, porque es más fácil manipular una figura que se encuentra en el centro del plano ya que cualquier transformación tiene menos efectos secundarios.
        - Es importante resaltar que es aquí donde se utilizan las funciones que controlan la rotación y escalamiento de las figuras, para dar la sensación de continuo giro sobre su propio eje y la senzación de zoom.
        - Esta acción se realiza en este lugar para que toda la figura se vea afectada por los cambios que se realicen por el usuario y no se pierda el efecto de la traslación inicial.

    - Como ya se había mencionado el punto dado sería el centro del triángulo, entonces la coordenada en el eje "y" divida a la mitad representará la altura de nuestro triángulo y utilizando las razones trigonométricas se obtiene la medida (y las coordenadas "x" y "y") de la base de nuestro triángulo para crear un triángulo equilatero.
        - Para almacenar dicha información, se usa una clase llamada "Punto" y de esta forma manipular con mayor facilidad las coordenadas de los puntos de los triángulos.
    
    - En caso de que la figura a realizar sea una cara de la pirámide, se hace una rotación en el eje "y" para poner la cara en el lugar necesario, una vez que se encuentre en la posicón correcta, se inclina la figura 35 grados y se traslada en el eje "z" para que adopte la distancia correcta y no cruce las otras caras o se encuentre demasiado separada.
        - La distancia que se traslada la figura en el eje "z" de igual forma se calcula mediante razones trigonométricas para mantener la relación de aspecto aunque se manden diferentes parámetros para el centro del triángulo.
    
    - Por último se crean los objetos con las coordenadas correspondientes a cada vértice del triángulo y se hace la primera llamada a la función recursiva que crea los triángulos.

2. Creación de los triángulos que conforman un triángulo de Sierpisnki
    - El segundo reto fue crear cada triángulo que conforma un triángulo de Sierpinski. Como los fractales son de natrualeza recursiva, entonces se utiliza una función recursiva llamada "triangulo", que en cada iteración calcula los nuevos puntos de los tres triángulos más pequeños que conforman el triángulo que recibe la función, hasta que se requiere imprimirlos.

    - La función recibe 4 parámetros, el primero es el nivel o el número de recursiones que tendrá la función, los otros tres son del tipo "Punto" y contienen las coordenadas del triángulo a dibujar.

    - El caso base para la detención del algoritmo es si es el último nivel de la función, entonces ya se puede imprimir la figura.
        - Aquí también se utiliza la función "fill()" para colorear cada figura con un color aleatorio diferente que se calcula y modifica cada que el usuario da click en la pantalla.

    - Para el resto de los casos, se obtienen las coordenadas de los nuevos puntos calculando el punto medio entre un punto y el siguiente en ambas coordenadas (x y y). Al mismo tiempo se crean objetos que contengan esos datos y puedan ser usados en las siguientes llamadas.

    - En las siguientes tres líneas, se hacen tres llamadas recursivas con las combinaciones correspondientes de los puntos que ahora representan los tres nuevos triángulos (centro, izquierda y derecha) sobre los que se calcularán nuevos puntos hasta alcanzar el caso base y para eso se le resta uno al nivel que se manda.

3. Al finalizar se tendrá un triángulo de Siepinski del nivel que se haya solicitado
    - En este caso se decidió utilizar la función "keyPressed()" para poder cambiar el número de fractales a voluntad mediante las teclas "+" o "-", para que sea más interactivo y entendible el funcionamiento del programa.

### Pasos tomados para crear la Pirámide de triángulos de Sierpinski

4. Por último, para crear la piramide
    - Este fue el paso más sencillo pues todo lo anterior fue pensado para que fuera útil al crear la pirámide, las funciones ya estaban listas para ser llamadas con la información correcta y la pirámide se crearía sin problemas.

    - La función no recibe ningún parámetro y tampoco devuelve nada, su única función es hacer cuatro iteraciones de la función "trianguloDeSierpinski" con el único cambio en el último parámetro para poner las caras en los cuadrantes correspondientes.
        - Cabe destacar que en cada llamada se hace un pushMatrix() y un popMatrix() para que las transformaciones realizadas dentro de una llamada no afecten a las de otra.

### Extras
- Al usuario se le presenta un set de instrucciones para manipular el programa ya funcionando.
    - Este set de isntrucciones puede ocultarse o mostrarse con la tecla 'm' o 'M'.
- La primera caracteristica es la posibilidad de cambiar el número de fractales con las teclas "+" o "-".
- También el programa está diseñado para funcionar con las dimensiones de la pantalla, por lo tanto se puede agrandar la pantalla y la pirámide lo hará con ella.
- El programa también tiene la función de cambiar el color de la figura cuando se de click dentro de la pantalla, como se explicó con anterioridad.
- Se puede escoger la figura que se muestra en pantalla mediante las teclas 'T' o 't' para mostrar el triángulo o 'P' o 'p' para mostrar la pirámide.
- La figura que se muestre en pantalla aparte rotar sobre su mismo eje, se puede rotar a voluntad arrastrando el mouse por la pantalla.
- También, como fue requerido, se puede hacer zoom utilizando la rueda del mouse.