//RECORRIDO ACOTADO CON EL MISMO CRITERIO QUE ESTÁ ORDENADO. Por ejemplo:

{
Implementar un programa que contenga:
	a. Un módulo que lea información de alumnos de Taller de Programacion y almacene
		en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior
		al 2010. Esta estructura debe estar ordenada por legajo y debe ser eficiente para la
		búsqueda por dicho criterio. De cada alumno se lee legajo, apellido, nombre, DNI y año de
		ingreso.

	b. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
		aquellos alumnos cuyo legajo sea inferior a 15853.

	c. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
		aquellos alumnos cuyo legajo esté comprendido entre 1258 y 7692.
}

//Como tengo que hacer un recorrido acotado, recorro dependiendo del ejercicio
//En este método recorro numeros menores al que se encuentra en el árbol
procedure alumnosLegajoInferior(a: arbol; num: integer);
begin
	if(a <> nil) then begin
		if(a^.dato.numLeajo < num) then begin
			writeln(a^.dato.numLegajo);
			alumnosLegajoInferior(a^.hi, num);
			alumnosLegajoInferior(a^.hd, num);
		end
		else
			alumnosLegajoInferior(a^.hi, num);
	end;
end;




//En este método recorro números comprendidos entre un número inferior y un número superior
procedure alumnosEntreValores(a: arbol; valorInferior, valorSuperior: integer);
begin
	if(a <> nil) then begin
		if(a^.dato.numero > valorInferior) then begin
			if(a^.dato.numero < valorSuperior) then begin
				writeln(a^.dato.numero);
				alumnosEntreValores(a^.hi, valorInferior, valorSuperior);
				alumnosEntreValores(a^.hd, valorInferior, valorSuperior);
			end
			else
				alumnosEntreValores(a^.hi, valorInferior, valorSuperior);
		end
		else
			alumnosEntreValores(a^.hd, valorInferior, valorSuperior);
	end;
end;