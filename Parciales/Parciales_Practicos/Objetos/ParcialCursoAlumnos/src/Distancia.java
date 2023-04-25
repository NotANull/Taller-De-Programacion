
public class Distancia extends Curso {

    private String link;

    public Distancia(int anioCursada, int nAlumnos) {
        super(anioCursada, nAlumnos);
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Override
    public boolean puedeRendir(Alumno a) {
        return (a.getCantAutoevaluacionesAprobadas() == 3) && (a.getCantasistencias() >= 1);
    }
    
}
