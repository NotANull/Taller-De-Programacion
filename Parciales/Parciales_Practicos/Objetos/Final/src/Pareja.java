
public class Pareja {

    private final Participante[] participantes;
    private String estiloBaile;

    public Pareja(String estiloBaile) {
        this.estiloBaile = estiloBaile;
        this.participantes = new Participante[2];
        inicializarParticipantes();
    }

    public String getEstiloBaile() {
        return estiloBaile;
    }

    public void setEstiloBaile(String estiloBaile) {
        this.estiloBaile = estiloBaile;
    }

    /*Sé que podría usarse un for para inicializar el array ya que
    se podría modificar la cantidad pero el enunciado sólo nos pide 2 participantes por pareja*/
    private void inicializarParticipantes() {
        this.participantes[0] = null;
        this.participantes[1] = null;
    }
    
    //Ordeno los participantes por edad así puedo diferenciar más fácil las edades
    public void agregarParticipantes(Participante p1, Participante p2) {
        if (p1.getEdad() > p2.getEdad()) { //Si la edad de participante 1 es mayor a la edad del participante 2
            this.participantes[0] = p1;
            this.participantes[1] = p2;
        } else if (p2.getEdad() > p1.getEdad()) { //Si la edad de participante 2 es mayor a la edad del participante 1
            this.participantes[0] = p2;
            this.participantes[1] = p1;
        } else { //Si las edades son iguales, que se guarden como están
            this.participantes[0] = p1;
            this.participantes[1] = p2;
        }
    }
    
    public int diferenciaDeEdad() {
        return (this.participantes[0].getEdad() - this.participantes[1].getEdad());
    }
    
    @Override
    public String toString() {
        return this.participantes[0] + "\n" + this.participantes[1];
    }
}
