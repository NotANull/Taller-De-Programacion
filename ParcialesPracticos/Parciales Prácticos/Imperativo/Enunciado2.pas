program parcial2;

const
	
	dimF = 100;

type

	rangoObra = 1..5;

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
	
	regArray = record
		dni: integer;
		codigoPaciente: integer;
	end;
	
	arrayPacientes = array [1..dimF] of regArray;
	
	
//--------------------COMIENZO DE LOS MÉTODOS--------------------\\
	



//--------------------COMIENZO DEL INCISO A--------------------\\
procedure generarArbol(var a: arbol);

	procedure leerPaciente(var p: paciente);
	begin
		with p do begin
			dni:= random(16); //Random entre 0 y 15
			writeln('Dni del paciente: ', dni);
			if(dni <> 0) then begin
				codigoPaciente:= random(500)+1; //Random entre 1 y 500
				writeln('Codigo del paciente: ', codigoPaciente);
				obraSocial:= random(5)+1; //Random entre 1 y 5
				writeln('Obra social del paciente: ', obraSocial);
				costoAbonado:= random(1000)+500; //Random entre 500 y 1500
				writeln('Costo abonado del paciente: ', costoAbonado:2:2);
				writeln();
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
	writeln('Se lee la informacion de cada paciente');
	writeln;
	leerPaciente(p);
	while(p.dni <> 0) do begin
		crearNodo(a, p);
		leerPaciente(p);
	end;
end;
//--------------------FIN INCISO A--------------------\\



//--------------------COMIENZO DEL INCISO C--------------------\\
procedure aumentarCostoPaciente(var a: arbol);

	function buscarCodigo(a: arbol; codigo: integer): arbol;
	begin
		if(a = nil) then
			buscarCodigo:= nil
		else if(a^.dato.codigoPaciente = codigo) then
			buscarCodigo:= a
		else if(codigo < a^.dato.codigoPaciente) then
			buscarCodigo:= buscarCodigo(a^.hi, codigo)
		else
			buscarCodigo:= buscarCodigo(a^.hd, codigo);
	end;

var
	monto: real;
	codigoPacienteABuscar: integer;
	arbolPaciente: arbol;
begin
	writeln;
	if(a <> nil) then begin
		write('Ingrese el codigo de paciente que se busca: ');
		readln(codigoPacienteABuscar);
		arbolPaciente:= buscarCodigo(a, codigoPacienteABuscar);
		if(arbolPaciente <> nil) then begin
			writeln('El paciente se encuentra en el arbol');
			monto:= random(1000)+500; //Random entre 500 y 1500
			writeln('Aumento del costo para el paciente: ', monto:2:2);
			arbolPaciente^.dato.costoAbonado:= arbolPaciente^.dato.costoAbonado + monto;
			writeln('El paciente debera abonar junto con el aumento un total de: ', arbolPaciente^.dato.costoAbonado:2:2);
		end
		else
			writeln('El paciente no se encuentra en el arbol');
	end
	else
		writeln('El arbol esta vacio');
end;
//--------------------FIN INCISO C--------------------\\


	
var
	a: arbol;
begin
	Randomize;
	
	generarArbol(a); //Inciso A
	
	aumentarCostoPaciente(a); //Inciso C
end.
