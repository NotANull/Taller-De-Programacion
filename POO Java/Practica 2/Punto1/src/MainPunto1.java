
import PaqueteLectura.*;

public class MainPunto1 {

    public static void main(String[] args) {

        //UTLIZANDO EL CONSTRUCTOR CON PARÁMETROS
        String nombre;
        int dni;
        int edad;

        System.out.print("Ingrese el nombre de la persona: ");
        nombre = Lector.leerString();

        System.out.print("Ingrese el dni de la persona: ");
        dni = Lector.leerInt();

        System.out.print("Ingrese la edad de la persona: ");
        edad = Lector.leerInt();

        Persona p1 = new Persona(nombre, dni, edad);

        System.out.println(p1);

        //UTILIZANDO EL CONSTRUCTOR SIN PARÁMETROS
        Persona p2 = new Persona();

        System.out.print("Ingrese el nombre de la persona: ");
        nombre = Lector.leerString();

        System.out.print("Ingrese el dni de la persona: ");
        dni = Lector.leerInt();

        System.out.print("Ingrese la edad de la persona: ");
        edad = Lector.leerInt();

        p2.setNombre(nombre);
        p2.setDNI(dni);
        p2.setEdad(edad);

        System.out.println(p2);
    }

}
