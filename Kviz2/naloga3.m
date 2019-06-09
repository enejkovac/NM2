% 3 naloga %

% y'' = (y^2 - 1)y' + y = 0, y(0) = 0, y'(0) = 1 

h = 0.01;
Y0 = [0 ; 1];
x0 = 0;
K = 500; % stevilo korakov

% y1 = y, y2 = y'
% [y1, y2]' = [y2, (y1^2-1)y2 + y1] 
F = @(x,Y) [Y(2); -(Y(1).^2-1).*Y(2) - Y(1)];

Yie = [Y0]; % ie ... implicitni Euler
Yee = [Y0]; % ee ... eksplicitni Euler
Yt = [Y0]; % t ... trapezna metoda
Yrk = [Y0];
X = [0];

for n = 1:K
  Yie(:, n+1) = implEuler(X(n),Yie(:,n),F,h,10);
  Yee(:, n+1) = ekspEuler(X(n),Yee(:,n),F,h);
  Yt(:, n+1) = trapezna(X(n),Yt(:,n),F,h,1);
  Yrk(:, n+1) = RK4(X(n), Yrk(:,n),F,h)
  X(n+1) = n*h;
end

impEuler = Yie(1,:);
eksEuler = Yee(1,:);
trap = Yt(1,:);
[T,Z] = ode45 (F, [0, 5], [0; 1],'AbsTol',10^-12,'RelTol',10^-12); % (F, interval, zacetni pogoji)

hold on

%plot(X,impEuler);
%plot(X,eksEuler);
%plot(X,trap);
plot(X,Yrk(1,:));
plot(T,Z(:,1)); % Z(:, 1) saj vrne resitev za Y1 in Y2.. za vsak zacetni pogoj

hold off