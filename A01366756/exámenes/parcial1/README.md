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

    - El primer reto que se presento fue el calcular de forma automática el tamaño y, por lo tanto, la posición de los puntos de el triángulo dentro del plano. Para esto se usaron los parámetros como la posición del centro del triángulo que se quiere dibujar.
    
    - Una vez obtenida esa información se traslada todo el plano a la posición deseada, porque es más fácil manipular una figura que se encuentra en el centro del plano.
        - Es importante resaltar qu es aquí donde se utilizan las funciones que controlan la rotación y escalamiento de las figuras, para dar la sensación de continuo giro sobre su propio eje y la senzación de zoom.
        - Esta acción se realiza en este lugar para que toda la figura se vea afectada por los cambios que se realicen por el usuario y de igual forma no se piera el efecto de la traslación.

    - Como ya se había mencionado el punto dado sería el centro del triángulo, entonces la coordenada en el eje "y" divida a la mitad representará la altura de nuestro triángulo y utilizando las razones trigonométricas se obtiene la medida (y la posición x y y) de la base de nuestro triángulo para crear un triángulo equilatero.
        - Para almacenar dicha información, se usa una clase y de esta forma manipular con mayor facilidad las coordenadas de los puntos de los triángulos.