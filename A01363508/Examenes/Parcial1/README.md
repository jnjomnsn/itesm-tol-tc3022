# Parcial 1
## Graficas Computacionales 
Alejandro Vazquez Somoza A0136308

### Implementación 
Primero para implementar los triangulos de Sierpinski intente hacerlo de forma maual creando funciones que recibieran los puntos medios de los triangulos  y estos se dibujaran mediante vertex(asi ya con la piramide hecha podria darle el eje z y sus puntos medios asi evitando rotaciones y sin necesidad de crear mas funciones para acomodar los triangulos principales) pero a medida que aumentaban las iteraciones el hacerlo manual se volvia muy tardado y complicado por lo que investigando encontre que este era un arbol asi que opte por la recursividad simplificando muchismo la creacion de los triangulos lo unico que cambio del codigo anteriror es que en de de crear una funcion para cada iteracion hacinedola recursiva podria hacer el mismo proceso de forma mas simplificada enviando arreglos con los puntos principales y otros arreglos para los nuevos segmentos a crear.

El segundo reto fue insertar los trinagulos en la piramide ya que  me costo un poco por el hecho de que tenia que ser tridimensional pero me limité a crear primero la priamide normal y despues cara por cara dandole las coordenadas de origen de los trinagulos principales para crear los triangulos de Sierpinski.

En la implementación tuve problemas para colorear los triangulos porque si coloreaba el triangulo principal y los de Sierpinski los clores se mezclaban asi que termine dejando el triangulo prncipal vacio y colocando dorados aletorios a los triangulos de Sierpinski y la base de blanco.

Por ultimo solo me quedaba hacer 3 cosas:
1. hacer girar la primade: modficando su rotacion constantemente.
2. Demorar la creacion de los triangulos: Usando una funcion de java llamada thread.sleep
3. Zoom mediante scroll: con la funcion de processing para la rueda del mouse cada vez que se hiciera un scroll se cambia la escala.

