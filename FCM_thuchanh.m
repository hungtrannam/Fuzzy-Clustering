clear; close all;
m=2;


a = [2.0 2.0 2.2 3.8 4.0 4.2 3];
b = [2.2 1.8 2.0 3.0 3.2 3.0 3];



X = [a;b];
V = [2 3; 4 2]';

max_iter = 100;
epsilon = 0.01;

c = 2;
n=size(X,2);
colors = parula(c)';

for iter = 1:max_iter


    for i = 1:c
        for j = 1:n
            D(i,j) = sum((V(:,i) - X(:,j)).^2).^0.5;
        end
    end

    for i = 1:c
        for j = 1:n
            S = 0;
            for k = 1:c
                S = S + (D(i,j)^(2/(m-1))) / (D(k,j)^(2/(m-1)));
            end
            U(i, j) = 1 / S;
        end
    end

    V_new = (X * (U.^m)') ./ sum(U.^m,2)';

    Stop = norm(V_new - V, 1);
    if Stop < epsilon
        break;
    else 
        V = V_new;
    end
    



    scatter(X(1,:), X(2,:), max(U)*60, [.5 .5 .5], 'filled');
    xlim([1,5]); ylim([1, 4]);
    hold on
    scatter(V(1,:), V(2,:), 'filled');
    pause(1);
    drawnow; cla;


end

[~,IDX] = max(U);

for i = 1:2
    X0 = X(:, IDX == i);
    scatter(X0(1,:), X0(2,:), 'filled', "DisplayName", "Cluster");  % 36 is the marker size
end
hold on;
scatter(V(1,:), V(2,:), 100, 'filled', 'square', 'k');
xlim([1,5]); ylim([1, 4]);

% 
[x,y] = meshgrid(linspace(1, 5, 200), linspace(1, 4, 200));
pair = [x(:) y(:)];

for i = 1:2
    for j = 1:size(pair,1)
        xv_j = pair(j, :) - V_new(:, i)';
        d(j, i) = sum((xv_j .* xv_j), 2).^.5;
    end
end
d = d';
S = 0;
for i = 1:2
    for j = 1:size(pair,1)
        sumDist = 0;
        for k = 1:2
            sumDist = sumDist + (d(i,j)^(2/(m-1))) / (d(k,j)^(2/(m-1)));
        end
        U_contour(i, j) = 1 / sumDist;
    end
end

f = max(U_contour)';
Z = reshape(f,size(x,1),size(x,2));
contour(x,y,Z, "DisplayName", "Contour");colorbar;hold off;



figure(2);
heatmap(U);
