function [p, a] = deljeneDiference(X,Y, tocka)
  % X tocke
  % Y vrednosti v tockah
  % p ... vrednost polinoma v tocki
  % a deljene diference Y = f(X) v X.
  n = length(X); 
  matrikaDiferenc = zeros(n);
  a = Y; 
  matrikaDiferenc(:,1) = a;
  for k = 2:n                             
    a(k:n) = (a(k:n) - a(k-1))./(X(k:n)- X(k-1)); 
    matrikaDiferenc(k:n,k) = a(k:n);
  end
  % Next, we program Newton Method Polynomial: 
  % Given by: p(x) = a0 + (x-x0)[a1 + (x-x1)[a2 + (x-x2)[a3 + (x-x3)[a4 + 
  % (x-x4)[a5]]]]]
  p = a(n);               
  for k = 1:n-1;
      p = a(n-k) + (tocka - X(n-k))*p;
  end
endfunction

    





