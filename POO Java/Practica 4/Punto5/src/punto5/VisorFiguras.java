/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Null
 */
public class VisorFiguras {
    private int guardadas;
    private int capacidadMaxima=5;
    private Figura []vector;
    
    public VisorFiguras(){
        guardadas= 0;
        vector = new Figura[capacidadMaxima];
    }
    
    public void guardar(Figura f){
        vector[guardadas]=f;
        guardadas++;
    }
    
    public void mostrar(){
        for(int i=0;i<guardadas;i++){
            System.out.println(vector[i].toString());
        }
    }
    
    public boolean quedaEspacio(){
        return guardadas<capacidadMaxima;
    }
    
    public int getGuardadas(){
        return guardadas;
    }
}
