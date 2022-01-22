function AnalisisCodigo4(Reporte,ano)
close all
[a,b,c]=AnalisisReportes(Reporte);

% % a;      %%Fecha
% % b;     %%Afectados
% % c;     %%Horas

datosB=b;
datosC=c;
fechadatos=a;

s=0;        %%para la acumulación B
sc=0;       %%para la acumulación C
s1=0;       %%Para las veces (conteo)
p1=1;       %%Para datos en Y pero con el nuevo vector fecha

for i=2:length(fechadatos)
    
    if(fechadatos(i)==fechadatos(i-1))
        s=datosB(i-1)+s;
        sc=datosC(i-1)+sc;
        s1=s1+1;
    else
        fechanueva(p1)=fechadatos(i-1);
        ynuevoB(p1)=datosB(i-1)+s;
        ynuevoC(p1)=datosC(i-1)+sc;
        yveces(p1)=s1+1;
        p1=p1+1;
        s=0;
        sc=0;
        s1=0;
    end
end

FechaVerdadera = datetime([ano,01,01]) + caldays(0:364);
DatosVerdaderosB=zeros(1,length(FechaVerdadera));
DatosVerdaderosC=zeros(1,length(FechaVerdadera));
DatosVeces=zeros(1,length(FechaVerdadera));

for i=1:length(FechaVerdadera)
   if(isempty(find(fechanueva==FechaVerdadera(i), 1)))
       DatosVerdaderosB(i)=0;
       DatosVerdaderosC(i)=0;
       DatosVeces(i)=0;
   else
       DatosVerdaderosB(i)=ynuevoB(fechanueva==FechaVerdadera(i));
       DatosVerdaderosC(i)=ynuevoC(fechanueva==FechaVerdadera(i));
       DatosVeces(i)=yveces(fechanueva==FechaVerdadera(i));
   end

end

%%%--------------------------------------------
figure(5)
stem(FechaVerdadera,DatosVerdaderosB)
title("Fecha vs Cantidad de Suscriptores Afectados en Codigo 4");
xlabel("Fecha");
ylabel("Cantidad");
grid on

figure(6)
stem(FechaVerdadera,DatosVerdaderosC)
title("Fecha vs Cantidad de Horas de Afección en Codigo 4");
xlabel("Fecha");
ylabel("Cantidad");
grid on

figure(7)
stem(FechaVerdadera,DatosVeces)
title("Fecha vs Conteo de veces en Codigo 4");
xlabel("Fecha");
ylabel("Veces");
grid on
end











