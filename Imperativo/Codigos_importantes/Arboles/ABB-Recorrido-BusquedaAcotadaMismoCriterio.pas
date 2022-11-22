//RECORRIDO ACOTADO CON EL MISMO CRITERIO QUE ESTÁ ORDENADO. Por ejemplo:

{
Implementar un programa que contenga:


	Un módulo que reciba la nueva estructura e informe el nombre y apellido de
	aquellos alumnos cuyo legajo sea inferior a 15853.

	***Hagamos de cuenta que anteriormente nos hayan pedido que carguemos el árbol
	y que esté ordenado por dicho criterio y bla bla bla...***
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
