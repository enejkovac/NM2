n = 6;
X = linspace(0, 1, n+1);
f = @(x) exp(-x + sin(10*x));
df1 = @(x)(-1+ 10*cos(10*x));
F = f(X);
dF = F .* df1(X);

tocke = repelem(X,2);
P = hermitC1(X, F, dF);

%horner(tocke(1:4),P(:,1),0.2);

z = linspace(0,1,200);
w = f(z);

hold on

plot(z,w)

st_tock = 60;
for i = 1:n
  v = linspace(X(i), X(i+1), st_tock);
  %2*i-1,2*i-1+3
  vrednosti = [];
  for k = 1 : st_tock
    vrednosti(k) = horner(tocke(2*i-1:2*i+2),P(:,i),v(k));
  endfor
  plot(v,vrednosti)
endfor
  
hold off

vmesne_vrednosti = [];
for i = 1:n % 1:length(X)-1
  vmesna = (X(i)+X(i+1))/2;
  vmesne_vrednosti(i) = horner(tocke(2*i-1:2*i+2),P(:,i),vmesna);
endfor
  