program arrayInsertarEnVectorOrdenado;

const

	dimF = 10;
	
type

	vector = array [1..dimF] of integer;
	
procedure cargarVector(var v: vector; var dimL: integer);
var
	n: integer;
begin
	write('Ingrese un numero siempre y cuando este ordenado: ');
	readln(n);
	while( (n <> 0) and (dimL < dimF) ) do begin
		dimL:= dimL + 1;
		v[dimL]:= n;
		write('Ingrese un numero siempre y cuando este ordenado: ');
		readln(n);
	end;
end;


//----------COMIENZO DEL METODO DE INSERTAR ORDENADO--------\\
procedure insertarVectorOrdenado(var v: vector; var dimL: integer; elemento: integer; var exito: boolean);

	function determinarPosicion(v: vector; dimL, elemento: integer): integer;
	var
		i: integer;
	begin
		i:= 1;
		while( (v[i] < elemento) and (i <= dimL) ) do
			i:= i + 1;
		determinarPosicion:= i;
	end;
	
	procedure insertar(var v: vector; var dimL: integer; pos, elemento: integer);
	var
		i: integer;
	begin
		for i:= dimL downto pos do
			v[i+1]:= v[i];
		v[pos]:= elemento;
		dimL:= dimL + 1;
	end;
//----------FIN DEL MÉTODO----------\\


var
	pos: integer;
begin
	exito:= false;
	if(dimL < dimF) then begin
		pos:= determinarPosicion(v, dimL, elemento);
		insertar(v, dimL, pos, elemento);
		exito:= true;
	end;
end;


procedure imprimirVector(v: vector; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
		writeln('Elemento de la posicion ', i, ': ', v[i]);
end;
	
var
	v: vector;
	dimL, elemento: integer;
	exito: boolean;
begin
	dimL:= 0;
	cargarVector(v, dimL);
	
	imprimirVector(v, dimL);
	
	elemento:= random(10)+1;
	writeln('Se quiere insertar el numero ', elemento, ' en el vector');
	insertarVectorOrdenado(v, dimL, elemento, exito);
	
	imprimirVector(v, dimL);
	
end.
