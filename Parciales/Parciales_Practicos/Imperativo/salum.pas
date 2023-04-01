program Salum;

const

	dimF = 15;

type

	cadena30 = String[30];
	rangoEstilo = 1..dimF;

	banda = record
		nombre: cadena30;
		estiloMusical: rangoEstilo;
		cantidadIntegrantes: integer;
	end;
	
	bandaAGuardar = record
		nombre: cadena30;
		cantidadIntegrantes: integer;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: bandaAGuardar;
		sig: lista;
	end;
	
	arrayListas = array [rangoEstilo] of lista;
	
	regMerge = record
		nombre: cadena30;
		cantidadIntegrantes: integer;
	end;
		
	
	listaMerge = ^nodoM;
	nodoM = record
		dato: regMerge;
		sig: listaMerge;
	end;
	
	listaNueva = ^nodoNuevo;
	nodoNuevo = record
		dato: cadena30;
		sig: listaNueva;
	end;
	







procedure nombreRandom(i: integer; var nombre: cadena30);
var
	resultado: String;
begin
	case i of
		1: resultado:= 'Carajo';
		2: resultado:= 'Arde La Sangre';
		3: resultado:= 'Slipknot';
		4: resultado:= 'All That Remains';
		5: resultado:= 'Breaking Benjamin';
		6: resultado:= 'Limp Bizkit';
		7: resultado:= 'Korn';
		8: resultado:= 'Jinjer';
		9: resultado:= 'Killswitch Engage';
		10: resultado:= 'Polaris';
		11: resultado:= 'Spiritbox';
		12: resultado:= 'Trivium';
		13: resultado:= 'Parkway Drive';
		14: resultado:= 'Metallica';
		15: resultado:= 'ACDC';
	end;
	nombre:= resultado;
end;







procedure imprimirArrayList(al: arrayListas);
var
	i: integer;
begin
	writeln('-------------- Se imprime el array list --------------');
	writeln;
	for i:= 1 to dimF do begin
		if(al[i] <> nil) then begin
			writeln('Se imprime la lista en la posicion ', i);
			writeln;
			while(al[i] <> nil) do begin
				writeln('Nombre banda: ', al[i]^.dato.nombre);
				writeln('Cantidad de integrantes: ', al[i]^.dato.cantidadIntegrantes);
				writeln;
				al[i]:= al[i]^.sig;
			end;
		end
		else begin
			writeln('La lista en la posicion ', i, ' esta vacua');
			writeln;
		end;
	end;
end;







procedure imprimirListaMerge(l: listaMerge);

	procedure imprimir(l: listaMerge);
	begin
		if(l <> nil) then begin
			writeln('Nombre: ', l^.dato.nombre, ' - Cantidad de integrantes: ', l^.dato.cantidadIntegrantes);
			imprimir(l^.sig);
		end;
	end;

begin
	writeln;
	if(l <> nil) then begin
		writeln('------------------ Se imprime la lista merge ------------------');
		writeln;
		imprimir(l);
	end
	else
		writeln('La lista merge esta vacia');
end;










procedure imprimirListaNueva(l: listaNueva);

	procedure imprimir(l: listaNueva);
	begin
		if(l <> nil) then begin
			writeln('Nombre de banda solista: ', l^.dato);
			imprimir(l^.sig);
		end;
	end;
	
begin
	writeln;
	if(l <> nil) then begin
		writeln('------------------ Se imprime la lista nueva ------------------');
		writeln;
		imprimir(l);
	end
	else
		writeln('No hubo bandas solistas');
end;














procedure generarArrayListas(var al: arrayListas);

	procedure inicializarArrayListas(var al: arrayListas);
	var
		i: integer;
	begin
		for i:= 1 to dimF do
			al[i]:= nil;
	end;

	procedure leerBanda(var b: banda);
	begin
		with b do begin
			cantidadIntegrantes:= random(16); //Random entre 0 y 15
			writeln('Cantidad de integrantes: ', cantidadIntegrantes);
			if(cantidadIntegrantes <> 0) then begin
				nombreRandom(random(15)+1, nombre);
				writeln('Ingrese nombre de la banda: ', nombre);
				estiloMusical:= random(15)+1;
				writeln('Estilo Musical: ', estiloMusical);
				writeln;
			end
			else
				writeln;
		end;
	end;
	
	procedure formatearBanda(b: banda; var aGuardar: bandaAGuardar);
	begin
		aGuardar.nombre:= b.nombre;
		aGuardar.cantidadIntegrantes:= b.cantidadIntegrantes;
	end;
	
	procedure insertarOrdenado(var l: lista; b: bandaAGuardar);
	var
		nue, ant, act: lista;
	begin
		new(nue);
		nue^.dato:= b;
		ant:= l;
		act:= l;
		while( (act <> nil) and (act^.dato.nombre > b.nombre) ) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if(act = l) then
			l:= nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;

var
	b: banda;
	bAGuardar: bandaAGuardar;
begin
	inicializarArrayListas(al);
	writeln('Se lee la informacion de cada banda');
	writeln;
	leerBanda(b);
	while(b.cantidadIntegrantes <> 0) do begin
		formatearBanda(b, bAGuardar);
		insertarOrdenado(al[b.estiloMusical], bAGuardar);
		leerBanda(b);
	end;
	imprimirArrayList(al); //SÓLO DE PRUEBA, DESCOMENTAR PARA PROBAR
end;







procedure merge(al: arrayListas; var lm: listaMerge);

	procedure buscarMax(var al: arrayListas; var nombreMin: regMerge);
	var
		indice, i: integer;
	begin
		indice:= -1;
		nombreMin.nombre:= 'AAA';
		for i:= 1 to dimF do begin
			if( (al[i] <> nil) and (al[i]^.dato.nombre > nombreMin.nombre) ) then begin
				nombreMin.nombre:= al[i]^.dato.nombre;
				indice:= i;
			end;
		end;
		if(indice <> -1) then begin
			nombreMin.cantidadIntegrantes:= al[indice]^.dato.cantidadIntegrantes;
			al[indice]:= al[indice]^.sig;
		end;
	end;
	
	procedure agregarAtras(var lm: listaMerge; var ult: listaMerge; nombreMin: regMerge);
	var
		nue: listaMerge;
	begin
		new(nue);
		nue^.dato:= nombreMin;
		nue^.sig:= nil;
		if(lm = nil) then
			lm:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;

var
	nombreMin: regMerge;
	ult: listaMerge;
begin
	ult:= nil;
	lm:= nil;
	buscarMax(al, nombreMin);
	while(nombreMin.nombre <> 'AAA') do begin
		agregarAtras(lm, ult, nombreMin);
		buscarMax(al, nombreMin);
	end;
	imprimirListaMerge(lm); //SÓLO DE PRUEBA, DESCOMENTAR PARA PROBAR
end;




procedure agregarSolistas(lm: listaMerge; var ln: listaNueva);

	procedure recorrerListaMerge(lm: listaMerge; var ln: listaNueva);
	
		procedure insertarOrdenado(var l: listaNueva; nombre: cadena30);
		var
			nue, act, ant: listaNueva;
		begin
			new(nue);
			nue^.dato:= nombre;
			act:= l;
			ant:= l;
			while( (act <> nil) and (act^.dato < nombre) ) do begin
				ant:= act;
				act:= act^.sig;
			end;
			if(act = l) then
				l:= nue
			else
				ant^.sig:= nue;
			nue^.sig:= act
		end;
	
	begin
		if(lm <> nil) then begin
			if(lm^.dato.cantidadIntegrantes = 1) then
				insertarOrdenado(ln, lm^.dato.nombre);
			recorrerListaMerge(lm^.sig, ln);
		end;
	end;

begin
	writeln;
	if(lm <> nil) then begin
		ln:= nil;
		recorrerListaMerge(lm, ln);
	end
	else
		writeln('La lista merge esta vacia');
	imprimirListaNueva(ln); //SÓLO DE PRUEBA, DESCOMENTAR PARA PROBAR
end;






var
	al: arrayListas;
	lm: listaMerge;
	ln: listaNueva;
begin
	randomize;
	generarArrayListas(al); //Inciso a
	merge(al, lm); //Inciso b
	agregarSolistas(lm, ln); //Inciso c
end.
