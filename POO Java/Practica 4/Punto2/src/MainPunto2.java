
import PaqueteLectura.GeneradorAleatorio;

public class MainPunto2 {

    public static void main(String[] args) {

    GeneradorAleatorio.iniciar();
    String nombre;
    double sueldoBasico;
    int antiguedad;
    
    System.out.println("JUGADOR");    
        
    nombre = GeneradorAleatorio.generarString(5);
    System.out.println("Nombre del jugdor: " + nombre);
    sueldoBasico = GeneradorAleatorio.generarDouble(25000) + 50000; //Random entre 50000 y 75000
    System.out.println("Sueldo básico del jugador: " + String.format("%.2f", sueldoBasico));
    antiguedad = GeneradorAleatorio.generarInt(31); //Random entre 0 y 30
    System.out.println("Antiguedad del jugador: " + antiguedad);
    int cantPartidosJugados = GeneradorAleatorio.generarInt(21); //Random entre 0 y 20;
    System.out.println("Cantidad de partidos jugados: " + cantPartidosJugados);
    int cantGolesAnotados = GeneradorAleatorio.generarInt(31); //Random entre 0 y 30;
    System.out.println("Cantidad de goles anotados: " + cantGolesAnotados);
    
    System.out.println("");
    
    Jugador jugador = new Jugador(cantPartidosJugados, cantGolesAnotados, nombre, sueldoBasico, antiguedad);
    
    System.out.println(jugador);
    
    
    System.out.println("");
    
    
    System.out.println("ENTRENADOR");
    nombre = GeneradorAleatorio.generarString(5);
    System.out.println("Nombre del entrenador: " + nombre);
    sueldoBasico = GeneradorAleatorio.generarDouble(25000) + 50000; //Random entre 50000 y 75000
    System.out.println("Sueldo básico del entrenador: " + String.format("%.2f", sueldoBasico));
    antiguedad = GeneradorAleatorio.generarInt(31); //Random entre 0 y 30
    System.out.println("Antiguedad del entrenador: " + antiguedad);
    int cantCampeonatosGanados = GeneradorAleatorio.generarInt(16); //Random entre 0 y 15
    System.out.println("Cantidad de campeonatos ganados: " + cantCampeonatosGanados);
    
    System.out.println();
    
    Entrenador entrenador = new Entrenador(cantCampeonatosGanados, nombre, sueldoBasico, antiguedad);
    
    System.out.println(entrenador);
    }

}
