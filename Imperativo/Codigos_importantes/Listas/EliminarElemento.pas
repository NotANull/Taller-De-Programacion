program listasEliminarElemento;

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


//----------INICIO DEL MÉTODO EN DONDE EL ELEMENTO PUEDE NO EXISTIR EN LA LISTA----------\\
Procedure BorrarElemento (var l: lista; elementoAEliminar: integer; var exito: boolean);
var ant, act: lista;
begin 
	exito := false;
	act := l;
  {Recorro mientras no se termine la lista y no encuentre el elemento}
	while  (act <> NIL)  and (act^.dato <> elementoAEliminar) do begin
		ant := act;
		act := act^.sig
	end;   
	if (act <> NIL) then begin
		exito := true; 
		if (act = l) then  
			l := act^.sig
		else  
			ant^.sig:= act^.sig;
		dispose (act);
	end;
end;
//----------FIN DEL MÉTODO----------\\


//----------INICIO DEL MÉTODO EN DONDE EL ELEMENTO PUEDE LLEGAR A ESTAR EN LA LISTA----------\\
Procedure BorrarElemento2 (var l: lista; elementoAEliminar: integer; var exito: boolean);
var ant, act: lista;
begin 
	exito := false;
	act := l;
	{Recorro mientras no encuentre el elemento}
	while (act^.dato <> elementoAEliminar) do begin   //NO HACE FALTA PREGUNTAR POR NIL 
		ant := act;
		act := act^.sig
	end;   
  
  //SI SALE DEL WHILE ES PORQUE YA LO ENCONTRÓ SEGURO
	exito := true; 
	if (act = l) then  
		l := act^.sig
	else  
		ant^.sig:= act^.sig;
	dispose(act);
end;
//----------FIN DEL MÉTODO----------\\


procedure imprimirLista(l: lista);
begin
	while(l <> nil) do begin
		writeln(l^.dato);
		l:= l^.sig;
	end;
end;

var
	l: lista;
	elementoAEliminar: integer;
	exito: boolean;
begin
	l:= nil;
	cargarLista(l);
	
	write('Ingrese un numero a eliminar de la lista: ');
	readln(elementoAEliminar);
	borrarElemento(l, elementoAEliminar, exito); //EL ELEMENTO PUEDE NO EXISTIR EN LA LISTA
	//borrarElemento2(l, elementoAEliminar, exito); //EL ELEMENTO SEGURO EXISTE EN LA LISTA
	if(exito) then
		writeln('Se encontro el elemento y se elimino de la lista')
	else
		writeln('NO se encontro el elemento en la lista');
	
	imprimirLista(l);
end.
