program parcial;

const

	dimF1 = 5;
	dimF2 = 180;
	
type

	ventas = record
		cod: integer;
		cant: integer;
		precio: real;
	end;

    Vventas = array [1..dimF2] of ventas;
    
	regsucu = record
		diml: integer;
		venta: Vventas;
	end;
	
	VSucu = array [1..dimF1] of regsucu;
	
	reglista = record
		cod: integer;
		monto: real;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: reglista;
		sig: Lista;
	end;

procedure carga(var Sucu:VSucu);

	procedure ordenarInsercion(var v: Vventas; dimL: integer);
	var
		i, j: integer;
		actual: ventas;
	begin
		for i:= 2 to dimL do begin
			actual:= v[i]; //Me guardo el elemento en i
			j:= i-1;
			while( (j > 0) and (v[j].cod > actual.cod) ) do begin
				v[j+1]:= v[j];
				j:= j-1;
			end;
			v[j+1]:= actual;
		end;
	end;

var
	i, j: integer;
	v: ventas;
begin
  
	for i:= 1 to dimf1 do begin
		j:= 0;
		Sucu[i].diml:= 0;
		writeln('---------- Sucursal ', i, ' ----------');
		writeln;
		v.cod:= random(17)-1; //Random entre -1 y 15
		writeln('Codigo de producto: ', v.cod);
		while (v.cod <> -1) and (j < dimf2) do begin
			v.cant:= random(51); //Random entre 0 y 50
			writeln('Cantidad vendidas:', v.cant);
			v.precio:= random(1000)+500; //Random entre 500 y 1500
			writeln('Precio: ', v.precio:2:2);
			j:= j + 1;
			Sucu[i].diml:= j;
			Sucu[i].venta[j] := v;
			writeln;
			v.cod:= random(17)-1; //Random entre -1 y 15
			writeln('Codigo de producto: ', v.cod);
		end;
		
		ordenarInsercion(Sucu[i].venta, Sucu[i].diml); //IMPORTANTE ORDENAR LOS SUB VECTORES SINO NO TOMA BIEN EL MERGE ACUMULADOR!!!!
		
	end;
	
end;


procedure merge(v: VSucu; var l: lista);

	procedure minimo(var v: VSucu; var regMin: reglista);

		Procedure BorrarPos (var v: Vventas; var dimL: integer; pos: integer);
		var
			i: integer;
		begin
			for i:= pos+1 to dimL do
				v[i-1] := v[i];
			dimL := dimL-1 ;
		end;

	var
		i,indice: integer;
	begin
		regMin.cod:= 9999;
		indice:= -1;
		for i:= 1 to dimf1 do begin
			if( (v[i].diml > 0) and (v[i].venta[1].cod  <= regMin.cod) ) then begin
				regMin.cod:= v[i].venta[1].cod;
				indice:= i;
			end;
		end;
		if(indice <> -1) then begin
			BorrarPos(v[indice].venta, v[indice].diml, 1);
			regMin.monto:= v[indice].venta[1].precio;
		end;
	end;
    
    procedure agregarAtras(var l: lista; var ult: lista; dato: regLista);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato := dato;
		nue^.sig := nil;
		if (l = nil) then
			l := nue
		else
			ult^.sig := nue;
		ult := nue;	
	end;


var
	ult: lista;
	regMin: reglista;
	regActual: reglista;
begin
	l:= nil;
	ult:= nil;
	minimo(v, regMin);
	while(regMin.cod <> 9999) do begin
		regActual.cod:= regMin.cod;
		regActual.monto:= 0;
		while( (regMin.cod <> 9999) and (regActual.cod = regMin.cod) ) do begin
			regActual.monto:= regActual.monto + regMin.monto;
			minimo(v, regMin);
		end;
		agregarAtras(l, ult, regActual);
	end;
end;


procedure imprimirLista(l: lista);

	procedure imprimir(l: lista);
	begin
		if(l <> nil) then begin
			writeln('Codigo de producto: ', l^.dato.cod, ' - Monto total vendido: ', l^.dato.monto:2:2);
			imprimir(l^.sig);
		end;
	end;
	
begin
	writeln;
	if(l <> nil) then begin
		writeln('-------------- Se imprime la lista merge acumulador --------------');
		writeln;
		imprimir(l);
	end
	else
		writeln('La lista esta vacia');
end;

var
	Sucu: VSucu;
	l: lista;
begin
	randomize;
	carga(Sucu);
	merge(Sucu,l);
	imprimirLista(l);
end.
