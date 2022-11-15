program arrayBusquedaDicotomica;

const

	dimF = 9;
	
type

	vector = array[1..dimF] of integer;

procedure cargarVector(var v: vector; var dimL: integer);
var
	n: integer;
begin
	write('Ingrese un numero (siempre y cuando sea ordenado): ');
	readln(n);
	while( (dimL < dimF) and (n <> 0) ) do begin
		dimL:= dimL + 1;
		v[dimL]:= n;
		write('Ingrese un numero (siempre y cuando sea ordenado): ');
		readln(n);
	end;
end;


//----------COMIENZO DEL METODO DE BUSQUEDA DICOTOMICA----------\\
function buscarElementoVectorOrdenado(v:vector; diml:integer; dato:integer):integer;
var
	pri:integer;
	ult:integer;
	medio:integer;
begin
	pri:=1;
	ult:=diml;
	medio:=(pri+ult) div 2;

	while( (pri<=ult) and (v[medio] <> dato) ) do begin // mientas no se termine el vector y no se encuentre el dato 
		if(dato < v[medio]) then  //si el dato es mas chico a elemento del vector
			ult:=medio-1  // Reduzco, lo que vendría a ser la dimL, y me quedo con la parte izquierda del vector.         
		else
			pri:=medio+1; // Aumento, lo que vendría a ser la dimL, y me quedo con la parte derecha del vector .
		medio:=(pri+ult) div 2; // Me posiciono en la mitad entre pri y ult, y uso la variable como posicion del elemento a comparar
	end;
	if(pri<=ult)then 
		BuscarElementoVectorOrdenado:=medio
	else 
		BuscarElementoVectorOrdenado:=0;
end;
//----------FIN DEL METODO ----------\\


var
	v: vector;
	dimL, datoABuscar: integer;
begin
	dimL:= 0;
	cargarVector(v, dimL);
	
	writeln();
	
	write('Ingrese el dato que estes buscando: ');
	readln(datoABuscar);
	
	if(buscarElementoVectorOrdenado(v, dimL, datoABuscar) <> 0) then
		writeln('Encontre el dato que estaba buscando')
	else
		writeln('NO encontre el dato que estaba buscando');
end.
