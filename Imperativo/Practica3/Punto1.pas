{
1.	Escribir un programa que:

a. Implemente un módulo que lea información de socios de un club y las
	almacene en un árbol binario de búsqueda. De cada socio se lee número
	de socio, nombre y edad. La lectura finaliza con el número de socio 0
	y el árbol debe quedar ordenado por número de socio.

b. Una vez generado el árbol, realice módulos independientes que reciban
	el árbol como parámetro y que :

	i. Informe el número de socio más grande. Debe invocar a un módulo
		recursivo que retorne dicho valor.
	
	ii. Informe los datos del socio con el número de socio más chico. Debe
		invocar a un módulo recursivo que retorne dicho socio.
	
	iii. Informe el número de socio con mayor edad. Debe invocar a un módulo
		recursivo que retorne dicho valor.

	iv. Aumente en 1 la edad de todos los socios.
 
	v. Lea un valor entero e informe si existe o no existe un socio con ese valor.
		Debe invocar a un módulo recursivo que reciba el valor leído y retorne verdadero o falso.

	vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe
		invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.

	vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.

	viii. Informe el promedio de edad de los socios. Debe invocar al módulo
		recursivo del inciso vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.

	ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol
		cuyo número de socio se encuentra entre los dos valores ingresados. Debe invocar a un
		módulo recursivo que reciba los dos valores leídos y retorne dicha cantidad.
}





program punto1;

type

	socio = record
		numeroSocio: integer;
		nombre: String;
		edad: integer;
	end;

	arbol = ^nodoArbol;
	nodoArbol = record
		dato: socio;
		hi: arbol;
		hd: arbol;
	end;
	
	


procedure randomString(tamanio:integer; var palabra:string);
var  str,Result: String;
begin
	str:='abcde'; //str:='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	Result:='';
	repeat
		Result:=Result+str[Random(Length(str))+1];
	until(Length(Result)=tamanio);
	palabra:=Result;
end;




//--------------------COMIENZO DE LOS MÉTODOS--------------------\\




//--------------------INCISO A--------------------\\
procedure generarArbol(var a: arbol);


	procedure leerSocio(var s: socio);
	begin
		with s do begin
			numeroSocio:= random(6); //Random entre 0 y 5
			writeln('Numero de socio: ', numeroSocio);
			if(numeroSocio <> 0) then begin
				randomString(1,nombre);
				writeln('Nombre del socio: ', nombre);
				edad:= random(100)+1; //Random entre 1 y 100
				writeln('Edad del socio: ', edad);
				writeln();
			end;
		end;
	end;
	
	
	procedure insertarEnArbol(var a: arbol; s: socio);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= s;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else
			if(s.numeroSocio < a^.dato.numeroSocio) then
				insertarEnArbol(a^.hi, s)
			else
				insertarEnArbol(a^.hd, s);
	end;

var
	s: socio;
begin
	a:= nil;
	writeln('Se lee la informacion de cada socio');
	writeln();
	leerSocio(s);
	while(s.numeroSocio <> 0) do begin
		insertarEnArbol(a, s);
		leerSocio(s);
	end;
end;
//--------------------FIN INCISO A--------------------\\






//--------------------INCISO B-i--------------------\\
procedure buscarSocioMax(a: arbol);
	
	function buscarEnArbol(a: arbol): integer;
	begin
		if(a = nil) then
			buscarEnArbol:= -1
		else
			if(a^.hd <> nil) then
				buscarEnArbol:= buscarEnArbol(a^.hd)
			else
				buscarEnArbol:= a^.dato.numeroSocio;
	end;

var
	max: integer;
begin
	max:= buscarEnArbol(a);
	if(max = -1) then
		writeln('El arbol esta vacio')
	else 
		writeln('El numero de socio mas grande es el ', max);
end;
//--------------------FIN INCISO B-i--------------------\\







//--------------------INCISO B-ii--------------------\\
procedure buscarSocioMin(a: arbol);

	function buscarEnArbol(a: arbol):arbol;
	begin
		if(a = nil) then
			buscarEnArbol:= nil
		else
			if(a^.hi <> nil) then
				buscarEnArbol:= buscarEnArbol(a^.hi)
			else
				buscarEnArbol:= a;
	end;

var
	socioMenor: arbol;
begin
	socioMenor:= buscarEnArbol(a);
	if(socioMenor = nil) then
		writeln('El arbol esta vacio')
	else begin
		writeln('informacion del socio con numero de socio mas chico');
		writeln('Numero de socio: ', socioMenor^.dato.numeroSocio);
		writeln('Nombre del socio: ', socioMenor^.dato.nombre);
		writeln('Edad del socio: ', socioMenor^.dato.edad);
	end;
end;
	
//--------------------FIN INCISO B-ii--------------------\\








//--------------------INCISO B-iii--------------------\\
procedure InformarNumeroSocioConMasEdad (a: arbol);

	procedure NumeroMasEdad(a: arbol; var maxEdad: integer; var maxNum: integer);
	var
		maxEdad1, maxEdad2, maxNum1, maxNum2: integer;
	begin
		if (a = nil) then
			maxEdad:= -1
		else begin
			NumeroMasEdad (a^.HI, maxEdad1, maxNum1);
			NumeroMasEdad (a^.HD, maxEdad2, maxNum2);
			//Como puede haber numeros de socios repetidos, me quedo con la edad máxima entre ellos
			If (maxEdad1 > maxEdad2) then begin 
				maxEdad:= maxEdad1;
				maxNum:= maxNum1;
			end
			else begin
				maxEdad:= maxEdad2;
				maxNum:= maxNum2;
			end;
		If (a^.dato.edad > maxEdad) then begin
			maxEdad:= a^.dato.edad;
			maxNum:= a^.dato.numeroSocio;
		end;
	end;


end;

var
	maxEdad, maxNum: integer;
begin
	NumeroMasEdad (a, maxEdad, maxNum);
	if(maxEdad = -1) then
		writeln ('El arbol esta vacio')
	else begin
		writeln ('Numero de socio con mas edad: ', maxNum);
		writeln('Socio con mas edad: ', maxEdad);
	end;
end;
//--------------------FIN INCISO B-iii--------------------\\









//--------------------INCISO B-iv--------------------\\
procedure aumentarEdadSocios(a: arbol);
begin
	if(a <> nil) then begin
		aumentarEdadSocios(a^.hi);
		aumentarEdadSocios(a^.hd);
		a^.dato.edad:= a^.dato.edad + 1;
	end;
end;
//--------------------FIN INCISO B-iv--------------------\\




//--------------------INCISO B-v--------------------\\
procedure buscarNumeroSocio(a: arbol);

	//Búsqueda que va bien si el árbol está ordenado por dicho criterio
	function buscarEnArbol(a: arbol; nSocioABuscar: integer): boolean;
	begin
		if(a = nil) then
			buscarEnArbol:= false
		else
			if(nSocioABuscar = a^.dato.numeroSocio) then
				buscarEnArbol:= true
			else if(nSocioABuscar < a^.dato.numeroSocio) then
				buscarEnArbol:= buscarEnArbol(a^.hi, nSocioABuscar)
			else	
				buscarEnArbol:= buscarEnArbol(a^.hd, nSocioABuscar);
	end;

var
	nSocioABuscar: integer;
begin
	nSocioABuscar:= random(5)+1; //Random entre 1 y 5
	writeln('Numero de socio a buscar: ', nSocioABuscar);
	if(a = nil) then
		writeln('El arbol esta vacio')
	else if(buscarEnArbol(a, nSocioABuscar)) then
		writeln('El socio con numero ', nSocioABuscar, ' se encuentra en el arbol')
	else
		writeln('El socio no se encuentra en el arbol');
end;
//--------------------FIN INCISO B-v--------------------\\







//--------------------INCISO B-vi--------------------\\ CONSULTAR POR LA BÚSQUEDA
procedure buscarNombreSocio(a: arbol);

	//Búsqueda que va bien si el árbol está ordenado por dicho criterio
	{function buscarEnArbol(a: arbol; nomSocioABuscar: String): boolean;
	begin
		if(a = nil) then
			buscarEnArbol:= false
		else
			if(nomSocioABuscar = a^.dato.nombre) then
				buscarEnArbol:= true
			else if(nomSocioABuscar < a^.dato.nombre) then
				buscarEnArbol:= buscarEnArbol(a^.hi, nomSocioABuscar)
			else
				buscarEnArbol:= buscarEnArbol(a^.hd, nomSocioABuscar);
	end;}
	
	function buscarEnArbol(a: arbol; nomSocioABuscar: String): boolean;
	begin
		if (a = nil) then
			buscarEnArbol:= false
		else if (nomSocioABuscar = a^.dato.nombre) then
			buscarEnArbol:= true
		else
			buscarEnArbol:= buscarEnArbol(a^.hi, nomSocioABuscar) or buscarEnArbol(a^.hd, nomSocioABuscar);

	end;

var
	nomSocioABuscar: String;
begin
	randomString(1,nomSocioABuscar);
	writeln('Nombre del socio a buscar: ', nomSocioABuscar);
{
	write('Ingrese el nombre del socio a buscar: ');
	readln(nomSocioABuscar);
}
	if(a = nil) then
		writeln('El arbol esta vacio')
	else if(buscarEnArbol(a, nomSocioABuscar)) then
		writeln('El socio ', nomSocioABuscar, ' se encuentra en el arbol')
	else
		writeln('El socio no se encuentra en el arbol');
end;
//--------------------FIN INCISO B-vi--------------------\\





//--------------------INCISO B-vii--------------------\\
function contador(a:arbol):integer;
begin
	if(a = nil)then
		contador:= 0
	else
		contador:= 1 + contador(a^.hi) + contador(a^.hd);
end;


procedure contarSocios(a: arbol);
var
	totalSocios: integer;
begin
	totalSocios:= contador(a);
	if(totalSocios = 0) then
		writeln('El arbol esta vacio')
	else
		writeln('El club cuenta con ', totalSocios, ' socios.');
	
end;
//--------------------FIN INCISO B-vii--------------------\\








//--------------------INCISO B-viii--------------------\\
procedure promedioEdadSocios(a: arbol);

	function sumar(a: arbol): integer;
	begin
		if(a = nil) then
			sumar:= 0
		else
			sumar:= a^.dato.edad + sumar(a^.hi) + sumar(a^.hd);
	end;

var
	sumaEdad, totalSocios: integer;
begin
	sumaEdad:= sumar(a);
	if(sumaEdad = 0) then
		writeln('El arbol esta vacio')
	else begin
		totalSocios:= contador(a);
		writeln('Promedio de edad de los socios: ', (sumaEdad / totalSocios):2:2);
	end;
end;
//--------------------FIN INCISO B-viii--------------------\\








//--------------------INCISO B-ix--------------------\\
procedure sociosEntre(a: arbol);

	procedure buscarEnArbol(a: arbol; var totalSocios: integer; valorInferior, valorSuperior: integer);
	begin
	if(a <> nil) then begin
		if(a^.dato.numeroSocio > valorInferior) then begin
			if(a^.dato.numeroSocio < valorSuperior) then begin
				totalSocios:= totalSocios + 1;
				buscarEnArbol(a^.hi, totalSocios, valorInferior, valorSuperior);
				buscarEnArbol(a^.hd, totalSocios, valorInferior, valorSuperior);
			end
			else
				buscarEnArbol(a^.hi, totalSocios, valorInferior, valorSuperior);
		end
		else
			buscarEnArbol(a^.hd, totalSocios, valorInferior, valorSuperior);
	end;
end;

var
	valorInf, valorSup, totalSocios: integer;
begin
	valorInf:= 1; //Digo que voy entre 1 y...
	writeln('Valor inferior: ', valorInf);
	valorSup:= random(7)+3; //... un random entre 3 y 7
	writeln('Valor superior: ', valorSup);
	
	totalSocios:= 0;
	buscarEnArbol(a, totalSocios, valorInf, valorSup);
	
	if(totalSocios = 0) then
		writeln('El arbol esta vacio o no hay socios en el rango de ', valorInf, ' y ', valorSup)
	else
		writeln('Cantidad de socios: ', totalSocios);
end;
//--------------------FIN INCISO B-ix--------------------\\











//--------------------INCISO B-x--------------------\\
procedure informarSociosCreciente(a: arbol);

	procedure imprimir(a: arbol);
	begin
		if(a <> nil) then begin
			imprimir(a^.hi);
			writeln('Numero de socio: ', a^.dato.numeroSocio);
			imprimir(a^.hd);
		end;
	end;

begin
	if(a = nil) then
		writeln('La lista esta vacia')
	else begin
		writeln('Numeros de socio en orden creciente');
		imprimir(a);
	end;
end;
//--------------------FIN INCISO B-x--------------------\\








//--------------------INCISO B-xi--------------------\\
procedure informarSociosDecreciente(a: arbol);

	procedure imprimir(a: arbol);
	begin
		if(a <> nil) then begin
			imprimir(a^.hd);
			if((a^.dato.numeroSocio mod 2) = 0) then
				writeln('Numero de socio: ', a^.dato.numeroSocio);
			imprimir(a^.hi);
		end;
	end;

begin
	if(a = nil) then
		writeln('La lista esta vacia')
	else begin
		writeln('Numeros de socio pares en orden decreciente');
		imprimir(a);
	end;
end;
//--------------------FIN INCISO B-xi--------------------\\









//--------------------FIN DE LOS MÉTODOS--------------------\\






//--------------------MÉTODOS DE PRUEBA (HACER LLAMADO)--------------------\\
procedure imprimirArbol(a: arbol);
begin
	if(a <> nil) then begin
		imprimirArbol(a^.hi);
		writeln('Numero de soico: ', a^.dato.numeroSocio);
		writeln('Nombre del socio: ', a^.dato.nombre);
		writeln('Edad del socio: ', a^.dato.edad);
		writeln;
		imprimirArbol(a^.hd);
	end;
end;
//--------------------FIN DE LOS MÉTODOS DE PRUEBA--------------------\\


	
var
	a: arbol;
begin
	Randomize;

	generarArbol(a); //Inciso A
	
	writeln('----------------------------------------');
	
	buscarSocioMax(a); //Inciso B-i
	
	writeln('----------------------------------------');
	
	buscarSocioMin(a); //Inciso B-ii

	writeln('----------------------------------------');

	InformarNumeroSocioConMasEdad(a); //Inciso B-iii
	
	writeln('----------------------------------------');
	
	aumentarEdadSocios(a); //Inciso B-iv
	
	writeln('----------------------------------------');
	
	buscarNumeroSocio(a); //Inciso B-v
	
	writeln('----------------------------------------');
	
	buscarNombreSocio(a); //Inciso B-vi
	
	writeln('----------------------------------------');
	
	contarSocios(a); //Inciso B-vii
	
	writeln('----------------------------------------');
	
	promedioEdadSocios(a); //Inciso B-viii
	
	writeln('----------------------------------------');
	
	sociosEntre(a); //Inciso B-ix
	
	writeln('----------------------------------------');
	
	informarSociosCreciente(a); //Inciso B-x
	
	writeln('----------------------------------------');
	
	informarSociosDecreciente(a); //Inciso B-xi
end.
