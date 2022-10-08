import PaqueteLectura.*;

public class MainPunto4 {

    public static void main(String[] args) {
        
        Director director = new Director("Nombre Director", 1010, 50, 20);
        
        CoroSemicircular semicircular = new CoroSemicircular(5, "Nombre del coro", director);
        
        Corista corista1 = new Corista("Nombre Corista 1", 1010, 21, 2);
        Corista corista2 = new Corista("Nombre Corista 2", 2020, 22, 5);
        Corista corista3 = new Corista("Nombre Corista 3", 3030, 23, 8);
        Corista corista4 = new Corista("Nombre Corista 4", 4040, 24, 12);
        Corista corista5 = new Corista("Nombre Corista 5", 5050, 25, 15);
        
        semicircular.agregarCorista(corista1);
        semicircular.agregarCorista(corista2);
        semicircular.agregarCorista(corista3);
        semicircular.agregarCorista(corista5);
        semicircular.agregarCorista(corista4);
        
        System.out.println(semicircular);
        
        if (semicircular.estaLleno()) {
            System.out.println("El coro semicircular está lleno");
        } else {
            System.out.println("Al coro semicircular le sobra espacio");
        }
        
        if (semicircular.estaFormado()) {
            System.out.println("El coro semicircular está bien formado por tono fundamental");
        } else {
            System.out.println("El coro semicircular no está formado por tono fundamental");
        }
        
        System.out.println("dimL: " + semicircular.getCantCoristas());
    }

}
