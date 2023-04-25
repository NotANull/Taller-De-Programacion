
public class Alumno {

    private int dni;
    private String nombre;
    private int Cantasistencias;
    private int cantAutoevaluacionesAprobadas;

    public Alumno() {
        this.Cantasistencias = 0;
        this.cantAutoevaluacionesAprobadas = 0;
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

    public int getCantasistencias() {
        return Cantasistencias;
    }

    public int getCantAutoevaluacionesAprobadas() {
        return cantAutoevaluacionesAprobadas;
    }
    
    public void incrementarAsistencia(int unDni) {
        if (this.dni == unDni) {
            this.Cantasistencias++;
        }
    }

    public void aprobarAutoevaluacion(int unDni) {
        if (this.dni == unDni) {
            this.cantAutoevaluacionesAprobadas++;
        }
    }

    @Override
    public String toString() {
        return "Alumna/o" +
               "\nNombre: " + this.nombre +
               "\nDni: " + this.dni +
               "\nCantidad de asistencias: " + this.Cantasistencias +
               "\nCantidad de autoevaluaciones aprobadas: " + this.cantAutoevaluacionesAprobadas;
    }
    
    
}
