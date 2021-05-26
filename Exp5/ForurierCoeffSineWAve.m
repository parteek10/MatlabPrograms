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
N=30;
% Index for a and b vectors
idx=1;
a=zeros(1,N+1);
b=zeros(1,N+1);
 
% Calculating the vectors a and b 
for n=0:N
    cosTerm=cos(2*pi*t*n/T);
    sinTerm=sin(2*pi*t*n/T);
    a(idx)=(2*Ts/T)*sum(f.*cosTerm);
    b(idx)=(2*Ts/T)*sum(f.*sinTerm);
    idx=idx+1;
end
 
a0=a(1)/2;
 
% Printing the vector a and b
fprintf('The value of a0 is: %d\n',a0);
fprintf('The Vector a is:[');
fprintf('%g,',a(1:end-1));
fprintf('%g]\n',a(end));
fprintf('The Vector b is:[');
fprintf('%g,',b(1:end-1));
fprintf('%g]\n',b(end));
 
% Ploting the vector a and b
 
subplot(3,1,2)
stem(0:N,a)
hold on
stem(0:N,b)
hold off
xlabel('Coefficient index ,n')
ylabel('Real Coefficient')
legend('a_n','b_n')
title('Real Valued Fourier Coefficient');
 
% Initialise the f_s with a(0) 
f_s=(a(1)/2)*ones(size(t));
 
for n=1:N
    cosTerm=cos(2*pi*t*n/T);
    sinTerm=sin(2*pi*t*n/T);
    f_s=f_s + a(n+1)*cosTerm + b(n+1)*sinTerm;
end
 
subplot(3,1,3)
plot(t,f)
hold on
plot(t,f_s)
hold off
grid on
xlabel('t(seconds)')
ylabel('Amplitude')
legend('f(t)','f_s(t)')
title(sprintf('Original And Fourier Series Approximation for N=%d Harmonic',N))
