
public class MainPunto5 {

    public static void main(String[] args) {
        
        Director directorSemicircular = new Director("TuVieja", 123, 56, 30);
        Director directorHileras = new Director("TuAbuela", 31, 65, 123);
        
        CoroSemicircular coroSemi = new CoroSemicircular(5, directorSemicircular);
        CoroHileras coroHileras = new CoroHileras(3, 3, directorHileras);
        
        Corista c1 = new Corista("asdasd", 345, 45, 13);
        Corista c2 = new Corista("xcvxcv", 455, 54, 12);
        Corista c3 = new Corista("ghjghj", 677, 32, 11);
        Corista c4 = new Corista("rtyrty", 268, 87, 10);
        Corista c5 = new Corista("rtyrty", 268, 87, 9);
        Corista c6 = new Corista("rtyrty", 268, 87, 8);
        Corista c7 = new Corista("rtyrty", 268, 87, 7);
        Corista c8 = new Corista("rtyrty", 268, 87, 6);
        Corista c9 = new Corista("rtyrty", 268, 87, 5);
        
        coroSemi.agregarCorista(c1);
        coroSemi.agregarCorista(c2);
        coroSemi.agregarCorista(c3);
        coroSemi.agregarCorista(c4);
        coroSemi.agregarCorista(c5);
        
        coroHileras.agregarCorista(c1);
        coroHileras.agregarCorista(c2);
        coroHileras.agregarCorista(c3);
        coroHileras.agregarCorista(c4);
        coroHileras.agregarCorista(c5);
        coroHileras.agregarCorista(c6);
        coroHileras.agregarCorista(c7);
        coroHileras.agregarCorista(c8);
        coroHileras.agregarCorista(c9);
        
//        if (coroSemi.estaFormado()) {
//            System.out.println("El coro está formado");
//        } else {
//            System.out.println("El coro NO ESTÁ formado");
//        }
        
        if (coroHileras.coroLleno()) {
            System.out.println("El coro está lleno");
        } else {
            System.out.println("El coro le sobra espacio");
        }
        
        if (coroHileras.estaFormado()) {
            System.out.println("El coro está formado");
        } else {
            System.out.println("El coro NO ESTÁ formado");
        }
        
//        System.out.println(coroSemi);
//        System.out.println(coroHileras);
          coroHileras.mostrarMatriz();
    }

}
