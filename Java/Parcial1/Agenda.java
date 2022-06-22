package ParcialPsicologo;

public class Agenda {
    private Paciente [][] turnos;
    private int CantDias;
    private int CantTurnos;

    public Agenda(int CantDias,int CantTurnos) {
        this.CantDias= CantDias;
        this.CantTurnos= CantTurnos;
        this.turnos= new Paciente[this.CantDias][this.CantTurnos];
        
        for(int i = 0; i < this.CantDias; i++) { //el sistema sin pacientes
            for(int j = 0; j < this.CantTurnos; j++) {
		this.turnos[i][j] = null;
            }
	}
    }

    
    
    //i. Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son válidos.
    public void agendar(Paciente p, int D, int T){
        turnos[D][T]=p;
    //no se usa un for porque solo te pide agendar en una posicion directamente        
    }
    
    //ii. Dado el nombre de un paciente, liberar todos sus turnos.
    public void liberarTurnos (String nombre){
        for (int i = 0; i < this.CantDias; i++) {
            for (int j = 0; j < this.CantTurnos; j++) {
                if((this.turnos[i][j] != null) && (this.turnos[i][j].getNombre().equals(nombre))){
                    this.turnos[i][j]=null;
                    System.out.println("Se liberó los turnos del paciente " + nombre);
                }               
            }          
        }  
    }
    
    //iii. Dado un día D y el nombre de un paciente, devolver si el paciente tiene agendado un
    //turno ese día. Asuma que D es válido.
    public boolean agendado(int dia, String nombre){
        boolean aux= false;
        int i = 0;
        while ((i < 6) && !(aux)){
            if ((this.turnos[dia][i] != null) &&(this.turnos[i][dia].getNombre().equals(nombre))){
                aux= true;
                System.out.println("El paciente "+nombre+ " está agendado");
            }else{
                i++;
                
            }
        }
        return aux;
    }
}