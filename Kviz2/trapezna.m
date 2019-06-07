function [priblizek] = trapezna(xn,Yn,F,h,k)
  % Yn prejsnji priblizek
  % F(x,[Y])
  % h korak
  % k stevilo korakov navadne iteracije
  priblizek = ekspEuler(xn,Yn,F,h); % prediktor
  for i = 1:k
    priblizek = Yn + h/2*(F(xn,Yn) + F(xn+h,priblizek));
  end
  priblizek;
endfunction
