
public abstract class Curso {

    private int anioCursada;
    private final int nAlumnos;
    private int dimL;
    private final Alumno[] arrayAlumnos;

    public Curso(int anioCursada, int nAlumnos) {
        this.anioCursada = anioCursada;
        this.nAlumnos = nAlumnos;
        this.arrayAlumnos = new Alumno[this.nAlumnos];
        this.dimL = 0;
    }

    public boolean agregarAlumno(Alumno a) {
        if (this.dimL < this.nAlumnos) {
            this.arrayAlumnos[dimL] = a;
            this.dimL++;
            return true;
        } else {
            return false;
        }
    }

    public void incrementarAsistenciaAlumno(int unDni) {
        int i = 0;
        boolean encontre = false;
        while ((i < this.dimL) && (!encontre)) {
            if (unDni == this.arrayAlumnos[i].getDni()) {
                this.arrayAlumnos[i].incrementarAsistencia(unDni);
                encontre = true;
            } else {
                i++;
            }
        }
    }

    public void aprobarAutoevaluacionAlumno(int unDni) {
        int i = 0;
        boolean encontre = false;
        while ((i < this.dimL) && (!encontre)) {
            if (unDni == this.arrayAlumnos[i].getDni()) {
                this.arrayAlumnos[i].aprobarAutoevaluacion(unDni);
                encontre = true;
            } else {
                i++;
            }
        }
    }

    //Como ambas clases hijas hacen exactamente lo mismo (contar la cantidad de alumnos en condiciones de rendir),
    //lo hago en la misma clase padre
    public int cantidadDeAlumnosQuePuedenRendir() {
        int cantidad = 0;
        for (int i = 0; i < this.dimL; i++) {
            if (this.puedeRendir(this.arrayAlumnos[i])) {
                cantidad++;
            }
        }
        return cantidad;
    }
    
    public abstract boolean puedeRendir(Alumno a);
    
    public void mostrarArray() {
        for (int i = 0; i < this.dimL; i++) {
            System.out.println(this.arrayAlumnos[i]);
        }
    }

}
