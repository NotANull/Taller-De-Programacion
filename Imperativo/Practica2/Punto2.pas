{
2.- Realizar un programa que lea números hasta leer el valor 0 e
	imprima, para cada número leído, sus dígitos en el orden en que
	aparecen en el número. Debe implementarse un módulo recursivo que
	reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe imprimir 2  5  6.
}

program punto2;



procedure leerValor;

	procedure descomponerEImprimir(n: integer);
	var
		digito: integer;
	begin
		if(n <> 0) then begin
			digito:= n mod 10;
			n:= n div 10;
			descomponerEImprimir(n);
			write(digito ,' ');
			writeln;
			
			
		end;
	end;

var
	numero: integer;
begin
	write('Ingrese un numero: ');
	readln(numero);
	writeln;
	while(numero <> 0) do begin
		descomponerEImprimir(numero);
		write('Ingrese un numero: ');
		readln(numero);
		writeln;
	end;
end;




begin
	leerValor;
end.
