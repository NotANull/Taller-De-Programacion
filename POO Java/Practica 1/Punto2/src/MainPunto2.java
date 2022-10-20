
import PaqueteLectura.*;

public class MainPunto2 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();

        double[] arrayAlturas;

        arrayAlturas = new double[15];

        double sumarAlturas = 0;
        double promedio;
        int cantEncimaPromedio = 0;

        for (int i = 0; i < 15; i++) {
            arrayAlturas[i] = GeneradorAleatorio.generarDouble(200) + 100; //Random entre 100 y 300
            System.out.println("Altura en la posición " + i + ": " + (double) Math.round(arrayAlturas[i] * 100d) / 100d);
        }

        for (int i = 0; i < 15; i++) {
            sumarAlturas += arrayAlturas[i];
        }

        promedio = (double) Math.round((sumarAlturas / 15) * 100d) / 100d;

        System.out.println();
        System.out.println("Promedio de alturas: " + promedio);

        for (int i = 0; i < 15; i++) {
            if (arrayAlturas[i] > promedio) {
                cantEncimaPromedio++;
            }
        }

        System.out.println();
        System.out.println("Cantidad de jugadores con altura por encima del promedio: " + cantEncimaPromedio);
    }

}
