{
4.- Escribir un programa que:

a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100.

b. Implemente un módulo recursivo que devuelva el máximo valor del vector.

c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
}

program punto4;

const

	dimF = 5;
	
type

	arrayNumeros = array [1..dimF] of integer;
	
	
	
	
//--------------------COMIENZO DE LOS MÉTODOS--------------------//








//--------------------INCISO A--------------------//
procedure generarArrayNumeros(var an: arrayNumeros);

	procedure generar(var an: arrayNumeros; indice: integer);
	var
		numero: integer;
	begin
		numero:= random(99)+1; //Random entre 1 y 99
		writeln('Numero generado: ', numero);
		if(indice < dimF) then begin
			indice:= indice + 1;
			an[indice]:= numero;
			generar(an, indice);
		end;
	end;

var
	indice: integer;
begin
	indice:= 0;
	generar(an, indice);
end;
//--------------------FIN INCISO A--------------------//









//--------------------INCISO B--------------------//
procedure buscarMaximo(an: arrayNumeros; var max: integer);

	procedure buscar(an: arrayNumeros; indice: integer; var max: integer);
	begin
		if(indice <= dimF) then begin
			if(an[indice] > max) then
				max:= an[indice];
			indice:= indice + 1;
			buscar(an, indice, max);
		end;
	end;

var
	indice: integer;
begin
	indice:= 1;
	max:= -1;
	buscar(an, indice, max);
	writeln('El numero maximo del arreglo es el ', max);
end;
//--------------------FIN INCISO B--------------------//







//--------------------INCISO C--------------------//
procedure contarNumeros(an: arrayNumeros; var contador: integer);

	procedure sumarNumeros(an: arrayNumeros; indice: integer; var contador: integer);
	begin
		if(indice <= dimF) then begin
			contador:= contador + an[indice];
			indice:= indice + 1;
			sumarNumeros(an, indice, contador);
		end;
	end;

var
	indice: integer;
begin
	indice:= 1;
	contador:= 0;
	sumarNumeros(an, indice, contador);
	writeln('La suma de todos los numero del arreglo es: ', contador);
end;
//--------------------FININCISO C--------------------//








//--------------------FIN DE LOS MÉTODOS--------------------//

	
	
	
var
	an: arrayNumeros;
	max, contador: integer;
begin
	Randomize;

	generarArrayNumeros(an); //Inciso A
	
	writeln('----------------------------------------');
	
	buscarMaximo(an, max); //Inciso B
	
	writeln('----------------------------------------');
	
	contarNumeros(an, contador); //Inciso C
end.
