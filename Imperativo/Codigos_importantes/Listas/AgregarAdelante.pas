program listasAgregarAdelante;

type

	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;
	
procedure cargarLista(var l: lista);

	procedure agregarAdelante(var l: lista; i: integer);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= i;
		nue^.sig:= l;
		l:= nue;
	end;

var
	i: integer;
begin
	for i:= 1 to 10 do
		agregarAdelante(l, i);
end;

procedure imprimirLista(l: lista);
begin
	while(l <> nil) do begin
		writeln(l^.dato);
		l:= l^.sig;
	end;
end;

var
	l: lista;
begin
	l:= nil;
	cargarLista(l);
	imprimirLista(l);
end.
