package ParcialCoro;

public abstract class Coro {
    private String nombre;
    private Director unDirector;
    private int diml = 0;
    private Corista [] vector;
    private int cantCoristas; //dimf

    public Coro(Director unDirector, int cantCoristas) {
        this.unDirector = unDirector;
        this.cantCoristas = cantCoristas;
        this.vector = new Corista [cantCoristas];
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getUnDirector() {
        return unDirector;
    }

    public void setUnDirector(Director unDirector) {
        this.unDirector = unDirector;
    }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }

    public int getCantCoristas() {
        return cantCoristas;
    }

    public void setCantCoristas(int cantCoristas) {
        this.cantCoristas = cantCoristas;
    }
    
    
    /*determinar si un coro estÃ¡ lleno o no. Devuelve true si el coro tiene a todos sus
coristas asignados o false en caso contrario.*/
    public boolean CoroLleno (){
        boolean aux= false;
        if (this.diml == this.getCantCoristas()){
            aux= true;
        }
        return aux;
    }

    @Override
    public String toString(){
        return "Nombre del coro es " + this.getNombre() + " el director es " + this.getUnDirector();
    }
    
    
}
