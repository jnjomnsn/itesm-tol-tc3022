# Primer examen parcial
## Graficas computacionales
## Pirámide de triángulos de Sierpinski
En este documento se redacta el proceso que lleva a la construcción de la pirámide

### Resumen
El código está dividido en varios módulos que en su conjunto logran el objetivo del proyecto. Dentro de las funciones importantes se encuentran: la función para inicializar los triángulos, la función para crear las cuatro caras de la pirámide y la función que crea cada fractal de la figura de un triángulo de Sierpinski de forma recursiva.

#### Pasos tomados para crear una cara de la Pirámide de triángulos de Sierpinski
1. Tamaño y posicionamiento del primer triangulo.
    - Para este caso se creó la función "trianguloDeSierpinski", que recibe cuatro parámetros. Los primeros tres parámetros representan el centro del tiángulo y el último la rotación que se le dará sobre el eje Y, de tal forma que se pueda reutilizar para cada cara de la figura. 
    `Nota: para no rotar la figura, cualquier valor negativo en el último parámetro.` 

    - El primer reto que se presento fue el calcular de forma automática el tamaño y, por lo tanto, las coordenadas de los puntos de el triángulo dentro del plano. Para esto se usaron los parámetros como la posición del centro del triángulo que se quiere dibujar.
    
    - Una vez obtenida esa información se traslada todo el plano a la posición deseada, porque es más fácil manipular una figura que se encuentra en el centro del plano.
        - Es importante resaltar que es aquí donde se utilizan las funciones que controlan la rotación y escalamiento de las figuras, para dar la sensación de continuo giro sobre su propio eje y la senzación de zoom.
        - Esta acción se realiza en este lugar para que toda la figura se vea afectada por los cambios que se realicen por el usuario y de igual forma no se pierda el efecto de la traslación.

    - Como ya se había mencionado el punto dado sería el centro del triángulo, entonces la coordenada en el eje "y" divida a la mitad representará la altura de nuestro triángulo y utilizando las razones trigonométricas se obtiene la medida (y las coordenadas x y y) de la base de nuestro triángulo para crear un triángulo equilatero.
        - Para almacenar dicha información, se usa una clase llamada "Punto" y de esta forma manipular con mayor facilidad las coordenadas de los puntos de los triángulos.
    
    - En caso de que la figura a realizar sea una cara de la pirámide, se hace una rotación en el eje "y" para poner la cara en el lugar necesario, una vez que se encuentre en la posicón correcta, se inclina la figura 35 grados y se traslada en el eje "z" para que adopte la distancia correcta y no cruce las otras caras o se encuentre demasiado separada.
        - La distancia que se traslada la figura en el eje "z" de igual forma se calcula mediante razones trigonométricas para mantener la relación de aspecto necesaria aunque se modifique el tamaño de la pantalla.
    
    - Por último se crean los objetos con las coordenadas correspondientes a cada vértice del triángulo y se hace la primera llamada a la función recursiva que crea los triángulos.

2. Creación de los triangulos que conforman un triángulo de Sierpisnki
    - La función recibe 4 parámetros, el primero es el nivel o el número de recursiones que tendrá la función, los otros tres son del tipo "Punto" y contienen las coordenadas del triángulo a dibujar.

    - El caso base para la detención del algoritmo es si es el último nivel de la función, entonces ya se puede imprimir la figura.
        - Aquí también se utiliza la función "fill()" para colorear cada figura con un color aleatorio diferente que se calcula y modifica cada que el usuario da click en la pantalla.

    - Para el resto de los casos, se obtienen las coordenadas de los nuevos puntos calculando el punto medio entre un punto y el siguiente en ambas coordenadas (x y y). Al mismo tiempo se crean objetos que contengan esos datos y puedan ser usados en las siguientes llamadas.

    - En las siguientes tres líneas, se hacen tres llamadas recursivas con las combinaciones correspondientes de los puntos que ahora representan los tres nuevos triángulos sobre los que se calcularán nuevos puntos hasta alcanzar el caso base y para eso se le resta uno al nivel que se manda.

3. Al finalizar se tendrá un triángulo de Siepinski del nivel que se haya solicitado