
public class Director extends Persona{

    private int antiguedad;

    public Director(String nombre, int dni, int edad, int antiguedad) {
        super(nombre, dni, edad);
        this.antiguedad = antiguedad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return "\nDIRECTOR" + "\n" + super.toString() + this.antiguedad;
    }
    
}
