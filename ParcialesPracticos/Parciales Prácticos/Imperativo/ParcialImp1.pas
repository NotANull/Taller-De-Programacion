program parcial1;

const

	dimF = 500;
	
type

	rangoPlanes = 1..5;

	afiliado = record
		nAfiliado: integer;
		dni: integer;
		plan: rangoPlanes;
		anioIngreso: integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: afiliado;
		hi: arbol;
		hd: arbol;
	end;
	
	regArray = record
		nAfiliado: integer;
		dni: integer;
		plan: rangoPlanes;
	end;
	
	arrayAfiliados = array [1..dimF] of regArray;


//--------------------COMIENZO DE LOS MÉTODOS--------------------//



//Sé que se dispone pero es para prueba
procedure generarArbolAfiliados(var a: arbol);

	procedure leerAfiliado(var afi: afiliado);
	begin
		with afi do begin
			nAfiliado:= random(11); //Random entre 0 y 10
			writeln('Numero de afiliado: ', nAfiliado);
			if(nAfiliado <> 0) then begin
				dni:= random(1499)+1; //Random entre 1 y 1500
				writeln('Dni del afiliado: ', dni);
				plan:= random(5)+1; //Random entre 1 y 5
				writeln('Plan del afiliado: ', plan);
				anioIngreso:= random(32)+1990; //Random entre 1900 y 2022
				writeln('Anio de ingreso del afiliado: ', anioIngreso);
				writeln;
			end
			else
				writeln;
		end;
	end;
	
	procedure crearNodo(var a: arbol; afi: afiliado);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= afi;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else if(afi.nAfiliado < a^.dato.nAfiliado) then
			crearNodo(a^.hi, afi)
		else
			crearNodo(a^.hd, afi);
	end;

var
	afi: afiliado;
begin
	writeln('Se lee la informacion de cada afiliado');
	writeln;
	leerAfiliado(afi);
	while(afi.nAfiliado <> 0) do begin
		crearNodo(a, afi);
		leerAfiliado(afi);
	end;
end;





procedure generarArrayAfiliados(a: arbol);

	procedure generarArray(a: arbol; var af: arrayAfiliados; var dimL: integer; dniInf, dniSup: integer; nPlan: rangoPlanes);
	
		procedure generar(var af: arrayAfiliados; var dimL: integer; afiliado, nDni: integer; nPlan: rangoPlanes);
		begin
			if(dimL < dimF) then begin
				dimL:= dimL + 1;
				af[dimL].nAfiliado:= afiliado;
				af[dimL].dni:= nDni;
				af[dimL].plan:= nPlan;
			end;
		end;
	
	begin
		if(a <> nil) then begin
			if(a^.dato.dni > dniInf) then begin
				if(a^.dato.dni < dniSup) then begin
					if(a^.dato.plan = nPlan) then
						generar(af, dimL, a^.dato.nAfiliado, a^.dato.dni, a^.dato.plan);
					generarArray(a^.hi, af, dimL, dniInf, dniSup, nPlan);
					generarArray(a^.hd, af, dimL, dniInf, dniSup, nPlan);
				end
				else
					generarArray(a^.hi, af, dimL, dniInf, dniSup, nPlan);
			end
			else
				generarArray(a^.hd, af, dimL, dniInf, dniSup, nPlan);
		end;
	end;
	
	procedure ordenarArray(var af: arrayAfiliados; dimL: integer);
	var
		i, j: integer;
		actual: regArray;
	begin
		for i:= 2 to dimL do begin
			actual:= af[i];
			j:= i-1;
			while((j > 0) and (af[j].dni > actual.dni)) do begin
				af[j+1]:= af[j];
				j:= j-1;
			end;
			af[j+1]:= actual;
		end;
	end;

	procedure mostrarArray(af: arrayAfiliados; dimL: integer);
	var
		i: integer;
	begin
		writeln;
		writeln('====================ARREGLO ORDENADO POR DNI DEL AFILIADO====================');
		writeln;
		for i:= 1 to dimL do begin
			writeln('Dni del afiliado: ', af[i].dni);
			writeln('Numero de afiliado: ', af[i].nAfiliado);
			writeln('Plan del afiliado: ', af[i].plan);
			writeln;
		end;
	end;

var
	af: arrayAfiliados;
	dimL: integer;
	dni1, dni2: integer;
	plan: rangoPlanes;
begin
	if(a <> nil) then begin
		dimL:= 0;
		write('Ingrese dni desde: ');
		readln(dni1);
		write('Ingrese dni hasta: ');
		readln(dni2);
		write('Ingrese un plan, del 1 al 5: ');
		readln(plan);
		generarArray(a, af, dimL, dni1, dni2, plan);
		writeln('DimL', dimL);
		ordenarArray(af, dimL);
		mostrarArray(af, dimL); //Sólo de prueba
	end
	else
		writeln('El arbol esta vacio');
end;




var
	a: arbol;
begin
	Randomize;
	generarArbolAfiliados(a); //Se dispone
	generarArrayAfiliados(a);
end.
