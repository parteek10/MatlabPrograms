clear all
% Period of f(t) in second
T= 2;
Ts=T/200;
% Time vector in second
t=0:Ts:T-Ts;
 
A=2;
 
f(t<(T/2))=A;
f((t>=(T/2)) & (t<T)) = -A;
 
subplot(3,1,1)
plot(t,f);
title('Function f(t)');
xlabel('t(seconds)');
ylabel('f(t)');
grid on
 
% Number of harmonic
N=50;
% Index for a and b vectors
idx=1;
c=zeros(1,2*N+1);
%Calculating c vector
for n=-N:N
    expTerm=exp(-1i*2*pi*t*n/T);
    c(idx)=(Ts/T)*sum(f.*expTerm);
    idx=idx+1;
end
 
% Printing the c vector
fprintf('The Vector c is:[');
fprintf('%g,',c(1:end-1));
fprintf('%g]\n',c(end));
    
subplot(3,1,2)
stem(-N:N,real(c))
hold on
stem(-N:N,imag(c))
hold off
legend('real(c_n)','img(c_n)')
xlabel('Coefficient Index,n')
ylabel('Complex Coefficients')
title('Complex Valued Fourier Coefficients')
 
f_s=zeros(size(t));
idx=1;
for n=-N:N
    expTerm=exp(1i*2*pi*t*n/T);
    f_s=f_s + c(idx)*expTerm;
    idx=idx+1;
end
 
subplot(3,1,3)
plot(t,f)
hold on
plot(t,f_s)
hold off
grid on
legend('f(t)','f_s(t)')
xlabel('t(seconds)')
ylabel('Amplitude')
legend('f(t)','f_s(t)')
title(sprintf('Original And Fourier Series Approximation for N=%d Harmonics',N))
