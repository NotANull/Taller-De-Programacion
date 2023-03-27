procedure ordenarVector(var v:vector;diml:integer);
var i,j,p:integer; item:oficina;
begin
	for i:=1 to diml-1 do begin
		p:=i;
		for j:= i+1 to diml do 
			if(v[j]<v[p])then p:=j;
		item:=v[p];
		v[p]:=v[i];
		v[i]:=item
	end;
	
	
end;