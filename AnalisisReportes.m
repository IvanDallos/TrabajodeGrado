function AnalisisReportes(Reporte)

%Se debe primero cargar la tabla que se requiere a analizar y colocarla
%en el argumento de la función
fecha=Reporte(:,6);
tipo=Reporte(:,7);
afectados=Reporte(:,8);
horas=Reporte(:,9);


fecha = table2array(fecha);
tipo = table2array(tipo);
afectados = table2array(afectados);
horas = table2array(horas);

p1=1;
p2=1;
p3=1;
p4=1;

for i=1:length(tipo)
    if(tipo(i)==1)
        x1(p1)=fecha(i);
        y1(p1)=afectados(i);
        z1(p1)=horas(i);
        p1=p1+1;
    elseif(tipo(i)==2)
        x2(p2)=fecha(i);
        y2(p2)=afectados(i);
        z2(p2)=horas(i);
        p2=p2+1;
    elseif(tipo(i)==3)
        sprintf("entre")
        x3(p3)=fecha(i);
        y3(p3)=afectados(i);
        z3(p3)=horas(i);
        p3=p3+1;
    elseif(tipo(i)==4)
        x4(p4)=fecha(i);
        y4(p4)=afectados(i);
        z4(p4)=horas(i);
        p4=p4+1;
    else
        sprintf("Existen datos con codigo 5! Revisar");
    end
end
TotalSus=[0 0 0 0];
TotalHrs=[0 0 0 0];
figure(1)
if(p1~=1)
    subplot(2,2,1)
    stem(x1,y1)
    title("Suscriptores afectados de codigo 1")
    xlabel("Fecha");
    ylabel("Cantidad");
    s1=0;
    s2=0;
    for i=1:length(y1)
        s1=y1(i)+s1;
        s2=z1(i)+s2;
    end
    TotalSus(1)=s1;
    TotalHrs(1)=s2;
    sprintf('Codigo 1: \n Suscriptores afectados %d\n Horas de afeccion %d',s1,s2)
end
if(p2~=1)
    subplot(2,2,2)
    stem(x2,y2)
    title("Suscriptores afectados de codigo 2")
    xlabel("Fecha");
    ylabel("Cantidad");
    s1=0;
    s2=0;
    for i=1:length(y2)
        s1=y2(i)+s1;
        s2=z2(i)+s2;
    end
    TotalSus(2)=s1;
    TotalHrs(2)=s2;
    sprintf('Codigo 2: \n Suscriptores afectados %d\n Horas de afeccion %d',s1,s2)
end
if(p3~=1)
    subplot(2,2,3)
    stem(x3,y3)
    title("Suscriptores afectados de codigo 3")
    xlabel("Fecha");
    ylabel("Cantidad");
    s1=0;
    s2=0;
    for i=1:length(y3)
        s1=y3(i)+s1;
        s2=z3(i)+s2;
    end
    TotalSus(3)=s1;
    TotalHrs(3)=s2;
    sprintf('Codigo 3: \n Suscriptores afectados %d\n Horas de afeccion %d',s1,s2)
end
if(p4~=1)
    subplot(2,2,4)
    stem(x4,y4)
    title("Suscriptores afectados de codigo 4")
    xlabel("Fecha");
    ylabel("Cantidad");
    s1=0;
    s2=0;
    for i=1:length(y4)
        s1=y4(i)+s1;
        s2=z4(i)+s2;
    end
    TotalSus(4)=s1;
    TotalHrs(4)=s2;
    sprintf('Codigo 4: \n Suscriptores afectados %d\n Horas de afeccion %d',s1,s2)
end
figure(2)
if(p1~=1)
    subplot(2,2,1)
    stem(x1,z1)
    title("Horas de suspención para codigo 1")
    xlabel("Fecha");
    ylabel("Cantidad");
end
if(p2~=1)
    subplot(2,2,2)
    stem(x2,z2)
    title("Horas de suspención para codigo 2")
    xlabel("Fecha");
    ylabel("Cantidad");
end
if(p3~=1)
    subplot(2,2,3)
    stem(x3,z3)
    title("Horas de suspención para codigo 3")
    xlabel("Fecha");
    ylabel("Cantidad");
end
if(p4~=1)
    subplot(2,2,4)
    stem(x4,z4)
    title("Horas de suspención para codigo 4")
    xlabel("Fecha");
    ylabel("Cantidad");
end
pr1=sum(TotalSus);
pr2=sum(TotalHrs);
sprintf('Codigo 1: %d registros\n Suscriptores afectados %d prj \n Horas de afeccion %d prj ',p1-1,100*((TotalSus(1))/pr1),100*(TotalHrs(1))/pr2)
sprintf('Codigo 2: %d registros\n Suscriptores afectados %d prj \n Horas de afeccion %d prj ',p2-1,100*((TotalSus(2))/pr1),100*(TotalHrs(2))/pr2)
sprintf('Codigo 3: %d registros\n Suscriptores afectados %d prj \n Horas de afeccion %d prj ',p3-1,100*((TotalSus(3))/pr1),100*(TotalHrs(3))/pr2)
sprintf('Codigo 4: %d registros\n Suscriptores afectados %d prj \n Horas de afeccion %d prj ',p4-1,100*((TotalSus(4))/pr1),100*(TotalHrs(4))/pr2)
%2173               837
%p1 0.8131          0.826
%p4 0.1872          0.1756




end
