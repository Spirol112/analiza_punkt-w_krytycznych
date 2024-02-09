%projekt metody numeryczne 
% zadanie 1.2 
% metoda analityczna
clc; clear; close all;
syms x y z;

f= 4*x^3 - 4*y^3 -26*x^2 + 21*y^2 - 3*z^2 -2*y*z + 56*x - 30*y + 22*z;

%pochodne pierwszego stopnia
df_dx = diff(f, x);
df_dy = diff(f, y);
df_dz = diff(f, z);
%pochodne drugiego stopnia
df2_dx2 = diff(df_dx, x);
df2_dy2 = diff(df_dy, y);
df2_dz2 = diff(df_dz, z);
df2_dxdy = diff(df_dx, y);
df2_dxdz = diff(df_dx, z);
df2_dydz = diff(df_dy, z);

H=[df2_dx2 df2_dxdy df2_dxdz;
   df2_dxdy df2_dy2 df2_dydz;
   df2_dxdz df2_dydz df2_dz2;];

W=(df2_dx2*df2_dy2)-(df2_dxdy^2);

cr_points=solve(df_dy==0,df_dx==0,df_dz==0);


 disp("Punkty podejżane o ekstremum (punkty krytczne): ")
 for i = 1:length(cr_points.x)
    % Konwersja ułamka prostej na liczbę zmiennoprzecinkową
    x_decimal = double(cr_points.x(i));
    y_decimal = double(cr_points.y(i));
    z_decimal = double(cr_points.z(i));
    
    % Wyświetlenie punktów jako ułamków dziesiętnych
    disp([x_decimal, y_decimal, z_decimal]);
end


for i=1:4
    P1=H;

    P1(1,1)=subs(df2_dx2,x,cr_points.x(i));
    P1(2,2)=subs(df2_dy2,y,cr_points.y(i));

    % disp(P1);

    H1=P1(1,1);
    H2=det([P1(1,1) P1(1,2); 
             P1(2,1) P1(2,2);]);
    H3=det(P1);
    
    if H1<0 && H2>0 && H3<0
        disp("ten punkt jest maximum:");
        disp([cr_points.x(i),cr_points.y(i),cr_points.z(i)]);
        A=subs(f,x,cr_points.x(i));
        A=subs(A,y,cr_points.y(i));
        A=subs(A,z,cr_points.z(i));
        disp("Wartosc funkcji w tym punkcie: ");
        disp(A);
    elseif H1>0 && H2>0 && H3>0
        disp("ten punkt jest min:");
        disp([cr_points.x(i),cr_points.y(i),cr_points.z(i)]);
    end
    disp(" ");
end