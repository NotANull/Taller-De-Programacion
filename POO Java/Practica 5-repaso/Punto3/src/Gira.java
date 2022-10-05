/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package punto3;

/**
 *
 * @author Null
 */
public class Gira extends Recital {
    private String nombre;
    private Fecha vector[];  
    private int cantMaxFechas;
    private int fechaActual;

    public Gira(String nombreBanda, String listaTemas,int cantMaxTemas,String nombre,int cantMaxFechas) {
        super(nombreBanda, listaTemas,cantMaxTemas);
        setCantMaxFechas(cantMaxFechas);
        setNombre(nombre);
        this.vector = new Fecha[cantMaxFechas];
        setFechaActual(-1);
        //inicializar vector
    }
    
    
    public void agregarFecha(Fecha f){
         if(hayLugar()==true){
             this.fechaActual++;
             vector[fechaActual]=f;
         }
    }
    
    public String actuar(){
        String aux ="";
        if(fechaActual <= cantMaxFechas && fechaActual>-1){
            aux = "Buenas noches"+vector[fechaActual].getCiudad();
        
            fechaActual--;}
        
        return aux+super.actuar();
    }
    
    public boolean hayLugar(){
        return fechaActual<cantMaxFechas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantMaxFechas() {
        return cantMaxFechas;
    }

    public void setCantMaxFechas(int cantMaxFechas) {
        this.cantMaxFechas = cantMaxFechas;
    }

    public int getFechaActual() {
        return fechaActual;
    }

    public void setFechaActual(int fechaActual) {
        this.fechaActual = fechaActual;
    }
    
    
    
}
