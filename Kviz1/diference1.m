%prejsnja naloga
%% izracun deljenih diferenc
n = 6;
x = linspace(0,1,n);
f = @(x) cos(2+2*x).^2;
matrika = zeros(n);
d = zeros(1,n);
d = f(x);
matrika(:,1) = d;
matrika1 = matrika;
for j = 2:n
    for i = n:-1:j    
        d(i) = (d(i)-d(i-1))/(x(i)-x(i-j+1)); 
    end
  matrika(:,j) = d;
  matrika1(j:n,j)=d(j:n);
end
matrika
matrika1
spodnje = tril(matrika)
diference = diag(matrika)
d % diference