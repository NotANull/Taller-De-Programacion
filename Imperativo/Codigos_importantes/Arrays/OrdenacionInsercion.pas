program cualquiera;

const

	dimF = 10;
	
type

	vector = array [1..dimF] of integer;
	
//----------COMIENZA EL MÉTODO PARA CARGAR EL VECTOR----------\\
procedure cargarVector(var v: vector; var dimL: integer);
var
	n: integer;
begin
	n:= random(16); //Random entre 0 y 15
	writeln('Se ingresa el numero ', n);
	while( (dimL < dimF) and (n <> 0) ) do begin
		dimL:= dimL + 1;
		v[dimL]:= n;
		n:= random(16); //Random entre 0 y 15
		writeln('Se ingresa el numero ', n);
	end;
end;
//----------FIN DEL MÉTODO----------\\



//----------COMIENZO DEL MÉTODO PARA RECORRER E IMPRIMIR EL VECTOR----------\\
procedure imprimirVector(v: vector; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
		writeln('Elemento en la posicion ', i, ' del vector: ', v[i]);
end;
//----------FIN DEL MÉTODO----------\\

	
//----------COMIENZO DEL MÉTODO PARA ORDENAR EL VECTOR----------\\
procedure ordenarInsercion(var v: vector; dimL: integer);
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
//----------FIN DEL MÉTODO------------\\
	
	
var
	v: vector;
	dimL: integer;
begin
	Randomize;
	dimL:= 0;
	cargarVector(v, dimL);
	
	writeln();
	
	imprimirVector(v, dimL);
	
	ordenarInsercion(v, dimL);
	
	writeln();
	
	writeln('Se imprime el vector ordenado por insercion');
	imprimirVector(v, dimL);
end.
