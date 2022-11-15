{
3.- Escribir un programa que:

a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.

b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.

c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.

d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario. 
}

program punto3;

type

	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;





//--------------------COMIENZO DE LOS MÉTODOS--------------------\\






//--------------------INCISO A--------------------\\
procedure generarLista(var l: lista);

	procedure listaRecursiva(var l: lista);
	
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
		n: integer;
	begin
		n:= random(101); //Random entre 0 y 100
		writeln('Se genera el numero: ', n);
		if(n <> 0) then begin
			agregarAdelante(l, n);
			listaRecursiva(l);
		end;
	end;

begin
	l:= nil;
	listaRecursiva(l);
end;
//--------------------FIN INCISO A--------------------\\







//--------------------INCISO B--------------------\\
procedure devolverMinimo(l: lista; var min: integer);

	procedure compararNumeros(l: lista; var min: integer);
	begin
		if(l <> nil) then begin
			if(l^.dato < min) then
				min:= l^.dato;
			compararNumeros(L^.sig, min);
		end;
	end;

begin
	min:= 9999;
	compararNumeros(l, min);
	if(l = nil) then
		writeln('La lista esta vacia')
	else
		writeln('El numero mas chico de la lista es el numero ', min);
end;
//--------------------FIN INCISO B--------------------\\






//--------------------INCISO C--------------------\\
procedure devolverMaximo(l: lista; var max: integer);

	procedure compararNumeros(l: lista; var max: integer);
	begin
		if(l <> nil) then begin
			if(l^.dato > max) then
				max:= l^.dato;
			compararNumeros(L^.sig, max);
		end;
	end;

begin
	max:= -1;
	compararNumeros(l, max);
	if(l = nil) then
		writeln('La lista esta vacia')
	else
		writeln('El numero mas grande de la lista es el numero ', max);
end;
//--------------------FIN INCISO C--------------------\\







//--------------------INCISO D--------------------\\
procedure buscarEnLaLista(l: lista; var encontre: boolean);

	procedure buscar(l: lista; nABuscar: integer; var encontre: boolean);
	begin
		if(l <> nil) then begin
			if(l^.dato = nABuscar) then
				encontre:= true
			else
				buscar(l^.sig, nABuscar, encontre);
		end;
	end;

var
	nABuscar: integer;
begin
	encontre:= false;
	nABuscar:= random(100)+1; //Random entre 1 y 100
	writeln('Se busca el numero ', nABuscar, ' en la lista');
	buscar(l, nABuscar, encontre);
	if(l = nil) then
		writeln('La lista esta vacia')
	else if(encontre) then
		writeln('El numero se encuentra en la lista')
		else
			writeln('No se encuentra el numero que busca en la lista');
end;
//--------------------FIN INCISO D--------------------\\








//--------------------FIN DE LOS MÉTODOS--------------------\\





var
	l: lista;
	minimo, maximo: integer;
	encontre: boolean;
begin
	Randomize;

	generarLista(l); //Inciso A
	
	writeln('----------------------------------------');
	
	devolverMinimo(l, minimo); //Inciso B
	
	writeln('----------------------------------------');
	
	devolverMaximo(l, maximo); //Inciso C
	
	writeln('----------------------------------------');
	
	buscarEnLaLista(l, encontre); //Inciso D
end.
