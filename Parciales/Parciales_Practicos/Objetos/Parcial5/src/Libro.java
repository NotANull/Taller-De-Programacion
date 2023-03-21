
public class Libro {

    private String titulo;
    private String nombreAutor;
    private double peso;

    public Libro(String titulo, String nombreAutor, double peso) {
        this.titulo = titulo;
        this.nombreAutor = nombreAutor;
        this.peso = peso;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getNombreAutor() {
        return nombreAutor;
    }

    public void setNombreAutor(String nombreAutor) {
        this.nombreAutor = nombreAutor;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    @Override
    public String toString() {
        return "Libro{" + "titulo=" + titulo + ", nombreAutor=" + nombreAutor + ", peso=" + String.format("%.2f", peso) + '}';
    }
}
