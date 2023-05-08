
public class Cama {

    private int numero;
    private boolean ocupada;
    private Paciente paciente;
    private int cantDiasOcupada;
    
    public Cama() {
        this.ocupada = false;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getCantDiasOcupada() {
        return cantDiasOcupada;
    }

    public void setCantDiasOcupada(int cantDiasOcupada) {
        this.cantDiasOcupada = cantDiasOcupada;
    }
    
    public boolean isOcupada() {
        return ocupada;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }
    
    public void ingresarPaciente(Paciente paciente, int nCama) {
        this.numero = nCama;
        this.paciente = paciente;
        this.ocupada = true;
    }
    
    public void altaPaciente() {
        this.ocupada = false;
    }
    
    public void incrementarDiaOcupada() {
        if (this.ocupada) {
            this.cantDiasOcupada++;
        }
    }
    
    @Override
    public String toString() {
        String aux = "";
        if (this.ocupada) {
            return aux = "\n////CAMA////" +
                   "\n->Ocupada<-" +
                   "\nNúmero: " + this.numero +
                   "\nCantidad de días ocupada: " + this.cantDiasOcupada +
                   this.paciente;
        } 
        return aux;
    }
}
