package ParcialCoro;


public class Corista{
    private String nombreCorista;
    private int dni;
    private int tonoFund;

    public Corista(String nombreCorista, int dni, int tonoFund) {
        this.nombreCorista= nombreCorista;
        this.dni= dni;
        this.tonoFund= tonoFund;
    }

    
    public String getNombreCorista() {
        return nombreCorista;
    }

    public void setNombreCorista(String nombreCorista) {
        this.nombreCorista = nombreCorista;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getTonoFund() {
        return tonoFund;
    }

    public void setTonoFund(int tonoFund) {
        this.tonoFund = tonoFund;
    }
    
    @Override
    public String toString(){
        return "Nombre del corista " + this.getNombreCorista() + " con dni " + this.getDni() + " y tono fundamental " + this.getTonoFund();
    }
}