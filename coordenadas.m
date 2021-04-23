function [Ex,Ey]=coordenadas(Cx, Cy, malla_x,malla_y,n)
Ex = [];
Ey = [];
q1 = 1;
% Calcula el campo electrico en cada punto de la malla
for i = 1:n
    for j = 1:n
        % try - catch evita que el programa se detenga al encontrar un
        % error, en este caso, division por 0
        try
            Ex(i,j) = Cx(q1, malla_x(i,j), malla_y(i,j));
            
        catch
            Ex(i,j) = 0;
        end
        try
            Ey(i,j) = Cy(q1, malla_x(i,j), malla_y(i,j));
            
        catch
            Ey(i,j) = 0;
        end
    end
end
end