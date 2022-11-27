program listaDeListas;

type

	listaInterna = ^nodoListaInterna;
	nodoListaInterna = record
		dato: integer;
		sig: listaInterna;
	end;

	lista = ^nodoLista;
	nodoLista = record
		dato: listaInterna;
		sig: lista;
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



procedure agregarAtrasLE(var le: lista; var ult: lista; li: listaInterna);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= li;
	nue^.sig:= nil;
	if(le = nil) then
		le:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
end;



procedure agregarAtrasLI(var li: listaInterna; var ult: listaInterna; n: integer);
var
	nue: listaInterna;
begin
	new(nue);
	nue^.dato:= n;
	nue^.sig:= nil;
	if(li = nil) then
		li:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
end;



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




var
	l, ultLe: lista;
	lInterna, ultLi: listaInterna;
	letraRandom: String; //Sé que tiene que ser de tipo char pero es para que funcione el método randomString
	nRandom: integer;
begin
	Randomize;
	l:= nil;
	ultLe:= nil;
	randomString(1,letraRandom);
	writeln('Letra random: ', letraRandom);
	while(letraRandom <> 'c') do begin
		writeln;
		lInterna:= nil;
		ultLi:= nil;
		nRandom:= random(11); //Random entre 0 y 10
		if(nRandom <> 0) then
			writeln('Nueva lista interna');
		writeln('Numero generado: ', nRandom);
		while(nRandom <> 0) do begin
			agregarAtrasLI(lInterna, ultLi, nRandom); //Lista interna (listaInterna)
			nRandom:= random(11); //Random entre 0 y 10
			writeln('Numero generado: ', nRandom);
		end;
		if(lInterna <> nil) then
			agregarAtrasLE(l, ultLe, lInterna); //Lista externa (lista)
		randomString(1,letraRandom);
		writeln;
		writeln('Letra random: ', letraRandom);
	end;
	mostrarListaListas(l);
end.
