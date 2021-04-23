function [result_x, result_y] = Coulomb(q, r_x, r_y)
% Calcula norma del vector
r_norm = sqrt(r_x^2 + r_y^2);
% Caso en que la norma es 0
if(r_norm == 0)
    result_x = 0;
    result_y = 0;
    return;
end
% Calcula el coeficiente por el que se multiplicara el vector
magnitude = 9e9 * q / r_norm^3;
% Las componentes x e y se multiplican por el coeficiente
result_x = magnitude * r_x;
result_y = magnitude * r_y;
end