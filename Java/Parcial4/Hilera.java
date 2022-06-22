package ParcialCoro;

/**
 *

 */
public class Hilera extends Coro{
    private Corista [][] matriz;
    private int fila;
    private int columna;

    public Hilera(Director unDirector, int cantCoristas) {
        super(unDirector, cantCoristas);
        this.fila= 0;
        this.columna=0;
        this.matriz= new Corista [this.fila][this.columna];
        
    }

    public int getFila() {
        return fila;
    }

    public void setFila(int fila) {
        this.fila = fila;
    }

    public int getColumna() {
        return columna;
    }

    public void setColumna(int columna) {
        this.columna = columna;
    }
    
    /*En el coro por hileras los coristas se deben ir agregando de izquierda a
derecha completando la hilera antes de pasar a la siguiente,
comenzando por la hilera de adelante.???????*/
    public void agregarCorista(Corista unCorista, int tonoF){
        for (int i = 0; i < this.fila; i++) {
            for (int j = 0; j < this.columna; j++) {
                if (tonoF > this.matriz[this.fila][this.columna].getTonoFund()){
                    this.matriz[this.fila][this.columna]= unCorista;
                
                }
            }
        }
    }
    
        
        
    }