
public class Paciente {

    private String nombrePaciente;
    private boolean obraSocial;
    private double costoPorSesion;

    public Paciente(String nombrePaciente, boolean obraSocial, double costoPorSesion) {
        this.nombrePaciente = nombrePaciente;
        this.obraSocial = obraSocial;
        this.costoPorSesion = costoPorSesion;
    }

    public String getNombrePaciente() {
        return nombrePaciente;
    }

    public void setNombrePaciente(String nombrePaciente) {
        this.nombrePaciente = nombrePaciente;
    }

    public boolean isObraSocial() {
        return obraSocial;
    }

    public void setObraSocial(boolean obraSocial) {
        this.obraSocial = obraSocial;
    }

    public double getCostoPorSesion() {
        return costoPorSesion;
    }

    public void setCostoPorSesion(double costoPorSesion) {
        this.costoPorSesion = costoPorSesion;
    }
    
    
}
