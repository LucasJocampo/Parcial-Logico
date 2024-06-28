# Parcial-Logico

# Entrando a Boxes

Contamos con la información de cada auto que hay en el taller: su identificacion, la cantidad de combustible que tiene, la capacidad máxima del tanque y su nivel de seguridad. 
enTaller(Auto, Combustible, Capacidad, Seguridad).

Tenemos información de los repuestos disponibles, de los que conocemos su descripción y su fabricante.
disponible(Repuesto, Fabricante)
 
A su vez, para cada auto se lleva el registro de la fecha en que se le colocó un determinado componente. (las del corriente año se expresan con dia y mes, a las de años anteriores se le agrega el año, y en otras sólo se indica el año)  
colocacion(Auto,Repuesto,Fecha)

Por ejemplo
Al rayo mcQueen se le colocó un tanque de combustible el 17 de mayo y una cubierta el 20 de junio de 2021.
Al delorean se le colocó un condensador de flujo en el año 1885
Al troncomovil no se le colocó ningun repuesto

Complementarimente, se cuenta con información sobre el país de origen de cada fabricante, y cuál es el nivel de seguridad límite para considerar inseguro un auto.

1) Se quiere averiguar cuáles de los repuestos disponibles en el taller, sería conveniente colocarle a alguno de los autos, lo cual depende de las siguientes condiciones.
Si al auto se le coloco un componente con la misma descripción antes del siglo XXI conviene colocarle nuevamente otro, del mismo u otro fabricante. 
A cualquier auto le conviene colocar un repuesto fabricado por "ACME" y que no se le haya colocado anteriormente.
A un auto con el tanque cargado en menos de la mitad de su capacidad máxima o que es inseguro, le conviene un repuesto que sea importado. 

2) Encontrar cada uno de los autos que tengan colocados:
    a) más de un componente.
    b) exactamente un componente.
    c) ningún componente

3) Averiguar cuales son los fabricantes que todos sus repuestos disponibles convendría colocar en alguno de los autos del taller. 

4) Encontrar la cantidad total de combustible necesario para completar todos los tanques de nafta de los autos con el tanque cargado en menos de la mitad de su capacidad máxima.

5) Agregar hechos de ejemplo y mostrar consultas para cada requerimiento

6) Garantizar que los predicados anteriores sean inversibles y justificar dicho concepto.
