
package ParcialEstanteria;


public class Estanteria {
    private Libro [][] matriz;
    private int cantEstantes;
    private int librosPorEstante;

    public Estanteria(int cantEstantes, int librosPorEstante) {
        this.cantEstantes = cantEstantes;
        this.librosPorEstante = librosPorEstante;
        this.matriz= new Libro[this.cantEstantes][this.librosPorEstante];
		
	for(int i = 0; i < this.cantEstantes; i++) { //inicialm no debe tener libros cargados
            for(int j = 0; j < this.librosPorEstante; j++) {
		this.matriz[i][j] = null;
            }
	}
    }

    public int getCantEstantes() {
        return cantEstantes;
    }

    public void setCantEstantes(int cantEstantes) {
        this.cantEstantes = cantEstantes;
    }

    public int getLibrosPorEstante() {
        return librosPorEstante;
    }

    public void setLibrosPorEstante(int librosPorEstante) {
        this.librosPorEstante = librosPorEstante;
    }
    
    public void almacenarLibro(Libro unLibro){
    boolean aux = false;
    int i = 0;
    int j = 0;
    while (aux != true){
        if (this.matriz[i][j] == null){
            this.matriz[i][j] = unLibro;
            aux = true;
            System.out.println(this.matriz[i][j]);
        }
        else {
            if (j == this.librosPorEstante){
                i++;
            } else {
                j++;
            }
        }
    }
        /*for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 3; j++) {
                this.matriz[i][j]=unLibro;
            } 
        }*/
    }
    
    public Libro sacarLibro(int x, int y) { 
	Libro libroAux = this.matriz[x][y];
	this.matriz[x][y] = null;
	return libroAux;
    }
    
    //calcular: calcula y devuelve la cantidad de libros de un autor cuyo nombre se recibe.
    public int calcular(String nombre){
        int cantidad=0;
        for (int i = 0; i < this.cantEstantes; i++) { //5 estantes
            for (int j = 0; j < this.librosPorEstante; j++) { //libros
               if (this.matriz[i][j] != null){
                   System.out.println(cantidad);
                if (this.matriz[i][j].getNombre().equals(nombre)){
                    cantidad++;
                    System.out.println(this.matriz[i][j].getNombre());
                } 
               }
            }        
        }
       return cantidad; 
    }
}