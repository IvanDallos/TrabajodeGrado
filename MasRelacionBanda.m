function MasRelacionBanda(Tabla,Actual)
%Conversión de datos
%Separa los datos por banda en formato array
disp("Inicio MasRelacionBanda---------------------")
fechadatos=Tabla(:,1); fechadatos=table2array(fechadatos);
B1=Tabla(:,2);  B1=table2array(B1);
B2=Tabla(:,3);  B2=table2array(B2);
B3=Tabla(:,4);  B3=table2array(B3);
B4=Tabla(:,5);  B4=table2array(B4);
B5=Tabla(:,6);  B5=table2array(B5);
B6=Tabla(:,7);  B6=table2array(B6);
B7=Tabla(:,8);  B7=table2array(B7);
B8=Tabla(:,9);  B8=table2array(B8);
B8A=Tabla(:,10);  B8A=table2array(B8A);
B9=Tabla(:,11);  B9=table2array(B9);
B10=Tabla(:,12);  B10=table2array(B10);
B11=Tabla(:,13);  B11=table2array(B11);
B12=Tabla(:,14);  B12=table2array(B12);
DatoEmcali=Tabla(:,15);  DatoEmcali=table2array(DatoEmcali);

close all
%Para este codigo solo se evalua el RhoPearson y su Pval
Pers = [];
Pvals = [];
Strings =["hola"];

Bandas(:,:,1) = B2;%Indicativo de banda -> 2
Bandas(:,:,2) = B3;%Indicativo de banda -> 3
Bandas(:,:,3) = B4;%Indicativo de banda -> 4
Bandas(:,:,4) = B5;%Indicativo de banda -> 5
Bandas(:,:,5) = B6;%Indicativo de banda -> 6
Bandas(:,:,6) = B7;%Indicativo de banda -> 7
Bandas(:,:,7) = B8;%Indicativo de banda -> 8
Bandas(:,:,8) = B9;%Indicativo de banda -> 9
Bandas(:,:,9) = B10;%Indicativo de banda -> 10
Bandas(:,:,10) = B11;%Indicativo de banda -> 11
Bandas(:,:,11) = B12;%Indicativo de banda -> 12
Bandas(:,:,12) = B8A;%Indicativo de banda -> 13

Rela1 = Actual;

%Explicación: Utiliza el mismo principio de RelacionBanda, solo que tiene
%un termino constante que es Actual. Actual como su nombre lo indica tiene
%la realción ya encontrada. El codigo no permite que actual se actualise
%sino las bandas que se le añaden
for i=1:12
    for j=1:12
        for k=1:12
            for l=1:12
                Rela1 = Rela1 + Bandas(:,1,i)./Bandas(:,1,j) + Bandas(:,1,k)./Bandas(:,1,l);
                [PerR1,PvalR1,~,~,~,~]= CorrePKS(Rela1,DatoEmcali);
                if abs(PerR1) > 0.8
                    Pers(end + 1) = abs(PerR1);
                    Pvals(end + 1) = PvalR1;
                    Strings(end + 1) = int2str(i+1) + "" + int2str(j+1) +""+int2str(k+1) + "" + int2str(l+1);
                end
                Rela1 = Actual; %Vuelve a la versión actual
            end
        end
    end
end
Strings(1) = [];
Strings = str2double(Strings);
figure(10)
stem(Strings, Pers, 'B')
hold on
stem(Strings, Pvals, 'K')
hold on
grid on
title("Más Relaciones de Banda")
ylabel("Rho-Pearson");
xlabel("Ubicación salida");

 a = find(Pers == max(Pers));
 a = a(1);
 disp("Maximo = " + max(Pers) + " en: " + Strings(a));
 
 
 disp("Fin MasRelacionBanda---------------------")
end