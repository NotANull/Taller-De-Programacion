
public class Persona {

    private String nombre;
    private int DNI;
    private int edad;

    public Persona(String unNombre, int unDNI, int unaEdad) {
        this.nombre = unNombre;
        this.DNI = unDNI;
        this.edad = unaEdad;
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }

    @Override
    public String toString() {
        return "Mi nombre es " + this.nombre + ", mi DNI es " + this.DNI + " y tengo " + this.edad + " años.";
    }

}
