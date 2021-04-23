function [result_x, result_y] = Coulomb(q, r_x, r_y)
r_norm = sqrt(r_x^2 + r_y^2);
if(r_norm == 0)
    result_x = 0;
    result_y = 0;
    return;
end
magnitude = 9e9 * q / r_norm^3;
result_x = magnitude * r_x;
result_y = magnitude * r_y;
end