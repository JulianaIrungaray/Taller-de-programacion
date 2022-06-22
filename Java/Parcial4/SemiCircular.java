package ParcialCoro;


public class SemiCircular extends Coro{
    private Corista [] vector;
    private int diml=0;
    private int dimf=2;

    public SemiCircular(Director unDirector, int cantCoristas) {
        super(unDirector, cantCoristas);
        this.vector = new Corista [dimf];
    }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }
    /*o En el coro semicircular los coristas se deben ir agregando de izquierda
    a derecha PREGUNTAR
    
    o En el caso del coro semicircular, de izquierda a derecha los coristas
    estÃ¡n ordenados de mayor a menor en cuanto a tono fundamental.*/
    public void agregarCorista(Corista unCorista){
        if(this.diml < super.getCantCoristas()){
           
                vector[this.diml] = unCorista;
                this.diml++;  
        
    }  
   }
    
}
