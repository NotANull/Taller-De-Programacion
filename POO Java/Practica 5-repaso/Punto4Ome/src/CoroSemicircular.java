
public class CoroSemicircular extends Coro{

    private final Corista[] coristas;
    private final int totalCoristas;
    private int cantCoristas;

    public CoroSemicircular(int totalCoristas, String nombreCoro, Director director) {
        super(nombreCoro, director);
        this.totalCoristas = totalCoristas;
        this.coristas = new Corista[this.totalCoristas];
        this.cantCoristas = -1;
    }

    public int getTotalCoristas() {
        return totalCoristas;
    }

    public int getCantCoristas() {
        return cantCoristas;
    }
    
    @Override
    public void agregarCorista(Corista corista) {
        this.cantCoristas++;
        if (this.cantCoristas < this.totalCoristas) {
            this.coristas[this.cantCoristas] = corista;
        }
    }

    @Override
    public boolean estaLleno() {
        return ((this.cantCoristas + 1) == this.totalCoristas);
    }

    @Override
    public boolean estaFormado() {
        int i = 0;
        boolean ordenado = true;
        while ( (i < this.cantCoristas) && (ordenado) ) {
            ordenado = this.coristas[i].getTonoFundamental() < this.coristas[i+1].getTonoFundamental();
            i++;
        }
        return ordenado;
    }

    @Override
    public String mostrarCoristas() {
        String cadena = "";
        for (int i = 0; i <= this.cantCoristas; i++) {
            cadena += this.coristas[i].toString() + "\n";
        }
        return ("CORISTAS \n" + cadena);
    }
    
    @Override
    public String toString() {
        return "CORO SEMICIRCULAR" + super.toString();
    }
}
