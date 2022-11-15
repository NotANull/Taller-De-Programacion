{
1.- Implementar un programa que procese la información de las ventas de productos de un comercio (como máximo 20). 

	De cada venta se conoce:
	* Código del producto (entre 1 y 15)
	* Cantidad vendida (como máximo 99 unidades).
	El ingreso de las ventas finaliza con el código 0 (no se procesa).

a. Almacenar la información de las ventas en un vector. El código debe generarse automáticamente (random) y la cantidad se debe leer. 
b. Mostrar el contenido del vector resultante.
c. Ordenar el vector de ventas por código.
d. Mostrar el contenido del vector resultante.
e. Eliminar del vector ordenado las ventas con código de producto entre dos valores que se ingresan como parámetros. 
f. Mostrar el contenido del vector resultante.
g. Generar una lista ordenada por código de producto de menor a mayor a partir del vector resultante del inciso e., sólo para los códigos pares.
h. Mostrar la lista resultante.
}
program punto1;

const
	
	dimF = 20;
	maxVentas = 99;
	
type

	producto = 0..15;
	vendido = 1..maxVentas;
	
	ventas = record
		codigoProducto: producto;
		cantVentas: vendido;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: ventas;
		sig: lista;
	end;
	
	arrayVentas = array [1..dimF] of ventas;
	
	
//--------------------COMIENZO DE LOS MÉTODOS--------------------\\





//....................COMIENZO DEL INCISO A....................\\
procedure cargarArrayVentas(var av: arrayVentas; var dimL: integer);

	
	procedure leerVenta(var v: ventas);
	begin
		with v do begin
			codigoProducto:= random(16); //Random entre 0 y 15
			writeln('Codigo de producto ingresado: ', codigoProducto);
			if(codigoProducto <> 0) then begin
				cantVentas:= random(100); //Random entre 0 y 99
				writeln('Cantidad de ventas realizadas: ', cantVentas);
			end;
			writeln();
		end;
	end;
	

var
	v: ventas;
begin
	dimL:= 0;
	writeln('Se carga la informacion de cada venta');
	leerVenta(v);
	while( (dimL < dimF) and (v.codigoProducto <> 0) ) do begin
		dimL:= dimL + 1;
		av[dimL]:= v;
		leerVenta(v);
	end;
end;
//....................FIN DEl INCISO A....................\\






//....................COMIENZO DEL INCISO B....................\\
procedure mostrarArrayVentas(av: arrayVentas; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		writeln('Posicion ', i, ' del array');
		writeln('Codigo de producto: ', av[i].codigoProducto);
		writeln('Cantidad de productos vendidos: ', av[i].cantVentas);
		writeln();
	end;
end;
//....................FIN DEl INCISO B....................\\




//....................COMIENZO DEL INCISO C....................\\
procedure ordenarArrayPorSeleccion(var av: arrayVentas; dimL: integer);
var
	aux: ventas;
	i, j, p: integer;
begin
	for i:= 1 to (dimL-1) do begin
		p:= i;
		for j:= (i+1) to dimL do
			if(av[j].codigoProducto < av[p].codigoProducto) then
				p:= j;
		aux:= av[p];
		av[p]:= av[i];
		av[i]:= aux;
	end;
end;


procedure ordenarArrayPorInserccion(var v: arrayVentas; dimL: integer);
var
	i, j: integer;
	actual: ventas;
begin
	for i:= 2 to dimL do begin
		actual:= v[i]; //Me guardo el elemento en i
		j:= i-1;
		while( (j > 0) and (v[j].codigoProducto > actual.codigoProducto) ) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= actual;
	end;
end;
//....................FIN DEl INCISO C....................\\






//....................COMIENZO DEL INCISO E....................\\
procedure borrarElementos(var v:arrayVentas; var dimL: integer; elemInf, elemSup: integer);



	Procedure BuscarPosElem (v:arrayVentas; var posInf, posSup: integer; elemInf, elemSup, dimL:integer);
	Begin
		posInf:= 1;
		posSup:= -1; //En caso de no encontrar un elemento inferior, que no siga buscando el elemento superior

		//Mientras esté dentro del rango y el elemento que se encuentra en el arreglo sea menor al que busco...
		while ( (posInf <= dimL) and (v[posInf].codigoProducto < elemInf) ) do
			posInf:= posInf + 1; //Me muevo en el arreglo

		//Si estoy dentro del rango y encontré el elemento inferior...
		if( (posInf <= dimL) and (v[posInf].codigoProducto = elemInf) ) then begin
			posSup:= posInf; //Sigo recorriendo desde la posición inferior pero con el puntero superior
			//Mientras estoy dentro del rango con el puntero inferior y el elemento que se encuentra en el arreglo sea menor o igual al que busco...
			while( (posSup <= dimL) and (v[posSup].codigoProducto <= elemSup) ) do
				posSup:= posSup + 1; //Me muevo en el arreglo con el puntero superior
			if( (posSup > dimL) or (v[posSup-1].codigoProducto <> elemSup) )then //Si estoy afuera del rango ó no encontré el elemento superior
				posSup:= -1 //Devuelvo una posición que no existe
			else
				posSup:= posSup - 1; //Sino devuelvo la posición en donde encontré el elemento superior
		end
		else
			posInf:= -1; //Sino devuelvo una posición que no existe

	end;
	
	
	
	procedure borrarPosiciones(var v: arrayVentas; var dimL: integer; posInf, posSup: integer);
	var
		i, aux, sobra: integer;
	begin
		sobra:= 0;
		aux:= posInf;
		for i:= (posSup + 1) to dimL do begin
			v[posInf]:= v[i];
			posInf:= posInf + 1;
			sobra:= sobra + 1
		end;
		dimL:= (aux - 1) + sobra;
	end;



var
	posInf, posSup: integer;
begin
	BuscarPosElem(v, posInf, posSup, elemInf, elemSup, dimL);
	if( (posInf <> - 1) and (posSup <> - 1) ) then
		borrarPosiciones(v, dimL, posInf, posSup);
end;
//....................FIN DEl INCISO E....................\\






//....................COMIENZO DEL INCISO G....................\\
procedure cargarLista(a: arrayVentas; dimL: integer; var l: lista);



	function codigoPar(codigo: integer):boolean;
	begin
		codigoPar:= ((codigo mod 2) = 0);
	end;




	procedure insertarOrdenado(v: ventas; var L:lista);
	var
		nue: lista;
		act, ant: lista; {punteros auxiliares para recorrido}
	begin
		new (nue);
		nue^.dato := v;
		act := L; {ubico act y ant al inicio de la lista}
		ant := L;
		while( act <> nil)and(v.codigoProducto > act^.dato.codigoProducto)do begin
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
	i: integer;
begin
	l:= nil;
	for i:= 1 to dimL do begin
		if(codigoPar(a[i].codigoProducto)) then
			insertarOrdenado(a[i], l);
	end;
end;
//....................FIN DEl INCISO G....................\\





//....................COMIENZO DEL INCISO H....................\\
procedure mostrarLista(l: lista);
begin
	while(l <> nil) do begin
		writeln('Codigo del producto: ', l^.dato.codigoProducto);
		writeln('Cantidad de productos vendidos: ', l^.dato.cantVentas);
		writeln();
		l:= l^.sig;
	end;
end;
//....................FIN DEl INCISO H....................\\




//--------------------FIN DE LOS MÉTODOS--------------------\\

	
	
	
	
	
var
	aVentas: arrayVentas;
	listaVentas: lista;
	dimL, elemInf, elemSup: integer;
begin
	Randomize;
	
	cargarArrayVentas(aVentas, dimL); //Inciso A
	
	writeln('Se muestra el contenido del array');
	mostrarArrayVentas(aVentas, dimL); //Inciso B
	
	
	//ordenarArrayPorSeleccion(aVentas, dimL); //Inciso C
	ordenarArrayPorInserccion(aVentas, dimL); //Inciso C
	
	writeln('Se muestra el contenido del array ordenado por seleccion');
	mostrarArrayVentas(aVentas, dimL); //Inciso D

	writeln();
	write('Ingrese el elemento inferior: ');
	readln(elemInf);
	write('Ingrese el elemento superior: ');
	readln(elemSup);
	borrarElementos(aVentas, dimL, elemInf, elemSup); //Inciso E
	
	writeln();
	writeln('Se imprime el vector despues de eliminar elementos');
	mostrarArrayVentas(aVentas, dimL); //Inciso F
	
	cargarLista(aVentas, dimL, listaVentas); //Inciso G
	
	writeln('Se imprime la lista');
	mostrarLista(listaVentas); //Inciso H
end.
