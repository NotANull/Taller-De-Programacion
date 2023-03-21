
public class Concurso {

    private final Alumno[][] concursoAlumno;
    private final int[] generos;
    private final int totalGeneros = 5;
    private final int totalAlumnos;

    public Concurso(int totalAlumnos) {
        this.totalAlumnos = totalAlumnos;
        this.concursoAlumno = new Alumno[this.totalGeneros][this.totalAlumnos];
        this.generos = new int[this.totalGeneros];
        inicializarConcursoAlumnos();
        inicializarGeneros();
    }

    public int getTotalGeneros() {
        return totalGeneros;
    }

    public int getTotalAlumnos() {
        return totalAlumnos;
    }
    
    private void inicializarConcursoAlumnos() {
        for (int i = 0; i < this.totalGeneros; i++) {
            for (int j = 0; j < this.totalAlumnos; j++) {
                this.concursoAlumno[i][j] = null;
            }
        }
    }

    private void inicializarGeneros() {
        for (int i = 0; i < this.totalGeneros; i++) {
            this.generos[i] = 0;
        }
    }
    
    public void inscribirAlumno(Alumno alumno, int genero) {
        this.concursoAlumno[genero][this.generos[genero]] = alumno;
        this.generos[genero]++;
    }
    
    public void asignarPuntaje(double puntaje, String nombre) {
        int i = 0;
        int j;
        boolean noEsta = false;
        while ((i < this.totalGeneros) && (!noEsta)) { //Es lo mismo que hacer noEsta == false
            j = 0;
            while ((j < this.generos[i]) && (!noEsta)) {
                if (this.concursoAlumno[i][j].getNombreAlumno().equals(nombre)) {
                    this.concursoAlumno[i][j].setPuntaje(puntaje);
                    noEsta = true;
                } else {
                    j++;
                }
            }
            if (!noEsta) {
                i++;
            }
        }
    }
    
    public int generoConMasAlumnos() {
        int max = -1;
        int indiceMax = -1;
        
        for (int i = 0; i < this.totalGeneros; i++) {
            if (this.generos[i] > max) {
                max = this.generos[i];
                indiceMax = i;
            }
        }
        return indiceMax;
    }
}
