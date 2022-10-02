
import PaqueteLectura.*;

public class MainPunto5 {

    public static void main(String[] args) {
        
        Circulo c = new Circulo(5, "Verder", "Azul");
        
        System.out.println("Perímetro del círculo: " + c.calcularPerimetro());
        System.out.println("Área del círculo: " + c.calcularArea());
    }

}
