package punto1;

import PaqueteLectura.*;

public class MainPunto1 {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        int DF = 11;  
        int[] tabla2 = new int[DF]; // indices de 0 a 10
        int n;
        
        n = GeneradorAleatorio.generarInt(12); //Random entre 0 y 11
        
        while (n != DF) {
        
            for(int i = 0; i < DF; i++) {
                tabla2[i] = 2*i;
            }
        
            for (int i = 0; i < DF; i++) {
                System.out.println("(2 x " + i + ") * " + n + " = " + (tabla2[i]*n));
            }
        
            System.out.println();
            
            n = GeneradorAleatorio.generarInt(12); //Random entre 0 y 11
        }
        
        
    }

}
