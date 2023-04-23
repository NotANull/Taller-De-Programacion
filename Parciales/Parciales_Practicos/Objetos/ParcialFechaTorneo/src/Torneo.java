
import PaqueteLectura.GeneradorAleatorio;

public class Torneo {

    private String nombre;
    private final int nFechas;
    private final Fecha[] arrayFechas;

    public Torneo(String nombre, int nFechas) {
        this.nombre = nombre;
        this.nFechas = nFechas;
        this.arrayFechas = new Fecha[this.nFechas];
        inicializarFechas();
    }

    public String getNombre() {
        return nombre;
    }

    public int getnFechas() {
        return nFechas;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    private void inicializarFechas() {
        GeneradorAleatorio.iniciar();
        for (int i = 0; i < this.nFechas; i++) {
            this.arrayFechas[i] = new Fecha(GeneradorAleatorio.generarInt(16));
        }
    }

    public void agregarGoleadorALaFecha(Goleador unGoleador, int fechaX) {
        this.arrayFechas[fechaX].agregarGoleador(unGoleador);
    }

    public Goleador getGoleadorMenosGoles(int fechaX) {
        return this.arrayFechas[fechaX].goleadorMenosGoles();
    }

    public int getTotalGoleadoresTorneo() {
        int contar = 0;
        for (int i = 0; i < this.nFechas; i++) {
            contar += this.arrayFechas[i].getDimL();
        }
        return contar;
    }

    public String mostrarFechas() {
        String aux = "";
        for (int i = 0; i < this.nFechas; i++) {
            if (this.arrayFechas[i].getDimL() > 0) {
                aux += "\nFecha #" + i + " Cantidad de goleadores de la fecha: " + this.arrayFechas[i].getDimL() + this.arrayFechas[i];
            } else {
                aux += "\nNo hubo fecha " + i + "\n";
            }
        }
        return aux;
    }
    
    @Override
    public String toString() {
        return "TORNEO 2022 " + this.nombre
                + "\n" + this.mostrarFechas() + "\n";
    }

}
