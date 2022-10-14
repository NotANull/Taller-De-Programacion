import PaqueteLectura.*;

public class MainParcial5 {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        Estanteria estanteria = new Estanteria(5, 3);
        
        Libro libro;
        Libro libroASacar;
        String titulo;
        String nombreAutor;
        int estante, lugar;
        double peso;
        
        for (int i = 0; i < 7; i++) {
            
            titulo = GeneradorAleatorio.generarString(3);
            System.out.println("Título del libro: " + titulo);
            
            nombreAutor = GeneradorAleatorio.generarString(5);
            System.out.println("Nombre del autor: " + nombreAutor);
            
            peso = GeneradorAleatorio.generarDouble(5);
            System.out.println("Peso del libro: " + String.format("%.2f", peso));
            
            libro = new Libro(titulo, nombreAutor, peso);
            
            System.out.print("Ingrese el estante a guardar el libro: ");
            estante = Lector.leerInt();
            
            System.out.print("Ingrese el cubiculo del estante: ");
            lugar = Lector.leerInt();
            
            System.out.println("El libro se va a guardar en el estante " + estante + " cubiculo " + lugar);
            
            System.out.println();
            
            estanteria.almacenarLibro(libro, estante, lugar);
        }
        
        System.out.println();
        
        System.out.print("ingrese el titulo de libro que quiere sacar: ");
        titulo = Lector.leerString();
        libroASacar = estanteria.sacarLibro(titulo);
        
        if (libroASacar != null) {
            System.out.println(libroASacar);
        } else {
            System.out.println("No se encuentra el libro en la estanteria");
        }
        
        System.out.println("");
        
        System.out.println("Libro más pesado de la estantería: \n" + estanteria.libroPesado());
    }

}
