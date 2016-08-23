%ingresar datos a analizar

clear;clc;

disp('metodos numericos');

bb=input('dame un punto de interpolacion: ');

n=input('ingrese el numero de datos n=');

disp('ingrese los puntos');

	for i=1:n

	    fprintf('x%.0f=',i-1);

	    x(i)=input(' ');

	    fprintf('y%.0f=',i-1);

	    y(i)=input(' ');

	end

%haciendo la matriz adelantada

%declarando los espacios de la matriz
	matriz=zeros(n);


%llenar primera fila y primera colunma de la matriz

for k=1:1
for a=1:n
matriz(a,k)=y(a);
end
end

%llenar demás filas

p=n;
q=2;%sustituto de k

for k=2:n %recorrer filas
	
	for a=2:n %recorrer columnas

		if a==k
		matriz(a,k)=matriz(a,k-1)-matriz(a-1,k-1);

		elseif a>k
		matriz(a,k)=matriz(a,k-1)-matriz(a-1,k-1);

		else 
		matriz(a,k)=0;
		end
	end

end

disp(matriz);


%hallando los valores del punto de interpolación

%calcular h

h=x(2)-x(1);

%ubicar el punto de interpolacion bb

a=1;

while a<=n 
	
	if x(a)<bb
		if x(a+1) >bb
		

		lim=x(a);
		ref=a;

		
		end
	end
a++;

end

disp("Valor inicial Ref=");
disp(ref);

disp("limite:");
disp(lim);

%k referencia
disp("referencia:");
refk=(bb-lim)/h ;

disp(refk);

%hacer polinomio............................................................

%ref es la posicion del limite

%guaradr los numeros de la diagonal que vamos a usar
tam=(n-ref)+1; %cantidad de espacios del vector elementos

for u=1:tam

elem(u)=matriz(ref,u);
ref=ref+1;

end 


disp(elem);

disp(u);%nuevo valor de referencia, tamanio del polinonio

%hacer el polinomio enserio.................................................


for v=1:u
	
	if v==1
		%para el elemento 1
		poli(v)=elem(v);
	elseif v==2
		%para el elemento 2
		poli(v)=elem(v)*refk;
	else	
		%para el elemento tercero en adelante

		%factorial, denominador ok............................
		deno=1;
		for m=1:v-1
		deno=deno*m;		
		end

		%numerador............................................
		%aqui voy a armar solo la multiplicacion del valor refk menos uno...menos dos...menos tres		
		key=1
		for s=1:v-2
		mul=refk-s;
		key=key*mul;	
		end

		%haciendo el numerador
		nume=refk*key*elem(v);

		
		%haciendo el valor entero del polinomio................
		poli(v)=nume/deno;		
		
	end


end

disp(poli);

%--------------------------------------sumar todo el polinomio babe

resultado=0;

for r=1:u

	resultado=resultado+poli(r);

end

disp("--------------------------------------------------");
disp("EL RESULTADO DEL POLINOMIO PARA EL PUNTO A INTERPOLAR: ");
disp(bb);
disp("es:");
disp(resultado);

s=input("teclea para salir------------------");











