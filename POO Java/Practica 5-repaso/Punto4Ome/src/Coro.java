
public abstract class Coro {

    private String nombreCoro;
    private Director director;

    public Coro(String nombreCoro, Director director) {
        this.nombreCoro = nombreCoro;
        this.director = director;
    }

    public String getNombreCoro() {
        return nombreCoro;
    }

    public void setNombreCoro(String nombreCoro) {
        this.nombreCoro = nombreCoro;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }
    
    public abstract void agregarCorista(Corista corista);
    
    public abstract boolean estaLleno();
    
    public abstract boolean estaFormado();
    
    public abstract String mostrarCoristas();

    @Override
    public String toString() {
        return this.director + "\n" + this.mostrarCoristas();
    }
    
    
}
