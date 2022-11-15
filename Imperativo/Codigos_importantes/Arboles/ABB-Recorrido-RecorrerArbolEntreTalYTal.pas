program cualquiera;

type

	{participanteLista = record
		codigo: integer;
		codigoCiudad: integer;
		edad: integer;
	end;}

	participanteArbol = record
		codigo: integer;
		codigoCiudad: integer;
		edad: integer;
	end;

	arbol = ^nodoA;
	nodoA = record
		dato: participanteArbol;
		hi: arbol;
		hd: arbol;
	end;
	
	lista = ^nodoL;
	nodoL = record
		dato: integer;
		sig: lista;
	end;


//--------------------PROCEDIMIENTOS Y/O FUNCIONES--------------------\\

procedure crearArbol(var a: arbol);

	procedure leerParticipante(var p: participanteArbol);
	begin
		with p do begin
			codigoCiudad:= random(10)-1;
			writeln('Codigo de ciudad de origen: ', codigoCiudad);
			if(codigoCiudad <> -1) then begin
				codigo:= random(51); //numero random entre 0 y 50
				writeln('Codigo de participante: ', codigo);
				edad:= random(90)+18;
				writeln('Edad del participante ', edad);
				writeln();
			end;
		end;
	end;
	
	procedure crearNodo(var a: arbol; p: participanteArbol);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= p;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else if(p.codigo < a^.dato.codigo) then
			crearNodo(a^.hi, p)
		else
			crearNodo(a^.hd, p);
	end;

var
	p: participanteArbol;
begin
	writeln('Se lee la informacion de los participantes');
	leerParticipante(p);
	while(p.codigoCiudad <> -1) do begin
		crearNodo(a, p);
		leerParticipante(p);
	end;
end;

procedure calcularCantCodigos(a: arbol; var cantCodigos: integer; n1, n2: integer);
begin
	if(a <> nil) then begin
		if( (a^.dato.codigo > n1) and (a^.dato.codigo < n2) ) then begin
			cantCodigos:= cantCodigos + 1;
			calcularCantCodigos(a^.hi, cantCodigos, n1, n2);
			calcularCantCodigos(a^.hd, cantCodigos, n1, n2);
		end
		else begin
			if(a^.dato.codigo < n1) then
				calcularCantCodigos(a^.hd, cantCodigos, n1, n2)
			else
				calcularCantCodigos(a^.hi, cantCodigos, n1, n2);
		end;
	end;
end;



//--------------------PROGRAMA PRINCIPAL--------------------\\
var
	a: arbol;
	cantCodigosComprendidos: integer;
begin
	a:= nil;
	cantCodigosComprendidos:= 0;
	
	Randomize;
	
	crearArbol(a);
	
	writeln();
	
	calcularCantCodigos(a, cantCodigosComprendidos, 20, 35);
	writeln('Cantidad de participantes cuyos codigos estan comprendidos entre 20 y 35: ', cantCodigosComprendidos);
	
end.

