function [MEx,MEy]=valorCampo(posx,posy,rx,ry,domt,m,sigma)
% Llena las matrices de campo con ceros
n=length(posx);
MEx=zeros(n); MEy=zeros(n);
% Delta t es la diferencia del parametro t entre cada par consecutivo de
% los m puntos
delt=(domt(2)-domt(1))/(m-1);
% Calcula la posicion de cada punto de la placa
for i=1:m
    qx(i)=rx(domt(1)+(i-1)*delt);
    qy(i)=ry(domt(1)+(i-1)*delt);
end
% Calcula la longitud de la placa
lx=rx(domt(1)+delt)-rx(domt(1));
ly=ry(domt(1)+delt)-ry(domt(1));
difl=sqrt(lx^2+ly^2);
% Calcula la carga total de la placa
Q=sigma*difl;
for i=1:n
    for j=1:n
        % Por cada posicion de la malla
        sumx=0; sumy=0;
        for cq=1:m
            % Calculamos el campo total como la suma de campos ejercidos
            % por cada fragmento de la placa
            [Eqx,Eqy]=Coulomb(Q/(m-1),posx(i,j)-qx(cq),posy(i,j)-qy(cq));
            sumx=sumx+Eqx;
            sumy=sumy+Eqy;
            
        end
        MEx(i,j)=sumx;
        MEy(i,j)=sumy;
    end
end
end