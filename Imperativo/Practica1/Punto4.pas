program punto4;

const

	dimF = 8;
	dimFRubro = 30;
	
type

	rubro = 1..dimF;
	
	producto = record
		codigoProd: integer;
		codigoRubro: rubro;
		precio: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: producto;
		sig: lista;
	end;
	
	arrayListas = array [1..dimF] of lista;
	
	arrayTercerRubro = array [1..dimFRubro] of producto;
	
	
	
	
	
	
	
//--------------------COMIENZO DE LOS MÉTODOS--------------------\\




procedure inicializarArrayListas(var al: arrayListas);
var
	i: integer;
begin
	for i:= 1 to dimF do
		al[i]:= nil
end;






//....................COMIENZO DEL INCISO A....................\\
procedure crearArrayListas(var al: arrayListas);

	procedure leerProducto(var p: producto);
	begin
		with p do begin
			precio:= random(1501); //Random entre 0 y 1500
			writeln('Precio: ', precio:2:2);
			if(precio <> 0) then begin
				codigoProd:= random(51); //Random entre 0 y 50
				writeln('Codigo del producto: ', codigoProd);
				codigoRubro:= random(8)+1; //Random entre 1 y 8
				writeln('Codigo del rubro: ', codigoRubro);
				writeln();
			end;
			writeln();
		end;
	end;
	
	procedure insertarOrdenado(var L:lista; p: producto);
	var
		nue: lista;
		act, ant: lista; {punteros auxiliares para recorrido}
	begin
		new (nue);
		nue^.dato := p;
		act := L; {ubico act y ant al inicio de la lista}
		ant := L;
		while( act <> nil)and(p.codigoProd > act^.dato.codigoProd)do begin
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
	p: producto;
begin
	writeln('Se lee la informacion de cada producto');
	writeln();
	leerProducto(p);
	while(p.precio <> 0) do begin
		insertarOrdenado(al[p.codigoRubro], p);
		leerProducto(p);
	end;
end;
//....................FIN DEL INCISO A....................\\




//....................COMIENZO DEL INCISO B....................\\
procedure mostrarArrayListas(al: arrayListas);
var
	i: integer;
begin
	writeln('Se muestran las listas de cada elemento del arreglo');
	for i:= 1 to dimF do begin
		while(al[i] <> nil) do begin
			writeln('Codigo de rubro: ', al[i]^.dato.codigoRubro);
			writeln('Codigo de producto: ', al[i]^.dato.codigoProd);
			writeln('Precio: ', al[i]^.dato.precio:2:2);
			writeln();
			al[i]:= al[i]^.sig;
		end;
	end;
end;
//....................FIN DEL INCISO B....................\\






//....................COMIENZO DEL INCISO C....................\\
procedure crearArrayTercerRubro(al: arrayListas; var atr: arrayTercerRubro; var dimL: integer);

begin
	dimL:= 0;
	while( (al[3] <> nil) and (dimL < dimFRubro)) do begin
		dimL:= dimL + 1;
		atr[dimL]:= al[3]^.dato;
		al[3]:= al[3]^.sig;
	end;
end;
//....................FIN DEL INCISO C....................\\





//....................COMIENZO DEL INCISO D....................\\
procedure ordenarArrayPorInserccion(var v: arrayTercerRubro; dimL: integer);
var
	i, j: integer;
	actual: producto;
begin
	for i:= 2 to dimL do begin
		actual:= v[i]; //Me guardo el elemento en i
		j:= i-1;
		while( (j > 0) and (v[j].precio > actual.precio) ) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= actual;
	end;
end;
//....................FIN DEL INCISO D....................\\






//....................COMIENZO DEL INCISO E....................\\
procedure mostrarArrayOrdenado(atr: arrayTercerRubro; dimL: integer);
var
	i: integer;
begin
	writeln('Se muestra el arreglo ordenado por precio del producto');
	for i:= 1 to dimL do begin
		writeln('Precio: ', atr[i].precio:2:2);
		writeln('Codigo de rubro: ', atr[i].codigoRubro);
		writeln('Codigo de producto: ', atr[i].codigoProd);
		writeln();
	end;
end;
//....................FIN DEL INCISO E....................\\






//--------------------FIN DE LOS MÉTODOS--------------------\\
	
	




//--------------------MÉTODOS DE PRUEBA--------------------\\
procedure mostrarArrayTercerRubro(atr: arrayTercerRubro; dimL: integer);
var
	i: integer;
	totalProductos: integer;
begin
	totalProductos:= 0;
	writeln();
	writeln('Se imprime el array con solo los productos del rubro 3');
	for i:= 1 to dimL do begin
		writeln('Codigo de rubro: ', atr[i].codigoRubro);
		writeln('Codigo de producto: ', atr[i].codigoProd);
		writeln('Precio: ', atr[i].precio:2:2);
		totalProductos:= totalProductos + 1;
		writeln();
	end;
	writeln('Total de productos que tiene el rubro 3: ', totalProductos);
end;
//--------------------FIN DE LOS MÉTODOS DE PRUEBA--------------------\\



	
var
	al: arrayListas;
	atr: arrayTercerRubro; //xD el nombre de la variable
	dimLAtr: integer;
begin
	Randomize;
	
	inicializarArrayListas(al);
	
	crearArrayListas(al); //Inciso A
	
	mostrarArrayListas(al); //Inciso B
	
	crearArrayTercerRubro(al, atr, dimLAtr); //Inciso C
	mostrarArrayTercerRubro(atr, dimLAtr);
	
	ordenarArrayPorInserccion(atr, dimLAtr); //Inciso D
	
	mostrarArrayOrdenado(atr, dimLAtr); //Incizo E
end.
