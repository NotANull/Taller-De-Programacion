
public class EventoOcasional extends Recital{

    private String motivo;
    private String nombreContratante;
    private String diaEvento;

    public EventoOcasional(String motivo, String nombreContratante, String diaEvento, String nombreBanda, int totalTemas) {
        super(nombreBanda, totalTemas);
        this.motivo = motivo;
        this.nombreContratante = nombreContratante;
        this.diaEvento = diaEvento;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public String getDiaEvento() {
        return diaEvento;
    }

    public void setDiaEvento(String diaEvento) {
        this.diaEvento = diaEvento;
    }

    @Override
    public void actuar() {
        if (this.motivo.equals("show de beneficencia")) {
            System.out.println("Recuerden colaborar con " + this.nombreContratante);
        } else if (this.motivo.equals("show de TV")) {
            System.out.println("Saludos amigos televidentes");
        } else if (this.motivo.equals("show privado")) {
            System.out.println("Un feliz cumpleaños para " + this.nombreContratante);
        }
        super.actuar();
    }
    
    @Override
    public double calcularCosto() {
        double costo = -1;
        if (this.motivo.equals("show de beneficencia")) {
            costo = 0;
        } else if (this.motivo.equals("show de TV")) {
            costo = 50000;
        } else if (this.motivo.equals("show privado")) {
            costo = 150000;
        }
        return costo;
    }
    
    
}
