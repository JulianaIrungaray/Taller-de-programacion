
package ParcialCoro;

import PaqueteLectura.Lector;

public class NewMain {

    public static void main(String[] args) {
        int diml=0;
        int dimf=2;

        System.out.println("Ingrese el nombre del coro");
        String nombreCoro = Lector.leerString();
          
        System.out.println("Datos del director del coro de hileras:");
        System.out.println("Ingrese nombre");
        String nombreD = Lector.leerString();
        System.out.println("Ingrese dni");
        int dni= Lector.leerInt();
        System.out.println("Ingrese edad");
        int edad= Lector.leerInt();
        System.out.println("Ingrese antiguedad");
        int ant= Lector.leerInt();
        System.out.println("Ingrese la cantidad coristas: ");
        int cantC= Lector.leerInt();
        
        Director d1 = new Director (nombreD, dni, edad, ant);
        Hilera h= new Hilera(d1, cantC);
       
        System.out.println("Ingrese nombre del corista: ");
        String nombreC = Lector.leerString();
        System.out.println("Ingrese dni corista");
        int dniC= Lector.leerInt();
        System.out.println("Ingrese el tono fundamental");
        int tonoF= Lector.leerInt();
        
        Corista c1= new Corista (nombreC, dniC, tonoF);
        h.agregarCorista(c1, tonoF);
        System.out.println(c1.toString());
  
        
        System.out.println("Ingrese el nombre del coro");
        nombreCoro = Lector.leerString();
        
        System.out.println("Datos del director del coro circular:");
        System.out.println("Ingrese nombre");
        nombreD = Lector.leerString();
        System.out.println("Ingrese dni");
        dni= Lector.leerInt();
        System.out.println("Ingrese edad");
        edad= Lector.leerInt();
        System.out.println("Ingrese antiguedad");
        ant= Lector.leerInt();
        
        Director d2 = new Director (nombreD, dni, edad, ant);
        
        SemiCircular cir= new SemiCircular(d2, cantC);
       
        System.out.println("Ingrese nombre del corista: ");
        nombreC = Lector.leerString();
        System.out.println("Ingrese dni corista");
        dniC= Lector.leerInt();
        System.out.println("Ingrese el tono fundamental");
        tonoF= Lector.leerInt();
        
        Corista c2= new Corista (nombreC, dniC, tonoF);
        cir.agregarCorista(c2);
        System.out.println(c2.toString());
        
        
    }
    
}