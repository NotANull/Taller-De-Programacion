{
1.- Implementar un programa que invoque a los siguientes módulos.
a. Implementar un módulo recursivo que permita leer una secuencia de
	caracteres terminada en punto y los almacene en un vector con dimensión física igual a 10.

b. Implementar un módulo que imprima el contenido del vector.

c. Implementar un módulo recursivo que imprima el contenido del vector.
 
d. Implementar un módulo recursivo que permita leer una secuencia de
	caracteres terminada en punto y retorne la cantidad de caracteres leídos.

e. Implementar un módulo recursivo que permita leer una secuencia de
	caracteres terminada en punto y retorne una lista con los caracteres leídos.

f. Implemente un módulo recursivo que reciba la lista generada en d. e imprima
	los valores de la lista en el mismo orden que están almacenados.

g. Implemente un módulo recursivo que reciba la lista generada en d. e imprima
	los valores de la lista en orden inverso al que están almacenados.
}

program punto1;

const

	dimF = 10;

type

	lista = ^nodo;
	nodo = record
		dato: char;
		sig: lista;
	end;

	arrayCaracteres = array [1..dimF] of char;


//--------------------COMIENZO DE LOS MÉTODOS--------------------\\




//--------------------COMIENZO INCISO A--------------------\\
procedure generarArrayCaracteres(var ac: arrayCaracteres; var dimL: integer);

	procedure cargaRecursiva(var ac: arrayCaracteres; var dimL: integer);
	var
		caracter: char;
	begin
		write('Ingrese un caracter: ');
		readln(caracter);
		if( (dimL < dimF) and (caracter <> '.') ) then begin
			dimL:= dimL + 1;
			ac[dimL]:= caracter;
			cargaRecursiva(ac, dimL);
		end;
	end;

begin
	dimL:= 0;
	writeln('Se ingresan caracteres para el arreglo');
	cargaRecursiva(ac, dimL);
end;
//--------------------FIN INCISO A--------------------\\




//--------------------COMIENZO INCISO B--------------------\\
procedure imprimirArray(ac: arrayCaracteres; dimL: integer);
var
	i: integer;
begin
	writeln('Array sin recursion');
	if(dimL > 0) then begin
		writeln('Se imprime el arreglo de caracteres SIN recursion');
		for i:= 1 to dimL do
			writeln('Caracter de la posicion ', i, ': ', ac[i]);
	end
	else
		writeln('El arreglo esta vacio. No se ingresaron elementos');
end;
//--------------------FIN INCISO B--------------------\\



//--------------------COMIENZO INCISO C--------------------\\
procedure imprimirArrayRecursivo(ac: arrayCaracteres; dimL: integer);

	procedure imprimir(ac: arrayCaracteres; dimL: integer);
	begin
		if(dimL > 0) then begin
			//writeln('Caracter de la posicion ', dimL, ': ', ac[dimL]); //Imprime el arreglo de fin a comienzo
			imprimir(ac, (dimL-1));
			writeln('Caracter de la posicion ', dimL, ': ', ac[dimL]); //Imprime el arreglo de comienzo a fin
		end;
	end;

begin
	writeln('Array recursivo');
	if(dimL > 0) then begin
		writeln('Se imprime el arreglo de caracteres en forma recursiva');
		imprimir(ac, dimL);
	end
	else
		writeln('El arreglo esta vacio. No se ingresaron elementos');
end;
//--------------------FIN INCISO C--------------------\\




//--------------------COMIENZO INCISO D--------------------\\
procedure contarCaracteres(var contador: integer);

	procedure leerCaracter(var contador: integer);
	var
		caracter: char;
	begin
		write('Ingrese un caracter: ');
		readln(caracter);
		if(caracter <> '.') then begin
			contador:= contador + 1;
			leerCaracter(contador);
		end;
	end;

begin
	contador:= 0;
	writeln('Contador de caracteres');
	leerCaracter(contador);
	if(contador > 0) then
		writeln('Se contaron ', contador, ' caracteres')
	else
		writeln('No se ingreso ningun caracter');
end;
//--------------------FIN INCISO D--------------------\\




//--------------------COMIENZO INCISO E--------------------\\
procedure generarListaCaracteres(var l: lista);

	procedure leerEInsertar(var l: lista);
	
		procedure agregarAdelante(var l: lista; i: char);
		var
			nue: lista;
		begin
			new(nue);
			nue^.dato:= i;
			nue^.sig:= l;
			l:= nue;
		end;
	
	var
		caracter: char;
	begin
		write('Ingrese un caracter: ');
		readln(caracter);
		if(caracter <> '.') then begin
			agregarAdelante(l, caracter);
			leerEInsertar(l);
		end;
	end;

begin
	l:= nil;
	writeln('Se ingresan caracteres para la lista');
	leerEInsertar(l);
end;
//--------------------FIN INCISO E--------------------\\






//--------------------COMIENZO INCISO F--------------------\\
procedure imprimirListaEnOrden(l: lista);

	procedure ListaEnOrden(l: lista);
	begin
		if(l <> nil) then begin
			ListaEnOrden(l^.sig);
			writeln('Caracter: ', l^.dato);
		end;
	end;

begin
	if(l <> nil) then begin
		writeln('Se imprime el contenido de la lista en orden que se ingresaron los datos');
		ListaEnOrden(l);
	end
	else
		writeln('La lista esta vacia. No se ingresaron elementos');
end;
//--------------------FIN INCISO F--------------------\\






//--------------------COMIENZO INCISO G--------------------\\
procedure imprimirListaEnOrdenInverso(l: lista);

	procedure ListaEnOrdenInverso(l: lista);
	begin
		if(l <> nil) then begin
			writeln('Caracter: ', l^.dato);
			ListaEnOrdenInverso(l^.sig);
		end;
	end;

begin
	if(l <> nil) then begin
		writeln('Se imprime el contenido de la lista en orden inverso a como se ingresaron los datos');
		ListaEnOrdenInverso(l);
	end
	else
		writeln('La lista esta vacia. No se ingresaron elementos');
end;
//--------------------FIN INCISO G--------------------\\







//--------------------FIN DE LOS MÉTODOS--------------------\\






	
var
	ac: arrayCaracteres;
	l: lista;
	dimL, contadorCaracteres: integer;
begin
	generarArrayCaracteres(ac, dimL); //Inciso A

	writeln('----------------------------------------');

	imprimirArray(ac, dimL); //Inciso B

	writeln('----------------------------------------');

	imprimirArrayRecursivo(ac, dimL); //Inciso C
	
	writeln('----------------------------------------');
	
	contarCaracteres(contadorCaracteres);//Inciso D
	
	writeln('----------------------------------------');
	
	generarListaCaracteres(l); //Inciso E
	
	writeln('----------------------------------------');
	
	imprimirListaEnOrden(l); //Inciso F
	
	writeln('----------------------------------------');
	
	imprimirListaEnOrdenInverso(l); //Inciso G
end.
