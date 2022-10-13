
public class Alumno {

    private String nombreAlumno;
    private int edad;
    private String instrumento;
    private double puntaje;

    public Alumno(String nombreAlumno, int edad, String instrumento) {
        this.nombreAlumno = nombreAlumno;
        this.edad = edad;
        this.instrumento = instrumento;
        this.puntaje = -1;
    }

    public String getNombreAlumno() {
        return nombreAlumno;
    }

    public void setNombreAlumno(String nombreAlumno) {
        this.nombreAlumno = nombreAlumno;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getInstrumento() {
        return instrumento;
    }

    public void setInstrumento(String instrumento) {
        this.instrumento = instrumento;
    }

    public double getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(double puntaje) {
        this.puntaje = puntaje;
    }
    
    
}
