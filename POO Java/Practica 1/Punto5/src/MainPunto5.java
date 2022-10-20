
import PaqueteLectura.*;

public class MainPunto5 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();

        int[][] mCalificaciones = new int[5][4];
        double[] aPromedios = new double[4];
        double promedio;
        int puntaje;

        for (int i = 0; i < 5; i++) {
            System.out.println("Para el cliente " + i + ":");
            for (int j = 0; j < 4; j++) {
                if (j == 0) {
                    puntaje = GeneradorAleatorio.generarInt(10) + 1; //Random entre 1 y 10
                    System.out.println("La atención al cliente es un " + puntaje);
                } else if (j == 1) {
                    puntaje = GeneradorAleatorio.generarInt(10) + 1; //Random entre 1 y 10
                    System.out.println("La calidad de la comida es un " + puntaje);
                } else if (j == 2) {
                    puntaje = GeneradorAleatorio.generarInt(10) + 1; //Random entre 1 y 10
                    System.out.println("El precio es un " + puntaje);
                } else {
                    puntaje = GeneradorAleatorio.generarInt(10) + 1; //Random entre 1 y 10
                    System.out.println("El ambiente es un " + puntaje);
                }
                mCalificaciones[i][j] = puntaje;
            }
            System.out.println();
        }

        for (int i = 0; i < 4; i++) {
            promedio = 0;
            for (int j = 0; j < 5; j++) {
                promedio += mCalificaciones[j][i];
                aPromedios[i] = (promedio / 5);
            }
        }

        System.out.println();
        System.out.println("Calificación promedio por cada aspecto");
        for (int i = 0; i < 4; i++) {
            System.out.println("Promedio del aspecto " + i + ": " + aPromedios[i]);
        }
    }

}
