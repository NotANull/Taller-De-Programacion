
public class Libro {

    private String titulo;
    private Autor primerAutor;
    private String editorial;
    private int añoEdicion;
    private String ISBN;
    private double precio;

    public Libro() {

    }
    
    public Libro(String Titulo, String Editorial, int AñoEdicion, Autor PrimerAutor, String ISBN, double Precio) {
        this.titulo = Titulo;
        this.editorial = Editorial;
        this.añoEdicion = AñoEdicion;
        this.primerAutor = PrimerAutor;
        this.ISBN = ISBN;
        this.precio = Precio;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Autor getPrimerAutor() {
        return primerAutor;
    }

    public void setPrimerAutor(Autor primerAutor) {
        this.primerAutor = primerAutor;
    }

    public String getEditorial() {
        return editorial;
    }

    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    public int getAñoEdicion() {
        return añoEdicion;
    }

    public void setAñoEdicion(int añoEdicion) {
        this.añoEdicion = añoEdicion;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        return this.titulo + " por " + this.primerAutor + " - " + this.añoEdicion + " - ISBN: " + this.ISBN;
    }

    
}
