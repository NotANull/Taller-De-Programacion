
public class Investigador {

    private String nombreInvestigador;
    private int categoria;
    private String especialidad;
    private final Subsidio[] subsidios;
    private final int maxSubsidios = 5;
    private int cantSubsidios;

    public Investigador(String nombreInvestigador, int categoria, String especialidad) {
        this.nombreInvestigador = nombreInvestigador;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.subsidios = new Subsidio[this.maxSubsidios];
        this.cantSubsidios = -1;
        inicializarSubsidios();
    }

    public int getMaxSubsidios() {
        return maxSubsidios;
    }

    public int getCantSubsidios() {
        return cantSubsidios;
    }

    public String getNombreInvestigador() {
        return nombreInvestigador;
    }

    public void setNombreInvestigador(String nombreInvestigador) {
        this.nombreInvestigador = nombreInvestigador;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public void agregarSubsidio(Subsidio unSubsidio) {
        this.cantSubsidios++;
        if (this.cantSubsidios < this.maxSubsidios) {
            this.subsidios[this.cantSubsidios] = unSubsidio;
        }
    }
    
    public void otorgarTodos(String nombreCompleto) {
        if (this.nombreInvestigador.equals(nombreCompleto)) {
            for (int i = 0; i < this.cantSubsidios; i++) {
                if (this.subsidios[i].isOtorgado() == false) {
                    this.subsidios[i].setOtorgado(true);
                }
            }
        }
    }
    
    public double totalEnSubsidios() {
        double sumaSubsidios = 0;
        for (int i = 0; i < this.cantSubsidios; i++) {
            if (this.subsidios[i].isOtorgado() == true) {
                sumaSubsidios += this.subsidios[i].getMontoPedido();
            }
        }
        return sumaSubsidios;
    }
    
    private void inicializarSubsidios() {
        for (int i = 0; i < this.maxSubsidios; i++) {
            subsidios[i] = null;
        }
    }
    
    @Override
    public String toString() {
        return "\nINVESTIGADOR" + "\nNombre: " + this.nombreInvestigador + "\nCategoría: " + this.categoria + "\nEspecialidad: " + this.especialidad + "\nTotal dinero en subsidios: " + this.totalEnSubsidios();
    }
}
