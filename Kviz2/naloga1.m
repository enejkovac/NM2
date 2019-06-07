% 1. naloga %
f = @(x) exp(x);
dddf = @(x) exp(x);
ddddf = @(x) exp(x);

% aproksimacija; s simetricnimi diferencami
df = @(x,h) (f(x+h) - f(x-h))/(2 * h); % - h^2 * dddf(x)/6
ddf = @(x,h) (f(x+h) -2*f(x) + f(x-h))/(h^2); % - h^2 * ddddf(x)/12

prvi_odvodi = [];
drugi_odvodi = [];
tocka = 0;
for j = 2 : 9
  h = 10^(-j);
  prvi_odvodi(j-1) = df(tocka,h);
  drugi_odvodi(j-1) = ddf(tocka,h);
endfor

% vrni tabelo aproksimacij odvodov
prvi_odvodi;
drugi_odvodi;

% napake
napake_prvih = abs(prvi_odvodi - 1);
napake_drugih = abs(drugi_odvodi - 1);

[napaka_prvega, index1] = min(napake_prvih)
[napaka_drugega, index2] = min(napake_drugih)

