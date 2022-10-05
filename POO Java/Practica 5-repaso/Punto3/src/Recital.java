

package punto3;


public abstract class Recital {
    private String nombreBanda;
    private String [] listaTemas;
    private int cantMaxTemas;
    private int cantTemas;
    
    
    public Recital(String nombreBanda,String listaTemas,int cantMaxTemas){
        setNombreBanda(nombreBanda);
        setCantMaxTemas(cantMaxTemas);
        this.listaTemas = new String[cantMaxTemas];
        setCantTemas(-1);
    }

    
    public void agregarTema(String nombreTema){
        
        if(this.hayLugar()==true){
            this.cantTemas++;
            listaTemas[this.cantTemas]=nombreTema;
        }
    }
    
    public String imprimirTemas(){
        System.out.print("y ahora tocaremos");
        return "";
    }
    
    public abstract String actuar();                   //abstract method

    
    
    
    
    public boolean hayLugar(){
        return cantTemas<cantMaxTemas;
    }

    public String[] getListaTemas() {
        return listaTemas;
    }

    public void setListaTemas(String[] listaTemas) {
        this.listaTemas = listaTemas;
    }

    public int getCantTemas() {
        return cantTemas;
    }

    public void setCantTemas(int cantTemas) {
        this.cantTemas = cantTemas;
    }
    
    
    
    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }


    public int getCantMaxTemas() {
        return cantMaxTemas;
    }

    public void setCantMaxTemas(int cantMaxTemas) {
        this.cantMaxTemas = cantMaxTemas;
    }
    
    
    
    
    
}
