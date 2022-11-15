program cualquiera;

const

	dimF = 2;
	
type

	gastoLista = record
		tipoGasto: integer;
		montoGasto: real;
	end;
	
	gastoArbol = record
		tipoGasto: integer;
		montoTotalGasto: real;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: gastoLista;
		sig: lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: gastoArbol;
		hi: arbol;
		hd: arbol;
	end;
	
	vIntegrantes = array [1..dimF] of lista;
	
	

//--------------------COMIENZO DE LOS PROCESOS Y FUNCIONES--------------------\\



procedure inicializarVector(var v: vIntegrantes);
var
	i: integer;
begin
	for i:= 1 to dimF do
		v[i]:= nil;
end;




procedure cargarVectorListas(var v: vIntegrantes);


	procedure leerGasto(var g: gastoLista);
	begin
		with g do begin
			tipoGasto:= random(4); //Numero random entre 0 y 10
			writeln('Tipo de gasto: ', tipoGasto);
			if(tipoGasto <> 0) then begin
				montoGasto:= random(10001); //Numero random entre 0 y 10000
				writeln('Monto del gasto: ', montoGasto:2:2);
				writeln();
			end;
			writeln();
		end;
	end;

	
	
	procedure insertarOrdenado(var L:lista; g: gastoLista);
	var
		nue: lista;
		act, ant: lista; {punteros auxiliares para recorrido}
	begin
		new (nue);
		nue^.dato := g;
		act := L; {ubico act y ant al inicio de la lista}
		ant := L;
		while( ( act <> nil ) and ( act^.dato.tipoGasto < g.tipoGasto ) ) do begin //ordenar de forma ascendente (menor a mayor)  <
			ant := act;																	//Ordenar de forma descendente (mayor a menor) >
			act:= act^.sig;
		end;
		if (act = ant) then {al inicio o lista vacía}
			L:= nue
		else {al medio o al final}
			ant^.sig:= nue;
		nue^.sig:= act;
	end;
	


var
	g: gastoLista;
	i: integer;
begin
	for i:= 1 to dimF do begin
		writeln('integrante ', i, ' de la familia');
		writeln('Se ingresan la informacion de un gasto');
		writeln();
		leerGasto(g);
		while(g.tipoGasto <> 0) do begin
			insertarOrdenado(v[i], g);
			leerGasto(g);
		end;
		writeln();
	end;
end;



procedure imprimirVectorListas(v: vIntegrantes);


	procedure imprimirLista(l: lista);
	begin
		if(l <> nil) then begin
			while(l <> nil) do begin
				writeln('Tipo de gasto: ', l^.dato.tipoGasto);
				writeln('Monto del gasto: ', l^.dato.montoGasto:2:2);
				writeln();
				l:= l^.sig;
			end;
			writeln();
		end
		else begin
			writeln('La lista esta vacia');
			writeln();
		end;
end;


var
	i: integer;
begin
	for i:= 1 to dimF do begin
		writeln('SE IMPRIME LA LISTA DE LA POSICION ' , i, ' DEL VECTOR');
		imprimirLista(v[i]);
	end;
end;




procedure mergeAcumulador(v: vIntegrantes; var a: arbol);



	procedure determinarMinimo(var v: vIntegrantes; var gastoMinimo: gastoLista);
	var
		i, indice: integer;
	begin
		gastoMinimo.tipoGasto:= 9999;
		indice:= -1;
		for i:= 1 to dimF do begin
			if( (v[i] <> nil) and (v[i]^.dato.tipoGasto <= gastoMinimo.tipoGasto) ) then begin
				gastoMinimo.tipoGasto:= v[i]^.dato.tipoGasto;
				indice:= i;
			end;
		end;
		if(indice <> -1) then begin
			gastoMinimo.montoGasto:= v[indice]^.dato.montoGasto;
			v[indice]:= v[indice]^.sig;
		end;
	end;




	procedure crearArbol(var a: arbol; dato: gastoArbol);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= dato;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else
			if(dato.montoTotalGasto < a^.dato.montoTotalGasto) then
				crearArbol(a^.hi, dato)
			else
				crearArbol(a^.hd, dato);
	end;




var
	gastoMinimo: gastoLista;
	gastoActual: gastoArbol;
begin
	determinarMinimo(v, gastoMinimo);
	while(gastoMinimo.tipoGasto <> 9999) do begin
		gastoActual.tipoGasto:= gastoMinimo.tipoGasto;
		gastoActual.montoTotalGasto:= 0;
		while(gastoActual.tipoGasto = gastoMinimo.tipoGasto) do begin
			gastoActual.montoTotalGasto:= gastoActual.montoTotalGasto + gastoMinimo.montoGasto;
			determinarMinimo(v, gastoMinimo);
		end;
		crearArbol(a, gastoActual);
	end;
end;




procedure imprimirGastoTotalMayor(a: arbol);



	function gastoMayor(a: arbol): real;
	begin
		if(a = nil) then
			gastoMayor:= -1
		else
			if(a^.hd <> nil) then
				gastoMayor:= gastoMayor(a^.hd)
			else
				gastoMayor:= a^.dato.montoTotalGasto;
	end;



begin
	if(gastoMayor(a) <> -1) then
		writeln('El gasto mayor es ', gastoMayor(a):2:2)
	else
		writeln(gastoMayor(a));
end;




procedure imprimirArbolEnOrden(a: arbol);
begin
	if(a <> nil) then begin
		writeln('Tipo de gasto: ', a^.dato.tipoGasto);
		writeln('Monto total del gasto: ', a^.dato.montoTotalGasto:2:2);
		imprimirArbolEnOrden(a^.hi);
		imprimirArbolEnOrden(a^.hd);
	end;
end;




//--------------------FIN DE LOS PROCESOS Y FUNCIONES--------------------\\




//--------------------PROGRAMA PRINCIPAL--------------------\\
var
	v: vIntegrantes;
	a: arbol;
begin
	Randomize;

	inicializarVector(v);
	a:= nil;
	
	cargarVectorListas(v);
	
	imprimirVectorListas(v);
	
	mergeAcumulador(v, a);
	
	imprimirArbolEnOrden(a);
	
	writeln();
	
	imprimirGastoTotalMayor(a);
end.
