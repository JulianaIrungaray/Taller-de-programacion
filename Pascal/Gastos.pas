{Ejercicio 2. Una familia de 4 integrantes lleva registro de sus gastos (tipo de gasto y monto gastado).
Se pide:
a) Generar una estructura que almacene los gastos de los integrantes de la familia, agrupados según
el integrante. Por cada integrante, se leen gastos hasta tipo de gasto 0. Los gastos de cada
integrante deben ordenarse por tipo de gasto.
b) Imprimir la estructura generada en a.
c) A partir de la estructura generada en a, realice un merge para obtener los montos totales gastados
por cada tipo de gasto. Genere un ABB con monto total y tipo de gasto, ordenado por monto total.
d) A partir del ABB, busque e imprima el tipo de gasto con mayor monto total}
program ejer2;
const
    dimf= 4;
type
    rango= 1..dimf;
    
    gasto= record
        tipo: integer;
        monto: real;
    end;

    lista = ^nodo;
	nodo = record
		dato:gasto;
		sig:lista;
	end;
	
	arbol = ^nodoA;
    nodoA = record 
        dato: gasto; 
        HI: arbol; 
        HD: arbol; 
    end;
	
	vector = array[rango] of lista;
	
procedure InicializarVector(var v:vector);   
var
  i:integer;
begin
  for i:=1 to dimf do
        v[i]:=nil;
end;  
    
procedure LeerGasto (var g: gasto);
begin
    g.tipo:= random(10);
    if(g.tipo <> 0) then 
        g.monto:= random(10);
end; 

procedure InsertarOrdenado(var l: lista; g: gasto);
var
    aux,ant,act: lista;
begin
    new(aux); 
    aux^.dato:= g;
    act:= l;
    ant:= l;
    while (act <> nil) and (act^.dato.tipo < g.tipo) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (ant=act) then 
        l:= aux
    else 
        ant^.sig:= aux;
    aux^.sig:= act;
end;

procedure CargarVectorLista (var v: vector); //A
var
    g: gasto;
    i: integer;
begin
    InicializarVector(v); //para cada integrante se actualiza
    for i:=1 to dimf do begin
        LeerGasto(g);
        while (g.tipo <> 0) do begin
            InsertarOrdenado (v[i], g); //agrupados según el integrante
            LeerGasto(g);
        end;
    end;
end;

procedure ImprimirVectorListas(v: vector); //B
var
    i: integer;
begin
    for i:= 1 to dimf do begin
        writeln ('Lista ', i , ':');
        while (v[i] <> nil) do begin
            writeln('Tipo de gasto: ', v[i]^.dato.tipo);
            writeln('Monto gastado: ', v[i]^.dato.monto:0:2);
            v[i]:=v[i]^.sig;
        end;
    end;
end;

//C

procedure BuscarMinimo(var g: gasto; var v:vector); 
var
    i,pos:integer;
begin
    g.tipo:=999;
    for i:=1 to dimf do begin
        if (v[i] <> nil)then 
            if (v[i]^.dato.tipo < g.tipo) then begin
                g:=v[i]^.dato; //se guarda el registro completo
                pos:=i;
           end;
    end;
    if (g.tipo <> 999) then begin
        v[pos]:=v[pos]^.sig;
    end;
end;

procedure InsertarArbol (var abb:arbol; g2:gasto);
begin
    if (abb=nil) then begin
        new(abb);
        abb^.dato:=g2;
        abb^.HI:=nil;
        abb^.HD:=nil;
    end
    else
        if (abb^.dato.monto > g2.monto) then
            InsertarArbol (abb^.HI, g2)
        else
            InsertarArbol (abb^.HD, g2);
end;
{c) A partir de la estructura generada en a, realice un merge para obtener los montos totales gastados
por cada tipo de gasto. Genere un ABB con monto total y tipo de gasto, ordenado por monto total.}
procedure MergeAcumulador(var a: arbol; var v:vector);
var
    tipoActual:integer;
    totalgasto:real;
    g:gasto; //viejo
    g2:gasto; //nueva variable usando el mismo registro
begin
   BuscarMinimo(g,v);
   while (g.tipo <> 999)do begin
        totalgasto:=0;
        tipoActual:= g.tipo;
        while (tipoActual = g.tipo) do begin
            totalgasto:= totalgasto + g.monto;
            BuscarMinimo(g,v);
        end;
       g2.tipo:=tipoActual;
       g2.monto:=totalgasto;
       InsertarArbol(a, g2);
   end;
end;


Procedure enOrden (a : arbol); 
begin 
    if (a <> nil ) then begin 
        enOrden (a^.HI); 
        writeln ('Monto arbol: ', a^.dato.monto:0:2);
        writeln ('Tipo arbol: ', a^.dato.tipo); 
        enOrden (a^.HD); 
    end; 
end;

{busque e imprima el tipo de gasto con mayor monto total}
function Maximo (a:arbol): integer;
begin
    if (a = nil) then
		Maximo:= -1
	else
	if (a^.HD = nil) then
		Maximo:= a^.dato.tipo
	else
		Maximo:= Maximo(a^.HD); 
end;

//pp
var
    v: vector;
    a: arbol;
begin
    a:=nil; 
    CargarVectorLista(v);
    ImprimirVectorListas(v);
    MergeAcumulador(a,v);
    enOrden(a);
    writeln('El tipo de gasto con mayor monto total: ', Maximo(a));
    readln;
end.