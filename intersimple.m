%ingresar datos a analizar-------------------------------------------

clear;clc;

disp('metodos numericos');

disp('INTERPOLACION SIMPLE');

n=input("Cuantos pares de datos va a ingresar:");

disp('ingrese los puntos');

for i=1:n

    fprintf('x%.0f=',i);

    x(i)=input(' ');

    fprintf('y%.0f=',i);

    y(i)=input(' ');

end


disp("----------polinomio de grado----------------");
disp(n-1);

%pedir el punto a interpolar------------------------------------

ppx=input("Dame el punto a interpolar: ");


matriz=zeros(n+1);

%haciendo la matriz para interpolar------------------
u=2;
for i=1:n
	
	for j=1:n+1
		if j==1 %si es la primera colunma entonces
		matriz(i,j)=1;
		

		elseif j==n+1 %si es la ultima
		matriz(i,j)=y(i);
		
		elseif j==2 %si es la segunda es la misma que el arregloX
		matriz(i,j)=x(i);

		else
		matriz(i,j)=x(i)^u;
		u++;

		end

end

u=2;

end

disp(matriz);

polinomio=rref(matriz);

disp("Solucionando el sistema");

disp(polinomio);


%armar el polinomio----------------------------------------------

v=1;
for i=1:n
	if i==1
	sol(i)=polinomio(i,n+1);
		else
		sol(i)=polinomio(i,n+1)*(ppx^v);
		v++;
	end
end

disp("Polinomio");
disp(sol);

%--------------------------------------sumar todo el polinomio babe

resultado=0;

for r=1:n

	resultado=resultado+sol(r);

end

disp("El resultado final del punto de interpolacion: ");
disp(ppx);
disp("Es: ");
disp(resultado);

n=input("Teclea para terminar el proceso");
