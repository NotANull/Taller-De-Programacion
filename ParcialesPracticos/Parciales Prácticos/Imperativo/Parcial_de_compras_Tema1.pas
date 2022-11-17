program parcial;

type

	rangoDias = 1..31;

	compra = record
		codigoCliente: integer;
		dia: rangoDias;
		cantidadProductos: integer;
		monto: real;
	end;
	
	compraAGuardar = record
		dia: rangoDias;
		cantidadProductos: integer;
		monto: real;
	end;
	
	lista = ^nodoL;
	nodoL = record
		datoLista: compraAGuardar;
		sig: lista;
	end;
	
	registroArbol = record
		codigoCliente: integer;
		listaCompras: lista;
	end;
	
	arbol = ^nodoA;
	nodoA = record
		datoArbol: registroArbol;
		hi: arbol;
		hd: arbol;
	end;
	
	
	
	
procedure generarArbolListas(var a: arbol);

	procedure leerCompra(var c: compra);
	begin
		with c do begin
			cantidadProductos:= random(31); //Random entre 0 y 30
			writeln('Cantidad de productos: ', cantidadProductos);
			if(cantidadProductos <> 0) then begin
				codigoCliente:= random(10)+1; //Random entre 1 y 99
				writeln('Codigo de cliente: ', codigoCliente);
				dia:= random(31)+1; //Random entre 1 y 31
				writeln('Dia: ', dia);
				monto:= random(8001); //Random entre 0 y 8000
				writeln('Monto: ', monto:2:2);
				writeln;
			end;
		end;
	end;
	
	function buscar(a: arbol; codigo: integer):arbol;
	begin
		if(a = nil) then
			buscar:= nil
		else if(codigo = a^.datoArbol.codigoCliente) then
			buscar:= a
		else if(codigo < a^.datoArbol.codigoCliente) then
			buscar:= buscar(a^.hi, codigo)
		else
			buscar:= buscar(a^.hd, codigo);
	end;
	
	procedure crearRegistro(c: compra; var ra: registroArbol);
	
	
		procedure guardarCompras(c: compra; var ca: compraAGuardar);
		begin
			ca.dia:= c.dia;
			ca.cantidadProductos:= c.cantidadProductos;
			ca.monto:= c.monto;
		end;
	
		procedure insertarOrdenado(var l: lista; ca: compraAGuardar);
		var
			nue, ant, act: lista;
		begin
			new(nue);
			nue^.datoLista:= ca;
			ant:= l;
			act:= l;
			while( (act <> nil) and (ca.dia > l^.datoLista.dia) ) do begin
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
		ca: compraAGuardar;
	begin
		ra.listaCompras:= nil;
		ra.codigoCliente:= c.codigoCliente;
		
		guardarCompras(c, ca);
		
		insertarOrdenado(ra.listaCompras, ca);
	end;
	
	procedure crearArbol(var a: arbol; ra: registroArbol);
	begin
		if(a = nil) then begin
			new(a);
			a^.datoArbol:= ra;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else if(ra.codigoCliente < a^.datoArbol.codigoCliente) then
			crearArbol(a^.hi, ra)
		else
			crearArbol(a^.hd, ra);
	end;
	
	procedure insertarOrdenado(var l: lista; ca: compraAGuardar);
	var
		nue, ant, act: lista;
	begin
		new(nue);
		nue^.datoLista:= ca;
		ant:= l;
		act:= l;
		while( (act <> nil) and (ca.dia > l^.datoLista.dia) ) do begin
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
	c: compra;
	ra: registroArbol;
	puntero: arbol;
begin
	a:= nil;
	writeln('Se lee la informacion de cada compra');
	writeln;
	leerCompra(c);
	while(c.cantidadProductos <> 0) do begin
		puntero:= buscar(a, c.codigoCliente);
		crearRegistro(c, ra);
		if(puntero = nil) then
			crearArbol(a, ra)
		else
			insertarOrdenado(puntero^.datoArbol.listaCompras, ra.listaCompras^.datoLista);
		leerCompra(c);
	end;
end;
	
	
	
procedure imprimirArbolListas(a: arbol);

	procedure imprimir(a: arbol);
	
		procedure imprimirRegistroArbol(a: arbol);
		begin
			writeln('Para el codigo de cliente ', a^.datoArbol.codigoCliente, ' tiene las siguientes compras');
			while(a^.datoArbol.listaCompras <> nil) do begin
				writeln('Dia: ', a^.datoArbol.listaCompras^.datoLista.dia);
				writeln('Cantidad de productos: ', a^.datoArbol.listaCompras^.datoLista.cantidadProductos);
				writeln('Monto: ', a^.datoArbol.listaCompras^.datoLista.monto:2:2);
				writeln();
				a^.datoArbol.listaCompras:= a^.datoArbol.listaCompras^.sig;
			end;
		end;
	
	begin
		if(a <> nil) then begin
			imprimir(a^.hi);
			imprimirRegistroArbol(a);
			imprimir(a^.hd);
		end;
	end;

begin
	if(a <> nil) then begin
		writeln('Se imprime el arbol de listas');
		writeln;
		imprimir(a);
	end
	else
		writeln('El arbol esta vacio');
end;
	
	
var
	a: arbol;
begin
	Randomize;
	
	generarArbolListas(a);
	
	writeln('----------------------------------------');
	
	imprimirArbolListas(a);
end.
