
public class MainParcial {

    public static void main(String[] args) {
        
        Hospital hospital = new Hospital();
        
        hospital.setNombre("Instituto Central de Medicina");
        hospital.setDireccion("43 e/ 6 y 7");
        
        Paciente p1 = new Paciente(123123, "Mojo", "IOMA");
        Paciente p2 = new Paciente(321321, "Jomo", "PAMI");
        Paciente p3 = new Paciente(456456, "Oomj", "OSECAC");
        
        hospital.ingresarPaciente(p2, 2);
        hospital.ingresarPaciente(p1, 4);
        hospital.ingresarPaciente(p3, 7);
        
        hospital.incrementarCamasEnUso();
        
        System.out.println(hospital);
        
        hospital.altaPaciente(321321);
        
        System.out.println("------DESPUÉS DE DARLE DE ALTA AL PACIENTE------");
        
        System.out.println(hospital);
        
    }

}
