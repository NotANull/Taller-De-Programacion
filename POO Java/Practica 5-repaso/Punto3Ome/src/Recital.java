
public abstract class Recital {

    private String nombreBanda;
    private final String[] temas;
    private final int totalTemas;
    private int cantTemas;

    public Recital(String nombreBanda, int totalTemas) {
        this.nombreBanda = nombreBanda;
        this.totalTemas = totalTemas;
        this.temas = new String[this.totalTemas];
        this.cantTemas = -1;
    }

    public int getTotalTemas() {
        return totalTemas;
    }

    public int getCantTemas() {
        return cantTemas;
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }
    
    public void agregarTema(String nombreTema) {
        this.cantTemas++;
        if (this.cantTemas < this.totalTemas) {
            this.temas[cantTemas] = nombreTema;
        }
    }
    
    public void actuar() {
        for (int i = 0; i <= this.cantTemas; i++) {
            System.out.println("Y ahora tocaremos " + this.temas[i]);
        }
    }
    
    public abstract double calcularCosto();
    
}
