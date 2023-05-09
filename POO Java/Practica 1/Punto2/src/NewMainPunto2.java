
import PaqueteLectura.*;
import java.util.ArrayList;

public class NewMainPunto2 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();

        ArrayList<Double> arrayAlturas = new ArrayList<>();

        double sumarAlturas = 0;
        double promedio;
        int cantEncimaPromedio = 0;

        for (int i = 0; i < 15; i++) {
            arrayAlturas.add(GeneradorAleatorio.generarDouble(200) + 100); //Random entre 100 y 300
        }

        for (Double arrayAltura : arrayAlturas) {
            System.out.println("Altura: " + String.format("%.2f", arrayAltura));
        }

        for (Double arrayAltura : arrayAlturas) {
            sumarAlturas += arrayAltura;
        }

        promedio = (sumarAlturas / 15);

        System.out.println("Altura promedio: " + String.format("%.2f", promedio));
        
        for (Double arrayAltura : arrayAlturas) {
            if (arrayAltura > promedio) {
                cantEncimaPromedio++;
            }
        }
        
        System.out.println("Cantidad de jugadores con altura por encima del promedio: " + cantEncimaPromedio);
    }

}
