{ACTIVIDAD 10
En el ProgramaVector.pas de la clase de ordenación
a) Implementar el módulo BusquedaDicotomica utilizando el pseudocódigo
ya analizado. Utilice el siguiente encabezado:
 Procedure busquedaDicotomica( v: vector; ini,fin: integer; dato:integer; var pos: integer);
b) Leer un valor e invocar al módulo BusquedaDicotomica
c) Informar el resultado de la búsqueda
Considere todos los casos durante las pruebas}



program cualquiera;

const

	dimF = 10;

type

	vector = array [1..dimF] of integer;
	
	
	
//----------COMIENZO DEL MÉTODO QUE CARGA EL VECTOR----------\\
procedure cargarVector(var v: vector; var dimL: integer);
var
	n: integer;
begin
	n:= random(16); //Numeros random entre 0 y 15
	writeln('Se ingresa un numero ', n);
	while( (n <> 0) and (dimL < dimF) ) do begin
		dimL:= dimL + 1;
		v[dimL]:= n;
		n:= random(16); //Numeros random entre 0 y 15
		writeln('Se ingresa un numero ', n);
	end;
end;
//----------FIN DEL MÉTODO----------\\
	



//----------COMIENZO DEL MÉTODO QUE ORDENA EL VECTOR----------\\
procedure ordenarVector(var v: vector; dimL: integer);
var
	i, j, actual: integer;
begin
	for i:= 2 to dimL do begin
		actual:= v[i]; //Me guardo el elemento en i
		j:= i-1;
		while( (j > 0) and (v[j] > actual) ) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= actual;
	end;
end;
//----------FIN DEL MÉTODO----------\\



	
//----------COMIENZO DEL MÉTODO QUE IMPRIME EL VECTOR----------\\
procedure imprimirVector(v: vector; dimL: integer);
var
	i: integer;
begin
	writeln();
	writeln('Se imprime el vector');
	for i:= 1 to dimL do
		write('[', v[i], ']');
end;
//----------FIN DEL MÉTODO----------\\
	
	
	
//----------COMIENZO DEL MÉTODO QUE UTILIZA LA BÚSQUEDA DICOTOMICA CON RECURSIÓN----------\\
procedure busquedaDicotomica(v:vector; ini, fin, dato:integer; var pos: integer);
var
	medio:integer;
begin

	if(ini > fin) then
		pos:= -1
	else
	begin
		medio:=(ini+fin) div 2;
		if( (ini <= fin) and (v[medio] = dato) ) then
			pos:= medio
		else
		begin
			if(dato < v[medio]) then begin
				fin:= medio - 1;
				busquedaDicotomica(v, ini, fin, dato, pos);
			end
			else
			begin
				ini:= medio + 1;
				busquedaDicotomica(v, ini, fin, dato, pos);
			end;
		end;	
	end;
end;
//----------FIN DEL MÉTODO----------\\
	
	
	
var
	v: vector;
	dimL, ini, datoABuscar, pos: integer;
begin
	Randomize;
	dimL:= 0;
	ini:= 1;
	
	cargarVector(v, dimL);
	ordenarVector(v, dimL);
	imprimirVector(v, dimL);
	
	writeln();
	
	write('Ingrese el elemento a buscar en el vector: ');
	readln(datoABuscar);
	busquedaDicotomica(v, ini, dimL, datoABuscar, pos);
	if(pos <> -1) then
		writeln('Se encontro el elemento a buscar en la posicion ', pos, ' del vector')
	else
		writeln('No se encontro el elemento');
end.
