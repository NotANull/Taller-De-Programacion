
public class Trabajador extends Persona {

    private String tarea;

    public Trabajador(String tarea, String unNombre, int unDNI, int unaEdad) {
        super(unNombre, unDNI, unaEdad);
        this.tarea = tarea;
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }

    @Override
    public String toString() {
        return super.toString() + " Soy " + this.tarea;
    }
}
