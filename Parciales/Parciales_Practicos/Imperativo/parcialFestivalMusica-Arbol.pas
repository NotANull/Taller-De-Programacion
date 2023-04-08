program parcial;

type

	cadena30 = String[30];

	banda = record
		nombre: cadena30;
		estilo: cadena30;
		integrantes: integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: banda;
		hi: arbol;
		hd: arbol;
	end;
	
	regLista = record
		nombre: cadena30;
		estilo: cadena30;
		integrantes: integer;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: regLista;
		sig: lista;
	end;







procedure nombreRandom(i: integer; var nombre: cadena30);
var
	resultado: cadena30;
begin
	case i of
		1: resultado:= 'Carajo';
		2: resultado:= 'Arde La Sangre';
		3: resultado:= 'Slipknot';
		4: resultado:= 'Snoop Dog';
		5: resultado:= 'Breaking Benjamin';
		6: resultado:= 'Limp Bizkit';
		7: resultado:= 'Beethoven';
		8: resultado:= 'Eminem';
		9: resultado:= 'Killswitch Engage';
		10: resultado:= 'Nonpalidece';
		11: resultado:= 'Dr.Dre';
		12: resultado:= 'Bach';
		13: resultado:= 'Parkway Drive';
		14: resultado:= 'Bob Marley';
		15: resultado:= 'Mozart';
	end;
	nombre:= resultado;
end;



procedure estiloRandom(nombre: cadena30; var estilo: cadena30);
var
	resultado: cadena30;
begin
	case nombre of
		'Carajo',
		'Arde La Sangre',
		'Slipknot',
		'Breaking Benjamin',
		'Limp Bizkit',
		'Killswitch Engage',
		'Parkway Drive': resultado:= 'Rock/Metal';
		
		'Snoop Dog',
		'Eminem',
		'Dr.Dre': resultado:= 'Rap';
		
		'Beethoven',
		'Bach',
		'Mozart': resultado:= 'Clasica';
		
		'Nonpalidece',
		'Bob Marley': resultado:= 'Reggae';
	end;
	estilo:= resultado;
end;








procedure mostrarArbol(a: arbol);

	procedure imprimir(a: arbol);
	begin
		if(a <> nil) then begin
			imprimir(a^.hi);
			writeln('Nombre de la banda: ', a^.dato.nombre);
			writeln('Estilo de la banda: ', a^.dato.estilo);
			writeln('Integrantes de la banda: ', a^.dato.integrantes);
			writeln;
			imprimir(a^.hd);
		end;
	end;

begin
	writeln;
	if(a <> nil) then begin
		writeln('---------------- Se imprime el contenido del arbol ----------------');
		writeln;
		imprimir(a);
	end
	else
		writeln('El arbol esta vacio');
end;





procedure mostrarLista(l: lista);

	procedure imprimir(l: lista);
	begin
		if(l <> nil) then begin
			writeln('Estilo de la banda: ', l^.dato.estilo);
			writeln('Nombre de la banda: ', l^.dato.nombre);
			writeln('Integrantes de la banda: ', l^.dato.integrantes);
			writeln;
			imprimir(l^.sig);
		end;
	end;

begin
	writeln;
	if(l <> nil) then begin
		writeln('---------------- Se imprime el contenido de la lista ----------------');
		writeln;
		imprimir(l);
	end
	else
		writeln('No hubo solistas');
end;








procedure generarArbol(var a: arbol);

	procedure leerBanda(var b: banda);
	begin
		with b do begin
			integrantes:= random(6); //Random entre 0 y 6
			writeln('Cantidad de integrantes: ', integrantes);
			if(integrantes <> 0) then begin
				nombreRandom(random(15)+1, nombre);
				writeln('Nombre de la banda: ', nombre);
				estiloRandom(nombre, estilo);
				writeln('Estilo de la banda: ', estilo);
				writeln;
			end
			else
				writeln;
		end;
	end;
	
	procedure generarNodo(var a: arbol; b: banda);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= b;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else if(b.nombre < a^.dato.nombre) then
			generarNodo(a^.hi, b)
		else
			generarNodo(a^.hd, b);
	end;

var
	b: banda;
begin
	a:= nil;
	writeln('Se lee la informacion de cada banda');
	writeln;
	leerBanda(b);
	while(b.integrantes <> 0) do begin
		generarNodo(a, b);
		leerBanda(b);
	end;
	mostrarArbol(a); //Sólo de prueba, descomentar para probar
end;




procedure generarLista(a: arbol; var l: lista);

	procedure insertarOrdenado(var l: lista; b: banda);
	var
		nue, ant, act: lista;
	begin
		new(nue);
		nue^.dato.nombre:= b.nombre;
		nue^.dato.estilo:= b.estilo;
		nue^.dato.integrantes:= b.integrantes;
		ant:= l;
		act:= l;
		while( (act <> nil) and (act^.dato.estilo > b.estilo) ) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if(act = l) then
			l:= nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;

	procedure recorrerArbol(a: arbol; var l: lista);
	begin
		if(a <> nil) then begin
			recorrerArbol(a^.hi, l);
			if(a^.dato.integrantes = 1) then
				insertarOrdenado(l, a^.dato);
			recorrerArbol(a^.hd, l);
		end;
	end;

begin
	writeln;
	if(a <> nil) then begin
		l:= nil;
		recorrerArbol(a, l);
	end
	else
		writeln('El arbol esta vacio');
	mostrarLista(l); //Sólo de prueba, descomentar para probar
end;





procedure buscarBanda(a: arbol);

	procedure recorrerArbol(a: arbol; var bandaMax: cadena30; var integrantes: integer);
	begin
		if(a <> nil) then begin
			recorrerArbol(a^.hi, bandaMax, integrantes);
			if(a^.dato.integrantes > integrantes) then begin
				bandaMax:= a^.dato.nombre;
				integrantes:= a^.dato.integrantes;
			end;
			recorrerArbol(a^.hd, bandaMax, integrantes);
		end;
	end;

var
	bandaMax: cadena30;
	integranteMax: integer;
begin
	if(a <> nil) then begin
		integranteMax:= -1;
		recorrerArbol(a, bandaMax, integranteMax);
		writeln(bandaMax, ' es la banda con mas ingrentes, tiene ', integranteMax); //Sé que no pide que mostremos la banda con mas integrantes pero sólo de prueba
	end
	else
		writeln('El arbol esta vacio');
end;





var
	a: arbol;
	l: lista;
begin
	randomize;
	generarArbol(a); //Inciso a
	generarLista(a, l); //Inciso b
	buscarBanda(a);//Inciso C
end.
