clear; close all;  % Xóa tất cả các biến và đóng tất cả các cửa sổ đồ thị
m = 2;  % Hệ số m cho thuật toán phân cụm Fuzzy C-Means

% Dữ liệu đầu vào
a = [2.0 2.0 2.2 3.8 4.0 4.2 3];
b = [2.2 1.8 2.0 3.0 3.2 3.0 3];

% Kết hợp dữ liệu vào ma trận X (mỗi cột là một điểm dữ liệu)
X = [a; b];
% Khởi tạo các trung tâm cụm ban đầu (2 cụm)
V = [2 3; 4 2]';

% Các tham số thuật toán
max_iter = 100;  % Số vòng lặp tối đa
epsilon = 0.01;  % Ngưỡng hội tụ

c = 2;  % Số lượng cụm
n = size(X, 2);  % Số lượng điểm dữ liệu
colors = parula(c)';  % Tạo bảng màu

% Vòng lặp chính của thuật toán
for iter = 1:max_iter

    % Tính toán khoảng cách giữa các điểm dữ liệu và trung tâm cụm
    for i = 1:c
        for j = 1:n
            D(i, j) = sqrt(sum((V(:, i) - X(:, j)).^2));  % Khoảng cách Euclid
        end
    end

    % Tính toán giá trị thuộc về cụm của mỗi điểm dữ liệu
    for i = 1:c
        for j = 1:n
            S = 0;
            for k = 1:c
                S = S + (D(i, j)^(2 / (m - 1))) / (D(k, j)^(2 / (m - 1)));
            end
            U(i, j) = 1 / S;  % Giá trị thuộc về cụm
        end
    end

    % Cập nhật các trung tâm cụm mới
    V_new = (X * (U.^m)') ./ sum(U.^m, 2)';

    % Kiểm tra điều kiện hội tụ
    Stop = norm(V_new - V, 1);  % Tính độ lớn của sự thay đổi
    if Stop < epsilon
        break;  % Dừng nếu sự thay đổi nhỏ hơn ngưỡng
    else
        V = V_new;  % Cập nhật trung tâm cụm
    end

    % Vẽ đồ thị phân tán các điểm dữ liệu và trung tâm cụm
    scatter(X(1, :), X(2, :), max(U) * 60, [.5 .5 .5], 'filled');
    xlim([1, 5]); ylim([1, 4]);
    hold on;
    scatter(V(1, :), V(2, :), 'filled');
    pause(1);  % Tạm dừng một giây để xem sự thay đổi
    drawnow; cla;  % Cập nhật đồ thị và xóa đồ thị hiện tại

end

% Xác định chỉ số của cụm với giá trị thuộc về cụm lớn nhất
[~, IDX] = max(U);

% Vẽ kết quả phân cụm cuối cùng
for i = 1:2
    X0 = X(:, IDX == i);  % Các điểm thuộc cụm i
    scatter(X0(1, :), X0(2, :), 'filled', "DisplayName", "Cluster");  % Vẽ điểm dữ liệu của cụm
end
hold on;
scatter(V(1, :), V(2, :), 100, 'filled', 'square', 'k');  % Vẽ các trung tâm cụm
xlim([1, 5]); ylim([1, 4]);

% Tính toán và vẽ các đường viền mức độ thuộc về cụm
[x, y] = meshgrid(linspace(1, 5, 200), linspace(1, 4, 200));  % Tạo lưới tọa độ
pair = [x(:) y(:)];  % Kết hợp các tọa độ thành ma trận

% Tính khoảng cách giữa các điểm lưới và trung tâm cụm
for i = 1:2
    for j = 1:size(pair, 1)
        xv_j = pair(j, :) - V_new(:, i)';  % Vector khoảng cách
        d(j, i) = sqrt(sum(xv_j .* xv_j));  % Khoảng cách Euclid
    end
end
d = d';  % Chuyển đổi ma trận khoảng cách
S = 0;
for i = 1:2
    for j = 1:size(pair, 1)
        sumDist = 0;
        for k = 1:2
            sumDist = sumDist + (d(i, j)^(2 / (m - 1))) / (d(k, j)^(2 / (m - 1)));
        end
        U_contour(i, j) = 1 / sumDist;  % Giá trị thuộc về cụm
    end
end

f = max(U_contour)';  % Lấy giá trị lớn nhất cho mỗi điểm lưới
Z = reshape(f, size(x, 1), size(x, 2));  % Chuyển đổi dữ liệu để vẽ contour
contour(x, y, Z, "DisplayName", "Contour"); colorbar; hold off;

% Vẽ heatmap của ma trận thuộc về cụm
figure(2);
heatmap(U);
