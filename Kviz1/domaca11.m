%Domaèa naloga 1 - 1. naloga

A = 2*eye(100,100);
for i = 1:99
    A(i,i+1)= -1;
    A(i+1,i)= -1;
end
z0 = zeros(100,1);
z0(1,1)= 1;
[x0, e0, k0] = inverzna_iteracija(A,0, z0, 10^-10, 1000);
[x1, e1, k1] = inverzna_iteracija(A,1, z0, 10^-10, 1000);
[x3, e3, k3] = inverzna_iteracija(A,3, z0, 10^-10, 1000);
[x4, e4, k4] = inverzna_iteracija(A,4, z0, 10^-10, 1000);