
public class Agenda {

    private final Paciente[][] agendaPacientes;
    private final int totalDiasAtencion = 5;
    private final int totalTurnosPorDia = 6;

    public Agenda() {
        this.agendaPacientes = new Paciente[this.totalDiasAtencion][this.totalTurnosPorDia];
        inicializarAgendaPacientes();
    }

    public int getTotalDiasAtencion() {
        return totalDiasAtencion;
    }

    public int getTotalTurnosPorDia() {
        return totalTurnosPorDia;
    }

    private void inicializarAgendaPacientes() {
        for (int i = 0; i < this.totalDiasAtencion; i++) {
            for (int j = 0; j < this.totalTurnosPorDia; j++) {
                this.agendaPacientes[i][j] = null;
            }
        }
    }

    public void agendarPaciente(Paciente p, int dia, int turno) {
        this.agendaPacientes[dia][turno] = p;
    }

    public void liberarTurnosPaciente(String nombrePaciente) {
        for (int i = 0; i < this.totalDiasAtencion; i++) {
            for (int j = 0; j < this.totalTurnosPorDia; j++) {
                if ((this.agendaPacientes[i][j] != null) && (this.agendaPacientes[i][j].getNombrePaciente().equals(nombrePaciente))) {
                    this.agendaPacientes[i][j] = null;
                }
            }
        }
    }

    public boolean estaAgendada(int dia, String nombrePaciente) {
        int j = 0;
        boolean sinAgendar = false;
        while ((j < this.totalTurnosPorDia) && (sinAgendar == false)) {
            if ((this.agendaPacientes[dia][j] != null) && (this.agendaPacientes[dia][j].getNombrePaciente().equals(nombrePaciente))) {
                sinAgendar = true;
            }
            if (sinAgendar == false) {
                j++;
            }
        }
        return sinAgendar;
    }
}
