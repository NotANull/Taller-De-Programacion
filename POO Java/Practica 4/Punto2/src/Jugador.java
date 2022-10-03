
public class Jugador extends Empleado {
    
    private int cantPartidosJugados;
    private int cantGolesAnotados;

    public Jugador(int cantPartidosJugados, int cantGolesAnotados, String nombre, double sueldoBasico, int antiguedad) {
        super(nombre, sueldoBasico, antiguedad);
        this.cantPartidosJugados = cantPartidosJugados;
        this.cantGolesAnotados = cantGolesAnotados;
    }

    public int getCantPartidosJugados() {
        return cantPartidosJugados;
    }

    public void setCantPartidosJugados(int cantPartidosJugados) {
        this.cantPartidosJugados = cantPartidosJugados;
    }

    public int getCantGolesAnotados() {
        return cantGolesAnotados;
    }

    public void setCantGolesAnotados(int cantGolesAnotados) {
        this.cantGolesAnotados = cantGolesAnotados;
    }
    
    @Override
    public double calcularEfectividad() {
        return (this.cantGolesAnotados / this.cantPartidosJugados);
    }

    @Override
    public double calcularSueldoACobrar() {
        double sueldo = (super.getSueldoBasico()) + ((super.getSueldoBasico() * 0.1) * super.getAntiguedad());
        if (this.calcularEfectividad() > 0.5) {
            return sueldo + super.getSueldoBasico();
        } else {
            return sueldo;
        }
    }

}
