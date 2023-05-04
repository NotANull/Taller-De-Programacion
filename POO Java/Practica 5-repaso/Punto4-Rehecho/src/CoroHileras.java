
public class CoroHileras extends Coro {

    private final int dimFFilas;
    private final int dimFColumnas;
    private int dimLFilas;
    private final int[] arrayDimLColumnas;
    private final Corista[][] matrizCoristas;

    public CoroHileras(int dimFFilas, int dimFColumnas, Director director) {
        super(director);
        this.dimFFilas = dimFFilas;
        this.dimFColumnas = dimFColumnas;
        this.dimLFilas = 0;
        this.arrayDimLColumnas = new int[dimFColumnas];
        inicializarArrayDimLColumnas();
        this.matrizCoristas = new Corista[this.dimFFilas][this.dimFColumnas];
    }

    private void inicializarArrayDimLColumnas() {
        for (int i = 0; i < this.dimFColumnas; i++) {
            this.arrayDimLColumnas[i] = 0;
        }
    }

    @Override
    public void agregarCorista(Corista unCorista) {
        if (this.dimLFilas < this.dimFFilas) {
            if (this.arrayDimLColumnas[this.dimLFilas] < this.dimFColumnas) {
                this.matrizCoristas[this.dimLFilas][this.arrayDimLColumnas[this.dimLFilas]] = unCorista;
                this.arrayDimLColumnas[this.dimLFilas]++;
            }
            if (this.arrayDimLColumnas[this.dimLFilas] == this.dimFColumnas) {
                this.dimLFilas++;
            }
        }
    }

    @Override
    public boolean estaFormado() {
        return (  this.primerasColumnasDescendentes() );
    }

    private boolean filasOrdenadas() {
        int i = 0;
        int j;
        boolean ordenado = true;
        while ((i < this.dimLFilas) && (ordenado)) {
            j = 0;
            while ((j < this.arrayDimLColumnas[(i)] - 1) && (ordenado)) {
                if (this.matrizCoristas[i][j + 1].getTonoFundamental() == this.matrizCoristas[i][j].getTonoFundamental()) {
                    j++;
                } else {
                    ordenado = false;
                }
            }
            if (ordenado) {
                i++;
            }
        }
        return ordenado;
    }

    private boolean primerasColumnasDescendentes() {
        int i = 0;
        boolean ordenado = true;
        while ((i < (this.dimLFilas-1)) && (ordenado)) {
            if (this.matrizCoristas[i+1][0].getTonoFundamental() < this.matrizCoristas[i][0].getTonoFundamental()) {
                i++;
            } else {
                ordenado = false;
            }
        }
        return ordenado;
    }
    
    public void mostrarMatriz() {
        for (int i = 0; i < this.dimLFilas; i++) {
            for (int j = 0; j < this.arrayDimLColumnas[i]; j++) {
                System.out.println("[" + i + "][" + j + "] = " + this.matrizCoristas[i][j].getTonoFundamental());
            }
            System.out.println("");
        }
    }

    @Override
    public boolean coroLleno() {
        return ((this.dimLFilas == this.dimFFilas) && (this.arrayDimLColumnas[dimLFilas-1] == this.dimFColumnas));
    }

    @Override
    public String mostrarCoristas() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
