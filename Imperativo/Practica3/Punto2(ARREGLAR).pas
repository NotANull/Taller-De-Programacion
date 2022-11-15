{
Escribir un programa que:

	a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se
		lee código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el
		código de producto 0. UN PRODUCTO PUEDE ESTAR EN MÁS DE UNA
		VENTA(Si se repite el codigo de producto, ¿Quiere decir que cada código tiene su propia fecha y cantidad de ventas?). Se pide:

			i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.

			ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código
				de producto. Cada nodo del árbol debe contener el código de producto y la cantidad total vendida.

			Nota: El módulo debe retornar los dos árboles.

	b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y
		retorne la cantidad total de unidades vendidas de ese producto.


}



program punto2;

type

	strFecha = String[10];

	venta = record
		codigoProducto: integer;
		fecha: strFecha;
		cantUnitVendidas: integer;
	end;
	
	productoVendido = record
		codigoProducto: integer;
		cantTotalVenta: integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: venta;
		hi: arbol;
		hd: arbol;
	end;
	
	arbolProdVendido = ^nodoProd;
	nodoProd = record
		dato: productoVendido;
		hi: arbolProdVendido;
		hd: arbolProdVendido;
	end;
	




//--------------------COMIENZO DE LOS MÉTODOS--------------------\\





procedure randomString(tamanio: integer; var palabra: string);
var
	str,Result: String;
begin
	str:='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	Result:='';
	repeat
		Result:=Result+str[Random(Length(str))+1];
	until(Length(Result)=tamanio);
	palabra:=Result;
end;







//--------------------INCISO A--------------------\\
procedure generarArbol(var a: arbol; var apv: arbolProdVendido);

	procedure leerVenta(var v: venta);
	begin
		with v do begin
			codigoProducto:= random(11); //Random entre 0 y 10
			writeln('Codigo de producto: ', codigoProducto);
			if(codigoProducto <> 0) then begin
				randomString(5,fecha);
				writeln('Fecha del producto: ', fecha);
				cantUnitVendidas:= random(501); //Random entre 0 y 500
				writeln('Cantidad de unidades vendidas: ', cantUnitVendidas);
				writeln();
			end;
		end;
	end;
	
	
	procedure leerProductoVendido(var pv: productoVendido);
	begin
		with pv do begin
			codigoProducto:= random(11); //Random entre 0 y 10
			writeln('Codigo de producto: ', codigoProducto);
			if(codigoProducto <> 0) then begin
				cantTotalVenta:= random(501); //Random entre 0 y 500
				writeln('Cantidad de productos vendidos: ', cantTotalVenta);
				writeln();
			end;
		end;
	end;
	
	procedure crearArbolVentas(var a: arbol; v: venta);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= v;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else if(v.codigoProducto < a^.dato.codigoProducto) then
			crearArbolVentas(a^.hi, v)
		else
			crearArbolVentas(a^.hd, v);
	end;
	
	procedure crearArbolProductos(var apv: arbolProdVendido; pv: productoVendido);
	begin
		if(apv = nil) then begin
			new(apv);
			apv^.dato:= pv;
			apv^.hi:= nil;
			apv^.hd:= nil;
		end
		else if(pv.codigoProducto < apv^.dato.codigoProducto) then
			crearArbolProductos(apv^.hi, pv)
		else
			crearArbolProductos(apv^.hd, pv);
	end;

var
	v: venta;
	pv: productoVendido;
begin
	a:= nil;
	apv:= nil;
	
	writeln('Se lee la informacion de cada venta');
	writeln();
	leerVenta(v);
	while(v.codigoProducto <> 0) do begin
		crearArbolVentas(a, v);
		leerVenta(v);
	end;
	writeln;
	writeln('Fin de la lectura de la informacion de cada venta');
	
	
	writeln;
	writeln('========================================');
	writeln;
		
	
	writeln('Se lee la informacion de cada producto vendido');
	writeln();
	leerProductoVendido(pv);	
	while(pv.codigoProducto <> 0) do begin
		crearArbolProductos(apv, pv);
		leerProductoVendido(pv);
	end;
	writeln;
	writeln('Fin de la lectura de la informacion de cada producto vendido');
end;
//--------------------FIN INCISO A--------------------\\








//--------------------INCISO B--------------------\\
procedure buscarUnidadesVendidas(a: arbol);

//ARREGLAR
{
	function buscarCodigoEnArbol(a: arbol; codigoABuscar: integer): integer;
	begin
		if(a = nil) then
			buscarCodigoEnArbol:= 0
		else if (codigoABuscar = a^.dato.codigoProducto) then
			buscarCodigoEnArbol:= ( buscarCodigoEnArbol(a^.hi, codigoABuscar) + a^.dato.cantUnitVendidas)
		else if(codigoABuscar < a^.dato.codigoProducto) then
			buscarCodigoEnArbol:= buscarCodigoEnArbol(a^.hi, codigoABuscar)
		else
			buscarCodigoEnArbol:= buscarCodigoEnArbol(a^.hd, codigoABuscar);
	end;
}

var
	codigoABuscar, cantTotalVentas: integer;
begin
	codigoABuscar:= random(10)+1; //Random entre 1 y 10
	writeln('Se busca el codigo de producto ', codigoABuscar);
	
	cantTotalVentas:= buscarCodigoEnArbol(a, codigoABuscar);
	
	if(cantTotalVentas = 0) then
		writeln('El arbol esta vacio')
	else
		writeln('Cantidad total de productos vendidos: ', cantTotalVentas);
end;
//--------------------FIN INCISO B--------------------\\







//--------------------FIN DE LOS MÉTODOS--------------------\\





	
var
	a: arbol;
	apv: arbolProdVendido;
begin
	Randomize;
	
	generarArbol(a, apv); //Inciso A
	
	writeln('----------------------------------------');
	
	buscarUnidadesVendidas(a); //Inciso B
end.
