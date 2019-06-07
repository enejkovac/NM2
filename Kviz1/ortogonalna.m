function dom = ortogonalna(A, p, N=100)
  % Z dominantni invariantni podprostor dimenzije p
  % A matrika
  % N stevilo korakov
  Z = rand(size(A)(1),p); % error
  for k = 1:N
    Y = A*Z;
    [Q,R] = qr(Y, 0);
    Z = Q;
  endfor
  Z
endfunction