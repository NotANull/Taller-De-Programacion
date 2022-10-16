
public class LibroImpreso extends Libro{

    private boolean tapaDura;

    public LibroImpreso(boolean tapaDura, String Titulo, double precioBase) {
        super(Titulo, precioBase);
        this.tapaDura = tapaDura;
    }

    @Override
    public double calcularAdicional() {
        if (tapaDura) {
            return 500;
        } else {
            return 0;
        }
    }

    @Override
    public String toString() {
        return "LIBRO IMPRESO\n" + super.toString();
    }

    
    
}
