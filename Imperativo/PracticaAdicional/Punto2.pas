program punto2;

const

	dimF = 2018;

type

	str10 = String[10];
	rangoAnio = 2010..dimF;

	auto = record
		patente: str10;
		anioFabricacion: rangoAnio;
		marca: str10;
		modelo: str10;
	end;
	
	autoAguardar = record 
		patente:str10;
		marca:str10;
		modelo:str10;
	end;
	
	arbol = ^nodoA;
	nodoA = record
		dato: auto;
		hi: arbol;
		hd: arbol;
	end;

	listaAutos = ^nodoL;
	nodoL = record
		dato: autoAguardar;
		sig: listaAutos;
	end;

	arrayListas = array[rangoAnio] of listaAutos;










//--------------------MÉTODOS DE PRUEBA--------------------\\
procedure imprimirArrayListas(a: arrayListas);
var
	i: integer;
begin
	writeln('Se imprime el arreglo de listas');
	writeln;
	for i:= 2010 to dimF do begin
		if(a[i] <> nil) then begin
			writeln('**********AUTOS VENDIDOS EN EL ANIO ', i, '**********');
			while(a[i] <> nil) do begin
				writeln('Patente del auto: ', a[i]^.dato.patente);
				writeln('Anio de fabricacion: ', a[i]^.dato.anioFabricacion);
				writeln('Marca del auto: ', a[i]^.dato.marca);
				writeln('Marca del auto: ', a[i]^.dato.modelo);
				writeln;
				a[i]:= a[i]^.sig;
			end;
		end
		else begin
			writeln('No se vendieron autos en el anio ', i);
			writeln;
		end;
	end;
end;
//--------------------FIN MÉTODOS DE PRUEBA--------------------\\











procedure randomString(tamanio:integer; var palabra:string);
var  str,Result: String;
begin
	str:='QRSTUVWXYZ';
	Result:='';
	repeat
		Result:=Result+str[Random(Length(str))+1];
	until(Length(Result)=tamanio);
	palabra:=Result;
end;






//--------------------COMIENZO DE LOS MÉTODOS--------------------\\




//--------------------Inciso A--------------------\\
procedure generarArbol(var a: arbol);

	procedure leerAuto(var au: auto);
	begin
		with au do begin
			randomString(1,patente);
			writeln('Patente del auto: ', patente);
			if(patente <> 'Z') then begin
				anioFabricacion:= random(8)+2010; //Random entre 2010 y 2018
				writeln('Anio de fabricacion: ', anioFabricacion);
				randomString(1, marca);
				writeln('Marca del auto: ', marca);
				randomString(5, modelo);
				writeln('Marca del auto: ', modelo);
				writeln;
			end;
		end;
	end;

	procedure crearNodo(var a: arbol; au: auto);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= au;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else if(au.patente < a^.dato.patente) then
			crearNodo(a^.hi, au)
		else
			crearNodo(a^.hd, au);
	end;

var
	au: auto;
begin
	a:= nil;
	writeln('Se lee la informacion de cada auto');
	writeln;
	leerAuto(au);
	while(au.patente <> 'Z') do begin
		crearNodo(a, au);
		leerAuto(au);
	end;
end;
//--------------------Fin Inciso A--------------------\\








//--------------------Inciso B--------------------\\
procedure cantMarcaAutos(a: arbol);

	procedure buscarEnArbol(a: arbol; marcaABuscar: str10; var totalAutos: integer);
	begin
		if(a <> nil) then begin
			if(a^.dato.marca = marcaABuscar) then
				totalAutos:= totalAutos + 1;
			buscarEnArbol(a^.hi, marcaABuscar, totalAutos);
			buscarEnArbol(a^.hd, marcaABuscar, totalAutos);
		end;
	end;

var
	cantAutos: integer;
	marcaABuscar: str10;
begin
	cantAutos:= 0;
	
	randomString(1, marcaABuscar);
	writeln('Se busca la marca del auto: ', marcaABuscar);
	
	buscarEnArbol(a, marcaABuscar, cantAutos);
	
	if(a = nil) then
		writeln('La lista esta vacia')
	else if(cantAutos = 0) then
		writeln('No se encontraron autos con la marca ', marcaABuscar)
	else
		writeln('Hay ', cantAutos ,' autos con la marca ', marcaABuscar);
end;
//--------------------Fin Inciso B--------------------\\







//--------------------Inciso C--------------------\\
procedure GenerarArrayListas(a: arbol);

	procedure inicializarArrayListas(var al: arrayListas);
	var
		i: integer;
	begin
		for i:= 2010 to dimF do
			al[i]:= nil;
	end;
	
	procedure recorrerArbol(a: arbol; var al: arrayListas);
	
		procedure insertarOrdenado(var l: listaAutos; a: auto);
		var
			nue, ant, act: listaAutos;
		begin
			new(nue);
			nue^.dato:= a;
			ant:= l;
			act:= l;
			while( (act <> nil) and (a.patente > act^.dato.patente) ) do begin
				ant:= act;
				act:= act^.sig
			end;
			if(ant = act) then
				l:= nue
			else
				ant^.sig:= nue;
			nue^.sig:= act;
		end;
		procedure formatearRegistro(a:auto;var aug:autoAguardar);
		begin
			aug.patente:=a.patente;
			aug.marca:=a.marca;
			aug.modelo:=a.modelo;
		end;
	var aug:autoAguardar;
	begin
		if(a <> nil) then begin
			formatearRegistro(a^.dato,aug);           //quito el año de fabricacion antes de guardar el auto;
			insertarOrdenado(al[a^.dato.anioFabricacion], aug);   //guardo el auto sin el año
			recorrerArbol(a^.hi, al);
			recorrerArbol(a^.hd, al);
		end;
	end;

var
	al: arrayListas;
begin
	inicializarArrayListas(al);
	recorrerArbol(a, al);
	//imprimirArrayListas(al); //Sólo de prueba
end;
//--------------------Fin Inciso C--------------------\\









//--------------------Inciso D--------------------\\
procedure buscarPatente(a: arbol);

	{function buscarEnArbol(a: arbol; patenteABuscar: str10): boolean;     
	begin
		if(a = nil) then
			buscarEnArbol:= false
		else if(patenteABuscar = a^.dato.patente) then
			buscarEnArbol:= true
		else if(patenteABuscar < a^.dato.patente) then
			buscarEnArbol:= buscarEnArbol(a^.hi, patenteABuscar)
		else
			buscarEnArbol:= buscarEnArbol(a^.hd, patenteABuscar)
	end;
	}
	function buscarEnArbol(a:arbol; patenteABuscar:str10):integer;
	begin
		if(a=nil)then 
			buscarEnArbol:=-1
			else if(a^.dato.patente=patenteABuscar)then
				buscarEnArbol:=a^.dato.anioFabricacion
			else if(patenteABuscar<a^.dato.patenteABuscar)then
				buscarEnArbol:=buscarEnArbol(a^.hi,patenteABuscar)
				else buscarEnArbol:=buscarEnArbol(a^.hd,patenteABuscar);
	end;

var
	patenteABuscar: str10;
begin
	randomString(1, patenteABuscar);
	writeln('Se busca la patente del auto: ', patenteABuscar);
	aniodeFabricacionEncontrado:=buscarEnArbol(a,patenteABuscar);    //la consigna pide el año de fabricacion de la patente a buscar...
	if(a = nil) then 
		writeln('El arbol esta vacio')
	else if(aniodeFabricacionEncontrado = -1) then
		writeln('la patente no se encuentra en el arbol')
	else
		writeln('Anio de fabricacion de patente',patenteABuscar,' = ',aniodeFabricacionEncontrado);
end;
//--------------------Fin Inciso D--------------------\\









//--------------------FIN DE LOS MÉTODOS--------------------\\




var
	a: arbol;
begin
	Randomize;

	generarArbol(a); //Iniciso A
	
	writeln('----------------------------------------');
	
	cantMarcaAutos(a); //Inciso B
	
	writeln('----------------------------------------');
	
	GenerarArrayListas(a); //Inciso C
	
	writeln('----------------------------------------');
	
	buscarPatente(a); //Inciso D
end.
