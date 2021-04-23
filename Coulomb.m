function [Eqx,Eqy]=Coulomb(qx,qy,posx,posy)
x=posx-qx; y=posy-qy;
Eqx=x/(x^2+y^2)^(3/2);
Eqy=y/(x^2+y^2)^(3/2);
end