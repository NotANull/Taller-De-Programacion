import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {

    private double costo;
    private boolean estaOcupada;
    private Cliente cliente;

    public Habitacion() {
        GeneradorAleatorio.iniciar();
        this.costo = (int)GeneradorAleatorio.generarDouble(6000)+2000; //Random entre 2000 y 8000
        this.estaOcupada = false;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    public boolean isEstaOcupada() {
        return estaOcupada;
    }

    public void setEstaOcupada(boolean estaOcupada) {
        this.estaOcupada = estaOcupada;
    }
    
    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    @Override
    public String toString() {
        if (estaOcupada) {
            return "Tiene un costo de " + this.costo + ". Está ocupada por el cliente " + this.cliente;
        } else {
            return "Tiene un costo de " + this.costo + ". Se encuentra libre";
        }
    }
    
    
    
    
}
