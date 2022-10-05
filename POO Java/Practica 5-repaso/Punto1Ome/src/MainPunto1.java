
public class MainPunto1 {

    public static void main(String[] args) {

        Proyecto proyecto = new Proyecto("Nombre de proyecto", 2022, "Nombre De Director");
        
        Investigador inv1 = new Investigador("Nombre Investigador 1", 3, "Ingeniero");
        Investigador inv2 = new Investigador("Nombre Investigador 2", 2, "Programador");
        Investigador inv3 = new Investigador("Nombre Investigador 3", 5, "Maquinista");
        
        Subsidio sub1 = new Subsidio(550, "Algún motivo 1");
        Subsidio sub2 = new Subsidio(505, "Algún motivo 2");
        Subsidio sub3 = new Subsidio(055, "Algún motivo 3");
        Subsidio sub4 = new Subsidio(500, "Algún motivo 4");
        Subsidio sub5 = new Subsidio(555, "Algún motivo 5");
        Subsidio sub6 = new Subsidio(005, "Algún motivo 6");
        
        inv1.agregarSubsidio(sub1);
        inv1.agregarSubsidio(sub2);
        
        inv2.agregarSubsidio(sub3);
        inv2.agregarSubsidio(sub4);
        
        inv3.agregarSubsidio(sub5);
        inv3.agregarSubsidio(sub6);
        
        proyecto.agregarInvestigador(inv1);
        proyecto.agregarInvestigador(inv2);
        proyecto.agregarInvestigador(inv3);
        
        System.out.println(proyecto);
    }

}
