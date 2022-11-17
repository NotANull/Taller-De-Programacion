//En este método recorro números comprendidos entre un número inferior y un número superior. Por ejemplo

{
	Implementar un programa que contenga:

	Un módulo que reciba la nueva estructura e informe el nombre y apellido de
	aquellos alumnos cuyo legajo esté comprendido entre 1258 y 7692.

	***Hagamos de cuenta que anteriormente nos hayan pedido que carguemos el árbol
	y que esté ordenado por dicho criterio y bla bla bla...***
}

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