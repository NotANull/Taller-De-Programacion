program listasAgregarAdelante;

type

	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;
	
procedure cargarLista(var l, ult: lista);

	//----------COMIENZO MÉTODO AGREGAR ATRÁS----------\\
	procedure agregarAtras(var l:lista; dato: integer);
	var
		nue, act, ant: lista;
	begin
		new(nue);
		nue^.dato := dato;
		ant := l;
		act := l;
		while (act <> nil) do begin
			ant := act;
			act := act^.sig;
		end;
		if (ant = act) then
			l := nue
		else
			ant^.sig := nue;
		nue^.sig := act;
	end;
	//----------FIN MÉTODO AGREGAR ATRÁS----------\\
	
	
	//----------COMIENZO MÉTODO AGREGAR ATRÁS VERSIÓN 2----------\\
	procedure agregarAtrasVersion2(var L: lista; dato: integer);
	var
		aux, act : lista;
	begin
		new(aux);
		aux^.dato := dato;
		aux^.sig := nil;
		if (l <> nil) then begin
			act:=l;
			while (act^.sig <> nil) do
				act:=act^.sig;
			act^.sig:=aux;
		end
		else
			l:=aux;
	end;
	//----------FIN MÉTODO AGREGAR ATRÁS VERSIÓN 2----------\\
	
	
	//----------COMIENZO MÉTODO AGREGAR ATRÁS VERSIÓN 3(CON PUNTERO AL ÚLTIMO)----------\\
	procedure agregarAtrasVersion3(var l: lista; var ult: lista; dato: integer);
	var
		nue:lista;
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
	//----------FIN MÉTODO AGREGAR ATRÁS VERSIÓN 3(CON PUNTERO AL ÚLTIMO)----------\\

var
	i: integer;
begin
	for i:= 1 to 10 do
		//agregarAtras(l, i); //OPCION 1 - recorre la lista para encontrar el ultimo elemento
		//agregarAtrasVersion2(l, i); //OPCION 2 - recorre la lista tambien hasta encontrar el ultimo elemento (no usa variable anterior)
		agregarAtrasVersion3(l, ult, i); // OPCION 3 - con puntero al ultimo elemento
end;

procedure imprimirLista(l: lista);
begin
	while(l <> nil) do begin
		writeln(l^.dato);
		l:= l^.sig;
	end;
end;

var
	l, ult: lista; //Usamos ult en caso de usar método de insertar ordenado al úiltimo elemento
begin
	l:= nil;
	ult:= nil;
	cargarLista(l, ult);
	imprimirLista(l);
end.
