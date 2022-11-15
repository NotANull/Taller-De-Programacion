program punto3;

const

	dimF = 10;
	
type

	rangoRubro = 1..dimF;

	producto = record
		codigo: integer;
		rubro: rangoRubro;
		stock: integer;
		precioUnitario: real;
	end;
	
	productoAGuardar = record
		codigo: integer;
		stock: integer;
		precioUnitario: real;
	end;
	
	arbol = ^nodoA;
	nodoA = record
		dato: productoAGuardar;
		hi: arbol;
		hd: arbol;
	end;
	
	arrayArboles = array [rangoRubro] of arbol;
	
	productoCodMayor = record
		codigo: integer;
		stock: integer;
	end;
	
	arrayCodigos = array [rangoRubro] of productoCodMayor;
	
	arrayContador = array [rangoRubro] of integer;
	
	
	
	
//--------------------COMIENZO DE LOS MÉTODOS--------------------\\






//--------------------INCISO A--------------------\\
procedure generarArrayArboles(var aa: arrayArboles);

	procedure inicializarArrayArboles(var aa: arrayArboles);
	var
		i: integer;
	begin
		for i:= 1 to dimF do
			aa[i]:= nil;
	end;
	
	procedure leerProducto(var p: producto);
	begin
		with p do begin
			codigo:= random(22)-1; //Random entre -1 y 20
			writeln('Codigo ingresado: ', codigo);
			if(codigo <> -1) then begin
				rubro:= random(10)+1; //Random entre 1 y 10
				writeln('Rubro ingresado: ', rubro);
				stock:= random(16); //Random entre 0 y 15
				writeln('Stock ingresado: ', stock);
				precioUnitario:= random(501); //Random entre 0 y 500
				writeln('Precio unitario ingresado: ', precioUnitario:2:2);
				writeln;
			end;
		end;
	end;
	
	procedure guardarProducto(p: producto; var pa: productoAGuardar);
	begin
		pa.codigo:= p.codigo;
		pa.stock:= p.stock;
		pa.precioUnitario:= p.precioUnitario;
	end;
	
	procedure crearArbol(var a: arbol; pa: productoAGuardar);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= pa;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else if(pa.codigo < a^.dato.codigo) then
			crearArbol(a^.hi, pa)
		else
			crearArbol(a^.hd, pa);
	end;

var
	p: producto;
	pa: productoAGuardar;
begin
	inicializarArrayArboles(aa);
	writeln('Se lee la informacion de cada producto');
	writeln;
	leerProducto(p);
	guardarProducto(p, pa);
	while(pa.codigo <> -1) do begin
		crearArbol(aa[p.rubro], pa);
		leerProducto(p);
		guardarProducto(p, pa);
	end;
end;
//--------------------FIN INCISO A--------------------\\









//--------------------INCISO B--------------------\\
procedure buscarCodigo(aa: arrayArboles);

	function buscarEnArbol(a: arbol; codigo: integer): boolean;
	begin
		if(a = nil) then
			buscarEnArbol:= false
		else if(codigo = a^.dato.codigo) then
			buscarEnArbol:= true
		else if(codigo < a^.dato.codigo) then
			buscarEnArbol:= buscarEnArbol(a^.hi, codigo)
		else
			buscarEnArbol:= buscarEnArbol(a^.hd, codigo);
			
	end;

var
	buscarEnRubro, codigoABuscar: integer;
begin
	buscarEnRubro:= random(10)+1; //Random entre 1 y 10
	codigoABuscar:= random(11); //Random entre 0 y 10
	writeln('Se busca el codigo ', codigoABuscar, ' en el rubro ', buscarEnRubro);
	
	if(aa[buscarEnRubro] = nil) then
		writeln('No hay productos en el rubro ', buscarEnRubro)
	else if(buscarEnArbol(aa[buscarEnRubro], codigoABuscar)) then
		writeln('El codigo ', codigoABuscar, ' se encuentra en el rubro ', buscarEnRubro)
	else
		writeln('No se encuentra el codigo');
		
end;
//--------------------FIN INCISO B--------------------\\





//--------------------INCISO C--------------------\\
procedure codigosMayores(aa: arrayArboles);

	procedure inicializarArrayCodigos(var ac: arrayCodigos);
	var
		i: integer;
	begin
		for i:= 1 to dimF do begin
			ac[i].codigo:= -1;
			ac[i].stock:= -1;
		end;
	end;
	
	procedure buscarMayores(a: arbol; var dato: productoCodMayor);
	begin
		if(a^.hd <> nil) then
			buscarMayores(a^.hd, dato)
		else begin
			dato.codigo:= a^.dato.codigo;
			dato.stock:= a^.dato.stock;
		end;
	end;
	
	procedure imprimirMayores(ac: arrayCodigos);
	var
		i: integer;
	begin
		for i:= 1 to dimF do begin
			if(ac[i].codigo <> -1) then begin
				writeln('Codigo de producto con codigo mayor del rubro ', i, ': ', ac[i].codigo);
				writeln('Stock de Producto con codigo mayor del rubro ', i, ': ', ac[i].stock);
				writeln;
			end
			else begin
				writeln('No hubo productos en el rubro ', i);
				writeln;
			end;
		end;
	end;

var
	ac: arrayCodigos;
	i: integer;
begin
	inicializarArrayCodigos(ac);
	for i:= 1 to dimF do begin
		if(aa[i] <> nil) then
			buscarMayores(aa[i], ac[i]);
	end;
	//imprimirMayores(ac);
end;
//--------------------FIN INCISO C--------------------\\









procedure contarProductos(aa: arrayArboles);

	procedure inicializarArrayContador(var ac: arrayContador);
	var
		i: integer;
	begin
		for i:= 1 to dimF do
			ac[i]:= 0;
	end;
	
	procedure ingresarValoresInfSup(var inf, sup: integer);
	begin
		inf:= random(21); //Random entre 0 y 20
		sup:= random(21); //Random entre 0 y 20
		
		if(inf > sup) then begin
			inf:= sup;
			sup:= inf;
		end;
			
		writeln('Se busca codigos entre ', inf, ' y ', sup);
	end;
	
	procedure contar(a: arbol; var cant: integer; inf, sup: integer);
	begin
		if(a <> nil) then begin
			if(a^.dato.codigo > inf) then begin
				if(a^.dato.codigo < sup) then begin
					cant:= cant + 1;
					contar(a^.hi, cant, inf, sup);
					contar(a^.hd, cant, inf, sup);
				end
				else
					contar(a^.hi, cant, inf, sup);
			end
			else
				contar(a^.hd, cant, inf, sup);
		end;
	end;
	
	procedure imprimirArrayContador(ac: arrayContador; aa: arrayArboles; inf, sup: integer);
	var
		i: integer;
	begin
		writeln('Se imprime la cantidad de codigos entre ', inf, ' y ', sup);
		writeln;
		for i:= 1 to dimF do begin
			if(aa[i] <> nil) then begin
				if(ac[i] <> 0) then begin
					writeln('Para el rubro ', i, ' hubo ', ac[i], ' cantidad de codigos');
					writeln;
				end
				else begin
					writeln('No se contaron codigos en el rubro ', i);
					writeln;
				end;
			end
			else begin
				writeln('No se encontraron codigos de producto ya que no hubo productos en el rubro ', i);
				writeln;
			end;
		end;
	end;

var
	ac: arrayContador;
	inferior, superior: integer;
	i: integer;
begin
	inicializarArrayContador(ac);
	
	ingresarValoresInfSup(inferior, superior);
	
	for i:= 1 to dimF do begin
		if(aa[i] <> nil) then
			contar(aa[i], ac[i], inferior, superior);
	end;
		
	imprimirArrayContador(ac, aa, inferior, superior);
end;









//--------------------FIN DE LOS MÉTODOS--------------------\\
	
	
	
	
	

var
	aa: arrayArboles;
begin
	Randomize;
	
	generarArrayArboles(aa); //Inciso A
	
	writeln('----------------------------------------');
	
	buscarCodigo(aa); //Inciso B
	
	writeln('----------------------------------------');
	
	codigosMayores(aa); //Inciso C
	
	writeln('----------------------------------------');
	
	contarProductos(aa); //Inciso D
end.
