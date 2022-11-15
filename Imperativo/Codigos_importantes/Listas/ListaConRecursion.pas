program listaConRecursion;
type
	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;

procedure crearLista (var L, ult: lista);
var
	n: integer;
	nue: lista;
begin
	
	writeln('Ingese un numero: ');
	readln(n);
	while (n <> 0) do begin
		new (nue);
		nue^.dato:= n;
		nue^.sig := NIL;
		if (L <> Nil) then
			ult^.sig := nue
		else
			L := nue;
		ult := nue;
		readln(n);
	end;
end;

procedure ImprimirEnOrden (L: lista);

begin
	if (L <> nil) then begin
		writeln(L^.dato);
		ImprimirEnOrden(L^.sig);
	end;
end;

procedure ImprimirOrdenInverso (L: lista);
begin
	
end;

procedure maximo (L: lista; var max: integer);
begin
	if (L <> nil) then begin
		if (L^.dato > max) then
			max:= L^.dato;
		maximo(L^.sig, max);
	end;
end;

procedure minimo (L: lista; var min: integer);
begin
	if (L <> nil) then begin
		if (L^.dato < min) then
			min:= L^.dato;
		minimo(L^.sig, min);
	end;
end;

var
 L, ult: lista;
 max, min: integer;

begin
	L:= nil;
	ult:= nil;
	max:= -1;
	min:= 9999;
	crearLista(L, ult);
	writeln('Lista en orden: ');
	ImprimirEnOrden(L);
	writeln('Lista en orden inverso: ');
	ImprimirOrdenInverso(L);
	maximo(L, max);
	writeln('El numero maximo es: ', max);
	minimo(L, min);
	writeln('El numero minimo es: ', min);
end.

