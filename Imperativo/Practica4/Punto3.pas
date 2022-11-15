Program punto3;

const
	
	dimF = 4;
	
type

	strFecha = String[10];
	rangoSucursal = 0..dimF; //Digo que el rango va de 0 a 4 ya que 0 es el corte de control
	
	venta = record
		fechaVenta: strFecha;
		codigoProducto: integer;
		codigoSucursal: rangoSucursal;
		cantVentas: integer;
	end;
	
	ventaAGuardar = record
		fechaVenta: strFecha;
		codigoProducto: integer;
		cantVentas: integer;
	end;
	
	lista = ^nodoL;
	nodoL = record
		dato: ventaAGuardar;
		sig: lista;
	end;
	
	arrayListas = array [rangoSucursal] of lista;
	
	ventaMergeAcumulador = record
		codigoProducto: integer;
		cantTotalVentas: integer;
	end;
	
	listaMergeAcumulador = ^nodoLma;
	nodoLma = record
		dato: ventaMergeAcumulador;
		sig: listaMergeAcumulador;
	end;
	
	
	
	


procedure randomString(tamanio:integer; var palabra:string);
var  str,Result: String;
begin
	str:='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	Result:='';
	repeat
		Result:=Result+str[Random(Length(str))+1];
	until(Length(Result)=tamanio);
	palabra:=Result;
end;







	
	
//--------------------COMIENZO DE LOS MÉTODOS--------------------\\








//--------------------INCISO A--------------------\\
procedure generarArrayListas(var al: arrayListas);


	procedure inicializarArrayListas(var al: arrayListas);
	var
		i: integer;
	begin
		for i:= 1 to dimF do
			al[i]:= nil;
	end;


	procedure leerVenta(var v: venta);
	begin
		with v do begin
			codigoSucursal:= random(5); //Random entre 0 y 4
			writeln('Codigo de sucursal: ', codigoSucursal);
			if(codigoSucursal <> 0) then begin
				randomString(10, fechaVenta);
				writeln('Fecha de la venta: ', fechaVenta);
				codigoProducto:= random(501); //Random entre 0 y 500
				writeln('Codigo del producto: ', codigoProducto);
				cantVentas:= random(501); //Random entre 0 y 500
				writeln('Cantidad de ventas del producto: ', cantVentas);
			end;
		end;
	end;
	
	procedure AsignarVentaAGuardar(v: venta; var vg: ventaAGuardar);
	begin
		vg.fechaVenta:= v.fechaVenta;
		vg.codigoProducto:= v.codigoProducto;
		vg.cantVentas:= v.cantVentas;
	end;
	
	procedure insertarOrdenado(var l: lista; vg: ventaAGuardar);
	var
		nue, ant, act: lista;
	begin
		new(nue);
		nue^.dato:= vg;
		ant:= l;
		act:= l;
		while( (act <> nil) and (vg.codigoProducto > act^.dato.codigoProducto) ) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if(ant = act) then
			l:= nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;

var
	v: venta;
	vg: ventaAGuardar;
begin
	inicializarArrayListas(al);
	writeln('Se lee la informacion de cada venta');
	writeln;
	leerVenta(v);
	AsignarVentaAGuardar(v, vg);
	while(v.codigoSucursal <> 0) do begin
		insertarOrdenado(al[v.codigoSucursal], vg);
		leerVenta(v);
		AsignarVentaAGuardar(v, vg);
	end;
end;
//--------------------FIN INCISO A--------------------\\











//--------------------INCISO B--------------------\\
procedure mergeAcumulador(al: arrayListas; var lma: listaMergeAcumulador);

	procedure buscarMinimo(var al: arrayListas; var regMin: ventaAGuardar);
	var
		i, indice: integer;
	begin
		regMin.codigoProducto:= 9999;
		indice:= -1;
		for i:= 1 to dimF do begin
			if( (al[i] <> nil) and (al[i]^.dato.codigoProducto <= regMin.codigoProducto) ) then begin
				regMin.codigoProducto:= al[i]^.dato.codigoProducto;
				regMin.cantVentas:= al[i]^.dato.cantVentas;
				indice:= i;
			end;
		end;
		if(indice <> -1) then
			al[indice]:= al[indice]^.sig;
	end;
	
	procedure agregarAtras(var l, ult: listaMergeAcumulador; reg: ventaMergeAcumulador);
	var
		nue: listaMergeAcumulador;
	begin
		new(nue);
		nue^.dato:= reg;
		nue^.sig:= nil;
		if(l = nil) then
			l:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;

var
	regMin: ventaAGuardar;
	regActual: ventaMergeAcumulador;
	ult: listaMergeAcumulador;
begin
	lma:= nil;
	ult:= nil;
	buscarMinimo(al, regMin);
	while(regMin.codigoProducto <> 9999) do begin
		regActual.codigoProducto:= regMin.codigoProducto;
		regActual.cantTotalVentas:= 0;
		while( (regMin.codigoProducto <> 9999) and (regActual.codigoProducto = regMin.codigoProducto) ) do begin
			regActual.cantTotalVentas:= regActual.cantTotalVentas + regMin.cantVentas;
			buscarMinimo(al, regMin);
		end;
		agregarAtras(lma, ult, regActual);
	end;
end;
//--------------------FIN INCISO B--------------------\\








//--------------------FIN DE LOS MÉTODOS--------------------\\
	
	
	
	
	
	
	
var
	al: arrayListas;
	lma: listaMergeAcumulador;
begin
	Randomize;
	
	generarArrayListas(al); //Inciso A
	
	writeln('----------------------------------------');
	
	mergeAcumulador(al, lma);
end.
