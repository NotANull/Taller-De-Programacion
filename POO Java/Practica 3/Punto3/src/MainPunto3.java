
import PaqueteLectura.*;

public class MainPunto3 {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        Estante e = new Estante();
        
        Autor autor;
        String nombreAutor;
        String biografiaAutor;
        String origenAutor;
        
        Libro libro;
        String tituloLibro;
        String editorialLibro;
        int añoEdicionLibro;
        String ISBNLibro;
        double precioLibro;
        
        Libro DameLibro = null;
        
        int librosAGuardar = GeneradorAleatorio.generarInt(31); //Digo PODRÍA LLEGAR A TENER 30 libros para guardar
        
        System.out.println("Se quieren guardar " + librosAGuardar + " libros");
        
        System.out.println("");
        
        while ( (!e.estaLleno()) && (librosAGuardar > 0) ) { //Mientras el estante no esté lleno
            
            System.out.println("Cubículo del estante " + (e.getCantLibros() + 1));
            
            System.out.println("");
            
            nombreAutor = GeneradorAleatorio.generarString(5);
            System.out.println("Nombre del autor: " + nombreAutor);
            biografiaAutor = GeneradorAleatorio.generarString(5);
            System.out.println("Biografía del autor: " + biografiaAutor);
            origenAutor = GeneradorAleatorio.generarString(5);
            System.out.println("Origen del autor: " + origenAutor);
            autor = new Autor(nombreAutor, biografiaAutor, origenAutor);
            
            System.out.println("");
            
            tituloLibro = GeneradorAleatorio.generarString(1);
            System.out.println("Título del libro: " + tituloLibro);
            editorialLibro = GeneradorAleatorio.generarString(5);
            System.out.println("Editorial del libro: " + editorialLibro);
            añoEdicionLibro = GeneradorAleatorio.generarInt(222)+1800; //Random entre 1800 y 2022
            System.out.println("Año de edición del libro: " + añoEdicionLibro);
            ISBNLibro = GeneradorAleatorio.generarString(5);
            System.out.println("ISBN del libro: " + ISBNLibro);
            precioLibro = (int)GeneradorAleatorio.generarDouble(5);
            System.out.println("Precio del libro: " + precioLibro);
            libro = new Libro(tituloLibro, editorialLibro, añoEdicionLibro, autor, ISBNLibro, precioLibro);
            
            System.out.println("");
            
            e.agregarLibro(libro);
            
            librosAGuardar--;
        }
        
        if (e.estaLleno()) {
            if (librosAGuardar == 0) {
                System.out.println("El estante está lleno de libros");
            } else {
                System.out.println("El estante está lleno de libros, me quedan sin guardar " + librosAGuardar);
            }
        } else {
            System.out.println("Al estante le sobra espacio");
        }
        
        //Replantear
        if (e.devolverLibro("M") == null) {
            System.out.println("El libro no se encuentra en el estante");
        } else {
            System.out.println(e.devolverLibro("M"));
        }
    }

}
