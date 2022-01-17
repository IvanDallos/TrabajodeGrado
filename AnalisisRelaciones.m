function AnalisisRelaciones(Tabla)
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
%CTERelacionBanda y MasRelacionBanda deben ser llamados desde aqui, no son
%scripts independientes.

%CTERelacionBanda(Tabla,(B2./B5) ,(B9./B2) , (B4./B5),(B3./B8) ,(B11./B5))
%MasRelacionBanda(Tabla,(B2./B5) + (B9./B2)+ (B4./B5));

%Se tienen hasta 9 tipos de relación para poder comparar en la figura 2
Rela1 = 1.75.*(B2./B5) + 1.75.*(B6./B8A)+ 1.5.*(B12./B5);
Rela2= (B2./B5) + (B9./B2)+ (B4./B5);
Rela3 = (B2./B5) + (B9./B2)+ (B4./B5)+ (B3./B8)+ (B11./B5);
Rela4 = (B5./B3) + (B7./B8)+ (B7./B6);
Rela5 = (B7./B6) + (B7./B8)+ (B5./B3);
Rela6 = (B7./B6) + (B7./B8)+ (B5./B3);
Rela7 = (B7./B6) + (B7./B8)+ (B5./B3);
Rela8 = (B7./B6) + (B7./B8)+ (B5./B3);
Rela9 = (B7./B6) + (B7./B8)+ (B5./B3);

Prediccion = -513.86*Rela1 + 2324.4;

%Aqui se obtienen todos los datos de estas 9 relaciones.
[RhoPR1,PvalPR1,RhoSR1,PvalSR1,RhoKR1,PvalKR1]=CorrePKS(Rela1,DatoEmcali);
[RhoPR2,PvalPR2,RhoSR2,PvalSR2,RhoKR2,PvalKR2]=CorrePKS(Rela2,DatoEmcali);
[RhoPR3,PvalPR3,RhoSR3,PvalSR3,RhoKR3,PvalKR3]=CorrePKS(Rela3,DatoEmcali);
[RhoPR4,PvalPR4,RhoSR4,PvalSR4,RhoKR4,PvalKR4]=CorrePKS(Rela4,DatoEmcali);
[RhoPR5,PvalPR5,RhoSR5,PvalSR5,RhoKR5,PvalKR5]=CorrePKS(Rela5,DatoEmcali);
[RhoPR6,PvalPR6,RhoSR6,PvalSR6,RhoKR6,PvalKR6]=CorrePKS(Rela6,DatoEmcali);
[RhoPR7,PvalPR7,RhoSR7,PvalSR7,RhoKR7,PvalKR7]=CorrePKS(Rela7,DatoEmcali);
[RhoPR8,PvalPR8,RhoSR8,PvalSR8,RhoKR8,PvalKR8]=CorrePKS(Rela8,DatoEmcali);
[RhoPR9,PvalPR9,RhoSR9,PvalSR9,RhoKR9,PvalKR9]=CorrePKS(Rela9,DatoEmcali);

%Aqui se adjuntan a un solo arreglo según el rho y el pval correspondiente
RhosP = [RhoPR1 RhoPR2 RhoPR3 RhoPR4 RhoPR5 RhoPR6 RhoPR7 RhoPR8 RhoPR9];
RhosS = [RhoSR1 RhoSR2 RhoSR3 RhoSR4 RhoSR5 RhoSR6 RhoSR7 RhoSR8 RhoSR9];
RhosK = [RhoKR1 RhoKR2 RhoKR3 RhoKR4 RhoKR5 RhoKR6 RhoKR7 RhoKR8 RhoKR9];

PvalsP = [PvalPR1 PvalPR2 PvalPR3 PvalPR4 PvalPR5 PvalPR6 PvalPR7 PvalPR8 PvalPR9];
PvalsS = [PvalSR1 PvalSR2 PvalSR3 PvalSR4 PvalSR5 PvalSR6 PvalSR7 PvalSR8 PvalSR9];
PvalsK = [PvalKR1 PvalKR2 PvalKR3 PvalKR4 PvalKR5 PvalKR6 PvalKR7 PvalKR8 PvalKR9];

RhosP = abs(RhosP);
RhosS = abs(RhosS);
RhosK = abs(RhosK);


%%-------------------------------------------------
%%:::::::::::::::::::::::::::::::::::::::::::::::::
%La figura 1 indica un sccater plot de cada relación para observar un poco
%su linealidad.
figure(1)
subplot(3,3,1)
scatter(Rela1,DatoEmcali)
title("Rela1 - EmCali");
grid on

subplot(3,3,2)
scatter(Rela2,DatoEmcali)
title("Rela2 - EmCali");
grid on

subplot(3,3,3)
scatter(Rela3,DatoEmcali)
title("Rela3 - EmCali");
grid on

subplot(3,3,4)
scatter(Rela4,DatoEmcali)
title("Rela4 - EmCali");
grid on

subplot(3,3,5)
scatter(Rela5,DatoEmcali)
title("Rela5 - EmCali");
grid on

subplot(3,3,6)
scatter(Rela6,DatoEmcali)
title("Rela6 - EmCali");
grid on

subplot(3,3,7)
scatter(Rela7,DatoEmcali)
title("Rela7 - EmCali");
grid on

subplot(3,3,8)
scatter(Rela8,DatoEmcali)
title("Rela8 - EmCali");
grid on

subplot(3,3,9)
scatter(Rela9,DatoEmcali)
title("Rela9 - EmCali");
grid on
%%:::::::::::::::::::::::::::::::::::::::::::::::::::::::
%%%-------------------------------------------------------




yline = [RhoPR1 RhoPR1 RhoPR1 RhoPR1 RhoPR1 RhoPR1 RhoPR1 RhoPR1 RhoPR1];
yline =abs(yline);

%%-------------------------------------------------
%%:::::::::::::::::::::::::::::::::::::::::::::::::
%La figura 2 indica la comparación de las relaciones dadas. Pueden haber
%hasta 9 comparaciones, siendo la primera (Rela1) la más importante, ya que
%tiene un tope para superar.
figure(2)
plot((1:9),yline)
hold on
stem(RhosP, 'Color','#171EAD');
hold on
stem(RhosS, 'Color','#27CC4D');
hold on
stem(RhosK, 'Color','#CC0A00');
hold on
stem(PvalsP, 'Color','#000000','Marker','.');
grid on
stem(PvalsS, 'Color','#0B3B16','Marker','*');
grid on
stem(PvalsK, 'Color','#7D0600','Marker','+');
grid on
title("Coeficientes de correlación")
xticklabels({'Rela1','Rela2','Rela3','Rela4','Rela5','Rela6','Rela7','Rela8','Rela9'});
legend('Max','RhoP','RhoS', 'RhoK','PvalP','PvalS','PvalK','Location','southeast')
ylabel("Valor");
%%:::::::::::::::::::::::::::::::::::::::::::::::::::::::
%%%-------------------------------------------------------
% polyfit(Rela1,DatoEmcali,1);


%%-------------------------------------------------
%%:::::::::::::::::::::::::::::::::::::::::::::::::
%La figura 3 nos indica la predicción realizada según la ecuación obtenida
%de la variable predicción y la relación1. La variable predicción se
%obtiene del excel de la base de datos.
figure(3)
plot(fechadatos, Prediccion, 'R','Marker','.');
hold on
plot(fechadatos, DatoEmcali, 'B','Marker','.');
grid on
legend('Prediccion','DatoReal')
xlabel("Fecha");
ylabel("Turbidez");
title("Comparación grafica real con predicción")
%%:::::::::::::::::::::::::::::::::::::::::::::::::::::::
%%%-------------------------------------------------------


[rho,pval]=corr(DatoEmcali,Prediccion,'type','kendall');
disp("Prediccion Datos: kendall")
disp("rho: " + rho);
disp("pval: " + pval);
disp("  ");
[rho,pval]=corr(DatoEmcali,Prediccion,'type','spearman');
disp("Prediccion Datos: spearman")
disp("rho: " + rho);
disp("pval: " + pval);
disp("  ");
[rho,pval]=corr(DatoEmcali,Prediccion,'type','pearson');
disp("Prediccion Datos: pearson")
disp("rho: " + rho);
disp("pval: " + pval);
disp("  ");

rmse = sqrt(immse(DatoEmcali, Prediccion));
disp("rmse: " + rmse);

mdl = fitlm(DatoEmcali,Prediccion);
disp("R-Squared Ordinary: " + mdl.Rsquared.Ordinary);
disp("R-Squared Asjusted: " + mdl.Rsquared.Adjusted);
s=0;

for i=1:length(Prediccion)
    s = s + abs((Prediccion(i) - DatoEmcali(i))/DatoEmcali(i));
end
s = (s/ length(Prediccion))*100;
disp("Eprome porcen: " + s);
%%-------------------------------------------------
%%:::::::::::::::::::::::::::::::::::::::::::::::::
% figure(4)
% scatter(Prediccion, DatoEmcali)
% a= [0 500];
% hold on
% plot(a,a);
% title("Scatter plot Prediccion vs DatoEmcali");
% xlabel("Predicción");
% ylabel("DatoEmcali");
% grid on
%%:::::::::::::::::::::::::::::::::::::::::::::::::::::::
%%%-------------------------------------------------------

end 