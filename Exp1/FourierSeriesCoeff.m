function [ao , a, b ] = FourierSeries(f,T,N)  

syms t ;
wo = 2*pi/T ;
ao_sym = 1/T*int(f, t , 0 ,T ) ;
ao = double(ao_sym) ;
for n = 1:N 
    a_sym(n) = 2/T*int(f*cos(n*wo*t) , t , 0 ,T ) ;
    b_sym(n) = 2/T*int(f*sin(n*wo*t) , t , 0 , T ) ; 
    
    a(n) = double(a_sym(n) ) ;
    b(n) = double(b_sym(n) ) ; 
end ;

