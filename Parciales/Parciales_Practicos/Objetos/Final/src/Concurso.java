
public class Concurso {

    private final Pareja[] parejas;
    private final int totalParejas;
    private int cantParejas;

    public Concurso(int totalParejas) {
        this.totalParejas = totalParejas;
        this.parejas = new Pareja[this.totalParejas];
        this.cantParejas = 0;
        inicializarParejas();
    }

    public int getTotalParejas() {
        return totalParejas;
    }

    public int getCantParejas() {
        return cantParejas;
    }

    private void inicializarParejas() {
        for (int i = 0; i < this.totalParejas; i++) {
            parejas[i] = null;
            
        }
    }
    
    public void agregarPareja(Pareja pareja) {
        this.parejas[this.cantParejas] = pareja;
        this.cantParejas++;
    }
    
    public Pareja parejaConMasDiferencia() {
        int maxDiferencia = -1;
        Pareja parejaMax = null;
        for (int i = 0; i < this.cantParejas; i++) {
            if (this.parejas[i].diferenciaDeEdad() > maxDiferencia) {
                parejaMax = this.parejas[i];
                maxDiferencia = this.parejas[i].diferenciaDeEdad();
            }
        }
        return parejaMax;
    }
    
    public void mostrarPareja() {
        for (int i = 0; i < this.cantParejas; i++) {
            System.out.println("Pareja " + (i+1));
            System.out.println(this.parejas[i]);
            System.out.println("Diferencia de edades entre participantes de la pareja " + (i+1) + ": " + this.parejas[i].diferenciaDeEdad());
            System.out.println("");
        }
    }
}
