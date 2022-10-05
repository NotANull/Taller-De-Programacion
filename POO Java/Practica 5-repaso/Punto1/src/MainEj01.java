
package practica5;


//import PaqueteLectura.Lector;
public class MainEj01 {

   
    public static void main(String[] args) {
        
    //-----------------------NUEVO PROYECTO-------------------------------    
        Proyecto p = new Proyecto("DataInc",2421,"Robert Smith");   
    
    //---------------------NUEVOS INVESTIGADORES----------------------------------    
        Investigador investigador1=new Investigador("roberto",1,"ingeniero");
        Investigador investigador2=new Investigador("Carlos",4,"medico");
        Investigador investigador3=new Investigador("Lucas",2,"abogado");
    
        
    //--------------------NUEVOS SUBSIDIOS---------------------------------
        Subsidio s1=new Subsidio(1000,"Grado1");
        Subsidio s2=new Subsidio(1000,"Grado2");
        Subsidio s3=new Subsidio(1000,"Grado3");
        Subsidio s4=new Subsidio(1000,"Grado4");
        Subsidio s5=new Subsidio(1000,"Grado5");
        Subsidio s6=new Subsidio(1000,"Grado6");
      
    //------------------SETEAR SUBSIDIOS A INVESTIGADORES--------------
        investigador1.agregarSubsidio(s1);
        investigador1.agregarSubsidio(s2);
        
        investigador2.agregarSubsidio(s3);
        investigador2.agregarSubsidio(s4);
                
        investigador3.agregarSubsidio(s5);
        investigador3.agregarSubsidio(s6);
        

        
    //---------------SETEAR INVESTIGADORES A PROYECTO-----------------
        p.agregarInvestigador(investigador1);
        p.agregarInvestigador(investigador2);
        p.agregarInvestigador(investigador3);
        
    //----------------CAMBIAR ESTADOS DE SUBSIDIOS A UN NOMBRE---------------
        p.otorgarTodos("roberto");
    
    //-------------------PRINT-------------------
        System.out.println(p);
        
        
    }
    
}
