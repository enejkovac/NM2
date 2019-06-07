function [priblizek] = ekspEuler(xn,Yn,F,h)
  % Yn prejsnji priblizek
  % F(x,[Y])
  % h korak
  priblizek = Yn + h*F(xn,Yn);
endfunction