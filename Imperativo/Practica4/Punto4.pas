program ej4;
const dimF=7;
type
	rangoDia=1..7;
	entrada=record
		dia:rangoDia;
		codObra:integer;
		asiento:integer;
		monto:real;
	end;
	
	entradaAguardar=record
		codObra:integer;
		asiento:integer;
		monto:real;
	end;
	
	obrasVendidas=record
		codObra:integer;
		total:integer;
	end;
	listaObras=^nodoObras;
	nodoObras=record
		dato:obrasVendidas;
		sig:listaObras;
	end;
	
	lista=^nodo;
	nodo=record
		dato:entradaAguardar;
		sig:lista;
	end;
	
	vector = array [rangoDia]of lista;

procedure cargarEntradas(var v:vector);
	procedure inicVec(var v:vector);
	var i:integer;
	begin
		for i:=1 to dimF do
			v[i]:=nil;
	end;
	procedure leer(var e:entrada);
	begin
		write('codigo de obra(0 corte de carga): ');readln(e.codObra);
		if(e.codObra<>0 )then begin
			write('dia de la semana(1 a 7) ');readln(e.dia);
			write('asiento: ');readln(e.asiento);
			write('monto: ');readln(e.monto);
			writeln('-----------------');
		end;
	end;
	procedure insertarOrdenado(var l:lista;dato:entradaAguardar);
	var act,ant,nue:lista;
	begin
		new(nue);
		nue^.dato:=dato;
		act:=l;
		ant:=act;
		while (act<>nil) and (act^.dato.codObra<dato.codObra) do begin
			ant:=act;
			act:=act^.sig;
		end;
		
		if(act=ant)then
			l:=nue
			else ant^.sig:=nue;
		nue^.sig:=act;
	end;
	procedure formatearRegistro(var e:entrada;var eg:entradaAguardar);
	begin
		eg.codObra:=e.codObra;
		eg.asiento:=e.asiento;
		eg.monto:=e.monto;
	end;
	
var e:entrada; eg:entradaAguardar;
begin
	inicVec(v);
	leer(e);
	while e.codObra <> 0 do begin
		formatearRegistro(e,eg);
		insertarOrdenado(v[e.dia],eg);
		leer(e);
	end;
end;

procedure mergeAcumulador(v:vector;var l:listaObras);
	procedure agregarAtras(var l:listaObras;var ult:listaObras;dato:obrasVendidas);
	var nue:listaObras;
	begin
		new(nue);
		nue^.dato:=dato;
		nue^.sig:=nil;
		if(l=nil)then
			l:=nue
			else ult^.sig:=nue;
		ult:=nue;
	end;
	procedure minimo(var v:vector; var eMin:entradaAguardar);
	var i,indiceMin:integer;
	begin
		eMin.codObra:=9999;
		for i:= 1 to dimF do
			if(v[i]<>nil)then
				if(v[i]^.dato.codObra<=eMin.codObra)then begin
					indiceMin:=i;
					eMin.codObra:=v[i]^.dato.codObra;
				end;
		if(eMin.codObra<>9999)then
			v[indiceMin]:=v[indiceMin]^.sig;
	end;
var eMin:entradaAguardar; eActual:obrasVendidas; ult:listaObras;
begin
	l:=nil;
	minimo(v,eMin);
	while eMin.codObra<>9999 do begin
		eActual.codObra:=eMin.codObra;
		eActual.total:=0;
		while(eMin.codObra<>9999)and(eMin.codObra=eActual.codObra)do begin
			eActual.total:=eActual.total +1;
			minimo(v,eMin);
		end;
		agregarAtras(l,ult,eActual);
	end;
end;
procedure imprimirLista(l:listaObras);
begin
	if(l<>nil)then begin
		writeln('->');
		writeln('codigo de obra: ',l^.dato.codObra);
		//writeln('asiento: ',l^.dato.asiento);
		//writeln('monto: ',l^.dato.monto:3:2);
		writeln('total vendidas: ',l^.dato.total);
		
		imprimirLista(l^.sig);
	end;
end;
{
procedure imprimirVector(v:vector);
var i:integer;
begin
	for i:=1 to dimF do begin
		writeln('   DIA ',i);
		if(v[i]=nil)then begin
			
			writeln('vacio');
			writeln('---------------')
			end else imprimirLista(v[i]);
		
	end;
end;
}
var v:vector;	l:listaObras;
begin
	cargarEntradas(v);
	//imprimirVector(v);
	mergeAcumulador(v,l);
	imprimirLista(l);
end.
