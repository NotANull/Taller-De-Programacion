
public class Corista extends Persona{

    private int tonoFundamental;

    public Corista(String nombre, int dni, int edad, int tonoFundamental) {
        super(nombre, dni, edad);
        this.tonoFundamental = tonoFundamental;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }

    @Override
    public String toString() {
        return super.toString() + this.tonoFundamental;
    }
    
    
}
