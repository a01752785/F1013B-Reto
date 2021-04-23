% campo(-6,5,-6,6,12,2,2)
% campo(-6,5,-6,6,12,5,1)
% campo(-6,5,-6,6,12,5,0)
function campo(xmin, xmax, ymin, ymax, n, intensity, op)
syms x y q Cx Cy
Cx(q, x, y) = 1; % Definicion del campo electrico
Cy(q, x, y) = 0;
 %Cx(q, x, y) = q*x/(x^2+y^2)^(3/2);
 %Cy(q, x, y) = q*y/(x^2+y^2)^(3/2);
 %Cx(q, x, y) = q*(x+2)/((x+2)^2+y^2)^(3/2) + q*(x-2)/((x-2)^2+(y)^2)^(3/2);
 %Cy(q, x, y) = q*y/((x+2)^2+y^2)^(3/2) + q*(y)/((x-2)^2+(y)^2)^(3/2);
% Crea la malla con puntos
[malla_x, malla_y] = malla(n, xmin, xmax, ymin, ymax); 
Ex = [];
Ey = [];
% Calcula el campo electrico en cada punto
[Ex,Ey]=coordenadas(Cx, Cy, malla_x,malla_y,n); 
graficador(malla_x, malla_y, Ex, Ey, n, intensity, op);

end