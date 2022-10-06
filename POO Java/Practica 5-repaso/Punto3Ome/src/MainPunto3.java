
public class MainPunto3 {

    public static void main(String[] args) {
        
        EventoOcasional evento = new EventoOcasional("show privado", "Abuela Rapera", "13/01/2023", "Pepito y los clonosaurios", 5);
        
        evento.agregarTema("Ay! Esta grasa no se quita");
        evento.agregarTema("Calle falsa 123");
        evento.agregarTema("Soy el aho de la palabra ahora");
        evento.agregarTema("A la grande le puse cuca");
        evento.agregarTema("Vas a morir Moe, wiii");
        
        evento.actuar();
        System.out.println("El evento tiene un costo de " + evento.calcularCosto());
        
        System.out.println("");
        
        Gira gira = new Gira("Woodstock 99", 3, "Los peces del infierno", 4);
        
        Fecha fecha1 = new Fecha("Ciudad A", "11/11/1111");
        Fecha fecha2 = new Fecha("Ciudad B", "22/22/2222");
        Fecha fecha3 = new Fecha("Ciudad C", "33/33/3333");
        
        gira.agregarFecha(fecha1);
        gira.agregarFecha(fecha2);
        gira.agregarFecha(fecha3);
        
        gira.agregarTema("Cowboys From Hell");
        gira.agregarTema("Duality");
        gira.agregarTema("Blind");
        gira.agregarTema("Break Stuff");
        
        gira.actuar();
        System.out.println("La gira tiene un costo de " + gira.calcularCosto());
    }

}
