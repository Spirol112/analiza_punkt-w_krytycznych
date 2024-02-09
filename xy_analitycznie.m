%projekt metody numeryczne 
% zadanie 10.1
% metoda analityczna 
clc; clear; close all;
syms x y;

f= x^3+22*x^2+41*y^2-24*x*y-176*x-68*y+500;

%pochodne pierwszego stopnia
df_dx = diff(f, x);
df_dy = diff(f, y);
%pochodne drugiego stopnia
df2_dx2 = diff(df_dx, x);
df2_dy2 = diff(df_dy, y);
df2_dxdy = diff(df_dx, y);

W=(df2_dx2*df2_dy2)-(df2_dxdy^2);

cr_points=solve(df_dy==0,df_dx==0);

disp("Punkty podejżane o ekstremum (punkty krytczne): ")
for i = 1:length(cr_points.x)
    % Konwersja ułamka prostej na liczbę zmiennoprzecinkową
    x_decimal = double(cr_points.x(i));
    y_decimal = double(cr_points.y(i));
    % Wyświetlenie punktów jako ułamków dziesiętnych
    disp([x_decimal, y_decimal]);
end

E=subs(W,x,cr_points.x);

for k=1:2
    if E(k)>0
         disp("punkt jest extremum:");
         disp([cr_points.x(k), cr_points.y(k)]);
         if subs(df2_dx2,x,cr_points.x(k))>0
             disp("jest to minimum");
         else
             disp("jest to maximum");
         end
         A=subs(f,x,cr_points.x(k));
         A=subs(A,y,cr_points.y(k));
         disp("Wartosc funkcji w tym punkcie: ");
         disp(A);
    end
    disp(" ");
end

