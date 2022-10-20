
import PaqueteLectura.*;

public class MainPunto4 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();
        
        int[][] edificio = new int[8][4];
        int piso, oficina;
        
        piso = GeneradorAleatorio.generarInt(9)+1;
        System.out.println("Piso " + piso);
        while (piso != 9) {
            oficina = GeneradorAleatorio.generarInt(4)+1;
            System.out.println("Oficina " + oficina);
            System.out.println();
            
            edificio[piso-1][oficina-1]++;
            
            piso = GeneradorAleatorio.generarInt(9)+1;
            System.out.println("Piso " + piso);
        }
        
        System.out.println();
        System.out.println("Cantidad de personas en cada oficina de cada piso");
        for (int i = 0; i < 8; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.print("[" + edificio[i][j] + "]");
            }
            System.out.println();
        }
    }

}
