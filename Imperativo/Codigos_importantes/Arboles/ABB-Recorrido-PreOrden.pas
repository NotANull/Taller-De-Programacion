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
		n:= random(40); //Random entre 0 y 39
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
	//generarRandom(n);
	ingresoYo(n);
	while(n <> 0) do begin
		insertar(a, n);
		//generarRandom(n);
		ingresoYo(n);
	end;
end;

procedure imprimirArbolPreOrden(a: arbol);
begin
	if(a <> nil) then begin
		write(a^.dato, ' - ');
		imprimirArbolPreOrden(a^.hi);
		imprimirArbolPreOrden(a^.hd);
	end;
end;

var
	a: arbol;
begin
	Randomize;
	cargarArbol(a);
	
	writeln();
	
	imprimirArbolPreOrden(a);
end.
