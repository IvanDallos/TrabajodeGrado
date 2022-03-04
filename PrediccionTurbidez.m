function PrediccionTurbidez(Tabla)
close all

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

RC = 1.75.*(B2./B5) + 1.75.*(B6./B8A)+ 1.5.*(B12./B5);
RB = 2.5*(B2./B5) + 3*(B12./B6) + 2*(B11./B5)+1.5*(B5./B7) + 2*(B3./B4);
RA = 0.75*(B2./B5) + 0.75*(B9./B2)+ 3*(B4./B5);

EC = -513.86*RC + 2324.4;
EB = -93.329*RB + 955.12;
EA = -686.74.*RA + 2880.9;


Predi = [];
for i=1:length(fechadatos)
    if RC(i) < 4.2
        Predi(end + 1) = EA(i);
    else
        Predi(end + 1) = EB(i);
    end
end
Predi = Predi';
disp("--------")

Predi2 = [];
for i=1:length(fechadatos)
    if DatoEmcali(i) > 150
        Predi2(end + 1) = EC(i);
    else
        Predi2(end + 1) = EC(i);
    end
end
Predi2 = Predi2';

[PvalPR1,RhoSR1,PvalSR1,RhoKR1,PvalKR1]=CorrePKS(Predi,DatoEmcali);
[RhoPR2,PvalPR2,RhoSR2,PvalSR2,RhoKR2,PvalKR2]=CorrePKS(EC,DatoEmcali);


[rho,pval]=corr(DatoEmcali,Predi,'type','kendall');
[rho2,pval2]=corr(DatoEmcali,EC,'type','kendall');
disp("Prediccion Datos: kendall")
disp("      Partida       Completa")
disp("rho:  " + rho +"        " + rho2);
disp("pval: " + pval+"     " + pval2);
disp("  ");
[rho,pval]=corr(DatoEmcali,Predi,'type','spearman');
[rho2,pval2]=corr(DatoEmcali,EC,'type','spearman');
disp("Prediccion Datos: spearman")
disp("      Partida       Completa")
disp("rho:  " + rho +"        " + rho2);
disp("pval: " + pval+"     " + pval2);
disp("  ");
[rho,pval]=corr(DatoEmcali,Predi,'type','pearson');
[rho2,pval2]=corr(DatoEmcali,EC,'type','pearson');
disp("Prediccion Datos: pearson")
disp("      Partida       Completa")
disp("rho:  " + rho +"        " + rho2);
disp("pval: " + pval+"     " + pval2);
disp("  ");

rmse = sqrt(immse(DatoEmcali, Predi));
rmse2 = sqrt(immse(DatoEmcali, Predi2));
mdl = fitlm(DatoEmcali,Predi);
mdl2 = fitlm(DatoEmcali,Predi2);
disp("            Doble       Unico")
disp("rmse:     " + rmse+"     " + rmse2);
disp("R2 Ordinary: " + mdl.Rsquared.Ordinary+"     " + mdl2.Rsquared.Ordinary);
disp("R2 Asjusted: " + mdl.Rsquared.Adjusted+"     " + mdl2.Rsquared.Adjusted);
s=0;
s2=0;
for i=1:length(Predi)
    s = s + abs((Predi(i) - DatoEmcali(i))/DatoEmcali(i));
    s2 = s2 + abs((Predi2(i) - DatoEmcali(i))/DatoEmcali(i));
end
s = (s/ length(Predi))*100;
s2 = (s2/ length(Predi))*100;
disp("Eprome porcen: " + s +"   " + s2);




figure(5)
plot(fechadatos,DatoEmcali,'R','Marker','*')
hold on
plot(fechadatos,Predi,'G','Marker','.')
plot(fechadatos,EC,'B','Marker','+')
grid on
legend('Dato Real Turbidez','Modelo Doble','Modelo Único')
xlabel("Fecha");
ylabel("Turbidez (NTU)");
title("Comparación Dato Turbidez - Modelo Doble - Modelo Único")


figure(7)
plot(fechadatos,DatoEmcali,'R','Marker','*')
hold on
plot(fechadatos,Predi,'B','Marker','+')
grid on
legend('Dato Real Turbidez','Predicción: Modelo Doble')
xlabel("Fecha");
ylabel("Turbidez (NTU)");
title("Comparación Dato Turbidez - Modelo Doble")

end
