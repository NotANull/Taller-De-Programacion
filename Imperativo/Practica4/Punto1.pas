program punto1;

const
	
	dimF = 12;
	
type

	meses = 1..dimF;
	dias = -1..31;
	
	prestamo = record
		isbn: integer;
		numeroSocio: integer;
		dia: dias;
		mes: meses;
		cantDiasPrestamo: integer;
	end;
	
	prestamoLm = record
		isbn: integer;
		numeroSocio: integer;
		dia: dias;
		cantDiasPrestamo: integer;
	end;
	
	lista = ^nodoL;
	nodoL = record
		dato: prestamoLm;
		sig: lista;
	end;
	
	
	
	listaMerge = ^nodoLm;
	nodoLm = record
		dato: prestamoLm;
		sig: listaMerge;
	end;
	
	regMa = record
		isbn: integer;
		totalDiasPrestamo: integer;
	end;
	
	listaMergeAcumulador = ^nodoLma;
	nodoLma = record
		dato: regMa;
		sig: listaMergeAcumulador;
	end;

	arrayMes = array [1..dimF] of lista;






//--------------------MÉTODOS DE PRUEBA--------------------\\
{
procedure imprimirVectorListas(am: arrayMes);
var
	i: integer;
begin
	writeln('----------------------------------------');
	writeln('Se imprime el array de listas');
	writeln();
	for i:= 1 to dimF do begin
		if(am[i] <> nil) then begin
			writeln('**********Se imprime los prestamos del mes ', i, ' **********');
			while(am[i] <> nil) do begin
				writeln('ISBN: ', am[i]^.dato.isbn);
				writeln('Numero de socio: ', am[i]^.dato.numeroSocio);
				writeln('Dia: ', am[i]^.dato.dia);
				writeln('Mes: ', am[i]^.dato.mes);
				writeln('Cantidad de dias prestados: ', am[i]^.dato.cantDiasPrestamo);
				writeln;
				am[i]:= am[i]^.sig;
			end;
		end
		else begin
			writeln('No hubo prestamos el dia ', i);
			writeln();
		end;
	end;
end;
}
//--------------------FIN DE LOS MÉTODOS DE PRUEBA--------------------\\











	
	
//--------------------COMIENZO DE LOS MÉTODOS--------------------\\





//--------------------INCISO A--------------------\\
procedure generarArrayListas(var a: arrayMes);

	procedure inicializarArrayListas(var a: arrayMes);
	var
		i: integer;
	begin
		for i:= 1 to dimF do
			a[i]:= nil;
	end;
	
	procedure leerPrestamo(var p: prestamo);
	begin
		with p do begin
			isbn:= random(12)-1; //Random entre -1 y 10
			writeln('ISBN: ', isbn);
			if(isbn <> -1) then begin
				numeroSocio:= random(101); //Random entre 0 y 100
				writeln('Numero de socio: ', numeroSocio);
				
				dia:= random(31)+1; //Random entre 1 y 31
				writeln('Dia: ', dia);
				
				mes:= random(12)+1; //Random entre 1 y 12
				writeln('Mes: ', mes);
				
				cantDiasPrestamo:= random(99)+1; //Random entre 1 y 99
				writeln('Cantidad de dias prestados: ', cantDiasPrestamo);
				
				writeln();
			end;
		end;
	end;
	
	procedure insertarOrdenado(var L: lista; p: prestamoLm);
	var
		nue: lista;
		act, ant: lista; {punteros auxiliares para recorrido}
	begin
		new (nue);
		nue^.dato := p;
		act := L; {ubico act y ant al inicio de la lista}
		ant := L;
		while( act <> nil)and(p.isbn > act^.dato.isbn)do begin
			ant := act;
			act:= act^.sig;
		end;
		if (act = ant) then {al inicio o lista vacía}
			L:= nue
		else {al medio o al final}
			ant^.sig:= nue;
		nue^.sig:= act;
	end;
	
	procedure crearregistro(p:prestamo;var pc:prestamoLm);
	begin
		pc.isbn:= p.isbn;
		pc.numeroSocio:= p.numeroSocio;
		pc.dia:= p.dia;
		pc.cantDiasPrestamo:= p.cantDiasPrestamo;
	end;

var
	p: prestamo; pc:prestamoLm;
begin
	inicializarArrayListas(a);
	writeln('Se lee la informacion de cada prestamo');
	writeln();
	leerPrestamo(p);
	crearregistro(p, pc);
	while(p.isbn <> -1) do begin
		insertarOrdenado(a[p.mes], pc);
		leerPrestamo(p);
		crearregistro(p, pc);
	end;
	//imprimirVectorListas(a);
end;
//--------------------FIN INCISO A--------------------\\









//--------------------INCISO B--------------------\\
procedure imprimirArrayListas(am: arrayMes);
	
	procedure imprimirArray(am: arrayMes; i: integer);
	
		procedure imprimirLista(l: lista);
		begin
			if(l <> nil) then begin
				writeln('ISBN: ', l^.dato.isbn);
				writeln('Numero de socio: ', l^.dato.numeroSocio);
				writeln;
				imprimirLista(l^.sig);
			end;
		end;
	
	begin
		if(i <= dimF) then begin
			writeln('**********Se imprime los prestamos del mes ', i, ' **********');
			imprimirLista(am[i]);
			imprimirArray(am, (i+1));
		end;
	end;
	
var
	i: integer;
begin
	i:= 1;
	writeln('Se imprime el array de listas');
	writeln();
	imprimirArray(am, i);
end;
//--------------------FIN INCISO B--------------------\\






//--------------------INCISO C--------------------\\
procedure merge(am: arrayMes; var lm: listaMerge);

	procedure buscarMinimo(var am: arrayMes; var pMinimo: prestamoLm);
	
		procedure inicializarPrestamoMinimo(var pMinimo: prestamoLm);
		begin
			with pMinimo do begin
				isbn:= 9999;
				numeroSocio:= -1;
				dia:= -1;
				cantDiasPrestamo:= -1;
			end;
		end;
	
	var
		i, indiceMin: integer;
	begin
		inicializarPrestamoMinimo(pMinimo);
		indiceMin:= -1;
		for i:= 1 to dimF do begin
			if( (am[i] <> nil) and (am[i]^.dato.isbn <= pMinimo.isbn) ) then begin
				pMinimo.isbn:= am[i]^.dato.isbn;
				pMinimo.numeroSocio:= am[i]^.dato.numeroSocio;
				pMinimo.dia:= am[i]^.dato.dia;
				pMinimo.cantDiasPrestamo:= am[i]^.dato.cantDiasPrestamo;
				indiceMin:= i;
			end;
		end;
		if(indiceMin <> -1) then
			am[indiceMin]:= am[indiceMin]^.sig;
	end;
	
	procedure agregarAtras(var l, ult: listaMerge; p: prestamoLm);
	var
		nue: listaMerge;
	begin
		new(nue);
		nue^.dato:= p;
		nue^.sig:= nil;
		if(l = nil) then
			l:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;

var
	pMinimo: prestamoLm;
	ult: listaMerge;
begin
	lm:= nil;
	ult:= nil;
	buscarMinimo(am, pMinimo);
	while(pMinimo.isbn <> 9999) do begin
		agregarAtras(lm, ult, pMinimo);
		buscarMinimo(am, pMinimo);
	end;
end;
//--------------------FIN INCISO C--------------------\\





//--------------------INCISO D--------------------\\
procedure mostrarListaMerge(lm: listaMerge);

	procedure imprimirRecursivo(lm: listaMerge);
	begin
	if(lm <> nil) then begin
		writeln('ISBN: ', lm^.dato.isbn);
		writeln('Cantidad prestado: ',lm^.dato.cantDiasPrestamo);
		writeln('Dia: ', lm^.dato.dia);
		writeln('Cantidad de dias prestados: ',lm^.dato.cantDiasPrestamo);
		writeln();
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
//--------------------FIN INCISO D--------------------\\










//--------------------INCISO E--------------------\\
procedure mergeAcumulador(am: arrayMes; var lma: listaMergeAcumulador);

	procedure buscarMinimo(var a: arrayMes; var pMinimo: prestamo);
	
		procedure inicializarPrestamoMinimo(var p: prestamo);
		begin
			with p do begin
				isbn:= 9999;
				cantDiasPrestamo:= 0;
			end;
		end;
	
	var
		i, indiceMin: integer;
	begin
		inicializarPrestamoMinimo(pMinimo);
		indiceMin:= -1;
		for i:= 1 to dimF do begin
			if( (a[i] <> nil) and (a[i]^.dato.isbn <= pMinimo.isbn) ) then begin
				pMinimo.isbn:= a[i]^.dato.isbn;
				pMinimo.cantDiasPrestamo:= a[i]^.dato.cantDiasPrestamo;
				indiceMin:= i;
			end;
		end;
		if(indiceMin <> -1) then
			a[indiceMin]:= a[indiceMin]^.sig;
	end;
	
	procedure agregarAtras(var l, ult: listaMergeAcumulador; r: regMa);
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
	pMinimo: prestamo;
	regActual: regMa;
	ult: listaMergeAcumulador;
begin
	lma:= nil;
	ult:= nil;
	buscarMinimo(am, pMinimo);
	while(pMinimo.isbn <> 9999) do begin
		regActual.isbn:= pMinimo.isbn;
		regActual.totalDiasPrestamo:= 0;
		while(regActual.isbn = pMinimo.isbn) do begin
			regActual.totalDiasPrestamo:= regActual.totalDiasPrestamo + pMinimo.cantDiasPrestamo;
			buscarMinimo(am, pMinimo);
		end;
		agregarAtras(lma, ult, regActual);
	end;
end;
//--------------------FIN INCISO E--------------------\\











//--------------------INCISO F--------------------\\
procedure mostrarListaMergeAcumulador(lma: listaMergeAcumulador);

	procedure imprimirRecursivo(lma: listaMergeAcumulador);
	begin
	if(lma <> nil) then begin
		writeln('ISBN: ', lma^.dato.isbn);
		writeln('Cantidad prestado: ',lma^.dato.totalDiasPrestamo);
		writeln();
		imprimirRecursivo(lma^.sig);
	end;
	
end;
begin
	if(lma <> nil) then begin
		writeln('Se imprime la lista merge acumulador');
		imprimirRecursivo(lma);
	end
	else
		writeln('La lista esta vacia');
end;
//--------------------FIN INCISO F--------------------\\











//--------------------FIN DE LOS MÉTODOS--------------------\\





var
	am: arrayMes;
	lm: listaMerge;
	lma: listaMergeAcumulador;
begin
	Randomize;
	
	generarArrayListas(am); //Inciso A
	
	writeln('----------------------------------------');
	
	imprimirArrayListas(am); //Inciso B
	
	writeln('----------------------------------------');
	
	merge(am, lm); //Inciso C
	
	writeln('----------------------------------------');
	
	mostrarListaMerge(lm); //Inciso D
	
	writeln('----------------------------------------');
	
	mergeAcumulador(am, lma); //Inciso E
	
	writeln('----------------------------------------');
	
	mostrarListaMergeAcumulador(lma); //Inciso F
end.
