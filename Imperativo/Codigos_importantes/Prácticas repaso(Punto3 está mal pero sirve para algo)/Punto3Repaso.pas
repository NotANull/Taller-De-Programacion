program cualquiera;

type

	fecha = String[10];

	venta = record
		codigoProducto: integer;
		tipoProducto: integer;
		unaFecha: fecha;
		cantUnitVendida: integer;
		monto: real;
	end;
	
	resumenVenta = record
		codigoProducto: integer;
		tipoProducto: integer;
		totalUnitVendidas: integer;
		montoTotal: real;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: resumenVenta;
		hi: arbol;
		hd: arbol;
	end;
	
	
	
//--------------------COMIENZO DE LOS PROCESOS Y FUNCIONES--------------------\\




// genera un string random y lo guarda en el parametro palabra
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



procedure crearArbol(var a: arbol);



	procedure leerVenta(var v: venta);
	begin
		with v do begin
			cantUnitVendida:= random (6); //Random entre 0 y 5
			writeln('Cantidad de unidades vendidas: ', cantUnitVendida);
			if(cantUnitVendida <> 0) then begin
			
				codigoProducto:= random(6); //Random entre 0 y 5
				writeln('Codigo del producto: ', codigoProducto);
			
				tipoProducto:= random(51); //Random entre 0 y 50
				writeln('Tipo de producto: ', tipoProducto);
				
				randomString(10, unaFecha);
				writeln('Ingrese la fecha del producto: ', unaFecha);
				
				monto:= random(1501); //Random entre 0 y 1500
				writeln('Monto del producto: ', monto:2:2);
				writeln();
			end;
			writeln();
		end;
	end;
	
	
	
	
	function estoy(a: arbol; dato: resumenVenta): boolean;
	begin
		if(a = nil) then
			estoy:= false
		else
			if(a^.dato.codigoProducto = dato.codigoProducto) then
				estoy:= true
			else
				if(dato.codigoProducto < a^.dato.codigoProducto) then
					estoy:= estoy(a^.hi, dato)
				else
					estoy:= estoy(a^.hd, dato);
	end;
	
	
	
	procedure sumar(var a: arbol; dato: resumenVenta);
	begin
		a^.dato.totalUnitVendidas:= a^.dato.totalUnitVendidas + dato.totalUnitVendidas;
		a^.dato.montoTotal:= a^.dato.montoTotal + dato.montoTotal;
	end;
	
	
	
	procedure insertarNodo(var a: arbol; dato: resumenVenta);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= dato;
			a^.hi:= nil;
			a^.hd:= nil
		end
		else
			if(dato.codigoProducto < a^.dato.codigoProducto) then
				insertarNodo(a^.hi, dato)
			else
				insertarNodo(a^.hd, dato);
	end;



var
	v: venta;
	rv: resumenVenta;
begin
	writeln('Se lee la informacion de una venta');
	leerVenta(v);
	while(v.cantUnitVendida <> 0) do begin
		rv.codigoProducto:= v.codigoProducto;
		rv.tipoProducto:= v.tipoProducto;
		rv.totalUnitVendidas:= 0;
		rv.montoTotal:= 0;
		while( (v.cantUnitVendida <> 0) and (rv.codigoProducto = v.codigoProducto) )do begin
			rv.totalUnitVendidas:= rv.totalUnitVendidas + v.cantUnitVendida;
			rv.montoTotal:= rv.montoTotal + v.monto;
			leerVenta(v);
		end;
		if(estoy(a, rv)) then
			sumar(a, rv)
		else
			insertarNodo(a, rv);
		
	end;
end;




procedure monstrarArbol(a: arbol);
begin
	if(a <> nil) then begin
		monstrarArbol(a^.hi);
		writeln('Codigo del producto: ', a^.dato.codigoProducto);
		writeln('Tipo de producto: ', a^.dato.tipoProducto);
		writeln('Cantidad total de unidades vendidas: ', a^.dato.totalUnitVendidas);
		writeln('Monto total: ', a^.dato.montoTotal:2:2);
		writeln();
		monstrarArbol(a^.hd);
	end;
end;



//--------------------FIN DE LOS PROCESOS Y FUNCIONES--------------------\\
	
	
	
//--------------------PROGRAMA PRINCIPAL--------------------\\	
var
	a: arbol;
begin
	Randomize;

	a:= nil;
	
	crearArbol(a);
	
	monstrarArbol(a);
end.
