function graficador(malla_x, malla_y, Ex, Ey, n, intensity, op)
normVector = [];
opa = 0.5;
% Calcula la norma del vector en cada punto
maxNorm = 0;
for i = 1:n
    for j = 1:n
        normVector(i,j) = sqrt(Ex(i,j)^2 + Ey(i,j)^2);
    end
end
maxNorm = max(max(normVector));
opac = [];
for i = 1:n
    for j = 1:n
        opac(i,j) = (1 - opa) + opa * normVector(i,j) / maxNorm;
    end
end
minOpac = min(min(opac));
maxOpac = max(max(opac));
for i = 1:n
    for j = 1:n
        opac(i,j) = ((opac(i,j) - minOpac) / (maxOpac - minOpac))^(1/intensity);
    end
end
figure
hold on
xlim([-6 6]);
ylim([-6 6]);

% Agrega una flecha a la grafica por cada punto
if(op == 0) % Graficar con vectores unitarios
    for i = 1:n
        for j = 1:n
            if(normVector(i,j) == 0)
                continue;
            end
            quiver(malla_x(i,j), malla_y(i,j), Ex(i,j)/normVector(i,j),...
                Ey(i,j)/normVector(i,j), 'color', 'r', 'MaxHeadSize', 0.5);
        end
    end
elseif(op == 1) % Graficar con escala de colores
    for i = 1:n
        for j = 1:n
            if(normVector(i,j) == 0)
                continue;
            end
            quiver(malla_x(i,j), malla_y(i,j), Ex(i,j)/normVector(i,j),...
                Ey(i,j)/normVector(i,j), 'color', [opac(i,j), 0.2, 1 - opac(i,j)], 'MaxHeadSize', 0.5);
        end
    end
elseif(op == 2) % Graficar con opacidad
    for i = 1:n
        for j = 1:n
            if(normVector(i,j) == 0)
                continue;
            end
            quiver(malla_x(i,j), malla_y(i,j), Ex(i,j)/normVector(i,j),...
                Ey(i,j)/normVector(i,j), 'color', [1 - opac(i,j), 1 - opac(i,j), 1 - opac(i,j)], 'MaxHeadSize', 0.5);
        end
    end
end
end