package tema2;

import PaqueteLectura.*;

public class Punto4 {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        int dimFF = 5;
        int dimLF = 0;
        
        int dimFC = 8;
        int[] arrayDimLC = new int[dimFC];
        
        Persona[][] matrizPersonas = new Persona[dimFF][dimFC];
        
        Persona p;
        
        String nombre;
        int edad, dni;
        
        //Inicializar arreglo de dimensiones lógicas de las columnas
        for (int i = 0; i < dimFC; i++) {
            arrayDimLC[i] = 0;
        }
        
        System.out.print("Ingrese un nombre: ");
        nombre = Lector.leerString();
        while ( (dimLF < dimFF) && (!nombre.equals("ZZZ")) ) {
            while ( (arrayDimLC[dimLF] < dimFC) && (!nombre.equals("ZZZ")) ) {
                edad = GeneradorAleatorio.generarInt(100)+1; //Random entre 1 y 100
                System.out.println("Edad de la persona: " + edad);
                dni = GeneradorAleatorio.generarInt(500)+1; //Random entre 1 y 500
                
                p = new Persona(nombre, dni, edad);
                
                matrizPersonas[dimLF][arrayDimLC[dimLF]] = p;
                arrayDimLC[dimLF]++;
                
                System.out.print("\nIngrese un nombre: ");
                nombre = Lector.leerString();
            }
            dimLF++;
        }
        
        
//        System.out.println("\nDimensión Lógica de las filas: " + dimLF);
//        
//        System.out.println("\nAsí quedaría el arreglo de dimensiones lógicas de las columnas");
//        for (int i = 0; i < dimFC; i++) {
//            System.out.print("[" + arrayDimLC[i] + "]");
//        }
        
        System.out.println("\nDía y turno para los entrevistados");
        for (int i = 0; i < dimLF; i++) {
            for (int j = 0; j < arrayDimLC[i]; j++) {
                System.out.println("Día " + i + " - Turno " + j + " = " + matrizPersonas[i][j]);
            }
            System.out.println("");
        }
        
    }

}
