% Placas(5, 5, 10, 2)
% Placas(7, 3, 8, 1)
% Placas(3, 10, 20, 0)
function Placas(lon1, lon2, dist, op)
syms rx ry rx2 ry2 t
n=15;
xmin=-10; xmax=10; ymin=-10; ymax=10;
dist=dist/2; lon1=lon1/2; lon2=lon2/2;
rx(t)=-dist; ry(t)=t; rx2(t)=dist; ry2(t)=-t;
domt=[-lon1,lon1]; domt2=[lon2,-lon2];
m=6;
sigma=1; sigma2=-1;
[posx,posy]=malla(n,xmin,xmax,ymin,ymax);
[MEx,MEy]=valorCampo(posx,posy,rx,ry,domt,m,sigma);
[MEx2,MEy2]=valorCampo(posx,posy,rx2,ry2,domt2,m,sigma2);
M1 = MEx + MEx2;
M2 = MEy + MEy2;
graficador(posx,posy,M1,M2,n,op)
hold on
% Agrega placas cargadas a la grafica
fplot(rx,ry,[-lon1,lon1], 'color', 'r', 'LineWidth', 3)
fplot(rx2,ry2,[-lon2,lon2], 'color', 'b', 'LineWidth', 3)
end