
package ParcialCine;


public class Pelicula {
    private String nomPeli;
    private String director;
    private int duracion;

    public Pelicula(String nomPeli, String director, int duracion) {
        this.nomPeli = nomPeli;
        this.director = director;
        this.duracion = duracion;
    }

    public String getNomPeli() {
        return nomPeli;
    }

    public void setNomPeli(String nomPeli) {
        this.nomPeli = nomPeli;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }
  
}