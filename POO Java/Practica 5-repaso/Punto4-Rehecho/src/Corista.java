
public class Corista {

    private String nombre;
    private int dni;
    private int edad;
    private int tonoFundamental;

    public Corista(String nombre, int dni, int edad, int tonoFundamental) {
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
        this.tonoFundamental = tonoFundamental;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }
    
    @Override
    public String toString() {
        return "\n***CORISTA***" +
               "\nNombre: " + this.nombre +
               "\nDNI: " + this.dni +
               "\nEdad: " + this.edad +
               "\nTono fundamental: " +this.tonoFundamental;
    }
    
}
