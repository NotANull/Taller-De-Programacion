{
En un colegio secundario, cada alumno participa de un proyecto de ciencias.
El proyecto de un alumno pertenece a un tópico(volcanes, vida marina, migración de las aves, etc).
Un mismo alumno pudo haber presentado más de un proyecto (en distintos tópicos).
En la última hora del evento, las personas visitantes pueden votar el proyecto del alumno que más le gustó.

a.	Realice un programa para el sistema de votación. Un voto consiste en el nombre del alumno y el tópico
		en el cual pertenece el proyecto.
	
b.	Almacene esta información en una estructura óptima para la búsqueda, ordenada por nombre de alumno. Para
		cada alumno, almacene todos sus proyectos ordenado por tópico.
		
c.	Al finalizar la carga (se lee el alumno 'zzz') se debe informar:
		i. Cuál fue el proyecto ganador: nombre del alumno, tópico y cantidad de votos.
		ii. Número de votos totales, es decir la suma de los votos de todos los proyectos en los que participa
			un alumno, ordenador alfabéticamente por nombre del alumno.
}

program parcial;

const

	dimF = 3;

type

	cadena30 = String[30];

	voto = record
		nombreAlumno: cadena30;
		topico: cadena30;
		darVoto: integer;
	end;
	
	datoAGuardar = record
		topico: cadena30;
		voto: integer;
	end;
	
	ganador = record
		alumnoGanador: cadena30;
		topicoGanador: cadena30;
		cantVotosGanador: integer;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: datoAGuardar;
		sig: lista;
	end;
	
	alumno = record
		nombreAlumno: cadena30;
		listaProyectos: lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: alumno;
		hi: arbol;
		hd: arbol;
	end;

	regVoto = record
		nombreAlumno: cadena30;
		cantTotalVotos: integer;
	end;
	
	listaVotos = ^nodoVoto;
	nodoVoto = record
		dato: regVoto;
		sig: listaVotos;
	end;






procedure elegirNombre(i: integer; var nombre: String);
var
	resultado: String;
begin
	case i of
		1: resultado:= 'Waldo';
		2: resultado:= 'Omar';
		3: resultado:= 'Sofia';
		4: resultado:= 'Robertino';
		5: resultado:= 'Caitlyn';
		6: resultado:= 'zzz';
	end;
	nombre:= resultado;
end;



procedure elegirTopico(i: integer; var topico: String);
var
	resultado: String;
begin
	case i of
		1: resultado:= 'volcanes';
		2: resultado:= 'vida marina';
		3: resultado:= 'migracion de aves';
		4: resultado:= 'flora y fauna';
	end;
	topico:= resultado;
end;


procedure generarArbol(var a: arbol);

	procedure leerVoto(var v: voto);
	begin
		with v do begin
			darVoto:= 0;
			elegirNombre(random(6)+1, nombreAlumno);
			writeln('ingrese nombre del alumno para quien va destinado el voto: ', nombreAlumno);
			if(nombreAlumno <> 'zzz') then begin
				elegirTopico(random(4)+1, topico);
				writeln('Ingrese topico a votar: ', topico);
				darVoto:= darVoto + 1;
				writeln;
			end;
		end;
	end;
	
	procedure generarNodo(var a: arbol; v: voto);
	
		procedure armarRegistroAGuardar(v: voto; var datoAlumnoAGuardar: datoAGuardar);
		begin
			datoAlumnoAGuardar.topico:= v.topico;
			datoAlumnoAGuardar.voto:= v.darVoto;
		end;
		
		procedure agregarAdelante(var l: lista; datoAlumnoAGuardar: datoAGuardar);
		var
			nue: lista;
		begin
			new(nue);
			nue^.dato:= datoAlumnoAGuardar;
			nue^.sig:= l;
			l:= nue;
		end;
		
		function mismoTopico(topico: cadena30; l: lista): boolean;
		begin
			if(l = nil) then
				mismoTopico:= false
			else if(topico = l^.dato.topico) then
				mismoTopico:= true
			else
				mismoTopico:= mismoTopico(topico, l^.sig);
		end;
	
	var
		datoAlumnoAGuardar: datoAGuardar;
	begin
		if(a = nil) then begin
			new(a); //Creo un nodo para el arbol
			a^.dato.nombreAlumno:= v.nombreAlumno; //Inserto el nombre del alumno en el registro del arbol
			a^.dato.listaProyectos:= nil; //Inicializo en nil a la lista en el registro del arbol
			armarRegistroAGuardar(v, datoAlumnoAGuardar); //Armo el registro que se va a insertar en la lista
			agregarAdelante(a^.dato.listaProyectos, datoAlumnoAGuardar); //genero un nodo en la lista y le agrego el registro anteriormente armado
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else if(v.nombreAlumno < a^.dato.nombreAlumno) then //si el nombre del alumno es menor al que se encuentra en el arbol
			generarNodo(a^.hi, v)
		else if(v.nombreAlumno > a^.dato.nombreAlumno) then //si el nombre del alumno es mayor al que se encuentra en el arbol
			generarNodo(a^.hd, v)
		else if(v.nombreAlumno = a^.dato.nombreAlumno) then begin //si el nombre del alumno es igual al que se encuentra en el arbol
			if(mismoTopico(v.topico, a^.dato.listaProyectos)) then //Si encuentro el mismo topico en la lista
				a^.dato.listaProyectos^.dato.voto:= a^.dato.listaProyectos^.dato.voto + 1
			else begin //Sino creo un nuevo nodo para la lista con un topico nuevo 
				armarRegistroAGuardar(v, datoAlumnoAGuardar);
				agregarAdelante(a^.dato.listaProyectos, datoAlumnoAGuardar);
			end;
		end;
			
	end;

var
	v: voto;
begin
	a:= nil;
	writeln('Se lee la informacion del voto');
	writeln;
	leerVoto(v);
	while(v.nombreAlumno <> 'zzz') do begin
		generarNodo(a, v);
		leerVoto(v);
	end;
end;




procedure proyectoGanador(a: arbol);

	procedure inicializarProyectoGanador(var pGanador: ganador);
	begin
		with pGanador do begin
			alumnoGanador:= '';
			topicoGanador:= '';
			cantVotosGanador:= -1;
		end;
	end;
	
	procedure contarVotos(a: arbol; var pGanador: ganador);
	
		procedure procesarVotos(alu: alumno; var pGanador: ganador);
		begin
			while(alu.listaProyectos <> nil) do begin
				if(alu.listaProyectos^.dato.voto > pGanador.cantVotosGanador) then begin
					pGanador.alumnoGanador:= alu.nombreAlumno;
					pGanador.topicoGanador:= alu.listaProyectos^.dato.topico;
					pGanador.cantVotosGanador:= alu.listaProyectos^.dato.voto;
				end;
				alu.listaProyectos:= alu.listaProyectos^.sig;
			end;
		end;
	
	begin
		if(a <> nil) then begin
			contarVotos(a^.hi, pGanador);
			procesarVotos(a^.dato, pGanador);
			contarVotos(a^.hd, pGanador);
		end;
	end;
	
	procedure mostrarGanador(pGanador: ganador);
	begin
		writeln('PROYECTO GANADOR');
		with pGanador do begin
			writeln('Nombre del alumno: ', alumnoGanador);
			writeln('Topico: ', topicoGanador);
			writeln('Cantidad de votos obtenidos: ', cantVotosGanador);
		end;
	end;

var
	pGanador: ganador;
begin
	writeln;
	if(a <> nil) then begin
		inicializarProyectoGanador(pGanador);
		contarVotos(a, pGanador);
		mostrarGanador(pGanador);
	end
	else
		writeln('El arbol esta vacio');
end;





procedure generarLista(a: arbol);

	procedure recorrerArbol(a: arbol; var l: listaVotos);
	
		procedure generarNodoLista(var l: listaVotos; alumnoArbol: alumno);
		
			function sumarVotos(l: lista): integer;
			begin
				if(l = nil) then
					sumarVotos:= 0
				else
					sumarVotos:= sumarVotos(l^.sig) + l^.dato.voto;
			end;
		
		var
			nue: listaVotos;
		begin
			new(nue);
			nue^.dato.nombreAlumno:= alumnoArbol.nombreAlumno;
			nue^.dato.cantTotalVotos:= sumarVotos(alumnoArbol.listaProyectos);
			nue^.sig:= l;
			l:= nue;
		end;
	

	begin
		if(a <> nil) then begin
			recorrerArbol(a^.hd, l);
			generarNodoLista(l, a^.dato);
			recorrerArbol(a^.hi, l);
		end;
	end;
	
	procedure imprimirListaVotos(l: listaVotos);
	begin
		if(l <> nil) then begin
			imprimirListaVotos(l^.sig);
			writeln(l^.dato.nombreAlumno, ' tiene ', l^.dato.cantTotalVotos, ' votos');
		end;
	end;

var
	l: listaVotos;
begin
	writeln;
	if(a <> nil) then begin
		l:= nil;
		recorrerArbol(a, l);
		writeln('SE MUESTRA LA LISTA DE ALUMNOS CON SUS VOTOS');
		imprimirListaVotos(l);
	end
	else
		writeln('El arbol esta vacio');
end;





procedure imprimirArbol(a: arbol);

	procedure imprimirLista(l: lista);
	begin
		if(l <> nil) then begin
			imprimirLista(l^.sig);
			writeln('Topico: ', l^.dato.topico, ' - votos: ', l^.dato.voto);
		end;
	end;

begin
	if(a <> nil) then begin
		imprimirArbol(a^.hi);
		writeln('Nombre del alumno: ', a^.dato.nombreAlumno);
		imprimirLista(a^.dato.listaProyectos);
		imprimirArbol(a^.hd);
	end;
end;

var
	a: arbol;
begin
	Randomize;
	generarArbol(a);
	proyectoGanador(a);
	generarLista(a);
	{writeln;
	imprimirArbol(a);}
end.
