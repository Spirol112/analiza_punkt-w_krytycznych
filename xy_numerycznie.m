%projekt metody numeryczne 
% zadanie 1.1
% metoda numeryczna
clc; clear; close all;

% Zdefiniuj funkcję celu (zastąp ją swoją funkcją)
f =@(x,y) x^3+22*x^2+41*y^2-24*x*y-176*x-68*y+500;
% Zakres poszukiwań punktów krytycznych
dx = 0.01;
range = -20:dx:20;

% Inicjalizacja pustej listy na punkty krytyczne
critical_points = [];

% Obliczenie przybliżonych pochodnych funkcji numerycznie (metoda różnic skończonych)

for x = range
    for y = range
            % Obliczenie pochodnej po x
          
            f_dx = (f(x + dx, y) - f(x, y)) / dx;
            
            % Obliczenie pochodnej po y
            f_dy = (f(x, y + dx) - f(x, y)) / dx;
            
            % Sprawdzenie, czy pochodne są bliskie zeru (zakładając pewną tolerancję)
            tolerance = 0.4; % Tolerancja dla wartości bliskich zeru
            if abs(f_dx) < tolerance && abs(f_dy) < tolerance
                disp([f_dx,f_dy]);
                % Dodanie punktu do listy punktów krytycznych
                critical_points = [critical_points; x, y];
            
        end
    end
end

% Wyświetlanie wyników
disp('Punkty krytyczne funkcji:');
disp(critical_points);

% Wykres funkcji i minimum
[X, Y] = meshgrid(-20:0.5:20, -20:0.5:20);
Z = X.^3+22*X.^2+41*Y.^2-24*X.*Y-176*X-68*Y+500;

figure;
surf(X, Y, Z, 'EdgeColor', 'none'); % Wykres powierzchni funkcji
hold on;
plot3(critical_points(1,1), critical_points(2,1), f(critical_points(1,1),critical_points(2,1)), 'ro', 'MarkerSize', 10);
plot3(critical_points(2,1), critical_points(2,2), f(critical_points(2,1),critical_points(2,2)), 'go', 'MarkerSize', 10);
title('Wykres funkcji 3D z minimum');
xlabel('X');
ylabel('Y');
zlabel('Wartość funkcji');
grid on;
hold off;
