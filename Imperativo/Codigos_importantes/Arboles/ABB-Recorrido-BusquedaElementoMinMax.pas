//Busco un elemento a la derecha de todo
function maximo(a: arbol): integer;
begin
	if(a = nil) then
		maximo:= -1
	else
		if(a^.hd <> nil) then
			maximo:= maximo(a^.hd)
		else
			maximo:= a^.dato;
end;


//Busco un elemento a la izquierda de todo
function minimo(a: arbol): integer;
begin
	if(a = nil) then
		minimo:= 9999
	else
		if(a^.hi <> nil) then
			minimo:= minimo(a^.hi)
		else
			minimo:= a^.dato;
end;