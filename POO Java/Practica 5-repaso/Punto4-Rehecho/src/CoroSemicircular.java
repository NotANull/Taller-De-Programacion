
public class CoroSemicircular extends Coro {

    private final int dimF;
    private int dimL;
    private final Corista[] arrayCoristas;

    public CoroSemicircular(int dimF, Director director) {
        super(director);
        this.dimF = dimF;
        this.dimL = 0;
        this.arrayCoristas = new Corista[this.dimF];
    }
    
    @Override
    public void agregarCorista(Corista unCorista) {
        if (this.dimL < this.dimF) {
            this.arrayCoristas[dimL] = unCorista;
            this.dimL++;
        }
    }
    
    @Override
    public boolean coroLleno() {
        return this.dimL == this.dimF;
    }
    
    @Override
    public boolean estaFormado() {
        int i = 0;
        boolean ordenado = true;
        while ( (i < (this.dimL-1)) && (ordenado) ) {
            if (this.arrayCoristas[i+1].getTonoFundamental() < this.arrayCoristas[i].getTonoFundamental()) {
                i++;
            } else {
                ordenado = false;
            }
        }
        return ordenado;
    }
    
    public String mostrarCoristas(){
        String aux = "";
        for (int i = 0; i < this.dimL; i++) {
           aux += this.arrayCoristas[i]; 
        }
        return aux;
    }
    
    @Override
    public String toString(){
        return super.toString() + this.mostrarCoristas();
    }
}
