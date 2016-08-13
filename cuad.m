%datos
%x=[0.242,0.1942,0.1497,0.1109,0.0790,0.54];
%y=[1,1.2,1.4,1.6,1.8,2];
x=[1930,1940,1950,1960,1970];
y=[16552722,19653552,25791017,34923129,48225238];
%x=[0.5,1,2,4,8,12];
%y=[160,120,94,75,62,56];
n=5;
disp(x);
disp(y);
for i=1:n
logx(i)=log10(x(i));
end

for i=1:n
logy(i)=log10(y(i));
end

disp(logx);
disp(logy);
%----------------------------------------------------------------graficando
subplot(1,3,1)
plot(x,logy)
title("1.- x, log y")
subplot(1,3,2)
plot(logx,y)
title("2.- log x, y")
subplot(1,3,3)
plot(logx,logy)
title("3.- log x, log y")
opc=input("Elige la opcion mas recta: ");
%----------------------------------------------sumatorias para el polinomio lineal
if opc==1
	%x,logy
	%x=x y=logy
	sumax=0;
	sumay=0;
	sumaxx=0;
	sumaxy=0;
	%sumatoria de x
	for i=1:n
	sumax=sumax+x(i);
	end
	%sumatoria de Y
	for i=1:n
	sumay=sumay+logy(i);
	end
	%sumatoria de X2
	for i=1:n
	xx(i)=x(i)*x(i);
	end
	for i=1:n
	sumaxx=sumaxx+xx(i);
	end
	%sumatoria de XY
	for i=1:n
	xy(i)=x(i)*logy(i);
	end
	for i=1:n
	sumaxy=sumaxy+xy(i);
	end

elseif opc==2
	%logx,y
	%x=logx y=y
	sumax=0;
	sumay=0;
	sumaxx=0;
	sumaxy=0;
	for i=1:n
	sumax=sumax+logx(i);
	end
	for i=1:n
	sumay=sumay+y(i);
	end
	%sumatoria de X2
	for i=1:n
	xx(i)=logx(i)*logx(i);
	end
	for i=1:n
	sumaxx=sumaxx+xx(i);
	end
	%sumatoria de XY
	for i=1:n
	xy(i)=logx(i)*y(i);
	end
	for i=1:n
	sumaxy=sumaxy+xy(i);
	end

elseif opc==3
	%logx,logy
	%x=logx, y=logy
	sumax=0;
	sumay=0;
	sumaxx=0;
	sumaxy=0;
	for i=1:n
	sumax=sumax+logx(i);
	end
	for i=1:n
	sumay=sumay+logy(i);
	end%sumatoria de X2
	for i=1:n
	xx(i)=logx(i)*logx(i);
	end
	for i=1:n
	sumaxx=sumaxx+xx(i);
	end
	%sumatoria de XY
	for i=1:n
	xy(i)=logx(i)*logy(i);
	end
	for i=1:n
	sumaxy=sumaxy+xy(i);
	end
end

%obteniendo las últimas sumatorias en X2 y XY
disp("valores registrados");
disp(x)
disp(y)
disp(logx);
disp(logy);
disp("valores finales");
disp(sumax);
disp(sumay);
disp(sumaxx);
disp(sumaxy);
%armando el polinomio lineal
poli=zeros(3);
poli(1,1)=sumaxx;
poli(1,2)=sumax;
poli(2,1)=sumax;
poli(2,2)=n;
poli(1,3)=sumaxy;
poli(2,3)=sumay;
disp(poli);
disp(rref(poli));
sol=rref(poli);
%eligiendo modelo---------------------------
%opc==1
%opc==3 logx,logy
disp("a0 es");
disp(sol(2,3));
disp("a1 es");
disp(sol(1,3))

if opc==3
alpha=10^(sol(2,3));
be=sol(1,3);
%haciendo el modelo...........................
modelo=['el modelo es Y=',num2str(alpha),'*','X^',num2str(be)];

disp(modelo);
ppx=input("Dame un numero a interpolar: ");
yppx=alpha*(ppx^be);
modelo=['La solucion al punto de interpolacion X:',num2str(ppx)," es Y=", num2str(yppx) ];
disp(modelo);
end

n=input("teclea para terminar");