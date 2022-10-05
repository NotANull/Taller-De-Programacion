
package punto3;


public class Evento extends Recital {
     private String motivo;
     private String nombreContratante;
     private int dia;

    public Evento(String nombreBanda, String listaTemas,int cantMaxTemas,String motivo,String nombreContratante,int dia) {
        super(nombreBanda, listaTemas,cantMaxTemas);
        setMotivo(motivo);
        setNombreContratante(nombreContratante);
        setDia(dia);
    }
    
   
    public String actuar() {
         String aux="";
         if(getMotivo().equals("show de beneficencia")){
           aux="recuerde colaborar con"+getNombreContratante();
         }else if(getMotivo().equals("show de TV")){
              aux="saludos amigos televidentes";
         }else if(getMotivo().equals("show privado")){
              aux="un feliz cumpleaños para"+getNombreContratante();
         }
        return super.actuar()+aux;
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

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }


    
    
    
}
