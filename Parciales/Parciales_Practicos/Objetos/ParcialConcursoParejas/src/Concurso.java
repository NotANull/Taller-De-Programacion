
public class Concurso {

    private final int dimF;
    private int dimL;
    private final Pareja[] arrayParejas;

    public Concurso(int dimF) {
        this.dimF = dimF;
        this.dimL = 0;
        this.arrayParejas = new Pareja[dimF];
        inicializarArrayParejas();
    }

    private void inicializarArrayParejas() {
        for (int i = 0; i < this.dimF; i++) {
            this.arrayParejas[i] = null;
        }
    }
    
    public void agregarPareja(Pareja unaPareja) {
        this.arrayParejas[dimL] = unaPareja;
        this.dimL++;
    }
    
    public Pareja getParejaMaxDiferencia() {
        Pareja maxPareja = null;
        int maxDiferencia = -1;
        for (int i = 0; i < this.dimL; i++) {
            if (this.arrayParejas[i].getDiferenciaEdad() > maxDiferencia) {
                maxPareja = this.arrayParejas[i];
                maxDiferencia = this.arrayParejas[i].getDiferenciaEdad();
            }
        }
        return maxPareja;
    }
}
