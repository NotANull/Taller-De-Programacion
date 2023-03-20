program binario;

procedure leernum(var num: integer);
begin
	write('ingrese numero: ');
	read(num);
end;

procedure convertir(var num:integer; var cadena: String);
var
	rest:integer;
begin
	if(num<>0)then begin
		rest:= num mod 2;
		num:=num div 2;
		convertir(num, cadena);
		writeln(rest);
		if(rest = 1) then
			cadena:= cadena + '1'
		else
			cadena:= cadena + '0';
	end;
end;
var
	num:integer;
	cadena: String;
begin
	leernum(num);
	convertir(num, cadena);
	writeln(cadena);
end.
