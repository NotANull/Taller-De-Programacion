
package practica5;


public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private int cantMaxSubsidios=5;
    private int cantSubsidios;
    private Subsidio []subsidios;
    
    public Investigador(String nombre,int categoria,String especialidad){
        this.setNombre(nombre);
        this.setCategoria(categoria);
        this.setEspecialidad(especialidad);
        this.setSubsidios(new Subsidio[cantMaxSubsidios]);
        this.setCantSubsidios(-1);
    }

    
    public void agregarSubsidio(Subsidio s){
        this.cantSubsidios++;
        subsidios[cantSubsidios]=s;
    }

    
    public double dineroTotalSubsidiosOtorgados(){
        double total = 0;
        for(int i=0;i<=cantSubsidios;i++){
            if(subsidios[i].getOtorgado()==true){
                total = total+ subsidios[i].getMonto();
            }
        }
        
        return total;
    }
    
    public void setStatusSubsidios(){
        for(int i=0;i<=cantSubsidios;i++){
            if(subsidios[i].getOtorgado()==false){
                subsidios[i].setOtorgado(true);}
        }
    }
    
    
    @Override
    public String toString() {
        return "{ "+"Nombre: "+nombre+" categoria: "+categoria+" especialidad: "+especialidad+" dinero total en subsidios otorgados: "+this.dineroTotalSubsidiosOtorgados()+" } ";
    }
    
    
//-----------------------------------------------------GET AND SET-------------------------------------------------------

    public void setSubsidios(Subsidio[] subsidios) {
        this.subsidios = subsidios;
    }
    
    

    public int getCantMaxSubsidios() {
        return cantMaxSubsidios;
    }

    public void setCantMaxSubsidios(int cantMaxSubsidios) {
        this.cantMaxSubsidios = cantMaxSubsidios;
    }

    public int getCantSubsidios() {
        return cantSubsidios;
    }

    public void setCantSubsidios(int cantSubsidios) {
        this.cantSubsidios = cantSubsidios;
    }
    
    
    
    public boolean hayLugar(){
        return cantSubsidios<cantMaxSubsidios;
    }
    
    public Subsidio[] getSubsidios() {
        return subsidios;
    }
  
  
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }


    
}
