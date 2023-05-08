
public class Paciente {

    private int dni;
    private String nombre;
    private String obraSocial;

    public Paciente() {
    }

    public Paciente(int dni, String nombre, String obraSocial) {
        this.dni = dni;
        this.nombre = nombre;
        this.obraSocial = obraSocial;
    }
    
    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getObraSocial() {
        return obraSocial;
    }

    public void setObraSocial(String obraSocial) {
        this.obraSocial = obraSocial;
    }
    
    @Override
    public String toString() {
        return "\n***PACIENTE***" +
               "\nNombre: " + this.nombre +
               "\nDNI: " + this.dni +
               "\nObra Social: " + this.obraSocial +
               "\n";
    }
}
