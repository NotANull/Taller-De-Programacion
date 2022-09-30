
public class Hotel {

    private Habitacion[] habitaciones;
    private final int nHabitaciones;

    public Hotel(int nHabitaciones) {
        this.nHabitaciones = nHabitaciones;
        this.habitaciones = new Habitacion[nHabitaciones];
        inicializarHabitaciones();
    }

    public int getnHabitaciones() {
        return nHabitaciones;
    }
    
    private void inicializarHabitaciones() {
        Habitacion h;
        for (int i = 0; i < this.nHabitaciones; i++) {
            h = new Habitacion();
            this.habitaciones[i] = h;
        }
    }
    
    public void ingresarCliente(Cliente cliente, int nHabitacion) {
        if (habitaciones[nHabitacion].isEstaOcupada() == false) {
            habitaciones[nHabitacion].setCliente(cliente);
            habitaciones[nHabitacion].setEstaOcupada(true);
        }
    }
    
    public void aumentarPrecioHabitaciones(double aumento) {
        for (int i = 0; i < this.nHabitaciones; i++) {
            this.habitaciones[i].setCosto(this.habitaciones[i].getCosto() + aumento);
        }
    }
    
    public void mostrarHabitaciones() {
        for (int i = 0; i < this.nHabitaciones; i++) {
            System.out.println("Habitacion " + (i+1) + ": " + this.habitaciones[i]);
        }
    }
}
