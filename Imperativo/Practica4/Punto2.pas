program punto2;

const
	
	dimF = 8;
	
type

	rangoGenero = 1..dimF;

	pelicula = record
		codigo: integer;
		codigoGenero: rangoGenero;
		puntajePromedio: integer;
	end;
	
	peliculaAGuardar = record
		codigo: integer;
		puntajePromedio: integer;
	end;
	
	lista = ^nodoL;
	nodoL = record
		dato: peliculaAGuardar;
		sig: lista;
	end;
	
	listaMerge = ^nodoLm;
	nodoLm = record
		dato: peliculaAGuardar;
		sig: listaMerge;
	end;
	
	arrayListas = array [1..dimF] of lista;
	
	





//--------------------MÉTODOS DE PRUEBA--------------------\\
procedure mostrarArregloListas(am: arrayListas);
var
	i: integer;
begin
	writeln('----------------------------------------');
	writeln('Se imprime el array de listas');
	writeln();
	for i:= 1 to dimF do begin
		if(am[i] <> nil) then begin
			writeln('**********Se imprime las peliculas del genero ', i, '**********');
			while(am[i] <> nil) do begin
				writeln('Codigo: ', am[i]^.dato.codigo);
				writeln('Puntaje Promedio: ', am[i]^.dato.puntajePromedio);
				writeln;
				am[i]:= am[i]^.sig;
			end;
		end
		else begin
			writeln('No hubo peliculas de genero ', i);
			writeln();
		end;
	end;
end;






procedure mostrarListaMerge(lm: listaMerge);

	procedure imprimirRecursivo(lm: listaMerge);
	begin
	if(lm <> nil) then begin
		writeln('Codigo: ', lm^.dato.codigo);
		writeln('Puntaje Promedio: ', lm^.dato.puntajePromedio);
		writeln;
		imprimirRecursivo(lm^.sig);
	end;
	
end;
begin
	if(lm <> nil) then begin
		writeln('Se imprime la lista merge');
		imprimirRecursivo(lm);
	end
	else
		writeln('La lista esta vacia');
end;




//--------------------FIN DE LOS MÉTODOS DE PRUEBA--------------------\\







	
	
	
//--------------------COMIENZO DE LOS MÉTODOS--------------------\\





//--------------------Inciso A--------------------\\
procedure generarArregloListas(var al: arrayListas);


	procedure inicializarArrayListas(al: arrayListas);
	var
		i: integer;
	begin
		for i:= 1 to dimF do begin
			al[i]:= nil;
		end;
	end;

	procedure leerPelicula(var p: pelicula);
	begin
		with p do begin
			codigo:= random(12)-1; //Random entre -1 y 10
			writeln('Codigo de pelicula: ', codigo);
			if(codigo <> -1) then begin
				codigoGenero:= random(dimF)+1; //Random entre 1 y 8
				writeln('Codigo de genero: ', codigoGenero);
				puntajePromedio:= random(101); //Random entre 0 y 100
				writeln('PuntajePromedio: ', puntajePromedio);
				writeln;
			end;
		end;
	end;
	
	procedure asignarPeliAGuardar(p: pelicula; var pg:peliculaAGuardar);
	begin
		pg.codigo:= p.codigo;
		pg.puntajePromedio:= p.puntajePromedio;
	end;
	
	procedure insertarOrdenado(var l: lista; pg: peliculaAGuardar);
	var
		nue, ant, act: lista;
	begin
		new(nue);
		nue^.dato:= pg;
		ant:= l;
		act:= l;
		while( (act <> nil) and (pg.codigo > act^.dato.codigo) ) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if(ant = act) then
			l:= nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;

var
	p: pelicula;
	pg: peliculaAGuardar;
begin
	inicializarArrayListas(al);
	writeln('Se lee la informacion de cada pelicula');
	writeln;
	leerPelicula(p);
	asignarPeliAGuardar(p, pg);
	while(p.codigo <> -1) do begin
		insertarOrdenado(al[p.codigoGenero], pg);
		leerPelicula(p);
		asignarPeliAGuardar(p, pg);
	end;
end;
//--------------------Fin Inciso A--------------------\\











//--------------------Inciso B--------------------\\
procedure Merge(al: arrayListas; var lm: listaMerge);

	procedure buscarMinimo(var al: arrayListas; var regMin: peliculaAGuardar);
	
		procedure inicializarRegMin(var regMin: peliculaAGuardar);
		begin
			with regMin do begin
				codigo:= 9999;
				puntajePromedio:= -1;
			end;
		end;
	
	var
		i, indiceMin: integer;
	begin
		inicializarRegMin(regMin);
		indiceMin:= -1;
		for i:= 1 to dimF do begin
			if( (al[i] <> nil) and (al[i]^.dato.codigo <= regMin.codigo) ) then begin
				regMin.codigo:= al[i]^.dato.codigo;
				regMin.puntajePromedio:= al[i]^.dato.puntajePromedio;
				indiceMin:= i;
			end;
		end;
		if(indiceMin <> -1) then
			al[indiceMin]:= al[indiceMin]^.sig;
	end;
	
	procedure agregarAtras(var lm, ult: listaMerge; regMin: peliculaAGuardar);
	var
		nue: listaMerge;
	begin
		new(nue);
		nue^.dato:= regMin;
		nue^.sig:= nil;
		if(lm = nil) then
			lm:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;

var
	regMin: peliculaAGuardar;
	ult: listaMerge;
begin
	lm:= nil;
	ult:= nil;
	buscarMinimo(al, regMin);
	while(regMin.codigo <> 9999) do begin
		agregarAtras(lm, ult, regMin);
		buscarMinimo(al, regMin);
	end;
end;
//--------------------Fin Inciso B--------------------\\







//--------------------FIN DE LOS MÉTODOS--------------------\\
	
	
	
	
	
	
var
	al: arrayListas;
	lm: listaMerge;
begin
	Randomize;
	
	generarArregloListas(al); //Inciso A
	
	writeln('----------------------------------------');
	
	mostrarArregloListas(al);
	
	writeln('----------------------------------------');
	
	Merge(al, lm); //Inciso B

	writeln('----------------------------------------');
	
	mostrarListaMerge(lm);
end.
