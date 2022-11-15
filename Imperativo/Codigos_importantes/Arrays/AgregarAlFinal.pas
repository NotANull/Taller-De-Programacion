program ArrayAgregarAlFinal;

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


//----------INICIO DEL MÉTODO DE AGREGAR ELEMENTO----------\\
procedure agregarElemento(var v: vector; var dimL: integer; elemento: integer; var exito: boolean);
begin
	exito:= false;
	if(dimL < dimF) then begin
		exito:= true;
		dimL:= dimL + 1;
		v[dimL]:= elemento;
	end;
end;
//----------FIN DEL MÉTODO----------\\


procedure imprimirVectorParcial(v: vector; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
		writeln('Posicion ', i, ': ', v[i]);
end;


var
	v: vector;
	dimL, elemento: integer;
	exito: boolean;
begin
	Randomize;
	dimL:= 0;
	cargarVector(v, dimL);
	
	imprimirVectorParcial(v, dimL);
	
	
	elemento:= random(100)+1; //Número entre 1 y 100
	writeln('Se quiere agregar el numero ', elemento, ' en el vector');
	
	agregarElemento(v, dimL, elemento, exito);
	
	if(exito) then
		writeln('Se pudo insertar el elemento en la posicion ', dimL, ' del vector')
	else
		writeln('NO se pudo insertar el elemento');
	
	
	imprimirVectorParcial(v, dimL);
end.
