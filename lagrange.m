%ingresar datos a analizar-------------------------------------------

clear;clc;

disp('metodos numericos');

disp('INTERPOLACION DE LAGRANGE');

n=4;

disp('ingrese los puntos');

for i=1:n

    fprintf('x%.0f=',i);

    x(i)=input(' ');

    fprintf('y%.0f=',i);

    y(i)=input(' ');

end


disp("----------polinomio de 3° grado----------------");

%pedir el punto a interpolar------------------------------------

ppx=input("Dame el punto a interpolar: ");

%construir el polinomio de lagrange-----------------------------

%primero buscar el intervalo del punto a interpolar ppx y obtener el pivote--------------
a=1;

if ppx<x(1)
	ref=1;
	ref2=2;
	ref3=3;
	
elseif ppx>x(4)
	ref=4;
	ref2=3;
	ref3=2;

	else
		while a<=n 
	
			if x(a)<=ppx
				if x(a+1) >ppx
				ref=a;
				ref2=a+1;
				ref3=a-1;
				end
			end
		a++;

		end
		
end



%obteniendo los otros dos pivotes
disp("Pivotes:----pivote1,2,3");
disp(ref);
disp(ref2);
disp(ref3);

%----------------------------------------------haciendo el polinomio

den(1)= (x(ref)-x(ref2) ) * (x(ref)-x(ref3) );

mul(1)= y(ref) *(ppx-x(ref2) ) * (ppx-x(ref3) );

poli(1)= mul(1)/den(1);


den(2)= (x(ref2)-x(ref) ) * (x(ref2)-x(ref3) );

mul(2)= y(ref2) *(ppx-x(ref) ) * (ppx-x(ref3) );

poli(2)= mul(2)/den(2);


den(3)= (x(ref3)-x(ref2) ) * (x(ref3)-x(ref) );

mul(3)= y(ref3) *(ppx-x(ref2) ) * (ppx-x(ref) );

poli(3)= mul(3)/den(3);


%--------------------------------------sumar todo el polinomio babe

resultado=0;

for r=1:3

	resultado=resultado+poli(r);

end

disp("EL RESULTADO DE INTEPOLAR EL VALOR DE: ");
disp(ppx);
disp("Es..:");
disp(resultado);
n=input("teclea para terminar");
