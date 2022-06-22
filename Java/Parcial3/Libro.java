package ParcialEstanteria;


public class Libro {
    private String titulo;
    private String nombre; //autor
    private double peso;

    public Libro(String titulo, String nombre, double peso) {
        this.titulo = titulo;
        this.nombre = nombre;
        this.peso = peso;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }
    
    public String toString(){
        return "Titulo: " + this.titulo + " Nombre de autor: " + this.nombre + " Peso: " + this.peso;
    }
}
