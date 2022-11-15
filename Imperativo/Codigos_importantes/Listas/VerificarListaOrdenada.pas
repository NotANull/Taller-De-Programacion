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


//----------INICIO DEL METODO----------\\
//SI QUIERO VERIFICAR QUE LA LISTA ESTÉ ORDENADA DE MENOR A MANOR TENGO QUE:
//CAMBIAR EL NUMERO DE LA VARIABLE INICIALIZADA EN UN NÚMERO MUY CHICO (actual:= -9999).
//EN LA CONDICIÓN DEL IF, TENGO QUE PREGUNTAR SI ANTERIOR ES MAS GRANDE QUE ACTUAL (if(anterior > actual)...)
function EstaOrdenada(l:lista):boolean; //VERIFICA SI LA LISTA ESTA ORDENADA DE MAYOR A MENOR
var
	ordenada: boolean;
	actual,anterior: integer;
begin
	ordenada:=true; //SUPONGO QUE ESTÁ ORDENADA
	actual:=9999; //LO TENGO QUE INICIALIZAR EN UN NUMERO MUY GRANDE ASI AL PRINCIPIO ANTERIOR TOMA UN VALOR
	while (l <> nil) and (ordenada) do begin
		anterior:=actual;
		actual:=l^.dato;
		if(anterior < actual) then //VOY COMPARANDO EL ACTUAL CON EL NUMERO ANTERIOR
			ordenada:=false;
		l:=l^.sig;
	end;
	EstaOrdenada:=ordenada;
end;
//----------INICIO DEL METODO----------\\


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
	
	if(estaOrdenada(l)) then
		writeln('La lista ESTA ordenada')
	else
		writeln('La lista NO ESTA ordenada');
	
	imprimirLista(l);
end.
