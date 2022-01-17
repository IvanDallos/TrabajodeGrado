function CTERelacionBanda(Tabla, R1R2, R3R4, R5R6, R7R8, R9R10)
disp("Inicio CTERelacionBanda---------------------")
fechadatos=Tabla(:,1); fechadatos=table2array(fechadatos);
DatoEmcali=Tabla(:,15);  DatoEmcali=table2array(DatoEmcali);

Pers = [];
Pvals = [];
Strings =["hola"];
a = [0.25 0.5 0.75 1 1.5 1.75 2 2.5 3 ];
%Indicativos de la CTE:
%1  ->  0.25
%2  ->  0.5
%3  ->  0.75
%4  ->  1
%5  ->  1.5
%6  ->  1.75
%7  ->  2
%8  ->  2.5
%9  ->  3

%Explicación: Utiliza el mismo principio de RelacionBanda, solo que ahora
%cada subrelacion (R1R2,R3R4...) es multiplicada por una constante definida
%por el vector a. La condición de parada determinará las correlaciones más
%altas
for i=1:length(a)
    for j=1:length(a)
        for k=1:length(a)
            for l=1:length(a)
                for m=1:length(a)
                    Rela1 = a(i).*R1R2 + a(j).*R3R4 + a(k).*R5R6 + a(l).*R7R8 + a(m).*R9R10;
                    [PerR1,PvalR1,~,~,~,~]= CorrePKS(Rela1,DatoEmcali);
                    if abs(PerR1) > 0.8
                        Pers(end + 1) = PerR1;
                        Pvals(end + 1) = PvalR1;
                        Strings(end + 1) = num2str(i) + "" + num2str(j)+"" + num2str(k)+"" + num2str(l)+"" + num2str(m);
                    end
                end
            end
        end
    end
end


            
Strings(1) = [];
Strings = str2double(Strings);
Pers = abs(Pers);
Pvals = abs(Pvals);
figure(8)
stem( Strings,Pers, 'B')
hold on
stem(Strings, Pvals, 'K')
hold on
grid on
title("CTE constantes")
ylabel("Rho-Pearson");
xlabel("Ubicación salida");

 a = find(Pers == max(Pers));
 a = a(1);
 disp("Maximo = " + max(Pers) + " en: " + Strings(a));
 disp("Fin CTERelacionBanda---------------------")
 
 %Interpretación de resultado:
%El resultado por ejemplo puede dar:
%Maximo = 0.91817 en: 65486
%El número 65486 corresponde al indicativo de CTE mencionado al inicio, para
%este caso las constantes son: (1.75, 1.5, 1,2.5,1.75). 
%El resultado final será 1.75.*(R1R2) + 1.5.*(R3R4)+ (R5R6)+ 2.5.*(R7R8)+ 1.75.*(R9R10);
end