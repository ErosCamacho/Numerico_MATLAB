clear
clc
marcador=1;
u=3;
dialuna=93;
while marcador<=5
    
    %% Averiguar el dia
    if u~=1 
        while dialuna<=365
        dialuna=dialuna+28;
        end
        dialuna=dialuna-365;
    else 
        while dialuna<=366
        dialuna=dialuna+28;
        end
        dialuna=dialuna-366;
    end
    
    u=u+1;
    if u==4
       u=1;
    end
    
    if u~=1
        while dialuna<80
        dialuna=dialuna+28; 
        end
    else
        while dialuna<81
        dialuna=dialuna+28;
        end
    end
    
    %% Averiguar la fecha exacta
    
    dialuna=dialuna-31;
    if u~=1
        dialuna=dialuna-28;
    else
        dialuna=dialuna-29;
    end
    
    if dialuna>31
        mes='Abril';
        dialuna=dialuna-31;
    else
        mes='Marzo';
    end
    
    fprintf('%d %s \n',dialuna,mes);

    marcador=marcador+1;
end    