program cualquiera;

const

	dimF = 7;
	
type

	entrada = record
		dia: 1..dimF;
		codigoObra: integer;
		asiento: integer;
		monto: real;
	end;
	
	entradaVendida = record
		cantEntradasVendidas: integer;
		codigoObra: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: entrada;
		sig: lista;
	end;
	
	listaNueva = ^nodoLN;
	nodoLN = record
		dato: entradaVendida;
		sig: listaNueva;
	end;
	
	vFunciones = array [1..dimF] of lista;



//--------------------COMIENZO DE MÉTODOS Y FUNCIONES--------------------\\



procedure inicializarVector(var v: vFunciones);
var
	i: integer;
begin
	for i:= 1 to dimF do
		v[i]:= nil;
end;




procedure cargarVectorListas(var v: vFunciones);

	procedure leerEntrada(var e: entrada);
	begin
		with e do begin
			codigoObra:= random(11); //Random entre 0 y 10
			writeln('Codigo de obra: ', codigoObra);
			if(codigoObra <> 0) then begin
				dia:= random(8); //Random entre 0 y 7
				writeln('Dia de la obra: ', dia);
				asiento:= random(120)+1; //Random entre 1 y 120
				writeln('Asiento: ', asiento);
				monto:= random(1500)+500; //Random entre 500 y 1500
				writeln('Monto: ', monto:2:2);
				writeln();
			end;
		end;
	end;
	
	procedure insertarOrdenado(var L:lista; e: entrada);
	var
		nue: lista;
		act, ant: lista; {punteros auxiliares para recorrido}
	begin
		new (nue);
		nue^.dato := e;
		act := L; {ubico act y ant al inicio de la lista}
		ant := L;
		while( ( act <> nil ) and ( act^.dato.codigoObra < e.codigoObra ) ) do begin
			ant := act;
			act:= act^.sig;
		end;
		if (act = ant) then {al inicio o lista vacía}
			L:= nue
		else {al medio o al final}
			ant^.sig:= nue;
		nue^.sig:= act;
	end;

var
	e: entrada;
	i: integer;
begin
	for i:= 1 to dimF do begin
		writeln('Se ingresa la informacion de una entrada');
		leerEntrada(e);
		while(e.codigoObra <> 0) do begin
			insertarOrdenado(v[i], e);
			leerEntrada(e);
		end;
	end;
end;




procedure mergeAcumulador(v: vFunciones; var l: listaNueva);


	procedure determinarMinimo(var v: vFunciones; var evMinimo: entrada);
	var
		i, indice: integer;
	begin
		evMinimo.codigoObra:= 9999;
		indice:= -1;
		for i:= 1 to dimF do begin
			if( (v[i] <> nil) and (v[i]^.dato.codigoObra <= evMinimo.codigoObra) ) then begin
				evMinimo.codigoObra:= v[i]^.dato.codigoObra;
				indice:= i;
			end;
		end;
		if(indice <> -1) then
			v[indice]:= v[indice]^.sig;
	end;
	
	
	
	procedure agregarAtras(var l: listaNueva; var ult: listaNueva; dato: entradaVendida);
	var
		nue:listaNueva;
	begin
		new(nue);
		nue^.dato := dato;
		nue^.sig := nil;
		if (l = nil) then
			l := nue
		else
			ult^.sig := nue;
		ult := nue;	
	end;
	


var
	evMinimo: entrada;
	evActual: entradaVendida;
	ult: listaNueva;
begin
	ult:= nil;
	determinarMinimo(v, evMinimo);
	while(evMinimo.codigoObra <> 9999) do begin
		evActual.codigoObra:= evMinimo.codigoObra;
		evActual.cantEntradasVendidas:= 0;
		while(evActual.codigoObra = evMinimo.codigoObra) do begin
			evActual.cantEntradasVendidas:= evActual.cantEntradasVendidas + 1;
			determinarMinimo(v, evMinimo);
		end;
		agregarAtras(l, ult, evActual);
	end;
end;


procedure imprimirLista(l: listaNueva);
begin
	if(l <> nil) then begin
		writeln('Codigo de obra: ', l^.dato.codigoObra);
		writeln('Cantidad de entradas vendidas: ', l^.dato.cantEntradasVendidas);
		imprimirLista(l^.sig);
	end;
end;


//--------------------FIN DE MÉTODOS Y FUNCIONES--------------------\\


//--------------------PROGRAMA PRINCIPAL--------------------\\
var
	v: vFunciones;
	l: listaNueva;
begin
	Randomize;

	inicializarVector(v);
	l:= nil;
	
	cargarVectorListas(v);
	
	writeln();
	
	mergeAcumulador(v, l);
	
	writeln();
	
	writeln('Se imprime la lista hecha con merge acumulador');
	imprimirLista(l);
end.
