
public class Circulo extends Figura{

    private double radio;

    public Circulo(String colorRelleno, String colorLinea) {
        super(colorRelleno, colorLinea);
    }

    public Circulo(double radio, String colorRelleno, String colorLinea) {
        super(colorRelleno, colorLinea);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    @Override
    public double calcularPerimetro() {
        return (Math.PI * this.radio * 2);
    }
    
    @Override
    public double calcularArea() {
        return (Math.PI * Math.pow(this.radio, 2));
    }

    @Override
    public String toString() {
        return "Radio: " + String.format("%.2f", this.radio) + super.toString();
    }
}
