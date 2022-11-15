program arrayInsertarEnPosicion;

const

	dimF = 10;
	
type

	vector = array [1..dimF] of integer;

procedure cargarVector(var v: vector; var dimL: integer);
var
	n: integer;
begin
	n:= random(10)+1;
	while( (n <> 5) and (dimL < dimF) ) do begin
		dimL:= dimL + 1;
		v[dimL]:= n;
		n:= random(10)+1;
	end;
end;


//----------INICIO DEL MÉTODO DE INSERTAR----------\\
procedure insertarEnPosicion(var v: vector; var dimL: integer; elemento, pos: integer; var exito: boolean);
var
	i: integer;
begin
	exito:= false;
	if((dimL < dimF) and  ( (pos >= 1) and (pos <= dimL) ) ) then begin
		exito:= true;
		for i:= dimL downto pos do
			v[i+1]:= v[i];
		v[pos]:= elemento;
		dimL:= dimL + 1;
	end;
end;
//----------FIN DEL MÉTODO----------\\


procedure imprimirVector(v: vector; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
		writeln('Elemento en la posicion ', i, ': ', v[i]);
end;


var
	v: vector;
	dimL, elemento, pos: integer;
	exito: boolean;
begin
	Randomize;
	dimL:= 0;
	cargarVector(v, dimL);
	
	imprimirVector(v, dimL);
	
	writeln();
	
	elemento:= random(100)+1;
	pos:= random(dimF)+1; //Vendria a ser un random entre 1 y 10(dimF)
	writeln('Se quiere insertar el numero ', elemento, ' en la posicion ', pos, ' del vector');
	
	insertarEnPosicion(v, dimL, elemento, pos, exito);
	
	writeln();
	
	imprimirVector(v, dimL);
	
	if(exito) then
		writeln('Se pudo insertar el numero ', elemento, ' en la posicion ', pos, ' del vector')
	else
		writeln('No se pudo insertar el elemento');
end.
