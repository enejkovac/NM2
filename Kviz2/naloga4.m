% 4. naloga % 

% ddx/dt = -2x/(sqrt(x^2 + y^2))^3
% ddy/dt = -2y/(sqrt(x^2 + y^2))^3
% r(t) = (x(t),y(t)), r(0) = (0,1), dr/dt(0) = (-1,1)

% Z = [z1, z2, z3, z4], z1 = x, z2 = y, z3 = dx/dt, z4 = dy/dt
%dZ = [z3, z4, -2z1/(sqrt(z1^2 + z2^2))^3, -2z2/(sqrt(z1^2 + z2^2))^3

F = @(x,Z) [Z(3); Z(4); -2.*Z(1)./(sqrt(Z(1).^2 + Z(2).^2)).^3;...
       -2.*Z(2)./(sqrt(Z(1).^2 + Z(2).^2)).^3];
h = 0.1;
K = 100;   
Z0 = [0;1;-1;1];
X = [0];
Zrk = [Z0];
for n = 1:K
  Zrk(:, n+1) = RK4(X(n),Zrk(:,n),F,h);
  X(n+1) = n*h;
end

[T,W] = ode45 (F, [0, 10], [0; 1; -1; 1],'AbsTol',10^-12,'RelTol',10^-12); % (F, interval, zacetni pogoji)

hold on

plot(Zrk(1,:), Zrk(2,:));
plot(W(:,1), W(:,2)); % W(:, 2) saj vrne resitev za W1, W2, W3, W4.. za vsak zacetni pogoj

hold off

priblizki = [Zrk(1,1:4)', Zrk(2,1:4)'];
ode_priblizki = [W(1:4,1),W(1:4,2)];