
public class MainPunto2 {

    public static void main(String[] args) {
        
        Autor a = new Autor("Nombre del autor", "Biografia del autor", "Origen del autor");
        
        Libro libro1 = new Libro("Java: A Beginner's Guide", "Mcgraw-Hill", 2014, a, "978-0071809252", 21.72);
        System.out.println(libro1.toString());
    }

}
