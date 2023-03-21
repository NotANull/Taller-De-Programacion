program parcial1;

type

	rangoObras = 1..5;

	paciente = record
		dni: integer;
		codPaciente: integer;
		obraSocial: rangoObras;
		costoAbonado: real;
	end;
		
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: paciente;
		hi: arbol;
		hd: arbol;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: integer;
		sig: lista;
	end;

//--------------------COMIENZO DE LOS MÉTODOS--------------------\\



//--------------------COMIENZO DEL INCISO A--------------------\\
procedure generarArbol(var a: arbol);

	procedure leerPaciente(var p: paciente);
	begin
		with p do begin
			dni:= random(6); //Random entre 0 y 5
			writeln('Dni del paciente: ', dni);
			if(dni <> 0) then begin
				codPaciente:= random(500)+1; //Random entre 1 y 500
				writeln('Codigo del paciente: ', codPaciente);
				obraSocial:= random(5)+1; //Random entre 1 y 5
				writeln('Obra social del paciente: ', obraSocial);
				costoAbonado:= random(1000)+500; //Random entre 1000 y 1500
				writeln('Costo abonado del paciente: ', costoAbonado:2:2);
				writeln;
			end
			else
				writeln;
		end;
	end;
	
	procedure generarNodo(var a: arbol; p: paciente);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= p;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else if(p.dni < a^.dato.dni) then
			generarNodo(a^.hi, p)
		else
			generarNodo(a^.hd, p);
	end;

var
	p: paciente;
begin
	a:= nil;
	writeln('Se lee la informacion de cada paciente');
	writeln;
	leerPaciente(p);
	while(p.dni <> 0) do begin
		generarNodo(a, p);
		leerPaciente(p);
	end;
end;


//--------------------FIN DEL INCISO A--------------------\\




//--------------------COMIENZO DEL INCISO B--------------------\\

procedure generarLista(a: arbol; var l: lista);

	procedure generarListaCodigos(a: arbol; var l: lista; valorInferior, valorSuperior: integer);
	
		procedure crearNodo(var l: lista; codigoPaciente: integer);
		var
			nue, ant, act: lista;
		begin
			new(nue);
			nue^.dato:= codigoPaciente;
			ant:= l;
			act:= l;
			while( (act <> nil) and (codigoPaciente > act^.dato)) do begin
				ant:= act;
				act:= act^.sig;
			end;
			if(act = ant) then
				l:= nue
			else
				ant^.sig:= nue;
			nue^.sig:= act;
		end;
	
	begin
		if(a <> nil) then begin
			if(a^.dato.codPaciente > valorInferior) then begin
				if(a^.dato.codPaciente < valorSuperior) then begin
					crearNodo(l, a^.dato.codPaciente);
					generarListaCodigos(a^.hi, l, valorInferior, valorSuperior);
					generarListaCodigos(a^.hd, l, valorInferior, valorSuperior);
				end
				else
					generarListaCodigos(a^.hi, l, valorInferior, valorSuperior);
			end
			else
				generarListaCodigos(a^.hd, l, valorInferior, valorSuperior);
		end;
	end;

var
	dniDesde, dniHasta: integer;
begin
	l:= nil;
	if(a = nil) then
		writeln('El arbol esta vacio')
	else begin
		write('Ingrese dni desde: ');
		readln(dniDesde);
		write('Ingrese dni hasta: ');
		readln(dniHasta);
		generarListaCodigos(a, l, dniDesde, dniHasta)
	end;
end;


//--------------------FIN DEL INCISO B--------------------\\



//--------------------COMIENZO DEL INCISO C--------------------\\

procedure AumentarCostoPorSesion(var a: arbol);

	procedure aumentarCosto(a: arbol; monto: real);
	begin
		if(a <> nil) then begin
			aumentarCosto(a^.hi, monto);
			a^.dato.costoAbonado:= a^.dato.costoAbonado + monto;
			aumentarCosto(a^.hd, monto);
		end;
	end;

var
	monto: real;
begin
	if(a <> nil) then begin
		write('Ingrese el aumento del costo por sesion: ');
		readln(monto);
		aumentarCosto(a, monto);
	end
	else
		writeln('La lista esta vacia');
end;

//--------------------FIN DEL INCISO C--------------------\\




//--------------------PROGRAMA PRINCIPAL--------------------\\

var
	a: arbol;
	l: lista;
begin
	Randomize;
	
	generarArbol(a); //Inciso A
	
	generarLista(a, l); //Inciso B
	
	AumentarCostoPorSesion(a); //Inciso C

end.
