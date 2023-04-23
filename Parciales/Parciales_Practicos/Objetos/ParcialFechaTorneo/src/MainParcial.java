import PaqueteLectura.GeneradorAleatorio;

public class MainParcial {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        Torneo torneo = new Torneo("TorneoX", 5);
        
        Goleador g;
        
        String nombre;
        String nombreEquipo;
        int cantGoles;
        
        nombre = devolverGoleador(GeneradorAleatorio.generarInt(11)+1);
        while (!nombre.equals("ZZZ")) {
            
            nombreEquipo = devolverEquipo(GeneradorAleatorio.generarInt(11)+1);
            cantGoles = GeneradorAleatorio.generarInt(501);
            
            g = new Goleador(nombre, nombreEquipo, cantGoles);
            
            torneo.agregarGoleadorALaFecha(g, GeneradorAleatorio.generarInt(4));
            
            nombre = devolverGoleador(GeneradorAleatorio.generarInt(11)+1);
        }
        
        System.out.println(torneo);
        
    }
    
    public static String devolverGoleador(int n) {
        String goleador;
        switch (n) {
            case 1:
                goleador = "Lionel Messi";
                break;
            case 2:
                goleador = "Cristiano Ronaldo";
                break;
            case 3:
                goleador = "Kylian Mbappé";
                break;
            case 4:
                goleador = "Erling Haaland";
                break;
            case 5:
                goleador = "Robert Lewandowski";
                break;
            case 6:
                goleador = "Karim Benzema";
                break;
            case 7:
                goleador = "Luka Modrić";
                break;
            case 8:
                goleador = "Neymar";
                break;
            case 9:
                goleador = "Pelé";
                break;
            case 10:
                goleador = "Diego Maradona";
                break;
            default:
                goleador = "ZZZ";
        }
        return goleador;
    }
    
    public static String devolverEquipo(int n) {
        String equipo;
        switch (n) {
            case 1:
                equipo = "PSG";
                break;
            case 2:
                equipo = "Barcelona";
                break;
            case 3:
                equipo = "Real Madrid";
                break;
            case 4:
                equipo = "Manchester United";
                break;
            case 5:
                equipo = "Manchester City";
                break;
            case 6:
                equipo = "Bayern Munich";
                break;
            case 7:
                equipo = "Estudiantes De La Plata";
                break;
            case 8:
                equipo = "Gimnasia de La Plata";
                break;
            case 9:
                equipo = "Boca Juniors";
                break;
            case 10:
                equipo = "River Plate";
                break;
            default:
                equipo = "Benfica";
        }
        return equipo;
    }

}
