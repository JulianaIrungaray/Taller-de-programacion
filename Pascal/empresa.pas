{Una empresa de logística ofrece 4 tipos de paquetes (1: encomienda común, 2: encomienda express, 3:  encomienda frágil, 4: certificado), 
y necesita procesar los envíos de  sus clientes. 
Para ello se dispone de un módulo “Envíos” que lee la información de los envíos realizados y genera una estructura con código de paquete,
código de localidad de destino, peso y precio del paquete, agrupados por tipo de paquete. Por cada tipo de paquete, los envíos se encuentran 
ordenados por código de localidad.
Se pide implementar un programa en Pascal que:  

A)Invoque a un módulo que reciba la estructura de los envíos y utilizando la técnica de merge o merge acumulador genere un árbol ordenado que 
contenga código de localidad y el peso total acumulado entre todos sus envíos. El árbol debe estar ordenado por el peso total.

B)Implementar un módulo recursivo que reciba la estructura generada en a) y retorne la cantidad de localidades con peso total inferior a un valor
que se recibe como parámetro.

NOTA: Para cada tipo de paquete puede haber más de un envío de la misma localidad.
No es necesario implementar la carga de la estructura que se dispone. Alcanza con declarar el encabezado del procedimiento e invocarlo para 
que el programa compile satisfactoriamente.}
program parcial2021;
const
    dimf=4;
type
    rango=1..dimf;

    envio= record
        codPaquete: rango; 
        codDestino: integer; //codigo de localidad de destino
        peso: real;
        precio: real;
    end;
    
    lista=^nodo; //una lista porque no sabemos la cantidad de envios del cliente
    nodo=record
        dato:envio;
        sig:lista;
    end;
    
    vector= array[rango] of lista;
    
    envio2= record
        codLocalidad: integer;
        pesoTotal: real;
    end;
    
    arbol = ^nodoA;
    nodoA = record 
        dato: envio2; 
        HI: arbol; 
        HD: arbol; 
    end;
    
procedure InicializarVector(var v:vector);
var
	 i:integer;
begin
	 for i:=1 to dimf do
		 v[i]:= nil;
end;    
    
procedure LeerEnvio(var e: envio);
begin
    writeln('Ingrese el código de destino: ');
    readln (e.codDestino);
    if (e.codDestino <> -1) then begin
        writeln('Ingrese el código de paquete: ');
        readln (e.codPaquete);
        writeln('Ingrese el peso: ');
        readln (e.peso);
        writeln('Ingrese el precio: ');
        readln (e.precio);
    end;
end;
    
procedure InsertarOrdenado(var l: lista; e:envio);
var
    aux,ant,act: lista;
begin
    new(aux); 
    aux^.dato:= e;
    act:= l;
    ant:= l;
    while (act <> nil) and (act^.dato.codDestino < e.codDestino) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (ant=act) then 
        l:= aux
    else 
        ant^.sig:= aux;
    aux^.sig:= act;
end;    
    
procedure CargarVectorLista(var v:vector);
var
	e:envio;
begin
	LeerEnvio(e);
	while (e.codDestino <> -1) do begin
		InsertarOrdenado(v[e.codPaquete], e); //agrupados por codigo de paquete
    	LeerEnvio(e);
	end;
end;    

procedure ImprimirVectorListas(v: vector); //no es necesario
var
    i: integer;
begin
    for i:= 1 to dimf do begin
        writeln ('lista', i , ':');
        while (v[i] <> nil) do begin
            writeln('Código de paquete: ', v[i]^.dato.codPaquete);
            writeln('Código de localidad: ', v[i]^.dato.codDestino);
            writeln('Peso: ', v[i]^.dato.peso:0:2);
            writeln('Precio: ', v[i]^.dato.precio:0:2);
            v[i]:=v[i]^.sig;
        end;
    end;
end;


{A)Invoque a un módulo que reciba la estructura de los envíos y utilizando la técnica de merge o merge acumulador genere un árbol ordenado que 
contenga código de localidad y el peso total acumulado entre todos sus envíos. El árbol debe estar ordenado por el peso total.}
procedure BuscarMinimo(var e: envio; var v:vector); 
var
    i,pos:integer;
begin
    e.codDestino:=999;
    for i:=1 to dimf do begin
        if (v[i] <> nil)then 
            if (v[i]^.dato.codDestino < e.codDestino) then begin
                e:=v[i]^.dato; //se guarda el registro completo
                pos:=i;
           end;
    end;
    if (e.codDestino <> 999) then begin
        v[pos]:=v[pos]^.sig;
    end;
end;

procedure InsertarArbol (var abb:arbol; e2:envio2);
begin
    if (abb=nil) then begin
        new(abb);
        abb^.dato:=e2;
        abb^.HI:=nil;
        abb^.HD:=nil;
    end
    else
        if (abb^.dato.pesoTotal > e2.pesoTotal) then
            InsertarArbol (abb^.HI, e2)
        else 
            InsertarArbol (abb^.HD, e2);
           
end;


procedure MergeAcumulador(var a: arbol; var v:vector);
var
    tipoActual:integer;
    totalPeso:real;
    e:envio; //viejo
    e2:envio2; //nuevo
begin
   BuscarMinimo(e,v);
   while (e.codDestino <> 999)do begin
        totalPeso:=0;
        tipoActual:= e.codDestino; //voy preguntando por localidad
        while (tipoActual = e.codDestino) do begin
            totalPeso:= totalPeso + e.peso;
            BuscarMinimo(e,v);
        end;
       e2.codLocalidad:=tipoActual;
       e2.pesoTotal:=totalPeso;
       InsertarArbol(a, e2);
   end;
end;


Procedure enOrden (a : arbol); 
begin 
    if (a <> nil ) then begin 
        enOrden (a^.HI); 
        writeln ('Codigo de localidad: ', a^.dato.codLocalidad);
        writeln ('Peso total: ', a^.dato.pesoTotal:0:2); 
        enOrden (a^.HD); 
    end; 
end;


function CantLocalidad(a: arbol; valor: real): integer;
begin
  if(a=nil) then 
    CantLocalidad:=0
    else
        if(a^.dato.pesoTotal < valor) then begin
            CantLocalidad:=CantLocalidad(a^.HI, valor) + 1;
            CantLocalidad:=CantLocalidad(a^.HD, valor) + 1;
        end
        else begin 
            CantLocalidad(a^.HD, valor);
            CantLocalidad(a^.HI, valor);
        end;
end;  


//pp
var
    v: vector;
    a: arbol;
    l: lista;
begin
    a:=nil;
    InicializarVector(v);
    CargarVectorLista(v);
    ImprimirVectorListas(v);
    MergeAcumulador(a,v);
    writeln('Merge de arbol: ');
    enOrden(a); //imprimir arbol
    writeln('La cantidad de localidades con peso total inferior al nro ingresado es: ', CantLocalidad(a,10));
end.