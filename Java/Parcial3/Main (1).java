/*
1) Queremos representar estanterías de libros. Una estantería mantiene sus libros organizados en N
estantes cada uno con lugar para M libros. Un libro posee título, nombre de su primer autor y peso.
a) Implemente las clases de su modelo, con sus atributos y getters/setters adecuados. Provea constructores
para iniciar: los libros a partir de toda su información; la estantería para N estantes y lugar para M libros
por estante (inicialmente no debe tener libros cargados).
b) Implemente los siguientes métodos
- almacenarLibro: recibe un libro y lo almacena en el primer estante que tenga lugar. Asuma que hay
espacio para almacenar el libro.
- sacarLibro: saca y devuelve el libro que se encuentra en el estante X, lugar Y (X e Y se reciben y son
válidos). Dicho lugar debe quedar disponible.
- calcular: calcula y devuelve la cantidad de libros de un autor cuyo nombre se recibe.
2) Realice un programa que instancie una estantería para 5 estantes y 3 libros por estante. Almacene 7
libros en la estantería. A partir de la estantería: saque un libro e informe su representación String; luego,
informe la cantidad de libros de “Borges */
package ParcialEstanteria;

public class NewMain {
    public static void main(String[] args) {
       Estanteria e= new Estanteria(5,3);
       Libro l= new Libro("hola", "Borges", 3);
       e.almacenarLibro(l);
       System.out.println(l.toString());
       System.out.println("Cantidad de libros de Borges: " + e.calcular("Borges"));
       e.sacarLibro(0, 0);
    }
    
}
