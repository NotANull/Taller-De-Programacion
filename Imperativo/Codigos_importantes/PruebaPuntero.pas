program pruebaPunteros;

type

	registro = record
		numero: integer;
		caracter: String;
	end;
	
	arbol = ^nodoA;
	nodoA = record
		dato: registro;
		hi: arbol;
		hd: arbol;
	end;




procedure randomString(tamanio:integer; var palabra:string);
var  str,Result: String;
begin
	str:='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	Result:='';
	repeat
		Result:=Result+str[Random(Length(str))+1];
	until(Length(Result)=tamanio);
	palabra:=Result;
end;



procedure generarArbol(var a: arbol);

	procedure leerRegistro(var r: registro);
	begin
		with r do begin
			write('Ingrese un numero: ');
			readln(numero);
			if(numero <> 0) then begin
				randomString(1,caracter);
				writeln('caracter: ', caracter);
				//write('Ingrese un caracter: ');
				//eadln(caracter);
				writeln;
			end;
		end;
	end;
	
	procedure crearNodo(var a: arbol; r: registro);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= r;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else if(r.numero < a^.dato.numero) then
			crearNodo(a^.hi, r)
		else
			crearNodo(a^.hd, r);
	end;

var
	r: registro;
begin
	writeln('Se ingresan datos');
	writeln;
	leerRegistro(r);
	while(r.numero <> 0) do begin
		crearNodo(a, r);
		leerRegistro(r);
	end;
end;





procedure imprimirEnOrdenes(a: arbol);

	procedure preOrden(a: arbol);
	begin
		if(a <> nil) then begin
			write(a^.dato.numero, ' - ');
			preOrden(a^.hi);
			preOrden(a^.hd);
		end;
	end;
	
	procedure enOrden(a: arbol);
	begin
		if(a <> nil) then begin
			enOrden(a^.hi);
			write(a^.dato.numero, ' - ');
			enOrden(a^.hd);
		end;
	end;
	
	procedure postOrden(a: arbol);
	begin
		if(a <> nil) then begin
			postOrden(a^.hi);
			postOrden(a^.hd);
			write(a^.dato.numero, ' - ');
		end;
	end;


begin
	writeln('Pre-Orden');
	preOrden(a);
	writeln;
	writeln('En-Orden');
	enOrden(a);
	writeln;
	writeln('Post-Orden');
	postOrden(a);
end;







procedure buscarEnArbol(a: arbol);

	function buscar(a: arbol; nABuscar: integer): arbol;
	begin
		if(a = nil) then
			buscar:= nil
		else if (nABuscar = a^.dato.numero) then
			buscar:= a
		else if(nABuscar < a^.dato.numero) then
			buscar:= buscar(a^.hi, nABuscar)
		else
			buscar:= buscar(a^.hd, nABuscar);
	end;

var
	nABuscar: integer;
	puntero: arbol;
begin
	puntero:= nil;
	if(a <> nil) then begin
		write('Ingrese numero a buscar: ');
		readln(nABuscar);
		//nABuscar:= random(40);
		//writeln('Numero a buscar: ', nABuscar);
		puntero:= buscar(a, nABuscar);
		if(puntero <> nil) then begin
			writeln('El puntero tiene los siguientes datos');
			writeln('Numero: ', puntero^.dato.numero);
			writeln('Caracter: ', puntero^.dato.caracter);
			writeln('========================================');
			if(puntero^.hi <> nil) then begin
				writeln('Hijo izquierdo tiene los siguientes datos');
				writeln('Numero del hijo izquierdo: ', puntero^.hi^.dato.numero);
				writeln('Caracter del hijo izquierdo: ', puntero^.hi^.dato.caracter);
				writeln('========================================');
			end
			else
				writeln('Hijo izquierdo nil');
			if(puntero^.hd <> nil) then begin
				writeln('Hijo derecho tiene los siguientes datos');
				writeln('Numero del hijo derecho: ', puntero^.hd^.dato.numero);
				writeln('Caracter del hijo derecho: ', puntero^.hd^.dato.caracter);
				writeln('========================================');
			end
			else
				writeln('Hijo derecho nil');
		end
		else
			writeln('No se encuentra el numero en el arbol');
	end
	else
		writeln('El arbol esta vacio');
end;





var
	a: arbol;
begin
	Randomize;

	generarArbol(a);
	
	writeln('----------------------------------------');
	
	//imprimirEnOrdenes(a);
	
	buscarEnArbol(a);
end.
