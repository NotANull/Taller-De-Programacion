
import PaqueteLectura.GeneradorAleatorio;

public class MainPunto1 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();
        String colorRelleno, colorLinea;
        
        
        //Para el/los triangulo/s
        System.out.println("TRIANGULO");
        double lado1 = GeneradorAleatorio.generarDouble(10)+1; //Random entre 1 y 10
        System.out.println("Lado 1: " + String.format("%.2f", lado1));
        double lado2 = GeneradorAleatorio.generarDouble(10)+1; //Random entre 1 y 10
        System.out.println("Lado 2: " + String.format("%.2f", lado2));
        double lado3 = GeneradorAleatorio.generarDouble(10)+1; //Random entre 1 y 10
        System.out.println("Lado 3: " + String.format("%.2f", lado3));
        
        colorRelleno = GeneradorAleatorio.generarString(3); //Hagamos cuenta que se ingresan nombres de colores xD
        System.out.println("Color de relleno para el triangulo: " + colorRelleno);
        colorLinea = GeneradorAleatorio.generarString(3); //Hagamos cuenta que se ingresan nombres de colores xD
        System.out.println("Color de línea para el triangulo: " + colorLinea);
        
        System.out.println("");
        
        //Podría utilizar también la clase padre (Figura) pero para ser más especifico, utilizo el mismo tipo triangulo
        Triangulo triangulo = new Triangulo(lado1, lado2, lado3, colorRelleno, colorLinea);
        
        System.out.println(triangulo);
        
        System.out.println("");
        
        //Para el/los circulo/s
        System.out.println("CIRCULO");
        double radio = GeneradorAleatorio.generarDouble(10)+1; //Random entre 1 y 10
        System.out.println("Radio: " + String.format("%.2f", radio));
        
        colorRelleno = GeneradorAleatorio.generarString(3); //Hagamos cuenta que se ingresan nombres de colores xD
        System.out.println("Color de relleno para el circulo: " + colorRelleno);
        colorLinea = GeneradorAleatorio.generarString(3); //Hagamos cuenta que se ingresan nombres de colores xD
        System.out.println("Color de línea para el circulo: " + colorLinea);
        
        System.out.println("");
        
        Circulo circulo = new Circulo(radio, colorRelleno, colorLinea);
        
        circulo.despintar();
        
        System.out.println(circulo);
        
        //A la respuesta C del punto 1: Debería modificar el método toString de la subclase ya que la clase padre va tener siempre lo mismo, sólo depende de qué clase vaya a implementarse
        //A la respuesta D del punto 1: Debería implementarlo en la clase padre ya que el pintar la línea y/o el relleno, va a ser para todas las subclases
    }

}
