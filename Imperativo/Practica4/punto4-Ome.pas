program punto4;

const

	dimF = 7;

type

	rangoDias = 1..dimF;

	entrada = record
		dia: rangoDias;
		codigoObra: integer;
		asiento: integer;
		monto: real;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: entrada;
		sig: lista;
	end;
	
	arraylistas = array [rangoDias] of lista;
	
	entradaMergeAc = record
		codigoObra: integer;
		cantEntradasVendidas: integer;
	end;
	
	listaMergeAc = ^nodoMergeAc;
	nodoMergeAc = record
		dato: entradaMergeAc;
		sig: listaMergeAc;
	end;
	
	
	

procedure generarArrayListas(var al: arraylistas);

	procedure inicializarArrayListas(var al: arraylistas);
	var
		i: integer;
	begin
		for i:= 1 to dimF do
			al[i]:= nil;
	end;

	procedure leerEntrada(var e: entrada);
	begin
		with e do begin
			codigoObra:= random(16); //Random entre 0 y 15
			writeln('Codigo de obra: ', codigoObra);
			if(codigoObra <> 0) then begin
				dia:= random(7)+1; //Random entre 1 y 7
				writeln('Dia de la obra: ', dia);
				asiento:= random(50)+1; //Random entre 1 y 50
				writeln('Asiento: ', asiento);
				monto:= random(1500)+500; //Random entre 500 y 1500
				writeln('Monto de la entrada: ', monto:2:2);
				writeln
			end
			else
				writeln;
		end;
	end;
	
	procedure insertarOrdenado(var L:lista; n: entrada);
	var
		nue: lista;
		act, ant: lista; {punteros auxiliares para recorrido}
	begin
		new (nue);
		nue^.dato := n;
		act := L; {ubico act y ant al inicio de la lista}
		ant := L;
		while( act <> nil)and(n.codigoObra > act^.dato.codigoObra)do begin
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
begin
	inicializarArrayListas(al);
	writeln('Se lee la informacion de cada entrada');
	writeln;
	leerEntrada(e);
	while(e.codigoObra <> 0) do begin
		insertarOrdenado(al[e.dia], e);
		leerEntrada(e);
	end;
end;





procedure mergeAcumulador(al: arraylistas; var lma: listaMergeAc);

	procedure buscarMinimo(var al: arraylistas; var regMin: entradaMergeAc);
	var
		indice, i: integer;
	begin
		regMin.codigoObra:= 9999;
		indice:= -1;
		for i:= 1 to dimF do begin
			if( (al[i] <> nil) and (al[i]^.dato.codigoObra <= regMin.codigoObra) ) then begin
				regMin.codigoObra:= al[i]^.dato.codigoObra;
				indice:= i;
			end;
		end;
		if(indice <> -1) then
			al[indice]:= al[indice]^.sig;
	end;
	
	procedure agregarAtras(var l, ult: listaMergeAc; dato: entradaMergeAc);
	var
		nue:listaMergeAc;
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
	regMin, regActual: entradaMergeAc;
	ult: listaMergeAc;
begin
	lma:= nil;
	ult:= nil;
	buscarMinimo(al, regMin);
	while(regMin.codigoObra <> 9999) do begin
		regActual.codigoObra:= regMin.codigoObra;
		regActual.cantEntradasVendidas:= 0;
		while( (regMin.codigoObra <> 9999) and (regActual.codigoObra = regMin.codigoObra) ) do begin
			regActual.cantEntradasVendidas:= regActual.cantEntradasVendidas + 1;
			buscarMinimo(al, regMin);
		end;
		agregarAtras(lma, ult, regActual);
	end;
end;


procedure imprimirListaMergeAc(lma: listaMergeAc);

	procedure imprimir(lma: listaMergeAc);
	begin
		if(lma <> nil) then begin
			writeln('Codigo de obra: ', lma^.dato.codigoObra, ' - Cantidad de entradas vendidas: ', lma^.dato.cantEntradasVendidas);
			imprimir(lma^.sig);
		end;
	end;

begin
	if(lma <> nil) then begin
		writeln('Se imprime la lista merge acumulador');
		writeln;
		imprimir(lma);
	end
	else
		writeln('La lista merge acumulador esta vacia');
end;
	
	
var
	al: arraylistas;
	lma: listaMergeAc;
begin
	randomize;
	generarArrayListas(al);
	mergeAcumulador(al, lma);
	imprimirListaMergeAc(lma);
end.
