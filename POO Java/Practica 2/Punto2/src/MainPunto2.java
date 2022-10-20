
import PaqueteLectura.*;

public class MainPunto2 {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        int dimF = 15;
        Persona[] arrayPersonas = new Persona[dimF];
        Persona px;
        String nombre;
        int dni;
        int edad;
        int i = 0;
        int cantMayores = 0;
        Persona pMenor;
        int dniMenor = 9999;
        String nombreMenor = "ZZZ";
        int edadMenor = 9999;
        
        dni = GeneradorAleatorio.generarInt(11); //Random entre 0 y 10
        System.out.println("DNI: " + dni);
        while ( (i < dimF) && (dni != 0) ) {
            nombre = GeneradorAleatorio.generarString(5);
            System.out.println("Nombre: " + nombre);
            
            edad = GeneradorAleatorio.generarInt(101); //Random entre 0 y 100
            System.out.println("Edad: " + edad);
            
            System.out.println("");
            
            px = new Persona(nombre, dni, edad);
            
            arrayPersonas[i] = px;
            
            i++;
            
            dni = GeneradorAleatorio.generarInt(11); //Random entre 0 y 10
            System.out.println("DNI: " + dni);
        }
        
        for (int j = 0; j < dimF; j++) {
            System.out.println("[" + j + "] = " + arrayPersonas[j]);
        }
        
        for (int j = 0; j < dimF; j++) {
            if( (arrayPersonas[j] != null) && (arrayPersonas[j].getEdad() > 65) ) {
                cantMayores++;
            }
        }
        
        System.out.println();
        System.out.println("Cantidad de personas mayores de 65 años: " + cantMayores);
        
        
        for (int j = 0; j < dimF; j++) {
            if (arrayPersonas[j] != null) {
                if (arrayPersonas[j].getDNI() < dniMenor) {
                    dniMenor = arrayPersonas[j].getDNI();
                    nombreMenor = arrayPersonas[j].getNombre();
                    edadMenor = arrayPersonas[j].getEdad();
                }
            }
        }
        
        pMenor = new Persona(nombreMenor, dniMenor, edadMenor);
        
        System.out.println();
        System.out.println("Persona con menor DNI");
        System.out.println(pMenor);
    }

}
