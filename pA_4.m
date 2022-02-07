%initialize elements
nx = 100;
ny = 100;
v = zeros(nx, ny);
iter_num = 100; %iteration number
% BC
v(:, 1) = 1;
v(:, nx) = 0;
v(1, :) = 0;
v(ny, :) = 0
x = linspace(1, nx, nx);
y = linspace(1, ny, ny);
[xx yy] = meshgrid(x, y);

for iter = 1:iter_num
    for i=2:(nx-1)
        for j=2:(ny-1)
            v(j, i) = (v(j-1, i) + v(j+1, i) + v(j, i+1) + v(j, i-1)) / 4;        
        end  
    end
    surf(xx, yy, v);
    pause(0.1);
end

[ex ey] = gradient(v);
dir = gradient(v);
figure(2);
surf(xx, yy, dir);
figure(3);
quiver(xx, yy, ex, ey, 10);

