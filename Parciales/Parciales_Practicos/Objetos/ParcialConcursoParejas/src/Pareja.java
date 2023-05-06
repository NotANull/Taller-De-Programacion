
public class Pareja {

    private Participante participante1;
    private Participante participante2;
    private String estiloBaile;

    public Pareja(Participante participante1, Participante participante2, String estiloBaile) {
        this.participante1 = participante1;
        this.participante2 = participante2;
        this.estiloBaile = estiloBaile;
    }
    
    public int getDiferenciaEdad() {
        int diferencia;
        if (this.participante1.getEdad() > this.participante2.getEdad()) {
            diferencia = this.participante1.getEdad() - this.participante2.getEdad();
        } else if (this.participante2.getEdad() > this.participante1.getEdad()) {
            diferencia = this.participante2.getEdad() - this.participante1.getEdad();
        } else {
            diferencia = 0;
        }
        return diferencia;
    }
    
    @Override
    public String toString() {
        return "\n////PAREJA////" +
               "\nEstilo de baile: " + this.estiloBaile +
               this.participante1 +
               this.participante2;
    }
}
