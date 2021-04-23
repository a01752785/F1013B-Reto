function Placas(lon)
syms rx ry rx2 ry2 t
n=11;
xmin=-7; xmax=7; ymin=-7; ymax=7;
a=2; lon=lon/2; lon2=5/2;
rx(t)=-a; ry(t)=t; rx2(t)=a; ry2(t)=-t;
domt=[-lon,lon]; domt2=[lon2,-lon2];
m=10;
sigma=1; sigma2=-1;
[posx,posy]=malla(n,xmin,xmax,ymin,ymax);
[MEx,MEy]=valorCampo(posx,posy,rx,ry,domt,m,sigma);
[MEx2,MEy2]=valorCampo(posx,posy,rx2,ry2,domt2,m,sigma2);
M1 = MEx + MEx2;
M2 = MEy + MEy2;
graficador(posx,posy,M1,M2,10,2,1)
hold on
% Agrega placas cargadas a la grafica
fplot(rx,ry,[-lon,lon], 'color', 'r', 'LineWidth', 3)
fplot(rx2,ry2,[-lon2,lon2], 'color', 'b', 'LineWidth', 3)
end