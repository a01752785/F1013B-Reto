function [MEx,MEy]=valorCampo(posx,posy,rx,ry,domt,m,sigma)
n=length(posx);
MEx=zeros(n); MEy=zeros(n);
delt=(domt(2)-domt(1))/(m-1);
for i=1:m
    qx(i)=rx(domt(1)+(i-1)*delt);
    qy(i)=ry(domt(1)+(i-1)*delt);
end
lx=rx(domt(1)+delt)-rx(domt(1));
ly=ry(domt(1)+delt)-ry(domt(1));
difl=sqrt(lx^2+ly^2);
q=sigma*difl;
for i=1:n
    for j=1:n
        sumx=0; sumy=0;
        for cq=1:m
            [Eqx,Eqy]=Coulomb(qx(cq),qy(cq),posx(i,j),posy(i,j));
            sumx=sumx+Eqx;
            sumy=sumy+Eqy;
            
        end
        MEx(i,j)=sumx;
        MEy(i,j)=sumy;
    end
end
end