program parcialPizzeria;

type

	cadena10 = String[10];

	//Sólo para leer
	pedido = record
		dni: integer;
		nombre: cadena10;
		fecha: cadena10;
		monto: real;
	end;
	
	//Información que se va a guardar en la lista que pertenece al árbol
	informacionAGuardar = record
		fecha: cadena10;
		monto: real;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: informacionAGuardar;
		sig: lista;
	end;
	
	//Información que se va a guardar en el árbol
	pedidoAGuardar = record
		dni: integer;
		nombre: cadena10;
		cantPedidos: integer;
		informacion: lista;
	end;
	
	//Estructura principal
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: pedidoAGuardar;
		hi: arbol;
		hd: arbol;
	end;

//-------------------- MÉTODOS DE PRUEBA --------------------\\


procedure fechaRandom(i: integer; var fecha: cadena10);
var
	resultado: String;
begin
	case i of
		1: resultado:= '24/03';
		2: resultado:= '02/04';
		3: resultado:= '01/05';
		4: resultado:= '25/05';
		5: resultado:= '20/06';
		6: resultado:= '09/07';
	end;
	fecha:= resultado;
end;



procedure nombreRandom(i: integer; var nombre: cadena10);
var
	resultado: String;
begin
	case i of
		1: resultado:= 'Waldo';
		2: resultado:= 'Omar';
		3: resultado:= 'Sofia';
		4: resultado:= 'Robertino';
		5: resultado:= 'Caitlyn';
		6: resultado:= 'Ezequiel';
	end;
	nombre:= resultado;
end;



procedure imprimirArbol(a: arbol);

	procedure imprimirLista(l: lista);
	begin
		if(l <> nil) then begin
			imprimirLista(l^.sig);
			writeln('Monto: ', l^.dato.monto:2:2, ' - Fecha: ', l^.dato.fecha);
		end;
	end;

begin
	if(a <> nil) then begin
		imprimirArbol(a^.hi);
		writeln('Dni del cliente: ', a^.dato.dni);
		writeln('Nombre del cliente: ', a^.dato.nombre);
		writeln('Cantidad de pedidos hecho por el cliente: ', a^.dato.cantPedidos);
		imprimirLista(a^.dato.informacion);
		writeln;
		imprimirArbol(a^.hd);
	end;
end;


//-------------------- FIN MÉTODOS DE PRUEBA --------------------\\




















procedure generarArbol(var a: arbol);

	procedure leerPedido(var p: pedido);
	begin
		with p do begin
			monto:= random(16); //Random entre 0 y 15
			writeln('Monto: ', monto:2:2);
			if(monto <> 0) then begin
				dni:= random(11);
				writeln('Dni del cliente: ', dni);
				nombreRandom(random(6)+1, nombre);
				writeln('Nombre del cliente: ', nombre);
				fechaRandom(random(6)+1, fecha);
				writeln('Fecha: ', fecha);
				writeln;
			end
			else
				writeln;
		end;
	end;
	
	procedure crearNodo(var a: arbol; p: pedido);
	
		procedure armarRegistroAGuardar(var aGuardar: informacionAGuardar; p: pedido);
		begin
			aGuardar.fecha:= p.fecha;
			aGuardar.monto:= p.monto;
		end;
		
		procedure agregarAdelante(var l: lista; aGuardar: informacionAGuardar);
		var
			nue: lista;
		begin
			new(nue);
			nue^.dato:= aGuardar;
			nue^.sig:= l;
			l:= nue;
		end;
	
	var
		aGuardar: informacionAGuardar;
	begin
		if(a = nil) then begin
			new(a);
			a^.dato.dni:= p.dni;
			a^.dato.nombre:= p.nombre;
			a^.dato.cantPedidos:= 1;
			armarRegistroAGuardar(aGuardar, p);
			agregarAdelante(a^.dato.informacion, aGuardar);
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else
			if(p.dni = a^.dato.dni) then begin
				a^.dato.cantPedidos:= a^.dato.cantPedidos + 1;
				armarRegistroAGuardar(aGuardar, p);
				agregarAdelante(a^.dato.informacion, aGuardar);
			end
			else if(p.dni < a^.dato.dni) then
				crearNodo(a^.hi, p)
			else
				crearNodo(a^.hd, p);
	end;

var
	p: pedido;
begin
	writeln('Se lee la informacion de cada pedido');
	writeln;
	leerPedido(p);
	while(p.monto <> 0) do begin
		crearNodo(a, p);
		leerPedido(p);
	end;
end;





procedure informarCantidadFechas(a: arbol);

	procedure recorrerArbol(a: arbol; fechasPedido: cadena10; var total: integer);
	
		function contar(l: lista; fechasPedido: cadena10): integer;
		begin
			if(l = nil) then
				contar:= 0
			else
				if(fechasPedido = l^.dato.fecha) then
					contar:= ( contar(l^.sig, fechasPedido) + 1 )
				else
					contar:= contar(l^.sig, fechasPedido);
		end;
	
	begin
		if(a <> nil) then begin
			recorrerArbol(a^.hi, fechasPedido, total);
			total:= total + contar(a^.dato.informacion, fechasPedido);
			recorrerArbol(a^.hd, fechasPedido, total);
		end;
	end;

var
	fechasPedidoABuscar: cadena10;
	total: integer;
begin
	writeln;
	if(a <> nil) then begin
		total:= 0;
		fechaRandom(random(6)+1, fechasPedidoABuscar);
		writeln('Buscar pedidos con fecha ', fechasPedidoABuscar);
		recorrerArbol(a, fechasPedidoABuscar, total);
		if(total > 0) then
			writeln('Hay ', total, ' pedido/s')
		else
			writeln('No hay pedidos con esa fecha');
	end
	else
		writeln('El arbol esta vacio');
end;


procedure informarPedidoClienteDni(a: arbol);

	function recorrerArbol(a: arbol; clienteDniABuscar: integer): arbol;
	begin
		if(a = nil) then
			recorrerArbol:= nil
		else
			if(clienteDniABuscar = a^.dato.dni) then
				recorrerArbol:= a
			else if(clienteDniABuscar < a^.dato.dni) then
				recorrerArbol:= recorrerArbol(a^.hi, clienteDniABuscar)
			else
				recorrerArbol:= recorrerArbol(a^.hd, clienteDniABuscar);
	end;
	
	function recorrerLista(l: lista): real;
	begin
		if(l = nil) then
			recorrerLista:= 0
		else
			recorrerLista:= (l^.dato.monto + recorrerLista(l^.sig) );
	end;

var
	clienteDniABuscar: integer;
	nodo: arbol;
begin
	writeln;
	if(a <> nil) then begin
		clienteDniABuscar:= random(11);
		writeln('Se busca al cliente con DNI ', clienteDniABuscar);
		nodo:= recorrerArbol(a, clienteDniABuscar);
		if(nodo <> nil) then begin
			writeln('Total de pedidos: ', nodo^.dato.cantPedidos, ' - debe abonar: $', recorrerLista(nodo^.dato.informacion):2:2);
		end
		else
			writeln('No se encuentra al cliente con ese DNI');
	end
	else
		writeln('El arbol esta vacio');
end;


var
	a: arbol;
begin
	randomize;
	generarArbol(a);
	informarCantidadFechas(a);
	writeln;
	imprimirArbol(a);
	informarPedidoClienteDni(a);
end.
