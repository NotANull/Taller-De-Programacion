
import PaqueteLectura.*;

public class MainPunto3 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();
	 
        int[][] matrizEnteros = new int[5][5];
        
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                matrizEnteros[i][j] = GeneradorAleatorio.generarInt(31); //Random entre 0 y 30
            }
        }
    
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                System.out.print("[" + matrizEnteros[i][j] + "]");
            }
            System.out.println();
        }
    
        int suma = 0;
        for (int j = 0; j < 5; j++) {
            suma+= matrizEnteros[1][j];
        }
        System.out.println();
        System.out.println("Suma de los valores de la fila 1: " + suma);
    
        int[] sumaArray = new int[5];
        
        for (int i = 0; i < 5; i++) {
            sumaArray[i] = 0;
        }
        
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                sumaArray[j]+= matrizEnteros[i][j];
            }
        }
        
        System.out.println();
        System.out.println("Se imprime la suma de cada posición del array");
        for (int i = 0; i < 5; i++) {
            System.out.print("[" + sumaArray[i] + "]");
        }

        System.out.println();
        
        int buscar = GeneradorAleatorio.generarInt(31); GeneradorAleatorio.generarInt(31); //Random entre 0 y 30
        System.out.println("Se busca el número " + buscar + " en la matriz");
        
        boolean noEncontre = true;
        int i = 0;
        int j = 0;
        
        
        while ( (i < 5) && (noEncontre)) {
            j = 0;
            while ( (j < 5) && (noEncontre) ) {
                if (matrizEnteros[i][j] != buscar) {
                    j++;
                } else {
                    noEncontre = false;
                }
            }
            if (noEncontre) {
                i++;
            }
        }
        
        if (noEncontre) {
            System.out.println("No se encuentra el número a buscar en la matriz");
        } else {
            System.out.println("El número " + buscar + " se encuentra en la fila " + i + " - columna " + j);
        }
    }

}
