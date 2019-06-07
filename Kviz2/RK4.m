function [priblizek] = RK4(xn,Yn,F,h)
  k1 = h * F(xn,Yn);
  k2 = h * F(xn + h./2, Yn + k1./2);
  k3 = h * F(xn + h./2, Yn + k2./2);
  k4 = h * F(xn + h, Yn + k3);
  
  priblizek = Yn + k1./6 + k2./3 + k3./3 + k4./6;
endfunction
