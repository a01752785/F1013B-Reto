function [x,y] = malla(n,xmin,xmax,ymin,ymax)
x =[];
y =[];
% Por cada punto establece los valores de x, y
for i=1:n
    for j=1:n
        x(j,i)=xmin+(xmax-xmin)*(i-1)/(n-1);
        y(j,i)=ymin+(ymax-ymin)*(n-j)/(n-1);
    end 
end
end