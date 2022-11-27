program listaDeListas;

type

	subLista = ^nodoSubLista;
	nodoSubLista = record
		dato: integer;
		sig: subLista;
	end;

	lista = ^nodoLista;
	nodoLista = record
		dato: subLista;
		sig: lista;
	end;

procedure generarListaPrincipal(var l: lista);

	procedure randomString(tamanio:integer; var palabra:string);
	var
		str,Result: String;
	begin
		str:='abcde';
		Result:='';
		repeat
			Result:=Result+str[Random(Length(str))+1];
		until(Length(Result)=tamanio);
		palabra:=Result;
	end;

	procedure generarSubLista(var subL: subLista);

		procedure agregarAtrasSL(var subL: subLista; var ultSL: subLista; n: integer);
		var
			nue: subLista;
		begin
			new(nue);
			nue^.dato:= n;
			nue^.sig:= nil;
			if(subL = nil) then
				subL:= nue
			else
				ultSL^.sig:= nue;
			ultSL:= nue;
		end;

	var
		ultSL: subLista;
		nRandom: integer;
	begin
		subL:= nil;
		ultSL:= nil;
		nRandom:= random(6); //Random entre 0 y 6
		if(nRandom <> 0) then
			writeln('Nueva sublista');
		writeln('Numero generado: ', nRandom);
		while(nRandom <> 0) do begin
			agregarAtrasSL(subL, ultSL, nRandom);
			nRandom:= random(11); //Random entre 0 y 10
			writeln('Numero generado: ', nRandom);
		end;
	end;

	procedure agregarAtrasLP(var l: lista; var ultLP: lista; subL: subLista);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= subL;
		nue^.sig:= nil;
		if(l = nil) then
			l:= nue
		else
			ultLP^.sig:= nue;
		ultLP:= nue;
	end;

var
	ultLP: lista;
	subL: subLista;
	letraRandom: String; //Sé que tiene que ser de tipo char pero es para que funcione el método randomString
begin
	l:= nil;
	ultLP:= nil;
	randomString(1, letraRandom);
	writeln('Letra random: ', letraRandom);
	while(letraRandom <> 'c') do begin
		writeln;
		generarSubLista(subL);
		if(subL <> nil) then
			agregarAtrasLP(l, ultLP, subL);
		randomString(1, letraRandom);
		writeln;
		writeln('Letra random: ', letraRandom);
	end;
end;


procedure mostrarListaListas(l: lista);
begin
	writeln;
	while(l <> nil) do begin
		writeln('Una lista');
		while(l^.dato <> nil) do begin
			writeln('Numero: ', l^.dato^.dato);
			l^.dato:= l^.dato^.sig;
		end;
		writeln;
		l:= l^.sig;
	end;
end;


var
	l: lista;
begin
	Randomize;

	generarListaPrincipal(l);

	mostrarListaListas(l);
end.
