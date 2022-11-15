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
	
	entradaAGuardar = record
		codigoObra: integer;
		asiento: integer;
		monto: real;
	end;
	
	lista = ^nodoL;
	nodoL = record
		dato: entradaAGuardar;
		sig: lista;
	end;
	
	arrayListas = array [rangoDias] of lista;
	
	regMergeAcumulador = record
		codigoObra: integer;
		totalEntradas: integer;
	end;
	
	listaMergeAcumulador = ^nodoLma;
	nodoLma = record
		dato: regMergeAcumulador;
		sig: listaMergeAcumulador;
	end;








//--------------------COMIENZO DE LOS MÉTODOS--------------------\\






//--------------------INCISO A--------------------\\
procedure generarArrayListas(var al: arrayListas);

	procedure inicializarArrayListas(var al: arrayListas);
	var
		i: integer;
	begin
		for i:= 1 to dimF do
			al[i]:= nil;
	end;
	
	procedure leerEntrada(var e: entrada);
	begin
		with e do begin
			codigoObra:= random(21); //Random entre 0 y 20
			writeln('Codigo de obra: ', codigoObra);
			if(codigoObra <> 0) then begin
				dia:= random(7)+1; //Random entre 1 y 7
				writeln('Dia: ', dia);
				asiento:= random(50)+1; //Random entre 1 y 50
				writeln('Numero de asiento: ', asiento);
				monto:= random(901); //Random entre 0 y 900
				writeln('Monto: ', monto:2:2);
				writeln;
			end;
		end;
	end;
	
	procedure AsignarEntradas(e: entrada; var eg: entradaAGuardar);
	begin
		eg.codigoObra:= e.codigoObra;
		eg.asiento:= e.asiento;
		eg.monto:= e.monto;
	end;
	
	procedure insertarOrdenado(var l: lista; eg: entradaAGuardar);
	var
		nue, ant, act: lista;
	begin
		new(nue);
		nue^.dato:= eg;
		ant:= l;
		act:= l;
		while( (act <> nil) and (eg.codigoObra > act^.dato.codigoObra) ) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if(ant = act) then
			l:= nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;
	
	procedure imprimirArrayListas(al: arrayListas);
	var
		i: integer;
	begin
		writeln('----------------------------------------');
		writeln('Se imprime el array de listas');
		writeln();
		for i:= 1 to dimF do begin
			if(al[i] <> nil) then begin
				writeln('**********Se imprime las entradas vendidas del dia ', i, ' **********');
				while(al[i] <> nil) do begin
					writeln('Codigo de obra: ', al[i]^.dato.codigoObra);
					writeln('Asiento: ', al[i]^.dato.asiento);
					writeln('Monto: ', al[i]^.dato.monto:2:2);
					writeln;
					al[i]:= al[i]^.sig;
				end;
			end
			else begin
				writeln('No hubo ventas el dia ', i);
				writeln();
			end;
		end;
	end;

var
	e: entrada;
	eg: entradaAGuardar;
begin
	inicializarArrayListas(al);
	writeln('Se lee la informacion de cada entrada');
	writeln;
	leerEntrada(e);
	AsignarEntradas(e, eg);
	while(e.codigoObra <> 0) do begin
		insertarOrdenado(al[e.dia], eg);
		leerEntrada(e);
		AsignarEntradas(e, eg);
	end;
	imprimirArrayListas(al);
end;
//--------------------FIN INCISO A--------------------\\









//--------------------INCISO B--------------------\\
procedure mergeAcumulador(al: arrayListas; var lma: listaMergeAcumulador);

	procedure buscarMinimo(var al: arrayListas; var eMin: entradaAGuardar);
	var
		i, indice: integer;
	begin
		eMin.codigoObra:= 9999;
		indice:= -1;
		for i:= 1 to dimF do begin
			if( (al[i] <> nil) and (al[i]^.dato.codigoObra <= eMin.codigoObra) ) then begin
				eMin.codigoObra:= al[i]^.dato.codigoObra;
				indice:= i;
			end;
		end;
		if(indice <> -1) then
			al[indice]:= al[indice]^.sig;
	end;
	
	procedure agregarAtras(var l, ult: listaMergeAcumulador; r: regMergeAcumulador);
	var
		nue: listaMergeAcumulador;
	begin
		new(nue);
		nue^.dato:= r;
		nue^.sig:= nil;
		if(l = nil) then
			l:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;

var
	ult: listaMergeAcumulador;
	regActual: regMergeAcumulador;
	eMin: entradaAGuardar;
begin
	lma:= nil;
	ult:= nil;
	buscarMinimo(al, eMin);
	while(eMin.codigoObra <> 9999) do begin
		regActual.codigoObra:= eMin.codigoObra;
		regActual.totalEntradas:= 0;
		while( (eMin.codigoObra <> 9999) and (regActual.codigoObra = eMin.codigoObra) ) do begin
			regActual.totalEntradas:= regActual.totalEntradas + 1;
			buscarMinimo(al, eMin);
		end;
		agregarAtras(lma, ult, regActual);
	end;
end;
//--------------------FIN INCISO B--------------------\\









procedure informarLma(l: listaMergeAcumulador);

	procedure imprimir(l: listaMergeAcumulador);
	begin
		if(l <> nil) then begin
			writeln('Codigo de obra: ', l^.dato.codigoObra);
			writeln('Cantidad de entradas vendidas: ', l^.dato.totalEntradas);
			writeln;
			imprimir(l^.sig);
		end;
	end;

begin
	if(l <> nil) then begin
		writeln('Se imprime la lista merge acumulador');
		writeln;
		imprimir(l);
	end
	else
		writeln('La lista merge acumulador esta vacia');
end;







//--------------------FIN DE LOS MÉTODOS--------------------\\







	
var
	al: arrayListas;
	lma: listaMergeAcumulador;
begin
	Randomize;
	
	generarArrayListas(al); //Inciso A
	
	writeln('----------------------------------------');
	
	mergeAcumulador(al, lma); //Inciso B
	
	writeln('----------------------------------------');
	
	informarLma(lma);
end.
