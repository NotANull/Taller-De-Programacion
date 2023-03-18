function buscarEnLista(l: lista; numero: integer): boolean;
begin
	if(l = nil) then
		buscarEnLista:= false
	else if (l^.dato = numero) then
		buscarEnLista:= true
	else
		buscarEnLista:= buscarEnLista(l^.sig, numero);
end;