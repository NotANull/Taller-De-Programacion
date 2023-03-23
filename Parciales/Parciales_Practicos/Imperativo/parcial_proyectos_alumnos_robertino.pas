{ En un colegio secundario, cada alumno participa de un proyecto de ciencias. El proyecto de
un alumno pertenece a un tópico (volcanes, vida marina, migración de las aves, etc.). Un
mismo alumno pudo haber presentado más de un proyecto (en distintos tópicos). En la
última hora del evento las personas visitantes pueden votar el proyecto del alumno que más
le gustó.
       a. Realice un programa para el sistema de votación. Un voto consiste en el nombre del
          alumno y el tópico en el cual pertenece el proyecto.
       b. Almacene esta información en una estructura óptima para la búsqueda, ordenada
          por nombre de alumno. Para cada alumno almacene todos sus proyectos ordenado
          por tópico.
       c. Al finalizar la carga (se lee el alumno ‘zzz’) se debe informar:
          i. Cual fue el proyecto ganador: nombre del alumno, tópico y cantidad de votos.
          ii. Número de votos totales, es decir la suma de los votos de todos los
          proyectos en los que participa un alumno, ordenados alfabéticamente por nombre de alumno.
}
program votacion; 
type
	voto = record
		nombre: string;
		topico: string;
		cant: integer;
	end;
	
	lista = ^nodo;
	nodo  = record
		dato:voto;
		sig :lista;
	end;
	
	alumno =record
		nombre : string;
		proyectos: lista;
    end;
    
	arbol = ^arb;
	arb   = record
		dato: alumno;
		ri: arbol;
		rd: arbol;
	end;
	
	
procedure cargarlista(var a: arbol; var max: integer ;var maxnom,topico: string);

	procedure carga(var L:lista; v: voto);
	
		procedure insertarordenado(var L,act, ant: lista;v:voto);
		var
			nue:lista;
		begin
		    new (nue);
			nue^.dato := v;
		    act := L; {ubico act y ant al inicio de la lista}
			ant := L;
			while( act <> nil)and(v.topico > act^.dato.topico)do begin
				ant := act;
				act:= act^.sig;
			end;
			if (act = ant) then {al inicio o lista vacía}
				L:= nue
			else {al medio o al final}
				ant^.sig:= nue;
			nue^.sig:= act;
		end;
		
	var
		laux:lista;
		si: integer;
		act, ant: lista; {punteros auxiliares para recorrido}
	begin
	    if(L = nil)then begin
	        v.cant:=1;
			insertarordenado(L,act,ant,v);
        end
        else begin
			laux:=L;
			si:= 0;
            while(laux <> nil)and(si <> 1)do begin
				if(v.topico=laux^.dato.topico)then begin
					si:= 1;
					laux^.dato.cant:= laux^.dato.cant+1;
				end
				else
				    laux:= laux^.sig;		    
			end;
			if(si=1)then
			   L^.dato.cant:=laux^.dato.cant   
			else begin
			    v.cant := 1;
				insertarordenado(L,act,ant,v);	
		    end;
	    end;
	end;
	
	procedure crear(var a: arbol; v:voto);
	var
		i:alumno;
	begin
		if(a = nil) then begin
			new(a);
			i.nombre:= v.nombre;
			i.proyectos:=nil;
			a^.dato:= i;
			a^.ri:= nil;
			a^.rd:= nil;
			carga(a^.dato.proyectos,v);
		end
		else if(v.nombre = a^.dato.nombre)then 
			carga(a^.dato.proyectos,v)
		else if(v.nombre < a^.dato.nombre) then begin
			crear(a^.ri,v);
		end
		else begin
			crear(a^.rd, v);
		end;
	end;

var
	v:voto;
begin
   max:=-1;
   maxnom:=' ';
   topico:=' ';
   a:=nil;
   v.cant:=0;
   write('Ingrese nombre del alumno: ');
   readln(v.nombre);
   while(v.nombre <> 'zzz')do begin
		write('Ingrese topico del proyesto:  ');
		readln(v.topico);
		crear(a,v);
		write('Ingrese nombre del alumno: ');
		readln(v.nombre);
   end;
   writeln('-----Fin votacion-----');
end;

procedure contador(a: arbol;var max: integer ;var maxnom,topico: string);
	
	procedure contabilizar_list(nombre: string; l: lista; var max: integer; var maxnom,topico: string);
	var
		total:integer;
	begin
		total:=0;
		while(l<> nil) do begin
			total:=total+l^.dato.cant;
			if(l^.dato.cant > max)then begin
				max:=l^.dato.cant;
				maxnom:=nombre;
				topico:=l^.dato.topico;
			end;
			l:=l^.sig;
		end;
		writeln;
		writeln('alumno: ',nombre,' total de votos: ',total);
	end;
	
begin
	if (a<>nil) then begin
	    contador(a^.ri, max,maxnom,topico);
        contabilizar_list(a^.dato.nombre,a^.dato.proyectos,max,maxnom,topico);
		contador(a^.rd, max,maxnom,topico);
	end;
	
end;  
		

procedure Ganador( max: integer ; maxnom,topico: string);
begin
	writeln('nombre: ', maxnom,' topico: ',topico,' cantidad de votos: ',max);
end;

{function}
var 
	a:arbol;
	max: integer;
	maxnom: string;
	topico: string;
begin
   writeln('------Inicia Votacion------');
   cargarlista(a,max,maxnom,topico);
   contador(a,max,maxnom,topico);
   Ganador(max,maxnom,topico);
   writeln(a^.dato.nombre);
end.
