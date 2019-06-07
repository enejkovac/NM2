function [x, sigma, X, S, k] = potencna(A, z0, tol=10^-6, N=300)
  % x priblizek za lastni vektor
  % sigma priblizek za lastno vrednost
  % X seznam priblizkov lastnih vektorjev
  % S seznam priblizkov lastnih vrednosti
  % k stevilo korakov
  % A matrika
  % z0 normiran zacetni priblizek
  % tol toleranca
  % N maksimalno stevilo korakov
  
  X = [z0]; % 'z0' undefined near line 12 column 8
  S = [0];
  k = 1;
  while k < N
    k = k + 1;
    y = A * X(:, k - 1);
    S(k) = X(:, k - 1)' * y;
    if norm(y - S(k) * X(:, k - 1)) < tol
      X(:, k) = y / norm(y);
      break
    endif
    X(:, k) = y / norm(y);
  endwhile
  
  lasten_vektor = X(:, k)
  sigma = S(k)
  X = X;
  S = S;
  k = k

endfunction
