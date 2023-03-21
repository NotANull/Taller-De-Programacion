import PaqueteLectura.*;

public class MainParcial4 {

    public static void main(String[] args) {
        
        PaqueteLectura.GeneradorAleatorio.iniciar();
        
        Concurso concurso = new Concurso(20);
        
        Alumno alumno;
        String nombreAlumno, instrumento;
        int edad, genero;
        double puntaje;
        
        for (int i = 0; i < 5; i++) {
            nombreAlumno = GeneradorAleatorio.generarString(5);
            System.out.println("Nombre del alumno: " + nombreAlumno);
        
            edad = GeneradorAleatorio.generarInt(80)+10; //Random entre 10 y 90
            System.out.println("Edad del alumno: " + edad);
        
            instrumento = GeneradorAleatorio.generarString(5);
            System.out.println("Instrumento que toca el alumno: " + instrumento);
            
            alumno = new Alumno(nombreAlumno, edad, instrumento);
            
            genero = GeneradorAleatorio.generarInt(5); //Random entre 0 y 4
            System.out.println("Genero musical: " + genero);
            
            concurso.inscribirAlumno(alumno, genero);
            
            puntaje = GeneradorAleatorio.generarDouble(11); //Random entre 0 y 10
            System.out.println("Puntaje para el alumno " + nombreAlumno + ": " + String.format("%.2f", puntaje));
            
            System.out.println("");
            
            concurso.asignarPuntaje(puntaje, nombreAlumno);
        }
        
        System.out.println("Género musical con más alumnos inscriptos: " + concurso.generoConMasAlumnos());
    }

}
