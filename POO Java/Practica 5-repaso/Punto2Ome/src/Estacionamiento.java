
public class Estacionamiento {

    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private final int numeroPiso;
    private final int numeroPlaza;
    private final Auto[][] estacionamiento;

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = "8:00";
        this.horaCierre = "21:00";
        this.numeroPiso = 5;
        this.numeroPlaza = 10;
        this.estacionamiento = new Auto[5][10];
        inicializarEstacionamiento();
    }

    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int numeroPiso, int numeroPlaza) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.numeroPiso = numeroPiso;
        this.numeroPlaza = numeroPlaza;
        this.estacionamiento = new Auto[this.numeroPiso][this.numeroPlaza];
        inicializarEstacionamiento();
    }

    public int getNumeroPiso() {
        return numeroPiso;
    }

    public int getNumeroPlaza() {
        return numeroPlaza;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }

    private void inicializarEstacionamiento() {
        for (int i = 0; i < this.numeroPiso; i++) {
            for (int j = 0; j < this.numeroPlaza; j++) {
                this.estacionamiento[i][j] = null;
            }
        }
    }
    
    public void registrarAuto(Auto unAuto, int nPiso, int nPlaza) {
        this.estacionamiento[nPiso][nPlaza] = unAuto; //Se supone que nPiso y nPlaza son válidos y el lugar está desocupado
    }
    
    public String buscarAuto(String patente) {
        int i = 0;
        int j;
        boolean noEncontre = true;
        String devolverLugar = "Auto Inexistente";
        
        while ( (i < this.numeroPiso) && (noEncontre)) {
            j = 0;
            while ( (j < this.numeroPlaza) && (noEncontre) ) {
                if ( (this.estacionamiento[i][j] != null) && (this.estacionamiento[i][j].getPatente().equals(patente)) ) {
                    devolverLugar = "El auto está estacionado en el piso " + i + ", plaza " + j;
                    noEncontre = false;
                } else {
                    j++;
                }
            }
            if (noEncontre) {
                i++;
            }
        }
        return devolverLugar;
    }
    
    public void mostrarEstacionamiento() {
        for (int i = 0; i < this.numeroPiso; i++) {
            for (int j = 0; j < this.numeroPlaza; j++) {
                if (this.estacionamiento[i][j] != null) {
                    System.out.println("Piso " + i + " Plaza " + j + ": " + this.estacionamiento[i][j]);
                } else {
                    System.out.println("Piso " + i + " Plaza " + j + ": libre");
                }
            }
        }
    }
    
    public int totalAutosEnPlaza(int nPlaza) {
        int cant = 0;
        for (int i = 0; i < this.numeroPiso; i++) {
            if (this.estacionamiento[nPlaza][i] != null) {
                cant++;
            }
        }
        return cant;
    }
}
