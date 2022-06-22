package ParcialCine;

public class Cine {
    private String nombreCine;
    private String direccion;
    private String nombreDueño;
    private int diml;
    private int dimf;
    private Sala [] vector;

    public Cine(String nombreCine, String direccion, String nombreDueño) {
        this.nombreCine = nombreCine;
        this.direccion = direccion;
        this.nombreDueño = nombreDueño;
        this.diml = 0; 
        this.dimf = 5; //max de salas
        this.vector= new Sala[this.dimf];
    }

    public String getNombreCine() {
        return nombreCine;
    }

    public void setNombreCine(String nombreCine) {
        this.nombreCine = nombreCine;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNombreDueño() {
        return nombreDueño;
    }

    public void setNombreDueño(String nombreDueño) {
        this.nombreDueño = nombreDueño;
    }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }

    public int getDimf() {
        return dimf;
    }

    public void setDimf(int dimf) {
        this.dimf = dimf;
    }
    
    public void agregarSala(Sala unaSala){
        if(this.diml < this.dimf){
            this.vector[this.diml]= unaSala;
            this.diml++;
        }
    }
   
   
    public void agregarPelicula(Pelicula unaPeli, int numSala){
        this.vector[numSala].setUnaPeli(unaPeli);
    }
    
    public void venderEntradaDeUnaSala(int numSala){
        if (this.HayEntrada(numSala)==true){
            this.vector[numSala].venderEntrada();
        }
    }
    
    public boolean HayEntrada(int numSala){
        boolean aux= false;
        if(this.vector[numSala].getCupo() > 0){
            return aux=true;
        }else{
            return aux=false;
        }
    }
    
    // Dado el nombre de una película saber en qué sala se proyecta
    public Sala enQueSalaSeProyecta(String nomPeli){
        int pos= 0, sala=-1;
        boolean encontre= false;
        while((pos< this.dimf) && (encontre==true)){
            if(this.vector[pos].getUnaPeli().getNomPeli().equals(nomPeli)){
                encontre=true;
                sala=pos;
            }
            pos++;
        }
        if (sala !=-1){
            return this.vector[sala];
        }else{
            return null;
        }
    }
    //La sala con mayor cantidad de entradas vendidas
    public Sala MayorCantEntradas (){
        int max=-1;
        Sala salaMax=null;
        for (int i = 0; i < this.diml; i++) {
            if(this.vector[i].getCantV() > max){
                max= this.vector[i].getCantV();
                salaMax=this.vector[i];
            }     
        }
        return salaMax;
    }
    
    //El nombre de la película que más entradas vendió
    public String peliMaxEntrada (){
        int max=-1;
        String peliMax="";
        for (int i = 0; i < this.diml; i++) {
            if(this.vector[i].getCantV() > max){
                max= this.vector[i].getCantV();
                peliMax=this.vector[i].getUnaPeli().getNomPeli();
            }      
        }
        return peliMax;
    }
}