
import PaqueteLectura.*;

public class MainPunto5 {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        Partido[] arrayPartidos = new Partido[20];
        Partido px;
        String local, visitante;
        int golesLocal, golesVisitante;
        int i = 0;
        int cantGanaRiver = 0;
        int totalGolesBocaLocal = 0;
        
        
        System.out.print("Ingrese nombre equipo visitante: ");
        visitante = Lector.leerString();
        
        while ((i < 20) && (!visitante.equals("ZZZ"))) {
            
            golesVisitante = GeneradorAleatorio.generarInt(11); //Random entre 0 y 10
            System.out.println("Cantidad de goles visitante: " + golesVisitante);
            
            System.out.print("Ingrese nombre equipo local: ");
            local = Lector.leerString();
            
            golesLocal = GeneradorAleatorio.generarInt(11); //Random entre 0 y 10
            System.out.println("Cantidad de goles local: " + golesLocal);
            
            px = new Partido(local, visitante, golesLocal, golesVisitante);
            
            System.out.println(px);
            
            System.out.println();
            
            arrayPartidos[i] = px;
            
            i++;
            
            System.out.print("Ingrese nombre equipo visitante: ");
            visitante = Lector.leerString();
        }
        
        for (int j = 0; j < 20; j++) {
            if (arrayPartidos[j] != null) {
                if (arrayPartidos[j].getGanador().equals("River")) {
                    cantGanaRiver++;
                }
                if (arrayPartidos[j].getLocal().equals("Boca")) {
                    totalGolesBocaLocal += arrayPartidos[j].getGolesLocal();
                }
            }
        }
        
        System.out.println();
        System.out.println("Cantidad de partidos que ganó River: " + cantGanaRiver);
        System.out.println("Total de goles que realizó Boca jugando de local: " + totalGolesBocaLocal);
    }

}
