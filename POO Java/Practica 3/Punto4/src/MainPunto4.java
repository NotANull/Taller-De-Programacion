
public class MainPunto4 {

    public static void main(String[] args) {
        
        Hotel h = new Hotel(5);
        
        Cliente c1 = new Cliente("Pepito", 1212, 26);
        Cliente c2 = new Cliente("Juanito", 2121, 62);
        Cliente c3 = new Cliente("Zote", 2022, 20);
        
        
        h.ingresarCliente(c1, 0); //Vendría a ser habitación 1
        h.ingresarCliente(c2, 2); //Vendría a ser habitación 3
        h.ingresarCliente(c3, 0); //No tendría que pisar la información con el cliente 1 ya que la habitación está ocupada
        
        h.mostrarHabitaciones();
        
        h.aumentarPrecioHabitaciones(1000);
        
        System.out.println();
        
        System.out.println("Habitaciones con aumento");
        h.mostrarHabitaciones();
    }

}
