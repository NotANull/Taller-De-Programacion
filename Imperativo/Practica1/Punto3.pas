{
Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022.

De cada película se conoce:
	* código de película
	* código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror)
	* puntaje promedio otorgado por las críticas

Implementar un programa modularizado que:

a. 	Lea los datos de películas y los almacene por orden de llegada y agrupados
	por código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1. 

b. 	Una vez almacenada la información, genere un vector que guarde, para cada género, el
	código de película con mayor puntaje obtenido entre todas las críticas.

c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría.

d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.
}

program punto3;

const

	dimF = 8;
	
type

	generos = 1..dimF;
	
	pelicula = record
		codigoPeli: integer;
		genero: generos;
		puntaje: integer;
	end;
	
	critica = record
		codigoPeli: integer;
		puntaje: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	
	arrayCriticas = array [generos] of critica;
	
	arrayGeneros = array [generos] of lista;
	
	
//--------------------COMIENZO DE LOS MÉTODOS--------------------\\



procedure inicializarArregloGeneros(var ag: arrayGeneros);
var
	i: integer;
begin
	for i:= 1 to dimF do
		ag[i]:= nil;
end;




procedure inicializarArregloCriticas(var ac: arrayCriticas);
var
	i: integer;
begin
	for i:= 1 to dimF do
		ac[i].codigoPeli:= -1;
		ac[i].puntaje:= -1;
end;




procedure generarArregloListas(var ag: arrayGeneros);

	procedure leerPelicula(var p: pelicula);
	begin
		with p do begin
			codigoPeli:= random(52)-1; //Random entre -1 y 50
			writeln('Codigo de pelicula: ', codigoPeli);
			if(codigoPeli <> -1) then begin
				genero:= random(dimF)+1; //Random entre 1 y 8
				writeln('Codigo de genero: ', genero);
				puntaje:= random(11); //Random entre 0 y 10
				writeln('Puntaje promedio otorgado: ', puntaje);
				writeln();
			end;
			writeln();
		end;
	end;
	
	procedure agregarAtras(var l: lista; p: pelicula);
	var
		nue, act, ant: lista;
	begin
		new(nue);
		nue^.dato := p;
		ant := l;
		act := l;
		while (act <> nil) do begin
			ant := act;
			act := act^.sig;
		end;
		if (ant = act) then
			l := nue
		else
			ant^.sig := nue;
		nue^.sig := act;
	end;

var
	p: pelicula;
begin
	writeln('Se lee la informacion de cada pelicula');
	writeln();
	leerPelicula(p);
	while(p.codigoPeli <> -1) do begin
		agregarAtras(ag[p.genero], p);
		leerPelicula(p);
	end;
end;





procedure generarArregloCriticas(ag: arrayGeneros; var ac: arrayCriticas);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		while(ag[i] <> nil) do begin
			if(ag[i]^.dato.puntaje > ac[i].puntaje) then begin
				ac[i].codigoPeli:= ag[i]^.dato.codigoPeli;
				ac[i].puntaje:= ag[i]^.dato.puntaje;
			end;
			ag[i]:= ag[i]^.sig;
		end;
	end;
end;





procedure ordenarArrayPorInserccion(var v: arrayCriticas);
var
	i, j: integer;
	actual: critica;
begin
	for i:= 2 to dimF do begin
		actual:= v[i]; //Me guardo el elemento en i
		j:= i-1;
		while( (j > 0) and (v[j].codigoPeli > actual.codigoPeli) ) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= actual;
	end;
end;




procedure mostrarMenorMayorPuntaje(ac: arrayCriticas);
begin
	writeln('Codigo de pelicula con menor puntaje: ', ac[1].codigoPeli);
	writeln('Codigo de pelicula con mayor puntaje: ', ac[dimF].codigoPeli);
end;






//--------------------FIN DE LOS MÉTODOS--------------------\\







//--------------------MÉTODOS DE PRUEBA--------------------\\
procedure mostrarArregloListas(ag: arrayGeneros);
var
	i: integer;
begin
	writeln('Se muestran las listas de cada elemento del arreglo');
	for i:= 1 to dimF do begin
		while(ag[i] <> nil) do begin
			writeln('Codigo de genero: ', ag[i]^.dato.genero);
			writeln('Codigo de pelicula: ', ag[i]^.dato.codigoPeli);
			writeln('Puntaje promedio otorgado: ', ag[i]^.dato.puntaje);
			writeln();
			ag[i]:= ag[i]^.sig;
		end;
	end;
end;






procedure mostrarArrayCriticas(ac: arrayCriticas);
var
	i: integer;
begin
	writeln('Mejores puntajes por genero');
	for i:= 1 to dimF do begin
		if(ac[i].codigoPeli <> -1) then
			writeln('Para el genero ', i, ' el mejor puntaje es de ', ac[i].puntaje, ' con codigo de pelicula ', ac[i].codigoPeli)
		else
			writeln('No se ingresaron peliculas del genero ', i);
	end;
end;




procedure mostrarArrayCriticasOrdenado(ac: arrayCriticas);
var
	i: integer;
begin
	writeln();
	writeln('Codigos de peliculas con mayor puntajes ordenados');
	for i:= 1 to dimF do begin
		writeln('Codigo de pelicula: ', ac[i].codigoPeli);
		writeln('Puntaje con mayor promedio otorgado: ', ac[i].puntaje);
		writeln();
	end;
end;



//--------------------FIN DE MÉTODOS DE PRUEBA--------------------\\




	
	
var
	ag: arrayGeneros;
	ac: arrayCriticas;
begin
	Randomize;
	
	inicializarArregloGeneros(ag);
	inicializarArregloCriticas(ac);
	
	generarArregloListas(ag); //Inciso A
	//mostrarArregloListas(ag);
	
	generarArregloCriticas(ag, ac); //Inciso B
	mostrarArrayCriticas(ac);
	
	ordenarArrayPorInserccion(ac); //Inciso C
	mostrarArrayCriticasOrdenado(ac);
	
	mostrarMenorMayorPuntaje(ac);//Inciso D
end.
