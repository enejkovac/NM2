function [x, lambda, k] = inverzna_iteracija(A, sigma, z0, tol, N)
  % x priblizek za lastni vektor
  % lambda priblizek za lastno vrednost
  % k stevilo korakov
  % A matrika
  % z0 normiran zacetni priblizek
  % sigma priblizek za lastno vrednost
  % tol toleranca
  % N maksimalno stevilo korakov
  k = 1;
  z = z0;
  y = (A - sigma*eye(size(A)))\z0;
  s = z0'*y;
  while (norm(y - s*z) > tol) and (k < N);
    z = y/norm(y);
    y = (A - sigma*eye(size(A)(1))) \ z;
    s = z'*y;
    k = k+1;
  endwhile
  
  x = y;
  lambda = 1/s + sigma;
  k = k;
  endfunction
