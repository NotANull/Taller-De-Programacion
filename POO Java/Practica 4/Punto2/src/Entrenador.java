
public class Entrenador extends Empleado {

    private int cantCampeonatosGanados;

    public Entrenador(int cantCampeonatosGanados, String nombre, double sueldoBasico, int antiguedad) {
        super(nombre, sueldoBasico, antiguedad);
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }

    public int getCantCampeonatosGanados() {
        return cantCampeonatosGanados;
    }

    public void setCantCampeonatosGanados(int cantCampeonatosGanados) {
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }

    @Override
    public double calcularEfectividad() {
        return (this.cantCampeonatosGanados / super.getAntiguedad());
    }

    @Override
    public double calcularSueldoACobrar() {
        double sueldo = super.calcularSueldoACobrar();
        if ( (this.cantCampeonatosGanados >= 1) && (this.cantCampeonatosGanados <= 4) ) {
            return sueldo + 5000;
        } else if ((this.cantCampeonatosGanados >= 5) && (this.cantCampeonatosGanados <= 10)) {
            return sueldo + 30000;
        } else if (this.cantCampeonatosGanados > 10) {
            return sueldo + 50000;
        } else {
            return sueldo;
        }
    }
    
    
}
