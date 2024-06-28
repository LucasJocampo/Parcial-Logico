%enTaller(Auto, Combustible, Capacidad, Seguridad).
enTaller(mcqueen,9,10,10).
enTaller(delorean,17,20,8).
enTaller(troncomovil ,3,10,6).
enTaller(fitito ,4,18,10).

%Repuesto
%Disponible
%disponible(Repuesto,Fabricante)
disponible(tanquecombustible, acme).
disponible(condensadorflujo, bm).
disponible(cubierta, acme).
disponible(volante, fox).
disponible(bocina, torino).
disponible(bujia, fox).

%Colocacion
%colocacion(Auto,Repuesto,Fecha)
colocacion(mcqueen, tanqueCombustible, fecha(17,05,_)).
colocacion(mcqueen, cubierta, fecha(20,06,2021)).
colocacion(delorean, condensadorFlujo, fecha(_,_,1885)).
colocacion(fitito, volante, fecha(_,_,1887)).
colocacion(fitito, bujia, fecha(20,06,2021)).

%Seguridad Limite
seguridadLimite(10).

%Pais Origen Fabricante
fabricante(acme, rusia).
fabricante(bm, alemania).
fabricante(torino, argentina).
fabricante(fox, belgica).

%Nuestro Pais
nuestroPais(argentina).

%AntesDelSiglo21
antesDelSigloXXI(_,_,2000).

%Punto 1
%Antes del Siglo xxi
conviene(Auto,Repuesto):-
    enTaller(Auto,_,_,_),
    disponible(Repuesto,_),
    colocacion(Auto, Repuesto, fecha(_,_,Anio)),
    antesDelSigloXXI(_,_,Anio2),
    Anio2 > Anio.

%repuesto fabricado por acme
conviene(Auto,Repuesto):-
    enTaller(Auto,_,_,_),
    disponible(Repuesto,acme),
    not(colocacion(Auto,Repuesto,_)).

%repuesto Inseguro o mitad del tanque
conviene(Auto,Repuesto):-
    inseguroOpococombustible(Auto),
    disponible(Repuesto, Fabrica),
    fabricante(Fabrica,PaisOrigen),
    nuestroPais(NuestroPais),
    PaisOrigen \= NuestroPais.
/*
conviene(Auto,Repuesto).
Auto = fitito,
Repuesto = volante ;
Auto = mcqueen,
Repuesto = tanquecombustible ;
Auto = delorean,
Repuesto = tanquecombustible ;
Auto = delorean,
Repuesto = cubierta ;
...
    */

inseguroOpococombustible(Auto):-
    enTaller(Auto,_,_,Seguridad),
    seguridadLimite(Limite),
    Seguridad < Limite.

inseguroOpococombustible(Auto):-
    enTaller(Auto,CombustibleActual,Capacidad,_),
    CombustibleActual < Capacidad / 2.
/*
inseguroOpococombustible(Auto).
Auto = delorean ;
Auto = troncomovil ;
Auto = troncomovil ;
Auto = fitito.

*/
%Punto 2

%A
variosComponentes(Auto):-
    enTaller(Auto,_,_,_),
    colocacion(Auto,Repuesto,_),
    colocacion(Auto,OtroRepuesto,_),
    Repuesto \= OtroRepuesto.

/*
variosComponentes(Auto).
Auto = mcqueen ;
Auto = mcqueen ;
Auto = fitito ;
Auto = fitito ;
false.
*/

%B
unSoloComponente(Auto):-
    enTaller(Auto,_,_,_),
    colocacion(Auto,Repuesto,_),
    forall(colocacion(Auto,OtroRepuesto,_),Repuesto = OtroRepuesto).

/*
unSoloComponente(Auto).
Auto = delorean ;
false.
*/

%C
ningunComponente(Auto):-
	enTaller(Auto, _, _, _),
	not(colocacion(Auto, _, _)).

/*
ningunComponente(Auto).
Auto = troncomovil ;
false.
*/


%Punto 3

repuestoConviene(Fabricante):-
    fabricante(Fabricante, _),
    forall((disponible(Repuesto, Fabricante),fabricante(Fabricante,_)), conviene(_, Repuesto)).
/*
repuestoConviene(Fabricante).
Fabricante = acme ;
Fabricante = bm ;
Fabricante = fox.
*/


%Punto 4
pococombustible(Auto):-
    enTaller(Auto,CombustibleActual,Capacidad,_),
    CombustibleActual < Capacidad / 2.

faltaLlenar(Auto, Falta):-
    pococombustible(Auto),
    enTaller(Auto, CombustibleActual, Capacidad, _),
    Falta is Capacidad - CombustibleActual.   
        
cantidadTotalCombustibleNecesario(Total):-
    findall(Falta, faltaLlenar(_, Falta), TodoLoQueFalta),
    sumlist(TodoLoQueFalta, Total).

/*
cantidadTotalCombustibleNecesario(Total).
Total = 21.
*/    

/*
La inversibilidad se utiliza para hacer consultas existenciales para todos los argumentos.
Lo que signfica que se puede enviar como parametro una incognita
y no algo particularizado
Ej:

En vez de enviar ningunComponente(mcqueen).
y que me returnee true o false

Con la inversibilidad puedo enviar ningunComponente(Auto).
y me va a devolver todos los autos que cumplen con esta funcion.
*/
