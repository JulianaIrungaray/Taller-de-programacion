/*Un psicólogo necesita un sistema para organizar su agenda semanal. El sistema
mantiene para c/u de los 5 días de atención y c/u de los 6 turnos (horarios) del día, la
información del paciente que tomó el turno. De los pacientes guarda: nombre, si tiene
obra social y costo a abonar por la sesión.
a)Genere las clases necesarias. Implemente constructores para iniciar: el sistema sin
pacientes; los pacientes a partir de toda su información.
b)Lea atentamente y luego implemente métodos que permitan:
i. Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son
válidos.
ii. Dado el nombre de un paciente, liberar todos sus turnos.
iii. Dado un día D y el nombre de un paciente, devolver si el paciente tiene agendado un
turno ese día. Asuma que D es válido.
c) Realice un programa que instancie el sistema. Cargue varios pacientes al sistema.
Libere turnos agendados. Para finalizar, imprima el resultado del inciso b.iii */
package ParcialPsicologo;

public class NewMain {

    public static void main(String[] args) {
        Agenda a= new Agenda(5,6);
        Paciente p1= new Paciente ("Matías", true, 500);
        a.agendar(p1, 0, 0);

        Paciente p2= new Paciente ("Carlos", true, 600);
        a.agendar(p2, 1, 1);
        a.liberarTurnos("Matías");
        a.agendado(1, "Carlos"); //muestra si el paciente está agendado o no
    }
        
 }