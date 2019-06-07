function [x, sigma, k] = inverzna(A, priblizek, z0, tol, N)
  % x priblizek za lastni vektor
  % sigma priblizek za lastno vrednost
  % X seznam priblizkov lastnih vektorjev
  % S seznam priblizkov lastnih vrednosti
  % k stevilo korakov
  % A matrika
  % z0 normiran zacetni priblizek
  % priblizek priblizek za lastno vrednost
  % tol toleranca
  % N maksimalno stevilo korakov
  
  X = [z0]; % 'z0' undefined near line 12 column 8
  S = [0];
  k = 1;
  while k < N
    k = k + 1;
    y = (A - priblizek*eye(size(A)(1))) \ X(:, k - 1);
    S(k) = X(:, k - 1)' * y;
    if norm(y - S(k) * X(:, k - 1)) < tol
      X(:, k) = y / norm(y);
      break
    endif
    X(:, k) = y / norm(y);
  endwhile
  
  x = X(:, k)
  sigma = 1 / S(k) + priblizek
  k = k

endfunction