function [priblizek] = implEuler(xn,Yn,F,h,k)
  % Yn prejsnji priblizek
  % F(x,[Y])
  % h korak
  % k stevilo korakov navadne iteracije
  priblizek = Yn; 
  for i = 1:k
    priblizek = Yn + h*F(xn+h,priblizek);
  end
  priblizek;
endfunction

