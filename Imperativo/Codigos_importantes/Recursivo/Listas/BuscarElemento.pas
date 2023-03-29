function buscar(l:lista; dimL:integer):boolean;
begin
	if(l=nil)then
		buscar:=false
	else
		if(l^.dato=x)then
			buscar:=true
		else
			buscar:=buscar(l^.sig,x);
end;