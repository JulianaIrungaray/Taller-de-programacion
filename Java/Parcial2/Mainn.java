/*
Un cine desea un sistema para poder vender entradas para las películas en cada una de sus salas.
-El cine se caracteriza por tener un nombre, una dirección y el nombre del dueño. El cine además tiene información
de sus salas (a lo sumo 5).
-Una sala se caracteriza por tener un número de sala, el cupo de entradas y la cantidad vendida. Además de tener
información de la película proyectada en esa sala.
-Una película se caracteriza por tener un nombre, un director y la duración en minutos.
a) Realice el modelo de clases. Implemente las clases con sus atributos y métodos para obtener /modificar el valor de
los mismos, además de los constructores necesarios.
b) implemente la posibilidad de poder agregar salas al cine y películas a una sala. También se debe implementar un
método que permita la venta de entradas de una determinada sala, como así también la devolución de una entrada.
c) Implemente los métodos necesarios (en las clases que correspondan) para poder conocer:
i Dado un número de sala, saber si quedan entradas disponibles
ii. Dado el nombre de una película saber en qué sala se proyecta
iii. La sala con mayor cantidad de entradas vendidas
iv. El nombre de la película que más entradas vendió
NOTA: los métodos NO deben imprimir nada, solo devolver lo solicitado.
NOTA2: piense que todo lo pedido debe poder ser accedido a partir de un cine, es decir: si en la función
main se instancia un cine, a partir de el se debe poder conocer/hacer todo lo solicitado.
 */
package ParcialCine;

public class NewMain {
    public static void main(String[] args) {
        Cine c= new Cine ("Cinema5", "55", "Pepe");
        Pelicula p1= new Pelicula("Spiderman", "pepito", 30);
        Pelicula p2= new Pelicula("Batman", "pepi", 50);
        
        
        Sala s1= new Sala(0, 5);
        Sala s2= new Sala(1, 6);
        c.agregarSala(s1);
        c.agregarSala(s2);
        
    
       c.agregarPelicula(p1, 0);
       c.agregarPelicula(p2, 1);
        
        c.venderEntradaDeUnaSala(1);
        
        c.enQueSalaSeProyecta("Spiderman"); 
        if(s1 != null) {
            System.out.println("La película " + p1.getNomPeli() + " se proyecta en la sala " + s1.getNumSala());
        }        
    }  
}