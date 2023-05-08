
public class Director {

    private String nombre;
    private int dni;
    private int edad;
    private int antiguedad;

    public Director(String nombre, int dni, int edad, int antiguedad) {
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
        this.antiguedad = antiguedad;
    }
    
    @Override
    public String toString() {
        return "\n***DIRECTOR***" +
               "\nNombre: " + this.nombre +
               "\nDNI: " + this.dni +
               "\nEdad " + this.edad +
               "\nAntiguedad: " + this.antiguedad;
    }
}
