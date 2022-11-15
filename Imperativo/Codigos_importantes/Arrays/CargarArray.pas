program cargaDeArray;

const

	dimF = 10;
	
type

	vector = array [1..dimF] of integer;
	
	
//----------INICIO MÉTODO DE CARGA COMPLETA----------\\
procedure cargarVectorCompleto(var v: vector); //Método el cual llena un vector en su totalidad
var
	i: integer;
begin
	for i:= 1 to dimF do
		v[i]:= i;
end;
//----------FIN MÉTODO----------\\


procedure imprimirVectorCompleto(v: vector);
var
	i: integer;
begin
	for i:= 1 to dimF do
		writeln('Posicion ', i, ': ', v[i]);
end;


//----------INICIO MÉTODO DE CARGA PARCIAL----------\\
procedure cargarVectorParcial(var v: vector; var dimL: integer);
var
	n: integer;
begin
	n:= random(10)+1; //Randoms entre 1 y 10
	while( (n <> 5) and (dimL < dimF) ) do begin
		dimL:= dimL + 1;
		v[dimL]:= n;
		n:= random(10)+1;
	end;
end;
//----------FIN MÉTODO----------\\


procedure imprimirVectorParcial(v: vector; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
		writeln('Posicion ', i, ': ', v[i]);
end;

	
var
	v: vector;
	dimL: integer;
begin
	Randomize;
	dimL:= 0;
	
	//cargarVectorCompleto(v);
	//imprimirVectorCompleto(v);
	
	cargarVectorParcial(v, dimL);
	imprimirVectorParcial(v, dimL);
	
end.
