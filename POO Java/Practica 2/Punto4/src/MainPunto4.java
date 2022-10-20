
import PaqueteLectura.*;

public class MainPunto4 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();

        Persona[][] m = new Persona[5][8];
        Persona p;
        String nombre;
        int edad, dni, i, j;

        i = 0;
        j = 0;

        nombre = GeneradorAleatorio.generarString(1);
        System.out.println("Nombre: " + nombre);

        while ((!nombre.equals("Z")) && (i < 5)) {

            if (j < 8) {

                dni = GeneradorAleatorio.generarInt(100) + 1;
                System.out.println("Dni: " + dni);

                edad = GeneradorAleatorio.generarInt(100) + 1;
                System.out.println("Edad: " + edad);

                System.out.println("");

                p = new Persona(nombre, dni, edad);

                m[i][j] = p;

                j++;

            } else {

                j = 0;

                i++;

            }

            if ((i != 5) && (j != 8)) {

                nombre = GeneradorAleatorio.generarString(1);
                System.out.println("Nombre: " + nombre);

            }

        }

        for (int k = 0; k < 5; k++) {
            for (int l = 0; l < 8; l++) {
                System.out.println("[" + k + "][" + l + "] = " + m[k][l]);
            }
            System.out.println("");
        }
    }

}
