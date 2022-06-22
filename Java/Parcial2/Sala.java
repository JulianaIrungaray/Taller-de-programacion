
package ParcialCine;

public class Sala {
    private int numSala;
    private int cupo;
    private int cantV;
    private Pelicula unaPeli;

    public Sala(int numSala, int cupo) {
        this.numSala = numSala;
        this.cupo = cupo;
        this.cantV = 0;
    }

    public int getNumSala() {
        return numSala;
    }

    public void setNumSala(int numSala) {
        this.numSala = numSala;
    }

    public int getCupo() {
        return cupo;
    }

    public void setCupo(int cupo) {
        this.cupo = cupo;
    }

    public int getCantV() {
        return cantV;
    }

    public void setCantV(int cantV) {
        this.cantV = cantV;
    }

    public Pelicula getUnaPeli() {
        return unaPeli;
    }

    public void setUnaPeli(Pelicula unaPeli) {
        this.unaPeli = unaPeli;
    }
    
   public void venderEntrada(){
       this.cantV+=1;
       this.cupo-=1;
   }
   
   public void devolverEntrada(){
       this.cantV-=1;
       this.cupo+=1;
   }


}