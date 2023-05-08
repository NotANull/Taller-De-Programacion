
public abstract class Coro {

    private String nombreCoro;
    private Director director;

    public Coro(Director director) {
        this.director = director;
    }
    
    public abstract void agregarCorista(Corista unCorista);
    public abstract boolean estaFormado();
    public abstract boolean coroLleno();
    public abstract String mostrarCoristas();

    @Override
    public String toString() {
        return "-------- CORO --------" +
               this.director;
    }
}
