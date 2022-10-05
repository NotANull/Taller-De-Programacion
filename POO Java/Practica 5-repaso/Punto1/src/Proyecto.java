
package practica5;


public class Proyecto {
    private String nombreProyecto;
    private int codigo;
    private String nombreDirector;
    private int cantMaxInvest = 50;
    private int cantInvest;
    private Investigador []investigadores;
    
    public Proyecto(String nombreProyecto,int codigo,String nombreDirector){
        this.setNombreProyecto(nombreProyecto);
        this.setCodigo(codigo);
        this.setNombreDirector(nombreDirector);
        this.setInvestigadores(new Investigador[this.cantMaxInvest]);
        this.setCantInvest(-1);
    }
    public void agregarInvestigador(Investigador i){
        this.cantInvest++;
        investigadores[cantInvest]=i;
    }
    
    public boolean hayLugar(){
        return cantInvest<cantMaxInvest;
    }
    
    public double dineroTotalOtorgado(){
        double total =0;
        for(int i=0;i<=cantInvest;i++){
            total= total+investigadores[i].dineroTotalSubsidiosOtorgados();
        }
        
        return total;
    }
    
    public void otorgarTodos(String unNombre){
         int i =0;
         boolean encontre = false;   
         while (i<=cantInvest && encontre==false){
             if(investigadores[i].getNombre().equals(unNombre)){encontre=true;}else{i++;}
         }
        if(encontre==true){
            investigadores[i].setStatusSubsidios();
        }
    }
    
    
    @Override
    public String toString(){
        String aux=" ";
        for(int i=0;i<=cantInvest;i++){
            aux = aux + investigadores[i];
        }
        return"Nombre de Proyecto: "+nombreProyecto+" Nombre del director: "+nombreDirector+"Dinero total otorgado del proyecto: "+ this.dineroTotalOtorgado()+" Investigadores: "+aux;
    }
    
    
 //--------------------------------------------------------GET AND SET----------------------------------------------
    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public int getCantMaxInvest() {
        return cantMaxInvest;
    }

    public void setCantMaxInvest(int cantMaxInvest) {
        this.cantMaxInvest = cantMaxInvest;
    }

    public int getCantInvest() {
        return cantInvest;
    }

    public void setCantInvest(int cantInvest) {
        this.cantInvest = cantInvest;
    }

    public Investigador[] getInvestigadores() {
        return investigadores;
    }

    public void setInvestigadores(Investigador[] investigadores) {
        this.investigadores = investigadores;
    }

    
    
        

  
   
}
