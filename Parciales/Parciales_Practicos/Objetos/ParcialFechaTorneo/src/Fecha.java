
public class Fecha {

    private int dimL;
    private final int mGoleadores;
    private final Goleador[] arrayGoleadores;

    public Fecha(int mGoleadores) {
        this.mGoleadores = mGoleadores;
        this.arrayGoleadores = new Goleador[this.mGoleadores];
        this.dimL = 0;
    }

    public int getDimL() {
        return dimL;
    }

    public int getmGoleadores() {
        return mGoleadores;
    }
    
    public void agregarGoleador(Goleador unGoleador) {
        if (this.dimL < this.mGoleadores) {
            this.arrayGoleadores[dimL] = unGoleador;
            this.dimL++;
        }
    }
    
    public Goleador goleadorMenosGoles() {
        Goleador goleador = new Goleador();
        goleador.setCantGoles(9999);
        for (int i = 0; i < this.dimL; i++) {
            if (this.arrayGoleadores[i].getCantGoles() < goleador.getCantGoles()) {
                goleador = this.arrayGoleadores[i];
            }
        }
        return goleador;
    }
    
    public String mostrarGoleadores() {
        String aux = "";
        for (int i = 0; i < this.dimL; i++) {
            aux += "\n" + this.arrayGoleadores[i] + "\n";
        }
        return aux;
    }
    
    @Override
    public String toString() {
        return "\nGoleadores" + this.mostrarGoleadores();
    }
}
