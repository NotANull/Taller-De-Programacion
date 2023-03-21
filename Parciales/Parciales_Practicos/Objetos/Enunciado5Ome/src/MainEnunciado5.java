
public class MainEnunciado5 {

    public static void main(String[] args) {

        Paciente p1 = new Paciente("Nombre Paciente 1", true, 1010);//
        Paciente p2 = new Paciente("Nombre Paciente 2", true, 2020);//
        Paciente p3 = new Paciente("Nombre Paciente 3", true, 3030);//
        Paciente p4 = new Paciente("Nombre Paciente 4", true, 4040);//
        Paciente p5 = new Paciente("Nombre Paciente 5", true, 5050);//
        Paciente p6 = new Paciente("Nombre Paciente 6", true, 6060);//
        Paciente p7 = new Paciente("Nombre Paciente 7", true, 7070);//
        Paciente p8 = new Paciente("Nombre Paciente 8", true, 8080);//
        Paciente p9 = new Paciente("Nombre Paciente 9", true, 9090);//
        Paciente p10 = new Paciente("Nombre Paciente 10", true, 100100);//
        Paciente p11 = new Paciente("Nombre Paciente 11", true, 110110);//
        Paciente p12 = new Paciente("Nombre Paciente 12", true, 120120);//
        Paciente p13 = new Paciente("Nombre Paciente 13", true, 130130);//
        Paciente p14 = new Paciente("Nombre Paciente 14", true, 140140);//
        Paciente p15 = new Paciente("Nombre Paciente 15", true, 150150);//
        
        Agenda agenda = new Agenda();
        
        agenda.agendarPaciente(p2, 4, 5);
        agenda.agendarPaciente(p5, 4, 1);
        agenda.agendarPaciente(p6, 4, 2);
        agenda.agendarPaciente(p8, 0, 4);
        agenda.agendarPaciente(p3, 1, 4);
        agenda.agendarPaciente(p1, 4, 0);
        agenda.agendarPaciente(p7, 2, 2);
        agenda.agendarPaciente(p13, 3, 4);
        agenda.agendarPaciente(p9, 0, 5);
        agenda.agendarPaciente(p15, 2, 4);
        agenda.agendarPaciente(p12, 4, 3);
        agenda.agendarPaciente(p14, 0, 0);
        agenda.agendarPaciente(p11, 3, 0);
        agenda.agendarPaciente(p4, 0, 1);
        agenda.agendarPaciente(p10, 2, 1);
        
        agenda.liberarTurnosPaciente("Nombre Paciente 8");
        
        System.out.println(agenda.estaAgendada(2, "Nombre Paciente 7"));
    }

}
