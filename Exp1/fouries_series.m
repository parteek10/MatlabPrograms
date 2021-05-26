clear ;
clc ; 
syms t ;
f = t*sin(t) ;
T = 2*pi ;
N = 50 ;
wo = 2*pi/T ;
[ao , a , b] = FourierSeriesCoeff(f,T,N) 

f_val = ao ;
t_val = [0 : 0.1: 10 ] ;
hold on ;
for n = 1:N
 Val = a(n)*cos(n*wo*t_val) + b(n)*sin(n*wo*t_val);
 f_val= f_val + Val;
 plot(t_val, f_val)
end
    
