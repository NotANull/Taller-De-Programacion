
public class Gira extends Recital{

    private String nombreGira;
    private final Fecha[] fechas;
    private final int totalFechas;
    private int cantFechas;
    private Fecha fechaActual;

    public Gira(String nombreGira, int totalFechas, String nombreBanda, int totalTemas) {
        super(nombreBanda, totalTemas);
        this.nombreGira = nombreGira;
        this.totalFechas = totalFechas;
        this.fechas = new Fecha[this.totalFechas];
        this.cantFechas = -1;
    }

    public int getTotalFechas() {
        return totalFechas;
    }

    public int getCantFechas() {
        return cantFechas;
    }

    public Fecha getFechaActual() {
        return fechaActual;
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }
    
    public void agregarFecha(Fecha unaFecha) {
        this.cantFechas++;
        if (this.cantFechas < this.totalFechas) {
            this.fechas[this.cantFechas] = unaFecha;
        }
    }
    
    @Override
    public void actuar() {
        for (int i = 0; i <= this.cantFechas; i++) {
            this.fechaActual = this.fechas[i];
            System.out.println("Buenas noches " + this.fechaActual.getCiudad());
            super.actuar();
        }
    }

    @Override
    public double calcularCosto() {
        if (this.cantFechas > -1) {
            return (this.cantFechas + 1) * 30000; //Le sumo +1 por la dimL de cantFechas
        } else {
            return 0;
        }
    }
    
    
}
