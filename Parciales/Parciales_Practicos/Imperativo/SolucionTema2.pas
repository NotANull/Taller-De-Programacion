{
Una casa de comidas para llevar necesita el procesamiento de los pedidos de combos realizados por los clientes durante agosto de 2022. De cada pedido se 
conoce el número del cliente, día, cantidad de combos y monto pagado.
a) Implementar un módulo que lea pedidos, genere y retorne una estructura adecuada para la búsqueda por número de cliente, donde para cada número de cliente 
se almacenen juntos todos sus pedidos (día, cantidad de combos y monto) que realizó. La lectura finaliza con numero de cliente 0.
Se sugiere utilizar el módulo leerRegistro ().
b) Implementar un módulo que reciba la estructura generada en a) y un número de cliente, y retorne todos los pedidos que realizó dicho cliente.
c) Realice un módulo recursivo que reciba la información retornada en el inciso b) y retorne el monto total abonado por el cliente.

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.
}


program Tema2;
type
 rangoDias= 1..31;
 registro= record 
             numCliente: integer;
             dia:rangoDias;
             cantCombos:integer;
             monto:real;
          end;
 datoGuardar= record
                dia:rangoDias;
                cantCombos:integer;
                monto:real;
             end;
 lista= ^nodo;
 nodo= record
         dato:datoGuardar;
         sig:lista;
       end;
 info = record
          numCliente:integer;
          pedidos: lista;
        end;
 arbol=^nodoA;
 nodoA= record
          dato: info;
          hd:arbol;
          hi:arbol;
        end;
       
procedure generarArbol (var a: arbol);
{ Implementar un módulo que lea pedidos, genere y retorne una estructura adecuada para la búsqueda por número de cliente, donde para cada número de cliente 
se almacenen juntos todos sus pedidos (día, cantidad de combos y monto) que realizó. La lectura finaliza con numero de cliente 0. }
    
    procedure LeerRegistro( var R: registro);
    begin
        {r.numCliente:=  Random(76);}    
        write ('Ingrese numero: ');
        read (r.numCliente);
        if (r.numCliente  <> 0) 
        then begin
               r.dia:= 1+ Random(31);
       	       r.monto:= 100.50 +  Random(3000);
               r.cantCombos:= 1 + Random(20);
               writeln ('                   Cantidad: ', r.cantCombos, ' Monto: ' , r.monto:2:2);
             end;
    end;
    procedure agregarAdelante( var l: lista; r: datoGuardar);
    var  nue:lista;
    begin
         new(nue);
         nue^.dato:= r;
         nue^.sig:= l;
         l:= nue;
    end;
    procedure insertarEnArbol ( var a: arbol; elem: registro);
      procedure ArmarRegistroAGuardarEnLista (r: registro; var aGuardar: datoGuardar);
      begin
         aGuardar.cantCombos:= r.cantCombos;
         aGuardar.monto:= r.monto;
         aGuardar.dia:= r.dia;
      end;

    var aGuardar: datoGuardar;
    begin
        if( a= nil)
        then begin
               new(a);
               a^.dato.numCliente:= elem.numCliente;
               a^.dato.pedidos:= nil;
               ArmarRegistroAGuardarEnLista (elem, aGuardar);
               agregarAdelante(a^.dato.pedidos, aGuardar);
               a^.hd:= nil;
               a^.hi:= nil;
             end
        else if(elem.numCliente = a^.dato.numCliente)
             then begin
                     ArmarRegistroAGuardarEnLista (elem, aGuardar);
                     agregarAdelante( a^.dato.pedidos, aGuardar);
                  end
             else if (elem.numCliente < a^.dato.numCliente)
                  then insertarEnArbol (a^.hi, elem)
                  else insertarEnArbol (a^.hd, elem);
    end;

var  pedido:registro;
begin
  writeln ('---------------------- Generar arbol ----------------------');
  writeln;
  a:= nil;
  leerRegistro(pedido);
  while(pedido.numCliente <> 0) do
  begin
    insertarEnArbol (a, pedido);
    leerRegistro (pedido);
  end;
end;

function buscarPedidos (a: arbol; numero: integer):lista;
{ Implementar un módulo que reciba la estructura generada en a) y un número de cliente, y retorne todos los pedidos que realizó dicho cliente. }
begin
  if (a= nil)
  then buscarPedidos:= nil
  else if( a^.dato.numCliente = numero)
       then buscarPedidos:= a^.dato.pedidos
       else if(numero < a^.dato.numCliente )
            then buscarPedidos:= buscarPedidos (a^.hi, numero)
            else buscarPedidos:= buscarPedidos (a^.hd, numero);
end;

function montoTotal (l:lista): real;
{ Realice un módulo recursivo que reciba la información retornada en el inciso b) y retorne el monto total abonado por el cliente. }
begin
  if(l= nil)
  then montoTotal:= 0
  else montoTotal:= MontoTotal (l^.sig) + l^.dato.monto;
end;

var a: arbol;
    numeroClienteABuscar: integer;
    listaPedidos: lista;
    monto:real;
    
begin
  generarArbol(a);
  if(a= nil)
  then begin
         writeln;
         writeln('////////// Arbol sin elementos //////////');
         writeln;
       end
  else begin
         writeln;
         writeln ('////////// Arbol generado ///////////');
         writeln;
         write ('Ingrese numero a buscar: ');
         readln (numeroClienteABuscar);
         writeln;
         listaPedidos:= buscarPedidos(a, numeroClienteABuscar);
         if (listaPedidos = nil)
         then writeln ('El cliente con numero ', numeroClienteABuscar, ' no existe en el arbol')
         else begin
                 writeln;
                 writeln ('////////// Lista de pedidos retornada ///////////');
                 writeln; 
                 monto:= montoTotal (listaPedidos);
                 writeln ('El cliente con numero ', numeroClienteABuscar, ' gasto en total $ ', monto:2:2);
              end;
       end;
end.
           
                     

