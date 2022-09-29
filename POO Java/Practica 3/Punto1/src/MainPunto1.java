import PaqueteLectura.*;

public class MainPunto1 {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        double lado1, lado2, lado3;
        String colorRelleno, colorLinea;
        
        lado1 = GeneradorAleatorio.generarDouble(10)+1; //Random entre 1 y 10
        System.out.println("Lado 1: " + (int)lado1);
        lado2 = GeneradorAleatorio.generarDouble(10)+1; //Random entre 1 y 10
        System.out.println("Lado 2: " + (int)lado2);
        lado3 = GeneradorAleatorio.generarDouble(10)+1; //Random entre 1 y 10
        System.out.println("Lado 3: " + (int)lado3);
        
        colorRelleno = GeneradorAleatorio.generarString(3); //Hagamos cuenta que se ingresan nombres de colores xD
        colorLinea = GeneradorAleatorio.generarString(3); //Hagamos cuenta que se ingresan nombres de colores xD
        
        Triangulo t = new Triangulo(lado1, lado2, lado3, colorRelleno, colorLinea);
        
        System.out.println("Perímetro: " + t.calcularPerimetro());
        System.out.println("Área: " + t.calcularArea());
    }

}
