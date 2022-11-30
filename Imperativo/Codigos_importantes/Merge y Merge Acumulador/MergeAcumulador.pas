program cualquiera;

const

	dimF = 4;
	
type
	
	venta = record
		codVenta: integer;
		codProducto: integer;
		cantProdVendido: integer;
	end;
	
	regMerge = record
		codProducto: integer;
		cantTotalProdVendido: integer;
	end;
	
	listaMerge = ^nodoMerge;
	nodoMerge = record
		dato: regMerge;
		sig: listaMerge;
	end;

	lista = ^nodo;
	nodo = record
		dato: venta;
		sig: lista;
	end;

	vector = array [1..dimF] of lista;
	
	
//----------COMIENZO DEL MÉTODO PARA INICIALIZAR EL VECTOR DEL LISTAS----------\\
procedure inicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to dimF do
		v[i]:= nil;
end;
//----------FIN DEL MÉTODO----------\\


//----------COMIENZO DEL MÉTODO PARA CARGAR EL VECTOR DEL LISTAS----------\\
procedure cargarVector(var v: vector);


	//__________Comienzo del método para leer una venta(valores random para prueba rápida)__________\\
	procedure leerVenta(var ve: venta);
	begin
		with ve do begin
			codVenta:= random(11); //Numero random entre 0 y 10
			writeln('Codigo de venta: ', codVenta);
			if(codVenta <> 0) then begin
				codProducto:= random(10)+1;
				writeln('Codigo de producto: ', codProducto);
				cantProdVendido:= random(100)+1;
				writeln('Cantidad de productos vendidos: ', cantProdVendido);
				writeln();
			end;
		end;
	end;
	//__________Fin del método__________\\
	
	
	
	
	//__________Comienzo del método para leer una venta(se ingresan a mano los valores)__________\\
	procedure leerVenta2(var ve: venta);
	begin
		with ve do begin
			
			write('Ingrese el codigo de venta: ');
			readln(codVenta);
			if(codVenta <> 0) then begin
				
				write('Ingrese el codigo de producto: ');
				readln(codProducto);
				
				write('Ingrese la cantidad de productos vendidos: ');
				readln(cantProdVendido);
				writeln();
			end;
		end;
	end;
	//__________Fin del método__________\\
	
	
	
	
	//__________Comienzo del método para insertar ordenado un elemento en la lista__________\\
	procedure insertarOrdenado(var L:lista; ve: venta);
	var
		nue: lista;
		act, ant: lista; {punteros auxiliares para recorrido}
	begin
		new (nue);
		nue^.dato := ve;
		act := L; {ubico act y ant al inicio de la lista}
		ant := L;
		while( ( act <> nil ) and ( act^.dato.codProducto < ve.codProducto ) ) do begin //ordenar de forma ascendente (menor a mayor)  <
			ant := act;																	//Ordenar de forma descendente (mayor a menor) >
			act:= act^.sig;
		end;
		if (act = ant) then {al inicio o lista vacía}
			L:= nue
		else {al medio o al final}
			ant^.sig:= nue;
		nue^.sig:= act;
	end;
	//__________Fin del método__________\\

var
	i: integer;
	ve: venta;
begin
	for i:= 1 to dimF do begin
		writeln('SE GENERA UNA LISTA EN LA POSICION ', i, ' DEL VECTOR');
		//leerVenta(ve); //Son números random que se leen (prueba rápida)
		leerVenta2(ve); //Ingreso yo a mano los datos
		while(ve.codVenta <> 0) do begin
			insertarOrdenado(v[i], ve);
			//leerVenta(ve); //Son números random que se leen (prueba rápida)
			leerVenta2(ve); //Ingreso yo a mano los datos
		end;
		writeln();
	end;
end;
//----------FIN DEL MÉTODO----------\\
	

//----------COMIENZO DEL MÉTODO PARA IMPRIMIR EL VECTOR DE LISTAS----------\\
procedure imprimirVectorListas(v: vector);


	procedure imprimirLista(l: lista);
	begin
		if(l <> nil) then begin
			while(l <> nil) do begin
				writeln('Codigo de venta: ', l^.dato.codVenta);
				writeln('Codigo de producto: ', l^.dato.codProducto);
				writeln('Cantidad de productos vendidos: ', l^.dato.cantProdVendido);
				writeln();
				l:= l^.sig;
			end;
			writeln();
		end
		else begin
			writeln('La lista esta vacia');
			writeln();
		end;
end;


var
	i: integer;
begin
	for i:= 1 to dimF do begin
		writeln('SE IMPRIME LA LISTA DE LA POSICION ' , i, ' DEL VECTOR');
		imprimirLista(v[i]);
	end;
end;
//----------FIN DEL MÉTODO----------\\


//----------COMIENZO DEL MÉTODO QUE HACE MERGE ACUMULADOR DE LAS LISTAS EN EL VECTOR----------\\
procedure mergeAcumulador(v: vector; var l: listaMerge);


	//__________Comienzo del submétodo para que me devuelva el código de producto más chico entre las lilstas__________\\
	procedure determinarMinimo(var v: vector; var regCodigoMinimo: venta);
	var
		i, indice: integer;
	begin
		regCodigoMinimo.codProducto:= 9999;
		indice:= -1;
		for i:= 1 to dimF do begin
			if( (v[i] <> nil) and (v[i]^.dato.codProducto <= regCodigoMinimo.codProducto) ) then begin
				regCodigoMinimo.codProducto:= v[i]^.dato.codProducto;
				regCodigoMinimo.cantProdVendido:= v[indice]^.dato.cantProdVendido;
				indice:= i;
			end;
		end;
		if(indice <> -1) then begin
			v[indice]:= v[indice]^.sig;
		end;
	end;
	//__________Fin del submétodo__________\\
	
	
	
	//__________Comienzo del método para agregar al final de la lista__________\\
	procedure agregarAtras(var l: listaMerge; var ult: listaMerge; dato: regMerge);
	var
		nue:listaMerge;
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
	//__________Fin del método__________\\
	


var
	regCodigoMinimo: venta;
	regActual: regMerge;
	ult: listaMerge;
begin
	ult:= nil;
	determinarMinimo(v, regCodigoMinimo);
	while(regCodigoMinimo.codProducto <> 9999) do begin
		regActual.codProducto:= regCodigoMinimo.codProducto;
		regActual.cantTotalProdVendido:= 0;
		while( (regCodigoMinimo.codProducto <> 9999) and (regActual.codProducto = regCodigoMinimo.codProducto) ) do begin
			regActual.cantTotalProdVendido:= regActual.cantTotalProdVendido + regCodigoMinimo.cantProdVendido;
			determinarMinimo(v, regCodigoMinimo);
		end;
		agregarAtras(l, ult, regActual);
	end;
end;
//----------FIN DEL MÉTODO----------\\


//----------COMIENZO DEL MÉTODO QUE IMPRIME LA LISTA HECHA CON MERGUE ACUMULADOR----------\\
procedure imprimirListaMerge(l: listaMerge);
begin
	while(l <> nil) do begin
		writeln('CODIGO DEL PRODUCTO: ', l^.dato.codProducto);
		writeln('CANTIDAD TOTAL DEL PRODUCTO VENDIDO: ', l^.dato.cantTotalProdVendido);
		writeln();
		l:= l^.sig;
	end;
end;
//----------FIN DEL MÉTODO----------\\



var
	v: vector;
	l: listaMerge;
begin
	Randomize;
	l:= nil;
	inicializarVector(v);
	cargarVector(v);
	
	writeln();
	
	imprimirVectorListas(v);
	
	writeln();
	
	mergeAcumulador(v, l);
	
	writeln();
	
	writeln('SE IMPRIME LA LISTA HECHA CON MERGE ACUMULADOR');
	imprimirListaMerge(l);
end.
	
