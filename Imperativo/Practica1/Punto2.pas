{
2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. 

Implementar un programa modularizado que:

a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra.
	De cada oficina se ingresa: 
	* el código de identificación
	* DNI del propietario
	* Valor de la expensa
	La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
	
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.

c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}

program punto2;

const

	dimF = 300;
	
type

	oficina = record
		codigoId: integer;
		dni: integer;
		expensa: real;
	end;
	
	arrayOficinas = array [1..dimF] of oficina;



//--------------------COMIENZO DE LOS MÉTODOS--------------------\\



procedure generarArray(var a: arrayOficinas; var dimL: integer);

	procedure leerOficina(var o: oficina);
	begin
		with o do begin
			codigoId:= random(52)-1; //Random entre -1 y 50
			writeln('Codigo de identificacion: ', codigoId);
			if(codigoId <> -1) then begin
				dni:= random(500)+1;
				writeln('DNI del propietario: ', dni);
				expensa:= random(1500)+1;
				writeln('Valor de la expensa: ', expensa:2:2);
				writeln();
			end;
			writeln();
		end;
	end;

var
	o: oficina;
begin
	dimL:= 0;
	writeln('Se ingresa la informacion de cada oficina');
	writeln();
	leerOficina(o);
	while( (dimL < dimF) and (o.codigoId <> -1) ) do begin
		dimL:= dimL + 1;
		a[dimL]:= o;
		leerOficina(o);
	end;
end;




procedure ordenarArrayPorSeleccion(var av: arrayOficinas; dimL: integer);
var
	aux: oficina;
	i, j, p: integer;
begin
	for i:= 1 to (dimL-1) do begin
		p:= i;
		for j:= (i+1) to dimL do
			if(av[j].codigoId < av[p].codigoId) then
				p:= j;
		aux:= av[p];
		av[p]:= av[i];
		av[i]:= aux;
	end;
end;


procedure ordenarArrayPorInserccion(var v: arrayOficinas; dimL: integer);
var
	i, j: integer;
	actual: oficina;
begin
	for i:= 2 to dimL do begin
		actual:= v[i]; //Me guardo el elemento en i
		j:= i-1;
		while( (j > 0) and (v[j].codigoId > actual.codigoId) ) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= actual;
	end;
end;




procedure mostrarArray(av: arrayOficinas; dimL: integer);
var
	i: integer;
begin
	writeln('Se muestra como queda ordenado por codigo de identificacion de la oficina');
	for i:= 1 to dimL do begin
		writeln('Codigo de identificacion: ', av[i].codigoId);
		writeln('DNI del propietario: ', av[i].dni);
		writeln('Valor de la expensa: ', av[i].expensa:2:2);
		writeln();
	end;
end;




//--------------------FIN DE LOS MÉTODOS--------------------\\



var
	a: arrayOficinas;
	dimL: integer;
begin
	Randomize;
	
	generarArray(a, dimL);
	
	//ordenarArrayPorSeleccion(a, dimL);
	ordenarArrayPorInserccion(a, dimL);
	
	mostrarArray(a, dimL);
end.
