rand('state',0);
X = rand(5);

A = zeros(5);
A(1,1) = 0.1;
A(2,2) = 0.2;
A(2,3) = 7;
A(3,3) = 0.3;
A(3,4) = 2;
A(4,4) = 0.4;
A(4,5) = 2;
A(5,5) = 0.5;

B = X*A*X^-1;
C = X*A*inverse(X);

[M,k] = qrOsnovna(B,100,10^-8);
[M1, k1] = qrEnojni(hess(B),100, 10^-8);
[M2, k2] = qrDvojni(hess(B),100,10^-8);