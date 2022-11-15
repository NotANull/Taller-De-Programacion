program punto1;

const

	dimF = 300;
	
type

	oficina = record
		codigoId: integer;
		dniPropietario: integer;
		valorExpensa: real
	end;
	
	arrayOficinas = array [1..dimF] of oficina;
	





//--------------------MÉTODOS DE PRUEBA--------------------\\
procedure mostrarArrayOrdenado(af: arrayOficinas; dimL: integer);
var
	i: integer;
begin
	writeln('Se imprime el arreglo ordenado por codigo de identificacion');
	writeln;
	for i:= 1 to dimL do begin
		writeln('Codigo de identificacion: ', af[i].codigoId);
		writeln('DNI del propietario: ', af[i].dniPropietario);
		writeln('Valor de expensa de la oficina: ', af[i].valorExpensa:2:2);
		writeln;
	end;
end;
//--------------------FIN MÉTODOS DE PRUEBA--------------------\\







//--------------------COMIENZO DE LOS MÉTODOS--------------------\\





//--------------------Inciso A--------------------\\
procedure generarArrayOficinas(var af: arrayOficinas; var dimL: integer);

	procedure leerOficina(var o: oficina);
	begin
		with o do begin
			codigoId:= random(7)-1; //Random entre -1 y 5
			writeln('Codigo de identificacion: ', codigoId);
			if(codigoId <> -1) then begin
				dniPropietario:= random(501); //Random entre 0 y 500
				writeln('DNI del propietario: ', dniPropietario);
				valorExpensa:= random(1501); //Random entre 0 y 1500
				writeln('Valor de expensa de la oficina: ', valorExpensa:2:2);
				writeln();
			end;
		end;
	end;

var
	o: oficina;
begin
	dimL:= 0;
	writeln('Se lee la informacion de cada oficina');
	writeln;
	leerOficina(o);
	while( (dimL < dimF) and (o.codigoId <> -1) ) do begin
		dimL:= dimL + 1;
		af[dimL]:= o;
		leerOficina(o);
	end;
end;
//--------------------Fin Inciso A--------------------\\







//--------------------Inciso B--------------------\\
procedure ordenarArray(var af: arrayOficinas; dimL: integer);
var
	i, j: integer;
	actual: oficina;
begin
	for i:= 2 to dimL do begin
		actual:= af[i];
		j:= i-1;
		while( (j > 0) and (af[j].codigoId > actual.codigoId) ) do begin
			af[j+1]:= af[j];
			j:= j-1;
		end;
		af[j+1]:= actual;
	end;
end;
//--------------------Fin Inciso B--------------------\\






//--------------------Inciso C--------------------\\
procedure buscarEnArray(af: arrayOficinas; dimL: integer);

	procedure busquedaDicotomica(var af: arrayOficinas; var busco: integer; var medio, inf, sup: integer);
	begin
		if(inf <= sup) then begin
			medio:= (inf + sup) div 2;
			if(busco = af[medio].codigoId) then
				busco:= af[medio].codigoId
			else begin
				if(busco < af[medio].codigoId) then
					sup:= (medio - 1)
				else
					inf:= (medio + 1);
				busquedaDicotomica(af, busco, medio, inf, sup);
			end;
		end;
	end;

var
	codigoABuscar: integer;
	inf, sup, medio: integer;
begin
	codigoABuscar:= random(6); //Random entre 0 y 5
	writeln('Se busca el codigo de identificacion de oficina ', codigoABuscar);
	writeln;
	
	inf:= 1;
	sup:= dimL;
	
	
	busquedaDicotomica(af, codigoABuscar, medio, inf, sup);
	
	if(af[medio].codigoId = codigoABuscar) then
		writeln('DNI del propietario: ', af[medio].dniPropietario)
	else
		writeln('El codigo buscado no existe');
end;	
//--------------------Fin Inciso C--------------------\\






//--------------------FIN DE LOS MÉTODOS--------------------\\





	
var
	af: arrayOficinas;
	dimL: integer;
begin
	Randomize;
	
	generarArrayOficinas(af, dimL); //Inciso A
	
	writeln('----------------------------------------');
	
	ordenarArray(af, dimL); //Inciso B
	
	writeln('----------------------------------------');
	
	buscarEnArray(af, dimL); //Inciso C
	
	//mostrarArrayOrdenado(af, dimL);
end.
