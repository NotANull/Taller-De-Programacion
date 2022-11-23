program arrayDeArrays;

const

	dimF = 3;
	
type

	arrayNumeros = array [1..dimF] of integer;
	
	ArrayDeArrayDeNumeros = array [1..dimF] of arrayNumeros;
	
var
	aa: ArrayDeArrayDeNumeros;
	numero: integer;
	i: integer;
	j: integer;
begin
	Randomize;
	for i:= 1 to dimF do begin
		writeln('--------En la posicion ', i, ' se inserta--------');
		writeln;
		for j:= 1 to dimF do begin
			writeln('Array de numeros en la posicion ', j);
			numero:= random(99)+1; //Random entre 1 y 99
			writeln('Numero ingresado: ', numero);
			aa[i][j]:= numero;
			writeln;
		end;
	end;
	
	writeln('====================IMPRIMIENDO PRUEBA ARRAY DE ARRAYS ====================');
	writeln;
	
	for i:= 1 to dimF do begin
		write('Posicion ', i, ' ');
		for j:= 1 to dimF do begin
			write('[', aa[i][j], '] ');
		end;
		writeln;
	end;
end.
