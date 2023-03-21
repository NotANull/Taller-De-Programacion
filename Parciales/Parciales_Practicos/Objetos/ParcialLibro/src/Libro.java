
public abstract class Libro {

    private String titulo;
    private double precioBase;
    private final String[] autores;
    private final int totalAutores = 8;
    private int cantAutores;

    public Libro(String titulo, double precioBase) {
        this.titulo = titulo;
        this.precioBase = precioBase;
        this.autores = new String[this.totalAutores];
        this.cantAutores = 0;
        inicializarAutores();
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public double getPrecioBase() {
        return precioBase;
    }

    public void setPrecioBase(double precioBase) {
        this.precioBase = precioBase;
    }

    private void inicializarAutores() {
        for (int i = 0; i < this.totalAutores; i++) {
            this.autores[i] = null;
        }
    }
    
    public void agregarAutor(String autor) {
        this.autores[this.cantAutores] = autor;
        this.cantAutores++;
    }
    
    public double precioFinal() {
        return (this.precioBase + this.calcularAdicional());
    }

    public abstract double calcularAdicional();
    
    public String mostrarAutores() {
        String cadena = "";
        for (int i = 0; i < this.cantAutores; i++) {
            cadena += "Autor: " + this.autores[i] + "\n";
        }
        return cadena;
    }

    @Override
    public String toString() {
        return "Título: " + this.titulo + ", precio final: " + String.format("%.2f", this.precioFinal()) + "\nAutores\n" + this.mostrarAutores();
    }
    
    
}
