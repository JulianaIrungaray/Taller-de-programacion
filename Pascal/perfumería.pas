{Ejercicio 3. Una perfumería dispone en papel de la información de las ventas de sus productos. De 
cada venta conoce: código de producto, tipo de producto, fecha, cantidad de unidades vendida y 
monto.
Se pide realizar un programa que:
a) A partir de la información de ventas ingresadas por teclado, genere un ABB que almacene para 
cada código de producto: su tipo, la cantidad total de unidades vendidas y el monto total vendido 
(entre todas las ventas realizadas). El ABB debe ordenarse por código de producto. El ingreso de 
información finaliza cuando se lee cantidad vendida 0.
b) Luego de generado el ABB, informar (implementar un módulo para cada inciso):
 i - El tipo de los productos cuyo código está comprendido entre los valores 1500 y 2200.
 ii – La cantidad de productos con monto total vendido comprendido entre 10000 y 50000}
 
 program Ejercicio3;
 type
	venta=record
		codigoProducto:integer;
		tipo:string;
		fecha:integer;
		cantidadVendida:integer;
		monto:real;
	end;
	
	abb=^nodoA;
	
	nodoA=record
		dato:venta;
		HI:abb;
		HD:abb;	
	end;
	
procedure LeerRegistroVenta (var v: venta);
begin
	writeln('Ingrese cantidad vendida');
	readln(v.cantidadVendida);
	if(v.cantidadVendida <> 0) then begin
	writeln('Ingrese codigo de producto');
	readln(v.codigoProducto);
	writeln('Ingrese tipo ');
	readln(v.tipo);
	writeln('Ingrese fecha ');
	readln(v.fecha);
	writeln('Ingrese monto ');
	readln(v.monto);
	end;
end;



procedure InsertarArbol (var abb:abb; v:venta);
begin
    if (abb=nil) then begin
        new(abb);
        abb^.dato:=v;
        abb^.HI:=nil;
        abb^.HD:=nil;
    end
    else
        if (abb^.dato.codigoProducto > v.codigoProducto) then
            InsertarArbol (abb^.HI, v)
        else
           if(abb^.dato.codigoProducto < v.codigoProducto) then
             InsertarArbol (abb^.HD, v)
		   else begin
				abb^.dato.cantidadVendida:=  abb^.dato.cantidadVendida  + v.cantidadVendida;
				abb^.dato.monto:=  abb^.dato.monto  + v.monto;
		    end;
end;

procedure crear (var a:abb);
var
   v:venta;
Begin
   LeerRegistroVenta(v);
   while (v.cantidadVendida <>0) do begin  
        InsertarArbol(a, v);
       LeerRegistroVenta(v); 
   end;
end; 

procedure enorden (a:abb);
begin
      if (a <> nil) then begin
            enorden(a^.HI);
            writeln(a^.dato.cantidadVendida);   {imprime de menor a mayor los datos}
            writeln(a^.dato.tipo);
            writeln(a^.dato.monto:0:2);
            writeln(a^.dato.codigoProducto);
            enorden(a^.HD);
            end;
end;  

{ i - El tipo de los productos cuyo código está comprendido entre los valores 1500 y 2200.}

procedure RangoCodigoProducto (a:abb; valor1,valor2:integer; var cantProductos: integer);
begin
    if(a<>nil)then begin
        if(a^.dato.codigoProducto>=valor1) then begin
          if(a^.dato.codigoProducto<=valor2) then begin
              cantProductos:= cantProductos + 1;
             RangoCodigoProducto(a^.HI,valor1,valor2, cantProductos);
             RangoCodigoProducto(a^.HD,valor1,valor2, cantProductos);
          end
          else
             RangoCodigoProducto(a^.HI,valor1,valor2, cantProductos)
        end
        else
             RangoCodigoProducto(a^.HD,valor1,valor2, cantProductos)
    end;
end;

{ii – La cantidad de productos con monto total vendido comprendido entre 10000 y 50000}

procedure RangoMonto (a:abb; valor1,valor2:integer; var cantProductos: integer);
begin
    if(a<>nil)then begin
        if(a^.dato.monto>=valor1) then begin
          if(a^.dato.monto<=valor2) then begin
             cantProductos:= cantProductos + 1;
             RangoMonto(a^.HI,valor1,valor2, cantProductos);
             RangoMonto(a^.HD,valor1,valor2, cantProductos);
          end
          else begin
             RangoMonto(a^.HD,valor1,valor2, cantProductos);
             RangoMonto(a^.HI,valor1,valor2, cantProductos);
          end;
        end
        else begin
             RangoMonto(a^.HD,valor1,valor2, cantProductos);
             RangoMonto(a^.HI,valor1,valor2, cantProductos);
        end;
    end;
end;


var
    a:abb;
    cantProductos:integer;
    cantProductos2:integer;
    valor1, valor2, valor1M, valor2M:integer;
begin
    cantProductos:=0;
    cantProductos2:=0;
    a:=nil;
    crear(a);
    enorden(a);
    valor1:=1500;
    valor2:=2200;
    valor1M:=10000;
    valor2M:=20000;
    RangoCodigoProducto(a,valor1,valor2, cantProductos);
    RangoMonto(a,valor1M,valor2M, cantProductos2);
    writeln('La cantidad de participantes entre el ',valor1, ' y ', valor2, ' son:',cantProductos);
    writeln('La cantidad de participantes entre el ',valor1M, ' y ', valor2M, ' son:',cantProductos2);
end.
