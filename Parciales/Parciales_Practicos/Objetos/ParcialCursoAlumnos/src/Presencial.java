
public class Presencial extends Curso{

    private int nAula;

    public Presencial(int anioCursada, int nAlumnos) {
        super(anioCursada, nAlumnos);
    }

    @Override
    public boolean puedeRendir(Alumno a) {
        return a.getCantasistencias() >= 3;
    }
    
}
