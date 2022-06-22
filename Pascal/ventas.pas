{Se lee información acerca de las ventas de productos realizadas en las 5 sucursales
de una empresa. Cada sucursal realizó a lo sumo 200 ventas. De cada venta se conoce el
código de producto, cantidad vendida y monto total de la venta. Las ventas de cada
sucursal se leen de manera consecutiva y ordenadas por código de producto. La lectura
por cada sucursal finaliza al completar las 200 ventas o cuando se lee el código de
producto -1, el cual no se procesa. Implementar un programa para que a partir de la
información leída, resuelva los siguientes ítems:

a)Utilizando la técnica de merge o merge acumulador según corresponda, generar una
lista que contenga la cantidad total vendida para cada código de producto, ordenada por
código de producto.

b)Realizar un módulo recursivo que reciba la lista generada en el punto a y retome la
cantidad de productos para los cuales la cantidad total vendida supera las 500 unidades.}
program ventas;
const
    dimfV=200;
    dimfS=5;
type
    venta= record
        codP: integer;
        cantV: integer;
        montoTotal: real;
    end;
    
    vectorV= array [1..dimfV] of venta;
    
    sucursal= record
        vector: vectorV;
        diml: integer;
        pos: integer;
    end;
    
    vectorS= array [1..dimfS] of sucursal;

    ventaLista= record
        cantTotal: real;
        codP: integer;
    end;
    
    lista = ^nodo;
    nodo = record
        dato:ventaLista;
        sig:lista;
    end;
    
procedure inicializarVector(var v2: vectorS);
var
	i: integer;
begin
	for i:= 1 to dimfS do begin
		v2[i].diml:=0;
		v2[i].pos:=1;
    end;
end;

procedure LeerVenta(var v:venta);
begin
    writeln('Ingrese el código: ');
    readln(v.codP);
    if (v.codP <> -1) then begin
        writeln('Ingrese la cantidad vendida: ');
        readln(v.cantV);
        writeln('Ingrese el monto total: ');
        readln(v.montoTotal);
    end;
end;   

procedure CargarVectorVentas(var v1: vectorV; var diml: integer);
var
    v:venta;
begin
    LeerVenta(v);
    while (diml < dimfV) and (v.codP <> -1) do begin
        diml:=diml+1;
        v1[diml]:=v; //v1= vector de ventas
        LeerVenta(v);
    end;
end;

procedure CargarVectorSucursal(var v2:vectorS);
var
    i:integer;
begin
    for i:=1 to dimfS do 
        CargarVectorVentas(v2[i].vector, v2[i].diml); //en cada pos carga las ventas
end; 

{----------------A----------------}
procedure AgregarAtras (var l,ult:lista; vent2: ventaLista);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=vent2;
	nue^.sig:=nil;
	if (l=nil) then 
		l:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;

procedure minimo (v2: vectorS; var minCod: integer; var minMonto:real);
var
	indiceMin,i:integer;
begin
	minCod:=9999;
	indiceMin:=-1;//me va a decir si encontrÃ© un min
	for i:=1 to 5 do begin	
		if (v2[i].pos <= v2[i].diml) then begin
			if (minCod < v2[i].vector[v2[i].pos].codP) then begin //accedo al vector de ventas por el campo de sucursal
				minCod:=v2[i].vector[v2[i].pos].codP;
				indiceMin:=i; 
				minMonto:=v2[i].vector[v2[i].pos].montoTotal;
			end;			
		end;
	end;
	if (indiceMin <> -1) then begin
		v2[indiceMin].pos:=v2[indiceMin].pos+1;
	end;
end;


procedure MergeAcumulador (v2: vectorS; var l: lista); 
var 
	ult: lista;
	minCod,actual: integer;
	minMonto,SumaTotal: real;
	vent2: ventaLista;
begin
	ult:=nil;
	minimo(v2,minCod,minMonto);
	while (minCod <> 9999) do begin
		actual:=minCod;
		SumaTotal:=0;
		while (minCod=actual) do begin
		    SumaTotal:=SumaTotal + minMonto;
		    minimo(v2,minCod,minMonto);
		end;
	vent2.cantTotal:=SumaTotal;
	vent2.codP:=actual;
	AgregarAtras(l,ult,vent2);
	end;
end;

procedure ImprimirListaMerge (l:lista);
begin
    while (l <> nil) do begin
        WriteLn('Codigo: ', l^.dato.codP);
        WriteLn('Total: ', l^.dato.cantTotal:0:2);
        l:=l^.sig;    
    end;
end;
{----------------B----------------}
function CantidadProductos (l:lista):integer;
begin
	if (l=nil) then 
		CantidadProductos:=0
	else 
		if (l^.dato.cantTotal > 500) then
			CantidadProductos:=CantidadProductos(l^.sig) + 1
		else
			CantidadProductos:=CantidadProductos(l^.sig);
end;

//pp
var
    v1: vectorV;
    v2: vectorS;
    l: lista;
begin
    l:=nil;
    inicializarVector(v2);
    CargarVectorSucursal(v2);
    MergeAcumulador(v2,l);
    writeln('Lista Merge: ');
    ImprimirListaMerge(l);
    writeln('Cantidad de productos: ', CantidadProductos(l));
end.
