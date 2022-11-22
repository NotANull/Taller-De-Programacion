program enunciado17;

const

	dimF = 5;

type

	rangoObra = 1..dimF;

	paciente = record
		dni: integer;
		codigoPaciente: integer;
		obraSocial: rangoObra;
		costoAbonado: real;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: paciente;
		hi: arbol;
		hd: arbol;
	end;
	
	arrayContador = array [rangoObra] of integer;
	
	



//-------------------MÉTODOS DE PRUEBA DE LOS INCISOS-------------------\\
procedure mostrarArbolEnOrden(a: arbol);
begin
	if(a <> nil) then begin
		mostrarArbolEnOrden(a^.hi);
		writeln('Dni del paciente: ', a^.dato.dni);
		writeln('Codigo del paciente: ', a^.dato.codigoPaciente);
		writeln('Obra social del paciente: ', a^.dato.obraSocial);
		writeln('Costo abonado del paciente: ', a^.dato.costoAbonado:2:2);
		writeln;
		mostrarArbolEnOrden(a^.hd);
	end;
end;

procedure mostrarArrayContador(ac: arrayContador);
var
	i: integer;
begin
	writeln('====================SE MUESTRA EL CONTENIDO DEL ARRAY CONTADOR====================');
	writeln;
	for i:= 1 to dimF do
		writeln('Obra social ', i, ': ', ac[i]);
end;
//-------------------FIN DE LOS MÉTODOS DE PRUEBA DE LOS INCISOS-------------------\\






	
//-------------------COMIENZO DE LOS MÉTODOS-------------------\\




//-------------------COMIENZO DEL INCISO A-------------------\\
procedure generarArbol(var a: arbol);

	procedure leerPaciente(var p: paciente);
	begin
		with p do begin
			dni:= random(16); //Random entre 0 y 15
			writeln('Dni del paciente: ', dni);
			if(dni <> 0) then begin
				codigoPaciente:= random(199)+1; //Random entre 1 y 200
				writeln('Codigo del paciente: ', codigoPaciente);
				obraSocial:= random(5)+1; //Random entre 1 y 5
				writeln('Obra social del paciente: ', obraSocial);
				costoAbonado:= random(500)+1000; //Random entre 1000 y 1500;
				writeln('Costo abonado del paciente: ', costoAbonado:2:2);
				writeln;
			end;
		end;
	end;
	
	procedure crearNodo(var a: arbol; p: paciente);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= p;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else if(p.codigoPaciente < a^.dato.codigoPaciente) then
			crearNodo(a^.hi, p)
		else
			crearNodo(a^.hd, p);
	end;

var
	p: paciente;
begin
	a:= nil;
	writeln('Se lee la informacion de cada paciente');
	writeln;
	leerPaciente(p);
	while(p.dni <> 0) do begin
		crearNodo(a, p);
		leerPaciente(p);
	end;
	writeln('====================SE MUESTRA EL CONTENIDO DEL ARBOL ORDENADO POR CODIGO DE PACIENTE====================');
	writeln;
	mostrarArbolEnOrden(a); //SÓLO DE PRUEBA!!!
end;
//-------------------FIN DEL INCISO A-------------------\\





//-------------------COMIENZO DEL INCISO B-------------------\\
procedure generarArregloContador(a: arbol);

	procedure procesarObraSocial(a: arbol; var ac: arrayContador);
	
		procedure contarObraSocial(nObra: integer; var ac: arrayContador);
		begin
			ac[nObra]:= ac[nObra] + 1;
		end;
	
	begin
		if(a <> nil) then begin
			procesarObraSocial(a^.hi, ac);
			contarObraSocial(a^.dato.obraSocial, ac);
			procesarObraSocial(a^.hd, ac);
		end;
	end;

	procedure inicializarArrayContador(var ac: arrayContador);
	var
		i: integer;
	begin
		for i:= 1 to dimF do
			ac[i]:= 0;
	end;

var
	ac: arrayContador;
begin
	if(a <> nil) then begin
		inicializarArrayContador(ac);
		procesarObraSocial(a, ac);
	end
	else begin
		writeln('El arbol esta vacio');
		writeln;
	end;
	mostrarArrayContador(ac); //SÓLO DE PRUEBA!!!
end;
//-------------------FIN DEL INCISO B-------------------\\




//-------------------COMIENZO DEL INCISO C-------------------\\
procedure calcularPacientes(a: arbol);

	procedure costosRandom(var rangoA, rangoB: integer);
	begin
		writeln;
		writeln('====================RANGO DEL COSTO ABONADO====================');
		rangoA:= random(1500)+700; //Random entre 700 y 1200
		rangoB:= random(1100)+1400; //Random entre 1400 y 2300
		if(rangoA < rangoB) then begin
			writeln('Costo abonado desde: ', rangoA);
			writeln('Costo abonado Hasta: ', rangoB);
			writeln;
		end
		else if(rangoB < rangoA) then begin
			rangoA:= rangoB;
			rangoB:= rangoA;
			writeln('Costo abonado desde: ', rangoA);
			writeln('Costo abonado Hasta: ', rangoB);
			writeln;
		end
		else begin
			writeln('Costo abonado desde: ', rangoA);
			writeln('Costo abonado Hasta: ', rangoB);
			writeln;
		end;
	end;
	
	procedure procesarCantidadCostoAbonado(a: arbol; valorInferior, valorSuperior: integer; var cantidad: integer);
	begin
		if(a <> nil) then begin
			if(a^.dato.costoAbonado > valorInferior) then begin
				if(a^.dato.costoAbonado < valorSuperior) then begin
					cantidad:= cantidad + 1;
					procesarCantidadCostoAbonado(a^.hi, valorInferior, valorSuperior, cantidad);
					procesarCantidadCostoAbonado(a^.hd, valorInferior, valorSuperior, cantidad);
				end
				else
					procesarCantidadCostoAbonado(a^.hi, valorInferior, valorSuperior, cantidad);
			end
			else
				procesarCantidadCostoAbonado(a^.hd, valorInferior, valorSuperior, cantidad);
		end;
	end;

var
	cantidadPacientes: integer;
	costoAbonadoDesde: integer;
	costoAbonadoHasta: integer;
begin
	if(a <> nil) then begin
		cantidadPacientes:= 0;
		costosRandom(costoAbonadoDesde, costoAbonadoHasta);
		procesarCantidadCostoAbonado(a, costoAbonadoDesde, costoAbonadoHasta, cantidadPacientes);
	end
	else begin
		writeln('El arbol esta vacio');
		writeln;
	end;
	writeln;
	writeln('Cantidad de pacientes cuyo costo abonado esta comprendido entre valores es de ', cantidadPacientes);
end;
//-------------------FIN DEL INCISO C-------------------\\

	
var
	a: arbol;
begin
	Randomize;

	generarArbol(a); //Inciso A
	
	generarArregloContador(a); //Inciso B
	
	calcularPacientes(a); //Inciso C
end.
