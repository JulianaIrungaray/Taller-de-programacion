{Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente
registra: dni, cód. de paciente, obra social (1: ioma 2: pami 3: osde 4: galeno 5: no tiene) y
costo abonado por sesión. Implemente un programa que:

a) Genere un ABB ordenado por dni. Para ello, genere información hasta el paciente con
dni 0.

A partir del ABB, realice módulos (uno por inciso) para:
b) Generar una estructura con dni y cód de paciente de los pacientes de ioma, ordenados
por dni descendente.

c) Dado un dni, modificar la obra social de dicho paciente a una recibida. Considere que el
paciente puede no existir}

program parcial;
type
    rango= 1..5;
    paciente= record
        dni: integer;
        codP: integer;
        obraS: rango;
        costo: real;
    end;
    
    arbol=^nodo;
    nodo= record
        dato: paciente;
        HI: arbol;
        HD: arbol;
    end;
    
   paciente2= record
        dni: integer;
        codP: integer;
    end;
    
    lista=^nodoL;
    nodoL= record
        dato: paciente2;
        sig: lista
    end;
    
procedure LeerPaciente(var p: paciente);
begin
    writeln('Ingrese el dni: ');
    readln(p.dni);
    if (p.dni <> 0) then begin
        writeln('Ingrese el código: ');
        readln(p.codP);
        writeln('Ingrese la obra social de (1 a 5): ');
        readln(p.obraS);
        writeln('Ingrese el costo: ');
        readln(p.costo);
    end;
end;

Procedure Insertar (var a:arbol; p:paciente);   
Begin 
    if (a = nil) then begin 
        new(a); 
        a^.dato:= p; 
        a^.HI:= nil; 
        a^.HD:= nil;
    end 
    else 
        if (p.dni < a^.dato.dni) then 
            Insertar (a^.HI, p) 
        else 
            if (p.dni > a^.dato.dni) then //para que no entren repetidos
                Insertar (a^.HD, p); 
End;

Procedure CrearABB (var a:arbol);
var
    p: paciente;
begin
    LeerPaciente(p);
    while (p.dni <> 0) do begin
        Insertar(a,p);
        LeerPaciente(p);
    end;
end;


procedure EnOrden(a:arbol);
begin
 if (a <> nil) then begin
    enorden (a^.HI);
    writeln('Dni: ', a^.dato.dni);
    writeln('Código de paciente: ', a^.dato.codP);
    writeln('Obra social: ', a^.dato.obraS);
    writeln('Costo: ', a^.dato.Costo:0:2);
    enorden (a^.HD);
 end;
end;

Procedure agregarAdelante(var l: lista; p: paciente);
var
    aux: lista;
begin
    new(aux);
    aux^.dato.dni:= p.dni;
    aux^.dato.codP:= p.codP;
    aux^.sig:=l;
    l:=aux;
end;


{ Generar una estructura con dni y cód de paciente de los pacientes de ioma, ordenados
por dni descendente.}
Procedure CargarLista (a:arbol ; var l:lista); //Crear Lista a partir de un arbol
begin 
    if (a <> nil) then begin
        if (a^.dato.obraS = 1) then 
            agregarAdelante(l, a^.dato); //insertar adelante en la lista para que quede descendente
        CargarLista (a^.HI,l);
        CargarLista (a^.HD,l);
    end;
end;

procedure ImprimirListaOrdenada(l:lista);
 begin
	while(l <> nil) do begin
        writeln('Dni: ', l^.dato.dni);
        writeln('Código: ', l^.dato.codP);
    l:=l^.sig;
    end;
 end; 

{Dado un dni, modificar la obra social de dicho paciente a una recibida. Considere que el
paciente puede no existir}
procedure modificarObra(var a: arbol; dni: integer; obra: integer; var ok: boolean);
begin
    if(a = nil) then 
        ok:=false
    else
        if(dni = a^.dato.dni) then begin
            a^.dato.obraS:= obra; 
            ok:=true;
        end
        else begin
            modificarObra(a^.HI,dni,obra,ok);
            if(not ok) then
                modificarObra(a^.HD,dni,obra,ok);
        end;
end;

//pp
var
    a: arbol;
    l: lista;
    ok:boolean;
    dni,obra:integer;
begin
    a:=nil;
    l:=nil;
    CrearABB(a);
    writeln('Arbol: ');
    EnOrden(a);
    CargarLista(a,l);
    writeln('Lista:');
    ImprimirListaOrdenada(l);
    writeln('Ingrese dni para modificar obra: ');
    readln(dni);
    writeln('Ingrese obra social para modificarla: ');
    readln(obra);
    modificarObra(a,dni,obra,ok);
    if(ok= true) then
        writeln('El paciente se encontró y la obra social fue modificada')
    else
        writeln('El paciente que ingresó no se encontró');
    readln;
end.