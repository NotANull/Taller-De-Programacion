
public class Estante {

    private final Libro[] arrayLibros;
    private final int dimF = 20; //Cada estante que se instancie va a tener, como máximo 20 libros.
    private int cantLibros;

    public Estante() {
        this.arrayLibros = new Libro[this.dimF];
        this.cantLibros = 0;
    }

    //Sólo quiero compartir hasta cuántos libros quiero / puedo almacenar
    public int getDimF() {
        return dimF;
    }

    //Sólo quiero compartir la cantidad de libros que quiero/puedo almacenar
    //Inciso i
    public int getCantLibros() {
        return cantLibros;
    }

    //Inciso ii
    public boolean estaLleno() {
        return (this.cantLibros == this.dimF);
    }

    public void agregarLibro(Libro unLibro) {
        if (this.cantLibros < this.dimF) {
            this.arrayLibros[this.cantLibros] = unLibro;
            this.cantLibros++;
        }
    }

    public Libro devolverLibro(String tituloLibro) {
        Libro libroABuscar = null;
        boolean noEsta = true;
        int indice = 0;
        while ((indice < cantLibros) && (noEsta)) {
            if (this.arrayLibros[indice].getTitulo() != tituloLibro) {
                indice++;
            } else {
                noEsta = false;
                libroABuscar = this.arrayLibros[indice];
            }
        }
        return libroABuscar;
    }
}
