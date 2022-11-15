program AprendiendoMerge;

const

	dimF = 4;
	
type

	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;

	vector = array [1..dimF] of lista;
	
procedure inicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to dimF do
		v[i]:= nil;
end;


procedure insertarOrdenado(var l: lista; n: integer);
var ant, nue, act: lista;
begin
	new(nue);
	nue^.dato := n;
	act := l;
	while (act <> NIL) AND (act^.dato < n) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = l) then
		l := nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;


//----------COMIENZO DEL MÉTODO PARA CARGAR EL VECTOR----------\\
procedure cargarVectorListas(var v: vector);
var
	i, n: integer;
begin
	for i:= 1 to dimF do begin
		writeln('LISA EN LA POSICION ', i, ':');
		n:= random(16); //Número random entre 0 y 15
		writeln('Se ingresa el numero: ', n);
		while(n <> 0) do begin
			insertarOrdenado(v[i], n);
			n:= random(16); //Número random entre 0 y 15
			writeln('Se ingresa el numero: ', n);
		end;
		writeln();
	end;
end;
//----------FIN DEL MÉTODO----------\\
	
	
procedure imprimirLista(l: lista);
begin
	while(l <> nil) do begin
		write(l^.dato, ' - ');
		l:= l^.sig;
	end;
end;
	
	
//----------COMIENZO DEL MÉTODO QUE IMPRIME EL VECTOR DE LISTAS-------\\
procedure imprimirVectorDeListas(v: vector);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		writeln('SE IMPRIME LA LISTA DE LA POSICION ', i, ' DE LA LISTA: ');
		imprimirLista(v[i]);
		writeln();
	end;
end;
//----------FIN DEL MÉTODO----------\\	
	
	
procedure merge(v: vector; var l: lista);

	procedure buscarMinimo(var v: vector; var min: integer);
	var
		indice, i: integer;
	begin
		indice:= -1;
		min:= 9999;
		for i:= 1 to dimF do begin
			if( (v[i] <> nil) and (v[i]^. dato < min) ) then begin
				min:= v[i]^.dato;
				indice:= i;
			end;
		end;
		if(indice <> -1) then
			v[indice]:= v[indice]^.sig;
	end;

var
	min: integer;
begin
	buscarMinimo(v, min);
	while(min <> 9999) do begin
		insertarOrdenado(l, min);
		buscarMinimo(v, min);
	end;
end;
	
	
var
	v: vector;
	l: lista;
begin
	l:= nil;
	Randomize;
	inicializarVector(v);
	cargarVectorListas(v);
	writeln();
	imprimirVectorDeListas(v);
	
	writeln();
	merge(v, l);
	imprimirLista(l);
end.
