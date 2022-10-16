import PaqueteLectura.GeneradorAleatorio;

public class MainParcialLibro {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
       
        String titulo, formato, autor;
        double precioBase, mb;
        boolean tapaDura;
        
        System.out.println("PARA EL LIBRO ELECTRÓNICO");
        
        titulo = GeneradorAleatorio.generarString(5);
        System.out.println("Nombre del título del libro electrónico: " + titulo);
        
        precioBase = GeneradorAleatorio.generarDouble(1000)+500; //Random entre 500 y 1000
        System.out.println("Precio base del libro electrónico: " + String.format("%.2f", precioBase));
        
        formato = GeneradorAleatorio.generarString(5);
        System.out.println("Formato del archivo para el libro electrónico: " + formato);
        
        mb = GeneradorAleatorio.generarDouble(600)+50; //Random entre 50 y 650
        System.out.println("Peso del archivo: " +  String.format("%.2f", mb) + " MB");
        
        LibroElectronico libroElectronico = new LibroElectronico(formato, mb, titulo, precioBase);
        
        //----------------------------------------------------------------------------------------------\\
        
        System.out.println();
        
        System.out.println("PARA EL LIBRO IMPRESO");
        
        titulo = GeneradorAleatorio.generarString(5);
        System.out.println("Nombre del título del libro impreso: " + titulo);
        
        precioBase = GeneradorAleatorio.generarDouble(1000)+500; //Random entre 500 y 1000
        System.out.println("Precio base del libro impreso: " + String.format("%.2f", precioBase));
        
        tapaDura = false;
        if (tapaDura) {
            System.out.println("Tapa dura: si");
        } else {
            System.out.println("Tapa dura: no");
        }
        
        LibroImpreso libroImpreso = new LibroImpreso(tapaDura, titulo, precioBase);
        
        System.out.println();
        
        for (int i = 0; i < 3; i++) {
            
            autor = GeneradorAleatorio.generarString(5);
            System.out.println("Nombre del autor del libro electrónico: " + autor);
            
            libroElectronico.agregarAutor(autor);
            
            autor = GeneradorAleatorio.generarString(5);
            System.out.println("Nombre del autor del libro impreso: " + autor);
            
            libroImpreso.agregarAutor(autor);
            
            System.out.println();
        }
        
        System.out.println(libroElectronico);
        
        System.out.println(libroImpreso);
    }

}
