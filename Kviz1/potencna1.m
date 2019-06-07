function [x, lambda, k] = potencna1(A,z0,tol,N)
  % x priblizek za lastni vektor
  % lambda priblizek za lastno vrednost
  % A matrika
  % z0 zacetni priblizek(normiran)
  % tol toleranca
  % N maksimalno stevilo korakov
  k = 1;
  Z = [z0];
  Y = [A*z0];
  L = [z0'*Y(:,k)];
  while (norm(Y(:,k)- L(:,k)*Z(:,k)) > tol) and (k < N);
    Y(:,k+1) = A*Z(:,k);
    L(k+1) = Z(:,k)'*Y(:,k+1);
    Z(:,k+1) = Y(:,k+1)/norm(Y(:,k+1));
    k = k+1;
  endwhile
  
  x = Y(:,k-1)
  lambda = L(k-1)
  k = k
endfunction
