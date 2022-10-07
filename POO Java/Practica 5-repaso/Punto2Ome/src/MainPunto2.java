import PaqueteLectura.*;

public class MainPunto2 {

    public static void main(String[] args) {
        
        Estacionamiento estacionamiento = new Estacionamiento("Nombre Estacionamiento", "Dirección Estacionamiento", "8:00", "21:00", 3, 3);
        
        Auto a1 = new Auto("Dueño 1", "Patente 1");
        Auto a2 = new Auto("Dueño 2", "Patente 2");
        Auto a3 = new Auto("Dueño 3", "Patente 3");
        Auto a4 = new Auto("Dueño 4", "Patente 4");
        Auto a5 = new Auto("Dueño 5", "Patente 5");
        Auto a6 = new Auto("Dueño 6", "Patente 6");
        
        estacionamiento.registrarAuto(a1, 1, 1);
        estacionamiento.registrarAuto(a2, 2, 0);
        estacionamiento.registrarAuto(a3, 0, 2);
        estacionamiento.registrarAuto(a4, 0, 1);
        estacionamiento.registrarAuto(a5, 1, 0);
        estacionamiento.registrarAuto(a6, 0, 0);
        
        estacionamiento.mostrarEstacionamiento();
        
        System.out.println();
        
        System.out.println("Cantidad de autos ubicados en la plaza 1: " + estacionamiento.totalAutosEnPlaza(0));
        
        System.out.println(estacionamiento.buscarAuto("Patente 1"));
    }

}
