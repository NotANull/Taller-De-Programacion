
public class LibroElectronico extends Libro{

    private String formato;
    private double mb;

    public LibroElectronico(String formato, double mb, String Titulo, double precioBase) {
        super(Titulo, precioBase);
        this.formato = formato;
        this.mb = mb;
    }

    @Override
    public double calcularAdicional() {
        return (2.5 * this.mb);
    }

    @Override
    public String toString() {
        return "LIBRO ELECTRÓNICO\n" + super.toString();
    }

    
}
