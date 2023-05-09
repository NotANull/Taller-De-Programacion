
public class Hospital {

    private String nombre;
    private String direccion;
    private final int dimF;
    private final Cama[] arrayCamas;

    public Hospital() {
        this.dimF = 100;
        this.arrayCamas = new Cama[this.dimF];
        inicializarArrayCamas();
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    private void inicializarArrayCamas() {
        for (int i = 0; i < this.dimF; i++) {
            this.arrayCamas[i] = new Cama();
        }
    }
    
    public void ingresarPaciente(Paciente paciente, int nCama) {
        if (nCama < this.dimF) {
            this.arrayCamas[nCama].ingresarPaciente(paciente, nCama);
        }
    }
    
    public void altaPaciente(int dni) {
        int i = 0;
        while (i < this.dimF){
            if ( (this.arrayCamas[i].isOcupada()) && (this.arrayCamas[i].getPaciente().getDni() == dni) ){
                this.arrayCamas[i] = new Cama();
            } else {
                i++;
            }
        }
    }
    
    public void incrementarCamasEnUso() {
        for (int i = 0; i < this.dimF; i++) {
            if (this.arrayCamas[i].isOcupada()) {
                this.arrayCamas[i].incrementarDiaOcupada();
            }
        }
    }
    
    private String mostrarCamas() {
        String aux = "";
        for (int i = 0; i < this.dimF; i++) {
            aux += this.arrayCamas[i].toString();
        }
        return aux;
    }
    
    @Override
    public String toString() {
        return "\n------HOSPITAL------" +
               "\nNombre: " + this.nombre +
               "\nDirección: " + this.direccion +
               "\n" + this.mostrarCamas();
    }
}
