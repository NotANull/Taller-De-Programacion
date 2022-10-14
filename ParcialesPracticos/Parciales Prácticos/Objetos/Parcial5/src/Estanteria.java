
public class Estanteria {

    private final Libro[][] libros;
    private final int nEstantes;
    private final int mLibros;

    public Estanteria(int nEstantes, int mLibros) {
        this.nEstantes = nEstantes;
        this.mLibros = mLibros;
        this.libros = new Libro[this.nEstantes][this.mLibros];
        inicializarLibros();
    }

    public int getnEstantes() {
        return nEstantes;
    }

    public int getmLibros() {
        return mLibros;
    }

    private void inicializarLibros() {
        for (int i = 0; i < this.nEstantes; i++) {
            for (int j = 0; j < this.mLibros; j++) {
                this.libros[i][j] = null;
            }
        }
    }
    
    public void almacenarLibro(Libro libro, int estante, int lugar) {
        this.libros[estante][lugar] = libro;
    }
    
    public Libro sacarLibro(String tituloLibro) {
        Libro libroADevolver = null;
        int i = 0;
        int j;
        boolean noEsta = true;
        while ((i < this.nEstantes) && (noEsta)) {
            j = 0;
            while (j < this.mLibros && (noEsta)) {
                if (this.libros[i][j] != null && (this.libros[i][j].getTitulo().equals(tituloLibro))) {
                    libroADevolver = this.libros[i][j];
                    this.libros[i][j] = null;
                    noEsta = false;
                } else {
                    j++;
                }
            }
            if (noEsta) {
                i++;
            }
        }
        return libroADevolver;
    }
    
    public Libro libroPesado() {
        Libro libroADevolver = null;
        double mayorPeso = -1;
        for (int i = 0; i < this.nEstantes; i++) {
            for (int j = 0; j < this.mLibros; j++) {
                if ((this.libros[i][j] != null) && (this.libros[i][j].getPeso() > mayorPeso)) {
                    libroADevolver = this.libros[i][j];
                    mayorPeso = this.libros[i][j].getPeso();
                }
            }
        }
        return libroADevolver;
    }
}
