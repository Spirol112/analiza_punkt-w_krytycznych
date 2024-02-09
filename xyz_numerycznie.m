%projekt metody numeryczne 
% zadanie 1.1
% metoda numeryczna
clc; clear; close all;
% Zdefiniuj funkcję celu (zastąp ją swoją funkcją)
f = @(x, y, z) 4*x^3 - 4*y^3 -26*x^2 + 21*y^2 - 3*z^2 -2*y.*z + 56*x - 30*y + 22*z;

% Zakres poszukiwań punktów krytycznych
dx = 0.03;
range = -5:dx:5;

% Inicjalizacja pustej listy na punkty krytyczne
critical_points = [];

% Obliczenie przybliżonych pochodnych funkcji numerycznie (metoda różnic skończonych)

for x = range
    for y = range
        for z = range
            % Obliczenie pochodnej po x
            f_dx = (f(x + dx, y, z) - f(x, y, z)) / dx;
            % Obliczenie pochodnej po y
            f_dy = (f(x, y + dx, z) - f(x, y, z)) / dx;
            
            % Obliczenie pochodnej po z
            f_dz = (f(x, y, z + dx) - f(x, y, z)) / dx;
            
            % Sprawdzenie, czy pochodne są bliskie zeru (zakładając pewną tolerancję)
            tolerance = 0.09; % Tolerancja dla wartości bliskich zeru
            if abs(f_dx) < tolerance && abs(f_dy) < tolerance && abs(f_dz) < tolerance
                % Dodanie punktu do listy punktów krytycznych
                disp([f_dx,f_dy,f_dz]);
                critical_points = [critical_points; x, y, z];
            end
        end
    end
end

% Wyświetlanie wyników
disp('Punkty krytyczne funkcji:');
disp(critical_points);

