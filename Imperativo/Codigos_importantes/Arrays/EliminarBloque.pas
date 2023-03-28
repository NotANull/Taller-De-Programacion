procedure Eliminar (var v: vector; var dimL: rango3; valorInferior, valorSuperior: rango1);
var
  ini,fin,i: integer;
  aBorrar: integer;
begin

  {Buscar en el vector la posicion donde debo empezar a borrar: ini} 
  ini:=1;
  while (ini <= dimL) and (v[ini].codigoP < valorInferior) do ini:=ini+1;

  {Buscar en el vector la posicion donde debo terminar de borrar: fin}
  {Comenzar a partir de ini porque el vector esta ordenado} 
  fin:= ini;
  while (fin <= dimL) and (v[fin].codigoP<=valorSuperior) do fin:=fin+1;
  
  {Cantidad de elementos a borrar: aBorrar}
  aBorrar:= fin - ini;  
  if (aBorrar>0)then begin
         {Eliminar todos las ventas entre las posiciones ini y fin-1 } 
		  for i:= fin to dimL do begin
			  v[ini]:=v[i];
			  ini:= ini+1;
		  end;
		  {Actualizar dimL}
		  dimL:= dimL - aBorrar;
  end;
end;