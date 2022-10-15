import PaqueteLectura.*;

public class MainFinal {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        Pareja pareja;
        String estiloBaile;
        Participante participante1, participante2;
        String nombre;
        int dni, edad;
        
        Concurso concurso = new Concurso(5);

        for (int i = 0; i < 5; i++) {
            
            nombre = GeneradorAleatorio.generarString(3);
            System.out.println("Nombre del participante de la pareja " + (i+1) + ": " + nombre);
            
            edad = GeneradorAleatorio.generarInt(72)+18; //Random entre 18 y 90
            System.out.println("Edad del participante de la pareja " + (i+1) + ": " + edad);
            
            dni = GeneradorAleatorio.generarInt(1500)+1500; //Random entre 1500 y 3000
            System.out.println("Dni del participante de la pareja " + (i+1) + ": " + dni);
            
            System.out.println();
            
            participante1 = new Participante(dni, nombre, edad);
            
            nombre = GeneradorAleatorio.generarString(3);
            System.out.println("Nombre del participante de la pareja " + (i+1) + ": " + nombre);
            
            edad = GeneradorAleatorio.generarInt(72)+18; //Random entre 18 y 90
            System.out.println("Edad del participante de la pareja " + (i+1) + ": " + edad);
            
            dni = GeneradorAleatorio.generarInt(1500)+1500; //Random entre 1500 y 3000
            System.out.println("Dni del participante de la pareja " + (i+1) + ": " + dni);
            
            participante2 = new Participante(dni, nombre, edad);
            
            estiloBaile = GeneradorAleatorio.generarString(5);
            System.out.println("Estilo de baile que se especializa la pareja " + (i+1) + ": " + estiloBaile);
            
            System.out.println();
            
            pareja = new Pareja(estiloBaile);
            pareja.agregarParticipantes(participante1, participante2);
            
            concurso.agregarPareja(pareja);
            
        }
        
        concurso.mostrarPareja();
        
        System.out.println();
        
        System.out.println(concurso.parejaConMasDiferencia());
    }

}
