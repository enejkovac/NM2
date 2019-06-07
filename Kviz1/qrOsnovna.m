function [M, st_korakov] = qrOsnovna(A, st_ponovitev, tol)
%M... Matrika ki jo zelimo reducirati
%st_ponovitev... kolikokrat se iteracija ponovi
%tol... toleranca velikosti poddiagonalnih elementov

k = 0;     
            
while k < st_ponovitev && any(abs(diag(A, -1)) >=tol)
    [Q,R] = qr(A);
    A = R*Q;
    k = k+1;
    
end
st_korakov = k;
M=A;
end