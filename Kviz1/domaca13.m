%1. Domaèa naloga - 3. naloga

f = @(x) cos(2+2*x).^2;
X = linspace(0,1,6);
Y = f(X);

[p1, a1] = deljeneDiference(X, Y, 0.25);
[p2, a2] = deljeneDiference(X, Y, 0.95);

P = [];
for i = 0:100
  x = i/100;
  P(i+1) = horner(X, a1, x);
end

F = f(linspace(0,1,101));
R = abs(F - P);
r = max(R)