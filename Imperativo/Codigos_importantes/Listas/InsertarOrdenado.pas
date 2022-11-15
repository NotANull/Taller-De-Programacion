program listasAgregarAdelante;

type

	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;
	
procedure cargarLista(var l: lista);

	procedure insertarOrdenado(var L:lista; n: integer);
	var
		nue: lista;
		act, ant: lista; {punteros auxiliares para recorrido}
	begin
		new (nue);
		nue^.dato := n;
		act := L; {ubico act y ant al inicio de la lista}
		ant := L;
		while( act <> nil)and(n > act^.dato)do begin
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
	i, n: integer;
begin
	for i:= 1 to 10 do begin
		n:= random(20)+1; //de a 1 a 10
		insertarOrdenado(l, n);
	end;
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
	Randomize;
	l:= nil;
	cargarLista(l);
	imprimirLista(l);
end.
