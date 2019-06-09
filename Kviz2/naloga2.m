% 2. naloga %

f = @(x) sin(x)./(1+x.^2);

% 3/8 pravilo

pravilo = @(x0,h,f) 3*h/8 * (f(x0) + 3*f(x0+h) + 3*f(x0+2*h) + f(x0+3*h));

interval = [-1,2];


n1 = 10; % število osnovnih pravil na intervalu
n2 = 20; % število osnovnih pravil na intervalu

h1 = (interval(2) - interval(1))/(n1*3); % 3 je stevilo intervalov v osnovnem pravilu
h2 = (interval(2) - interval(1))/(n2*3);

Sh1 = 0;
for i = 1 : n1
  x0 = interval(1) + (i-1)*3*h1;
  Sh1 += pravilo(x0,h1,f);
endfor
Sh2 = 0;
for i = 1 : n2
  x0 = interval(1) + (i-1)*3*h2;
  Sh2 += pravilo(x0,h2,f);
endfor

priblizka = [Sh1, Sh2];
prava_vrednost = integral(f,interval(1),interval(2),'AbsTol',10^-15,'RelTol',10^-15);

Rh1 = prava_vrednost - Sh1; % mogoce kontra
Rh2 = prava_vrednost - Sh2;

% ekstrapolacija % 
eksRh2 = (Sh2 - Sh1)/31 ;
eksI = (32*Sh2-Sh1)/31;
eksNapaka = prava_vrednost - eksI;