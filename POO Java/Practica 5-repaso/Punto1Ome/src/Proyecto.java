
public class Proyecto {

    private String nombre;
    private int codigo;
    private String nombreDirector;
    private final Investigador[] investigadores;
    private final int maxInvestigadores = 50;
    private int cantInvestigadores;

    public Proyecto(String nombre, int codigo, String nombreDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        this.investigadores = new Investigador[this.maxInvestigadores];
        this.cantInvestigadores = -1;
        inicializarInvestigadores();
    }

    public int getMaxInvestigadores() {
        return maxInvestigadores;
    }

    public int getCantInvestigadores() {
        return cantInvestigadores;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }
    
    public void agregarInvestigador(Investigador unInvestigador) {
        this.cantInvestigadores++;
        if (this.cantInvestigadores < this.maxInvestigadores) {
            this.investigadores[this.cantInvestigadores] = unInvestigador;
        }
    }
    
    public double dineroTotalOtorgado() {
        double sumaDinero = 0;
        for (int i = 0; i < this.cantInvestigadores; i++) {
            sumaDinero += this.investigadores[i].totalEnSubsidios();
        }
        return sumaDinero;
    }
    
    public String mostrarInvestigador() {
        String cadena = "";
        for (int i = 0; i < this.cantInvestigadores; i++) {
            cadena += this.investigadores[i];
        }
        return cadena;
    }
    
    private void inicializarInvestigadores() {
        for (int i = 0; i < this.maxInvestigadores; i++) {
            investigadores[i] = null;
        }
    }

    @Override
    public String toString() {
        return "PROYECTO" + "\nNombre del proyecto: " + this.nombre + "\nNombre del director: " + this.nombreDirector + "\nTotal dinero para el proyecto: " + this.dineroTotalOtorgado() + "\n" + this.mostrarInvestigador();
    }
    
    
}
