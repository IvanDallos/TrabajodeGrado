function RelacionBanda(Tabla)
%Conversión de datos
%Separa los datos por banda en formato array
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
%%%Creación de vectores con los resultados
RhoP = [];
PvalP = [];

RhoK = [];
PvalK = [];

RhoS = [];
PvalS = [];

Strings =["hola"];

%Se agrupan todas las bandas en un arreglo de arreglos
%Ver interpretación de resultado para entender el indicativo de banda.
%Linea 110
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

%Explicación:
%Cada ciclo for corresponde al númerador o denominador de la fracción
%respectivamente. Por lo tanto se van a mezclar todas las bandas.
%Ejemplo B2/B2, B2/B3, B2/B4 ... B3/B2, B3/B3, B3/B4... Hasta B12/B12
for i=1:12
    for j=1:12
        Rela1 = Bandas(:,1,i)./Bandas(:,1,j); %Refiere a Bi/Bj
        [RhoPR1,PvalPR1,RhoSR1,PvalSR1,RhoKR1,PvalKR1]=CorrePKS(Rela1,DatoEmcali);
        %Se obtiene Todos los datos de correlación
        if abs(RhoPR1) > 0.5 %COndición de triunfo
            RhoP(end + 1) = RhoPR1; %Si triunfa se agrega al vector resultado respectivo
            PvalP(end + 1) = PvalPR1;
            RhoS(end + 1) = RhoSR1;
            PvalS(end + 1) = PvalSR1;
            RhoK(end + 1) = RhoKR1;
            PvalK(end + 1) = PvalKR1;
            Strings(end + 1) = int2str(i+1) + "" + int2str(j+1);
            %Se agrega al vector de strings las bandas correspondientes
        end
    end
end
Strings(1) = []; %Se borra el Hola temporal
Strings = str2double(Strings);%Los strings se convierten en números
%Con los datos adecuados se grafican los resultados
figure(1)
stem(Strings, RhoP, 'Color','#171EAD','Marker','*')
hold on
stem(Strings, RhoS, 'Color','#27CC4D','Marker','*')
hold on
stem(Strings, RhoK, 'Color','#CC0A00','Marker','*')
hold on
stem(Strings, PvalP, 'Color','#000000','Marker','.')
hold on
stem(Strings, PvalS, 'Color','#0B3B16','Marker','.')
hold on
stem(Strings, PvalK, 'Color','#7D0600','Marker','.')
hold on
legend('RhoP','RhoS', 'RhoK','PvalP','PvalS','PvalK','Location','southeast')
grid on
title("Busqueda Relación de Banda n=2")
ylabel("Rho-Pearson");
xlabel("Ubicación salida");

RhoPA = abs(RhoP);
RhoSA = abs(RhoS);
RhoKA = abs(RhoK);

%Por ultimo se muestra en consola los datos con mayor correlación
a = find(RhoPA == max(RhoPA));
a = a(1);
disp("Maximo Pearson= " + RhoP(a) + " en: " + Strings(a));

a = find(RhoSA == max(RhoSA));
a = a(1);
disp("Maximo Spearman= " + RhoS(a) + " en: " + Strings(a));

a = find(RhoKA == max(RhoKA));
a = a(1);
disp("Maximo Kendall= " + RhoK(a) + " en: " + Strings(a));

%Interpretación de resultado:
%El resultado por ejemplo puede dar:
%Maximo Pearson en:
%-0.91528 en: 25613125
%El número 25613125 corresponde al indicativo de banda mencionado al inicio, para
%este caso B2/B5 + B6/B13 + B12/5. La banda 13 corresponde a la banda B8A como
%caso especial. Y el -0.91528 al valor como tal de la correlación.


%%%%------------Se repite el proceso pero con 2 factores más----------------------------------
RhoP = [];
PvalP = [];

RhoK = [];
PvalK = [];

RhoS = [];
PvalS = [];

Strings =["hola"];
tic
for i=1:12
    for j=1:12
        for k=1:12
            for l=1:12
                Rela1 = Bandas(:,1,i)./Bandas(:,1,j) + Bandas(:,1,k)./Bandas(:,1,l);
                [RhoPR1,PvalPR1,RhoSR1,PvalSR1,RhoKR1,PvalKR1]=CorrePKS(Rela1,DatoEmcali);
                if abs(RhoPR1) > 0.6
                    RhoP(end + 1) = RhoPR1;
                    PvalP(end + 1) = PvalPR1;
                    RhoS(end + 1) = RhoSR1;
                    PvalS(end + 1) = PvalSR1;
                    RhoK(end + 1) = RhoKR1;
                    PvalK(end + 1) = PvalKR1;
                    Strings(end + 1) = int2str(i+1) + "" + int2str(j+1) +""+int2str(k+1) + "" + int2str(l+1);
                end
            end
        end
    end
end
toc
Strings(1) = [];
Strings = str2double(Strings);
figure(2)
stem(Strings, RhoP, 'Color','#171EAD','Marker','*')
hold on
stem(Strings, RhoS, 'Color','#27CC4D','Marker','*')
hold on
stem(Strings, RhoK, 'Color','#CC0A00','Marker','*')
hold on
stem(Strings, PvalP, 'Color','#000000','Marker','.')
hold on
stem(Strings, PvalS, 'Color','#0B3B16','Marker','.')
hold on
stem(Strings, PvalK, 'Color','#7D0600','Marker','.')
hold on
legend('RhoP','RhoS', 'RhoK','PvalP','PvalS','PvalK','Location','southeast')
grid on
title("Busqueda Relación de Banda n=4")
ylabel("Rho-Pearson");
xlabel("Ubicación salida");
% % StringsN';

RhoPA = abs(RhoP);
RhoSA = abs(RhoS);
RhoKA = abs(RhoK);

a = find(RhoPA == max(RhoPA));
a = a(1);
disp("Maximo Pearson= " + RhoP(a) + " en: " + Strings(a));

a = find(RhoSA == max(RhoSA));
a = a(1);
disp("Maximo Spearman= " + RhoS(a) + " en: " + Strings(a));

a = find(RhoKA == max(RhoKA));
a = a(1);
disp("Maximo Kendall= " + RhoK(a) + " en: " + Strings(a));
%%%%-------------------------------------------------------
%%%%----------------Se repite el proceso pero con 2 factores más--------------------
RhoP = [];
PvalP = [];

RhoK = [];
PvalK = [];

RhoS = [];
PvalS = [];

Strings =["hola"];
%Como esta sección toma mucho tiempo de procesamiento, no se toman TODOS
%los datos antes de obtener el triunfo, solo el necesario.
for i=1:12
    tic
    for j=1:12
        for k=1:12
            for l=1:12
                for m=1:12
                    for n=1:12
                        Rela1 = Bandas(:,1,i)./Bandas(:,1,j) + Bandas(:,1,k)./Bandas(:,1,l)+ Bandas(:,1,m)./Bandas(:,1,n);
                        [rhoP,~]=corr(Rela1,DatoEmcali,'type','pearson');
                        if abs(rhoP) > 0.8 
                            [RhoPR1,PvalPR1,RhoSR1,PvalSR1,RhoKR1,PvalKR1]=CorrePKS(Rela1,DatoEmcali);
                            RhoP(end + 1) = RhoPR1;
                            PvalP(end + 1) = PvalPR1;
                            RhoS(end + 1) = RhoSR1;
                            PvalS(end + 1) = PvalSR1;
                            RhoK(end + 1) = RhoKR1;
                            PvalK(end + 1) = PvalKR1;
                            Strings(end + 1) = int2str(i+1) + "" + int2str(j+1) +""+int2str(k+1) + "" + int2str(l+1)+""+int2str(m+1) + "" + int2str(n+1);
                        end
                    end
                end
            end
        end
    end
    toc
end


Strings(1) = [];
Strings = str2double(Strings);

figure(5)
stem(Strings, RhoP, 'Color','#171EAD','Marker','*')
hold on
stem(Strings, RhoS, 'Color','#27CC4D','Marker','*')
hold on
stem(Strings, RhoK, 'Color','#CC0A00','Marker','*')
hold on
stem(Strings, PvalP, 'Color','#000000','Marker','.')
hold on
stem(Strings, PvalS, 'Color','#0B3B16','Marker','.')
hold on
stem(Strings, PvalK, 'Color','#7D0600','Marker','.')
hold on
legend('RhoP','RhoS', 'RhoK','PvalP','PvalS','PvalK','Location','southeast')
grid on
title("Busqueda Relación de Banda n=6")
ylabel("Rho-Pearson");
xlabel("Ubicación salida");
% % StringsN';

RhoPA = abs(RhoP);
RhoSA = abs(RhoS);
RhoKA = abs(RhoK);

a = find(RhoPA == max(RhoPA));
a = a(1);
disp("Maximo Pearson en:")
disp(RhoP(a) + " en: " + Strings(a));

a = find(RhoSA == max(RhoSA));
a = a(1);
disp("Maximo Spearman en:")
disp(RhoS(a) + " en: " + Strings(a));

a = find(RhoKA == max(RhoKA));
a = a(1);
disp("Maximo Kendall en:")
disp(RhoK(a) + " en: " + Strings(a));
end