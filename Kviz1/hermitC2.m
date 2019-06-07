function [T] = hermitC2(X, F, dF)
n = length(X)-1; % stevilo intervalov
matrika = zeros(n+1);
matrika(1,1) = 1;
matrika(n+1,n+1) = 1;

DELTA = zeros(n,1);
H = zeros(n,1);
for i = 1: n
  DELTA(i) = (F(i+1)-F(i))/(X(i+1) - X(i));
  H(i) = X(i+1)-X(i);
endfor
for i = 2 : n
    matrika(i,i-1) = 2/H(i-1);
    matrika(i,i) = 4/H(i-1) + 4/H(i);
    matrika(i,i+1) = 2/H(i);
endfor

% matrika*D = delta % D = stolpec di 

delta = zeros(n+1,1);
delta(1) = dF(1);
delta(n+1) = dF(n+1);

for i = 2 : n
  delta(i) = 6*DELTA(i-1)/H(i-1) + 6*DELTA(i)/H(i);
endfor

D = matrika\delta;

T = hermitC1(X, F, D);

