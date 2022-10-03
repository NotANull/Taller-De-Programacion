
public abstract class Figura {

    private String colorRelleno;
    private String colorLinea;

    public Figura(String colorRelleno, String colorLinea) {
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public void despintar() {
        this.colorLinea = "Negra";
        this.colorRelleno = "Blanco";
    }
    
    public abstract double calcularPerimetro();
    public abstract double calcularArea();

    @Override
    public String toString() {
        return " - Color relleno: " + this.colorRelleno + " - Color línea: " + this.colorLinea + "\nPerímetro: " + String.format("%.2f", this.calcularPerimetro()) + "\nÁrea: " + String.format("%.2f", this.calcularArea());
    }
    
}
