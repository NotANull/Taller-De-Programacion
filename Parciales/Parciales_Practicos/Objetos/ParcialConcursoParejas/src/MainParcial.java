
public class MainParcial {

    public static void main(String[] args) {

        Concurso concurso = new Concurso(5);
        
        Participante p1 = new Participante(123123, "Sofia", 54);
        Participante p2 = new Participante(321321, "Omar", 28);
        Participante p3 = new Participante(456456, "Benjamín", 34);
        Participante p4 = new Participante(654654, "Isabella", 24);
        
        Pareja par1 = new Pareja(p1, p2, "Rock and Roll");
        Pareja par2 = new Pareja(p3, p4, "Jazz");
        
        concurso.agregarPareja(par1);
        concurso.agregarPareja(par2);
        
        System.out.println(concurso.getParejaMaxDiferencia());
    }
}
