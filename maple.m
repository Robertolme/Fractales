% Parámetros iniciales
n_points = [10000, 100000, 1000000]; % Número de puntos para cada iteración
x = 0; % Valor inicial de x
y = 0; % Valor inicial de y
points = []; % Matriz para almacenar los puntos generados

% Probabilidades para seleccionar cada transformación
probabilities = [1/3, 1/3 , 1/3];

% Matrices de transformación
T1 = [0.5, 0, 0, 0.5, 1, 1];
T2 = [0.5, 0, 0, 0.5, 1, 50];
T3 = [0.5, 0, 0, 0.5, 50,50];

% Para cada cantidad de puntos en la lista n_points
for j = 1:length(n_points)
    % Inicializa el vector de puntos vacío
    points = zeros(n_points(j), 2);
    
    % Genera los puntos
    for i = 1:n_points(j)
        % Genera una variable aleatoria U
        U = rand;
        
        % Selecciona la transformación de acuerdo a U
        if U < probabilities(1)
            T = T1;
        elseif U < sum(probabilities(1:2))
            T = T2;
        else
            T = T3;        
        end
        
        % Aplica la transformación al punto (x, y)
        x_new = T(1) * x + T(2) * y + T(5);
        y_new = T(3) * x + T(4) * y + T(6);
        
        % Actualiza el punto (x, y)
        x = x_new;
        y = y_new;
        
        % Guarda el nuevo punto en la matriz de puntos
        points(i, :) = [x, y];
    end
    
    % Grafica el fractal
    figure;
    plot(points(:, 1), points(:, 2), '.', 'MarkerSize', 1, 'Color', 'blue');
    title(['Fractal de Helecho con ', num2str(n_points(j)), ' puntos']);
    axis equal;
    axis off;
end