program cualquiera;

type

	arbol = ^nodo;
	nodo = record
		dato: integer;
		hi: arbol;
		hd: arbol;
	end;

procedure cargarArbol(var a: arbol);

	procedure generarRandom(var n: integer);
	begin
		n:= random(11); //Random entre 0 y 39
		writeln('Se genera el numero: ', n);
	end;
	
	procedure ingresoYo(var n: integer);
	begin
		write('Ingrese un numero: ');
		readln(n);
	end;

	procedure insertar(var a: arbol; n: integer);

	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= n;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else if(n < a^.dato) then
			insertar(a^.hi, n)
		else
			insertar(a^.hd, n);
	end;

var
	n: integer;
begin
	generarRandom(n);
	//ingresoYo(n);
	while(n <> 0) do begin
		insertar(a, n);
		generarRandom(n);
		//ingresoYo(n);
	end;
end;

function valorMinimoEnArbol(a: arbol): integer;
begin
	if(a = nil) then
		valorMinimoEnArbol:= -1
	else
		if(a^.hi <> nil) then
			valorMinimoEnArbol:= valorMinimoEnArbol(a^.hi)
		else
			valorMinimoEnArbol:= a^.dato;
end;

function valorMaximoEnArbol(a: arbol): integer;
begin
	if(a = nil) then
		valorMaximoEnArbol:= -1
	else
		if(a^.hd <> nil) then
			valorMaximoEnArbol:= valorMaximoEnArbol(a^.hd)
		else
			valorMaximoEnArbol:= a^.dato;
end;

procedure imprimirArbolPreOrden(a: arbol);
begin
	if(a <> nil) then begin
		imprimirArbolPreOrden(a^.hi);
		imprimirArbolPreOrden(a^.hd);
		write(a^.dato, ' - ');
	end;
end;

var
	a: arbol;
begin
	Randomize;
	
	a:= nil;
	
	cargarArbol(a);
	
	writeln();
	
	if(valorMinimoEnArbol(a) <> -1) then
		writeln('El numero mas chico del arbol es el ', valorMinimoEnArbol(a))
	else
		writeln(valorMinimoEnArbol(a));
	
	if(valorMaximoEnArbol(a) <> -1) then
		writeln('El numero mas grande del arbol es el ', valorMaximoEnArbol(a))
	else
		writeln(valorMaximoEnArbol(a));
end.
