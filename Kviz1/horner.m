function [p] = horner(X,koef,tocka)
  % koef - koeficienti polinoma
  % X - tocke, za premaknjeno bazo
  % tocka, v kateri racunamo vrednost polinoma 
  n = length(X);
  p = koef(n);               
  for k = 1:n-1;
      p = koef(n-k) + (tocka - X(n-k))*p;
  end
  y = p;
endfunction
